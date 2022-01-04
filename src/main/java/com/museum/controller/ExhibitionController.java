package com.museum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dto.Paging;
import com.museum.service.ExhibitionService;

@Controller
public class ExhibitionController {
	
	@Autowired
	ExhibitionService exhbnSvc;
	
	@RequestMapping("/exhibitionSpecialList")
	public ModelAndView exhibitionSpecialList(Model model, HttpServletRequest request, @RequestParam("kind") String kind) 
	{
		ModelAndView mav = new ModelAndView();
		
		// page 세팅
		int page = 1;
		HttpSession session = request.getSession();
		
		if(request.getParameter("page") != null)
		{
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		}
		else
		{
			page = 1;
			session.removeAttribute("page");
		}
		
		Paging paging = new Paging();
		paging.setPage(page);
		
		int count = exhbnSvc.getAllCount(kind);

		paging.setTotalCount(count);
		paging.paging();

		mav.addObject("kind", kind);
		mav.addObject("ExhibitionList", exhbnSvc.getExhbnSpList(paging, kind));
		mav.addObject("paging", paging);
		
		mav.setViewName("exhibition/exhibitionSpecialList");
		
		return mav;
	}

	@RequestMapping("/exhibitionSpecialDetail")
	public ModelAndView exhibitionSpecialDetail(Model model, HttpServletRequest request, @RequestParam("kind") String kind, @RequestParam("num") int num) 
	{
		ModelAndView mav = new ModelAndView();

		mav.addObject("kind", kind);
		mav.addObject("ExhibitionDto", exhbnSvc.getExhbnSp(num));
		
		mav.setViewName("exhibition/exhibitionSpecialDetail");
		
		return mav;
	}
	

}
