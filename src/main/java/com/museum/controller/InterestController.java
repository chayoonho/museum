package com.museum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.museum.service.InterestService;

@Controller
public class InterestController {
	
	@Autowired
	InterestService interestSvc;

}
