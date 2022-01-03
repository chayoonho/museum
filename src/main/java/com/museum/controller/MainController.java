package com.museum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("architecturalOverview")
	public String architecturalOverview() {
		return "intro/architecturalOverview";
	}
	
	@RequestMapping("bus")
	public String bus() {
		return "intro/bus";
	}

	@RequestMapping("car")
	public String car() {
		return "intro/car";
	}
	
	@RequestMapping("greeting")
	public String greeting() {
		return "intro/greeting";
	}
	
	@RequestMapping("parking")
	public String parking() {
		return "intro/parking";
	}
	
	@RequestMapping("subway")
	public String subway() {
		return "intro/subway";
	}
	
	@RequestMapping("tourGuidance")
	public String tourGuidance() {
		return "intro/tourGuidance";
	}
	
}
