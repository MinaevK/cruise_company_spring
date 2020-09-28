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

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
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


    @GetMapping("/user/booking")
    public String booking(Model model) {
        model.addAttribute("cruises", cruiseService.allCruises());
        model.addAttribute("ships", shipService.allShips());
        model.addAttribute("cabins", cabinService.allCabins());
        return "user/booking";
    }

    @PostMapping("/user/booking-cabin/{id}")
    public String addRoomApplication(@ModelAttribute("bookingForm") UserApplication applicationForm,
                                                    @RequestParam("cruisePrice") float cruisePrice,
                                                    @RequestParam("cabinPrice") float cabinPrice) throws ParseException {
        UserApplication application = new UserApplication();
        application.setCruise(applicationForm.getCruise());
        application.setCabin(applicationForm.getCabin());
        application.setShip(applicationForm.getShip());
        LocalDate dateArrival = LocalDate.parse(application.getCruise().getArrivalDate());
        LocalDate dateDeparture = LocalDate.parse(application.getCruise().getDepartureDate());
        long days = ChronoUnit.DAYS.between(dateDeparture, dateArrival);
        application.setPrice(cruisePrice + (cabinPrice * days));
        application.setUser((User)SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        application.setPaid(false);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        application.setApplicationDate(java.time.LocalDateTime.now().format(formatter));
        bookingService.saveApplication(application);
        return "redirect:/user/booking-cabin/{id}";
    }

    @GetMapping("/user/booking-cabin/{id}")
    public String bookingCabin (@PathVariable("id") Long id, Model model) {
        Cruise currentCruise = cruiseService.findCruiseById(id);
        model.addAttribute("cruise", currentCruise);
        List<Cabin> cabins = bookingService.findBookedCabins(currentCruise.getId(), currentCruise.getShip().getId());
        model.addAttribute("cabins", cabins);
        model.addAttribute("bookingForm", new UserApplication());
        return "/user/booking-cabin";
    }

}
