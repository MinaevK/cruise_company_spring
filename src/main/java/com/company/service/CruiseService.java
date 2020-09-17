package com.company.service;

import com.company.entity.Cruise;
import com.company.entity.Port;
import com.company.entity.Ship;
import com.company.repository.CruiseRepository;
import com.company.repository.ShipRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CruiseService {
    @Autowired
    private CruiseRepository cruiseRepository;
    @Autowired
    private ShipRepository shipRepository;

    public List<Cruise> allCruises(){return cruiseRepository.findAll();}
    public boolean saveCruise(Cruise cruise, Long shipId, List<Port> ports){
        Optional<Ship> optionalShip = shipRepository.findById(shipId);
        cruise.setShip(optionalShip.get());
        cruise.setPorts(ports);
        cruiseRepository.save(cruise);
        return true;
    }
    public Cruise findCruiseById(Long id){
        Optional<Cruise> cruise = cruiseRepository.findById(id);
        return cruise.get();
    }
}
