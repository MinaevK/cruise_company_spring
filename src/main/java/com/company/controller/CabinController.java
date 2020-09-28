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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
public class CabinController {
    @Autowired
    private ShipService shipService;
    @Autowired
    private CabinService cabinService;

    @GetMapping("/admin/cabins")
    public String cabinForm(Model model) {
        model.addAttribute("allCabins", cabinService.allCabins());
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("cabinClasses", CabinClass.values());
        if (!model.containsAttribute("cabinForm"))
            model.addAttribute("cabinForm", new Cabin());


        return "admin/cabins";
    }

    @PostMapping("/admin/cabins")
    public String  addCabin(@ModelAttribute("cabinForm") @Valid Cabin cabin, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes,
                                                        @RequestParam(required = true, defaultValue = "" ) Long shipId) {
        if (bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.cabinForm", bindingResult);
            redirectAttributes.addFlashAttribute("cabinForm", cabin);
            return "redirect:/admin/cabins";
        }
        cabinService.saveCabin(cabin, shipId);
        return "redirect:/admin/cabins";
    }

    @GetMapping("/admin/cabin-edit/{id}")
    public String cabinEdit(@PathVariable("id") Long id, Model model) {
        Cabin cabin = cabinService.cabinById(id);
        model.addAttribute("cabin", cabin);
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("cabinClasses", CabinClass.values());
        if (!model.containsAttribute("cabinForm"))
            model.addAttribute("cabinForm", new Cabin());
        return "admin/cabin-edit";
    }
    @PostMapping("/admin/cabin-edit/{id}")
    public String  editCabin(@ModelAttribute("cabinForm") @Valid Cabin cabin,  BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes,
                                                            @RequestParam(required = true, defaultValue = "" ) Long shipId,
                                                            @PathVariable("id") Long id) {
        if (bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.cabinForm", bindingResult);
            redirectAttributes.addFlashAttribute("cabinForm", cabin);

            return "redirect:/admin/cabin-edit/" + id;
        }
        cabin.setId(id);
        cabinService.saveCabin(cabin, shipId);
        return "redirect:/admin/cabins";
    }
}
