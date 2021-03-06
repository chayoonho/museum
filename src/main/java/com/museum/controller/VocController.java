package com.museum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dto.Paging;
import com.museum.service.ProgramService;
import com.museum.service.VocService;

@Controller
public class VocController {
	
	@Autowired
	VocService vocSvc;
	
	@Autowired
	ProgramService programSvc;
	
	@RequestMapping("vocList")
	public ModelAndView vocList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		if (request.getParameter("first") != null) {
			session.removeAttribute("page");
			session.removeAttribute("key");
		}

		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		} else if (session.getAttribute("page") != null) {
			page = (int) session.getAttribute("page");
		} else {
			page = 1;
			session.removeAttribute("page");
		}

		String key = "";
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
			session.setAttribute("key", key);
		} else if (session.getAttribute("key") != null) {
			key = (String) session.getAttribute("key");
		} else {
			session.removeAttribute("key");
			key = "";
		}

		Paging paging = new Paging();
		paging.setPage(page);
		paging.setDisplayRow(10);

		int count = programSvc.getAllCount("voc", "title", key);
		paging.setTotalCount(count);
		paging.paging();

		mav.addObject("VocList", vocSvc.listVoc(paging, key));
		mav.addObject("paging", paging);
		mav.addObject("key", key);
		mav.setViewName("voc/vocList");

		return mav;
	}
}
