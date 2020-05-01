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

    @GetMapping("/ship")
    public String ship(Model model) {
        model.addAttribute("shipForm", new Ship());
        return "ship";
    }


    @PostMapping("/ship")
    public String  addShip(@ModelAttribute("shipForm") Ship ship) {
    shipService.saveShip(ship);
        return "redirect:/ship";
    }
}
