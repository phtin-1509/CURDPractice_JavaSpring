package com.example.Shop.Project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.Shop.Project.services.UserService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.example.Shop.Project.domain.User;
import com.example.Shop.Project.repository.UserRepository;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> users = this.userService.getAllUserByEmails("phtin1509contact@gmail.com");
        System.out.println("Users: " + users);
        model.addAttribute("userInfo", "userInfo");
        model.addAttribute("title", "Home Page");
        return "homepage";
    }

    // Admin page to manage users
    @RequestMapping("/admin/user")
    public String getAdminUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        System.out.println("Users: " + users);
        model.addAttribute("users", users);
        return "admin/user/admin-home";
    }

    // Method to create a new user
    @RequestMapping("/admin/user/create")
    public String createNewUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
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
    public String updateUser(Model model, @PathVariable("id") Long id, @ModelAttribute("user") User user) {
        // Fetch the existing user by ID
        User existingUser = this.userService.getUserById(id).orElse(null);
        if (existingUser != null) {
            // Update the existing user's details
            existingUser.setFullName(user.getFullName());
            existingUser.setPhone(user.getPhone());
            existingUser.setAddress(user.getAddress());
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

    // Method to create a new user with admin privileges
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserWithAdmin(Model model, @ModelAttribute("newUser") User user) {
        // Call the userService to create the user
        this.userService.createUser(user);
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
