package com.example.Shop.Project.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardController {
    @GetMapping("/admin")
    public String showDashboard() {
        return "admin/dashboard/admin-show";
    }
}
