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

import javax.validation.Valid;
import java.util.Map;

@Controller

public class ShipController {
    @Autowired
    ShipService shipService;

    @GetMapping("/ships")
    public String ship(Model model) {
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("shipForm", new Ship());
        return "ships";
    }


    @PostMapping("/ships")
    public String  addShip(@ModelAttribute("shipForm") Ship ship) {
    shipService.saveShip(ship);
        return "redirect:/ships";
    }

    @GetMapping("/ship-edit/{id}")
    public String shipEdit(@PathVariable("id") Long id, Model model) {
        Ship ship = shipService.shipById(id);
        model.addAttribute("ship", ship);
        model.addAttribute("shipForm", new Ship());
        return "/ship-edit";
    }
    @PostMapping("/ship-edit/{id}")
    public String  saveEditedShip(@ModelAttribute("shipForm") Ship ship,
                             @PathVariable("id") Long id) {
        ship.setId(id);
        shipService.saveShip(ship);
        return "redirect:/ships";
    }
}
