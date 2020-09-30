package com.company.service;

import com.company.entity.Excursion;
import com.company.entity.Port;
import com.company.repository.ExcursionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExcursionService {
    @Autowired
    ExcursionRepository excursionRepository;

    public List<Excursion> allExcursions() {
        return excursionRepository.findAll();
    }

    public void saveExcursion(Excursion excursion, Port port) {
        excursion.setPort(port);
        excursionRepository.save(excursion);
    }
}
