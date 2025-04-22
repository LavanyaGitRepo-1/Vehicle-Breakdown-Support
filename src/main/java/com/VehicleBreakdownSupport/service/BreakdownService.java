package com.VehicleBreakdownSupport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.VehicleBreakdownSupport.exception.BreakdownNotFoundException;
import com.VehicleBreakdownSupport.model.Breakdown;
import com.VehicleBreakdownSupport.repository.BreakdownRepository;

@Service
public class BreakdownService {

	@Autowired
    private BreakdownRepository breakdownRepository;

    public Breakdown addBreakdown(Breakdown breakdown) {
        return breakdownRepository.save(breakdown);
    }

    public List<Breakdown> getUserBreakdowns(Long userId) {
        return breakdownRepository.findByUserId(userId);
    }

    public List<Breakdown> getAllBreakdowns() {
        return breakdownRepository.findAll();
    }

    public Breakdown updateBreakdownStatus(Long id, String status) {
        Breakdown breakdown = breakdownRepository.findById(id)
                .orElseThrow(() -> new BreakdownNotFoundException("Breakdown request not found"));
        
        breakdown.setStatus(status);
        return breakdownRepository.save(breakdown);
    }
}
