package com.VehicleBreakdownSupport.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.VehicleBreakdownSupport.model.Users;


public interface UserRepository extends JpaRepository<Users, Long> {

	 Users findByEmail(String email);
}

