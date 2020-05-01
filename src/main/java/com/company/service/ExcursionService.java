package com.company.service;

import com.company.entity.Cabin;
import com.company.entity.Excursion;
import com.company.entity.Port;
import com.company.entity.Ship;
import com.company.repository.ExcursionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ExcursionService {
    @Autowired
    ExcursionRepository excursionRepository;

    public List<Excursion> allExcursions(){return excursionRepository.findAll();}
    public boolean saveExcursion(Excursion excursion, Port port){
        excursion.setPort(port);
        excursionRepository.save(excursion);
        return true;
    }
}
