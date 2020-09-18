package com.company.controller;

import com.company.entity.User;
import com.company.entity.UserApplication;
import com.company.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ApplicationsController {
    @Autowired
    private BookingService bookingService;


    @GetMapping("/admin/all-applications")
    public String applications(Model model) {
        model.addAttribute("allApplications", bookingService.findAllApplications());
        return "admin/all-applications";
    }
    @PostMapping("/admin/all-applications")
    public String  sendApplication(@RequestParam(required = true, defaultValue = "" ) Long userId) {
            UserApplication userApplication = bookingService.findById(userId);
            userApplication.setPaid(true);
            bookingService.saveApplication(userApplication);

        return "redirect:/admin/all-applications";
    }
    @GetMapping("/user-applications")
    public String userApplications(Model model) {
        model.addAttribute("userApplications", bookingService.findByUser(((User)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId()));
        return "user-applications";
    }
}
