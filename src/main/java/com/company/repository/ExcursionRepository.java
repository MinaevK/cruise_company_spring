package com.company.repository;

import com.company.entity.Excursion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

public interface ExcursionRepository extends JpaRepository<Excursion, Long> {
    List<Excursion> findAll();

    Optional<Excursion> findById(Long id);
}
