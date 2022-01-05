package com.museum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.museum.service.BookingService;
import com.museum.service.ProgramService;

@Controller
public class BookingController {
	
	@Autowired
	BookingService bookingSvc;
	
	@Autowired
	ProgramService programSvc;
	
	@RequestMapping("bookingForm")
	public ModelAndView bookingForm(@RequestParam("num") int num, 
		HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		mav.addObject("programDto", programSvc.getProgram(num));
		mav.setViewName("booking/bookingForm");
		
		return mav;		
	}
}
