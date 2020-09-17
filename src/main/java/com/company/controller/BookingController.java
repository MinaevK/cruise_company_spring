package com.company.controller;

import com.company.entity.Cabin;
import com.company.entity.Cruise;
import com.company.entity.User;
import com.company.entity.UserApplication;
import com.company.service.BookingService;
import com.company.service.CabinService;
import com.company.service.CruiseService;
import com.company.service.ShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BookingController {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private CruiseService cruiseService;
    @Autowired
    private ShipService shipService;
    @Autowired
    private CabinService cabinService;


    @GetMapping("/booking")
    public String booking(Model model) {
        model.addAttribute("cruises", cruiseService.allCruises());
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("cabins", cabinService.allCabins());
        return "booking";
    }

    @PostMapping("/booking-cabin/{id}")
    public String addRoomApplication(@ModelAttribute("bookingForm") UserApplication applicationForm,
                                                    @RequestParam("cruisePrice") float cruisePrice,
                                                    @RequestParam("cabinPrice") float cabinPrice) {
        UserApplication application = new UserApplication();
        application.setCruise(applicationForm.getCruise());
        application.setCabin(applicationForm.getCabin());
        application.setShip(applicationForm.getShip());
        application.setPrice(cruisePrice + cabinPrice);
        application.setUser((User)SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        application.setPaid(false);
        bookingService.saveApplication(application);
        return "redirect:/booking-cabin/{id}";
    }

    @GetMapping("/booking-cabin/{id}")
    public String bookingCabin (@PathVariable("id") Long id, Model model) {
        Cruise currentCruise = cruiseService.findCruiseById(id);
        model.addAttribute("cruise", currentCruise);
        List<Cabin> cabins = cabinService.cabinsOnShip(currentCruise.getShip().getId());
        List<Cabin> deletedList = bookingService.findBookedCabins(currentCruise.getId());
        cabins.removeAll(deletedList);
        model.addAttribute("cabins", cabins);
        model.addAttribute("bookingForm", new UserApplication());
        return "/booking-cabin";
    }

}
