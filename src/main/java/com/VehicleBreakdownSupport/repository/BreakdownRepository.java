package com.VehicleBreakdownSupport.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.VehicleBreakdownSupport.model.Breakdown;


public interface BreakdownRepository extends JpaRepository<Breakdown, Long> {
	List<Breakdown> findByUserId(Long userId);
}

