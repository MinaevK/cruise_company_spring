package com.company.controller;

import com.company.entity.*;
import com.company.service.CruiseService;
import com.company.service.ShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        System.out.println(portsChecked);
        cruiseService.saveCruise(cruise, shipId, portsChecked);
        return "redirect:/cruises";
    }

}
