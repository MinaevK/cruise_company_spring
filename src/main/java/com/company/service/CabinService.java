package com.company.service;

import com.company.entity.Cabin;
import com.company.entity.CabinClass;
import com.company.entity.Ship;
import com.company.repository.CabinRepository;
import com.company.repository.ShipRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CabinService {
    @Autowired
    private ShipRepository shipRepository;
    @Autowired
    private CabinRepository cabinRepository;
    public List<Cabin> allCabins(){return cabinRepository.findAll();}
    public boolean saveCabin(Cabin cabin, Long shipId){
        Optional<Ship> optionalShip = shipRepository.findById(shipId);
        cabin.setShip(optionalShip.get());
        cabinRepository.save(cabin);
        return true;
    }
    public List<Cabin> cabinsOnShip(Long id){
        return cabinRepository.findByShip_Id(id);
    }
    public Cabin cabinById(Long id){
        Optional<Cabin> cabin = cabinRepository.findById(id);
        return cabin.get();
    }
}
