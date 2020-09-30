package com.company.controller;

import com.company.entity.Excursion;
import com.company.entity.Port;
import com.company.service.ExcursionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ExcursionController {
    @Autowired
    ExcursionService excursionService;

    @GetMapping("/excursions")
    public String userList(Model model) {
        model.addAttribute("ports", Port.values());
        model.addAttribute("excursionForm", new Excursion());
        return "excursions";
    }

    @PostMapping("/excursions")
    public String addCabin(@ModelAttribute("excursionForm") Excursion excursion, @RequestParam(required = true, defaultValue = "") Port port) {
        excursionService.saveExcursion(excursion, port);
        return "redirect:/excursions";
    }
}
