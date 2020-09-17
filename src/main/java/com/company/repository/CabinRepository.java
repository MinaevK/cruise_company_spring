package com.company.repository;

import com.company.entity.Cabin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;

import java.util.List;
import java.util.Optional;

public interface CabinRepository extends JpaRepository<Cabin, Long> {
    List<Cabin> findAll();
    Optional<Cabin> findById(Long id);
    List<Cabin> findByShip_Id(Long id);
}
