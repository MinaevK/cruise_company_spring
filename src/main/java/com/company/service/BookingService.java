package com.company.service;

import com.company.entity.*;
import com.company.repository.BookingRepository;
import com.company.repository.CabinRepository;
import com.company.repository.CruiseRepository;
import com.company.repository.ShipRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class BookingService {
    @Autowired
    BookingRepository bookingRepository;
    @Autowired
    CruiseRepository cruiseRepository;
    @Autowired
    CabinRepository cabinRepository;
    @Autowired
    ShipRepository shipRepository;

    public void saveApplication(UserApplication userApplication) {
        bookingRepository.save(userApplication);
    }

    public List<Cabin> findBookedCabins(Long cruiseId, Long shipId) {
        List<UserApplication> applications = bookingRepository.findAllByCruise_Id(cruiseId);
        List<Cabin> cabins = cabinRepository.findByShip_Id(shipId);
        ArrayList<Cabin> removeList = new ArrayList<>();
        applications.forEach(a -> removeList.add(a.getCabin()));
        cabins.removeAll(removeList);
        return cabins;
    }

    public List<UserApplication> findAllApplications() {
        return bookingRepository.findAll();
    }

    public UserApplication findById(Long id) {
        Optional<UserApplication> optionalUserApplication = bookingRepository.findById(id);
        return optionalUserApplication.get();
    }

    public List<UserApplication> findByUser(Long userId) {
        return bookingRepository.findAllByUser_Id(userId);
    }
}
