package com.VehicleBreakdownSupport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.VehicleBreakdownSupport.service.BreakdownService;



@Controller
@RequestMapping("/admins")
public class AdminController {

	
	    @Autowired
	    private BreakdownService breakdownService; // Use Service instead of Repository

	    // Admin Dashboard - View All Breakdown Requests
	    @GetMapping("/getadmin")
	    public String adminDashboard(Model model) {
	        model.addAttribute("breakdowns", breakdownService.getAllBreakdowns());
	        return "admin";  // This maps to admin.jsp
	    }

	    // Update Breakdown Status
	    @PostMapping("/update-status/{id}")
	    public String updateStatus(@PathVariable Long id, @RequestParam String status, Model model) {
	        breakdownService.updateBreakdownStatus(id, status);

	        // Reload the updated breakdowns
	        model.addAttribute("breakdowns", breakdownService.getAllBreakdowns());

	        // Return the updated view
	        return "admin";  // This should match admin.jsp
	    }
}

