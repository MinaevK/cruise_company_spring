package com.company.controller;

import com.company.entity.Ship;
import com.company.entity.User;
import com.company.service.ShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Map;

@Controller

public class ShipController {
    @Autowired
    ShipService shipService;

    @GetMapping("/admin/ships")
    public String ship(Model model) {
        model.addAttribute("ships", shipService.allShips());
        if (!model.containsAttribute("shipForm"))
            model.addAttribute("shipForm", new Ship());
        return "/admin/ships";
    }


    @PostMapping("/admin/ships")
    public String addShip(@ModelAttribute("shipForm") @Valid Ship ship, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.shipForm", bindingResult);
            redirectAttributes.addFlashAttribute("shipForm", ship);

            return "redirect:/admin/ships";
        }
        shipService.saveShip(ship);
        return "/";
    }

    @GetMapping("/admin/ship-edit/{id}")
    public String shipEdit(@PathVariable("id") Long id, Model model) {
        Ship ship = shipService.shipById(id);

        if (!model.containsAttribute("shipForm"))
            model.addAttribute("shipForm", ship);
        return "/admin/ship-edit";
    }

    @PostMapping("/admin/ship-edit/{id}")
    public String saveEditedShip(@ModelAttribute("shipForm") @Valid Ship ship, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes,
                                 @PathVariable("id") Long id) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.shipForm", bindingResult);
            redirectAttributes.addFlashAttribute("shipForm", ship);

            return "/admin/ship-edit";
        }
        ship.setId(id);
        shipService.saveShip(ship);
        return "redirect:/admin/ships";
    }
}
