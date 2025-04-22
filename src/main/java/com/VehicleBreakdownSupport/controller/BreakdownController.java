package com.VehicleBreakdownSupport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.VehicleBreakdownSupport.model.Breakdown;
import com.VehicleBreakdownSupport.model.Users;
import com.VehicleBreakdownSupport.service.BreakdownService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BreakdownController {

	
	    @Autowired
	    private BreakdownService breakdownService;

//	    @GetMapping("/dashboard")
//	    public String userDashboard(Model model, HttpSession session) {
//	        Users user = (Users) session.getAttribute("user");
//	        System.out.println(user);
//	        if (user == null) return "redirect:/login";
//
//	        System.out.println(user.getId());
//	        model.addAttribute("breakdowns", breakdownService.getUserBreakdowns(user.getId()));
//	        return "dashboard";
//	    }
	    
	    
	    
	    @GetMapping("/dashboard")
	    public String userDashboard(Model model, HttpSession session) {
	    	Users user = (Users) session.getAttribute("user");
	        if (user == null) return "redirect:/login";

	        model.addAttribute("user", user); // ✅ Add this line
	        model.addAttribute("breakdowns", breakdownService.getUserBreakdowns(user.getId()));
	        return "dashboard";
	    }


	    @PostMapping("/submit-breakdown")
	    public String submitBreakdown(@ModelAttribute Breakdown breakdown, HttpSession session) {
	        Users user = (Users) session.getAttribute("user");
	        if (user == null) return "redirect:/login";

	        breakdown.setUser(user);
	        breakdownService.addBreakdown(breakdown);
	        return "redirect:/dashboard";
	    }
}
