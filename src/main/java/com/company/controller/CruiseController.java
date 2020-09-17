package com.company.controller;

import com.company.entity.*;
import com.company.service.CabinService;
import com.company.service.CruiseService;
import com.company.service.ShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CruiseController {
    @Autowired
    private ShipService shipService;
    @Autowired
    private CruiseService cruiseService;

    @GetMapping("/cruises")
    public String userList(Model model) {
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("ports", Port.values());
        model.addAttribute("cruiseForm", new Cruise());
        model.addAttribute("allCruises", cruiseService.allCruises());
        return "cruises";
    }

    @PostMapping("/cruises")
    public String  addCruise(@ModelAttribute("cruiseForm") Cruise cruise, @RequestParam(required = true, defaultValue = "" ) Long shipId ,
                                                                    @RequestParam(required = true, defaultValue = "" ) List<Port> portsChecked) {
        cruiseService.saveCruise(cruise, shipId, portsChecked);
        return "redirect:/cruises";
    }
    @GetMapping("/cruise-edit/{id}")
    public String cabinEdit(@PathVariable("id") Long id, Model model) {
        Cruise cruise = cruiseService.findCruiseById(id);
        model.addAttribute("cruise", cruise);
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("ports", Port.values());
        model.addAttribute("cruiseForm", new Cruise());
        return "/cruise-edit";
    }
    @PostMapping("/cruise-edit/{id}")
    public String  editCabin(@ModelAttribute("cruiseForm") Cruise cruise, @RequestParam(required = true, defaultValue = "" ) Long shipId,
                             @RequestParam(required = true, defaultValue = "" ) List<Port> portsChecked,
                             @PathVariable("id") Long id) {
        cruise.setId(id);
        cruiseService.saveCruise(cruise, shipId, portsChecked);
        return "redirect:/cruises";
    }

}
