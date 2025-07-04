package com.example.Shop.Project.controller;

import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.Shop.Project.services.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;

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
