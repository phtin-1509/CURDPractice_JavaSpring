package com.example.Shop.Project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.Shop.Project.services.UserService;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMethod;
import com.example.Shop.Project.domain.User;

@Controller
public class UserController {
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String userInfo = this.userService.getUserInfo();
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("title", "Home Page");
        return "homepage";
    }

    @RequestMapping("/admin/user")
    public String getAdminUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)
    public String createUserWithAdmin(Model model, @ModelAttribute("newUser") User user) {
        // Call the userService to create the user
        System.out.println("run here" + user);
        return "homepage";
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
