package com.company.service;

import com.company.entity.Ship;
import com.company.repository.ShipRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ShipService {
    @Autowired
    private ShipRepository shipRepository;
    public List<Ship> allShips(){return shipRepository.findAll();}
    public boolean saveShip(Ship ship){
        shipRepository.save(ship);
        return true;
    }
    public Ship shipById(Long Id){
        Optional<Ship> optionalShip = shipRepository.findById(Id);
        return optionalShip.get();
    }
}
