package com.company.controller;

import com.company.entity.*;
import com.company.service.CabinService;
import com.company.service.CruiseService;
import com.company.service.ShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
public class CruiseController {
    @Autowired
    private ShipService shipService;
    @Autowired
    private CruiseService cruiseService;

    @GetMapping("/admin/cruises")
    public String cruises(Model model) {
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("ports", Port.values());
        model.addAttribute("allCruises", cruiseService.allCruises());
        if (!model.containsAttribute("cruiseForm"))
            model.addAttribute("cruiseForm", new Cruise());
        return "admin/cruises";
    }

    @PostMapping("/admin/cruises")
    public String addCruise(@ModelAttribute("cruiseForm") @Valid Cruise cruise, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes,
                            @RequestParam(required = true, defaultValue = "") Long shipId,
                            @RequestParam(required = true, defaultValue = "") List<Port> portsChecked) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.cruiseForm", bindingResult);
            redirectAttributes.addFlashAttribute("cruiseForm", cruise);

            return "redirect:/admin/cruises";
        }
        cruiseService.saveCruise(cruise, shipId, portsChecked);
        return "redirect:/admin/cruises";
    }

    @GetMapping("/admin/cruise-edit/{id}")
    public String cabinEdit(@PathVariable("id") Long id, Model model) {
        Cruise cruise = cruiseService.findCruiseById(id);
        model.addAttribute("cruise", cruise);
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("ports", Port.values());
        if (!model.containsAttribute("cruiseForm"))
            model.addAttribute("cruiseForm", new Cruise());
        return "admin/cruise-edit";
    }

    @PostMapping("/admin/cruise-edit/{id}")
    public String editCabin(@ModelAttribute("cruiseForm") @Valid Cruise cruise, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes,
                            @RequestParam(required = true, defaultValue = "") Long shipId,
                            @RequestParam(required = true, defaultValue = "") List<Port> portsChecked,
                            @PathVariable("id") Long id) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.cruiseForm", bindingResult);
            redirectAttributes.addFlashAttribute("cruiseForm", cruise);

            return "redirect:/admin/cruise-edit/" + id;
        }
        cruise.setId(id);
        cruiseService.saveCruise(cruise, shipId, portsChecked);
        return "redirect:/admin/cruises";
    }

    @GetMapping("/cruise-info/{id}")
    public String cruiseInfo(@PathVariable("id") Long id, Model model) {
        Cruise cruise = cruiseService.findCruiseById(id);
        model.addAttribute("cruise", cruise);
        return "/cruise-info";
    }

    @GetMapping("/")
    public String cruiseAll(Model model) {
        model.addAttribute("allCruises", cruiseService.allCruises());
        return "/index";
    }
}
