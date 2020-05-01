package com.company.repository;

import com.company.entity.Ship;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ShipRepository extends JpaRepository<Ship, Long> {
    List<Ship> findAll();
    Optional<Ship> findById(Long id);
}
