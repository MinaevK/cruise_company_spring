package com.company.repository;
import com.company.entity.Cruise;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CruiseRepository  extends JpaRepository<Cruise, Long> {
    List<Cruise> findAll();
    Optional<Cruise> findById(Long id);
}
