package com.example.Shop.Project.controller.admin;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.Shop.Project.services.UploadService;
import com.example.Shop.Project.services.UserService;


import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.example.Shop.Project.domain.User;

import java.util.List;



import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
    // Injecting UserService to handle user-related operations
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // Admin page to manage users
    @RequestMapping("/admin/user")
    public String getAdminUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/admin-home";
    }

    // Method to create a new user
    @GetMapping("/admin/user/create")
    public String createNewUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // Method to create a new user with admin privileges
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserWithAdmin(Model model, @ModelAttribute("newUser") @Valid User user,
            BindingResult newUserBindingResult,
            @RequestParam("tinFile") MultipartFile file) {
        // Check for validation errors
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            // System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newUserBindingResult.hasErrors()) {
            model.addAttribute("newUser", user);
            return "admin/user/create"; // Return to the create page with errors
        }
        // Call the userService to create the user

        String userAvatar = this.uploadService.handleFileUpload(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setAvatar(userAvatar);
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(user.getRole().getName())); // Set the role to admin
        this.userService.createUser(user);
        return "redirect:/admin/user"; // Redirect to the admin user page to show the updated list
    }

    // Method to get user details by ID
    @RequestMapping("/admin/user/{id}")
    public String getDetailUser(Model model, @PathVariable("id") Long id) {
        User user = this.userService.getUserById(id).orElse(null);
        if (user == null) {
            // Nếu không tìm thấy user, chuyển về danh sách hoặc báo lỗi
            return "redirect:/admin/user";
        }
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/admin-detail";
    }

    // Method to show the update form for a user
    @RequestMapping(value = "/admin/user/update/{id}", method = RequestMethod.GET)
    public String showUpdateUserForm(Model model, @PathVariable("id") Long id) {
        User user = this.userService.getUserById(id).orElse(null);
        if (user == null) {
            return "redirect:/admin/user";
        }
        model.addAttribute("user", user);
        return "admin/user/admin-update"; // Tạo file update.jsp để hiển thị form cập nhật
    }

    // Method to update user details
    @RequestMapping(value = "/admin/user/update/{id}", method = RequestMethod.POST)
    public String updateUser(Model model, @PathVariable("id") Long id, @ModelAttribute("user") User user,
            @RequestParam("updateAvatar") MultipartFile file) {
        // Fetch the existing user by ID
        User existingUser = this.userService.getUserById(id).orElse(null);
        if (existingUser != null) {
            // Update the existing user's details
            existingUser.setFullName(user.getFullName());
            existingUser.setPhone(user.getPhone());
            existingUser.setAddress(user.getAddress());
            // If a new avatar file is provided, handle the file upload
            if (file != null && !file.isEmpty()) {
                String userAvatar = this.uploadService.handleFileUpload(file, "avatar");
                existingUser.setAvatar(userAvatar);
            }
            // Save the updated user
            this.userService.createUser(existingUser);
        }
        return "redirect:/admin/user"; // Redirect to the admin user page to show the updated list
    }

    // Method to delete a user (not implemented yet)
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUser(Model model, @PathVariable Long id) {
        // Call the userService to delete the user
        model.addAttribute("id", id);
        User user = new User();
        user.setId(id);
        model.addAttribute("newUser", user);
        return "admin/user/confirm-delete"; // Redirect to the admin user page to show the updated list
    }

    @PostMapping("/admin/user/delete")
    public String deleteUser(@ModelAttribute("newUser") User user) {
        // Call the userService to delete the user by ID
        this.userService.deleteUserById(user.getId());
        return "redirect:/admin/user"; // Redirect to the admin user page to show the updated list
    }

}
// @RestController
// public class UserController {

// // Injecting UserService to handle user-related operations
// // Dependency Injection
// private UserService userService;

// public UserController(UserService userService) {
// this.userService = userService;
// }

// @GetMapping("")
// public String getHomePage() {
// return this.userService.getUserInfo();
// }

// }
