package com.company.repository;

import com.company.entity.UserApplication;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BookingRepository extends JpaRepository<UserApplication, Long> {
    List<UserApplication> findAll();
    Optional<UserApplication> findById(Long id);
    List<UserApplication> findAllByCruise_Id(Long cruiseId);

}
