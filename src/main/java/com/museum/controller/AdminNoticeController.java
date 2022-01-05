package com.museum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.museum.service.AdminNoticeService;

@Controller
public class AdminNoticeController {

	@Autowired
	AdminNoticeService adminSvc;
}
