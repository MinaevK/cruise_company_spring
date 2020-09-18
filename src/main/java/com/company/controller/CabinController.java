package com.company.controller;

import com.company.entity.Cabin;
import com.company.entity.CabinClass;
import com.company.entity.Ship;
import com.company.service.CabinService;
import com.company.service.ShipService;
import com.company.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class CabinController {
    @Autowired
    private ShipService shipService;
    @Autowired
    private CabinService cabinService;

    @GetMapping("/cabins")
    public String cabinForm(Model model) {
        model.addAttribute("allCabins", cabinService.allCabins());
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("cabinClasses", CabinClass.values());
        model.addAttribute("cabinForm", new Cabin());
        return "cabins";
    }

    @PostMapping("/cabins")
    public String  addCabin(@ModelAttribute("cabinForm") Cabin cabin, @RequestParam(required = true, defaultValue = "" ) Long shipId) {
            cabinService.saveCabin(cabin, shipId);
        return "redirect:/cabins";
    }

    @GetMapping("/cabin-edit/{id}")
    public String cabinEdit(@PathVariable("id") Long id, Model model) {
        Cabin cabin = cabinService.cabinById(id);
        model.addAttribute("cabin", cabin);
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("cabinClasses", CabinClass.values());
        model.addAttribute("cabinForm", new Cabin());
        return "/cabin-edit";
    }
    @PostMapping("/cabin-edit/{id}")
    public String  editCabin(@ModelAttribute("cabinForm") Cabin cabin, @RequestParam(required = true, defaultValue = "" ) Long shipId,
                                                                    @PathVariable("id") Long id) {
        cabin.setId(id);
        cabinService.saveCabin(cabin, shipId);
        return "redirect:/cabins";
    }
}
