package com.museum.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dto.RelicDto;
import com.museum.service.RelicService;
import com.museum.util.Paging;
import com.museum.util.RelicXMLParsing;

@Controller
public class RelicController {
	
	@Autowired
	RelicService relicSvc;

	@RequestMapping("/collectionList")
	public ModelAndView collectionList(Model model, HttpServletRequest request) 
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
		
		RelicXMLParsing relicParsing = new RelicXMLParsing();
		List<RelicDto> list = new ArrayList<RelicDto>();

		// 소장품 조회
		list = relicParsing.viewRelic("1", "2", "", Integer.toString(page), "");
		
		Paging paging = new Paging();

		paging.setPage(page);
		
		int totalCount = Integer.parseInt(list.get(0).getTotalCount());
		paging.setTotalCount(totalCount);
		paging.paging();
		
		mav.addObject("relicList", list);
		mav.addObject("paging", paging);
		
		mav.setViewName("relic/collectionList");
		
		return mav;
	}
	
	@RequestMapping("/collectionDetail")
	public ModelAndView collectionDetail(Model model, @RequestParam("id") String id) 
	{
		ModelAndView mav = new ModelAndView();
		
		RelicXMLParsing relicParsing = new RelicXMLParsing();
		List<RelicDto> list = new ArrayList<RelicDto>();
		
		// 해당 소장품 조회
		list = relicParsing.viewRelic("1", "3", id, "", "");
		
		mav.addObject("relicList", list);

		mav.setViewName("relic/collectionDetail");
		
		return mav;
	}
	
	@RequestMapping("/treasureList")
	public ModelAndView treasureList(Model model, HttpServletRequest request) 
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
		
		RelicXMLParsing relicParsing = new RelicXMLParsing();
		List<RelicDto> list = new ArrayList<RelicDto>();

		// 보물 조회
		list = relicParsing.viewRelic("2", "2", "", Integer.toString(page), "");
		
		Paging paging = new Paging();

		paging.setPage(page);
		
		int totalCount = Integer.parseInt(list.get(0).getTotalCount());
		paging.setTotalCount(totalCount);
		paging.paging();
		
		mav.addObject("relicList", list);
		mav.addObject("paging", paging);
		
		mav.setViewName("relic/treasureList");
		
		return mav;
	}
	
	@RequestMapping("/treasureDetail")
	public ModelAndView treasureDetail(Model model, @RequestParam("id") String id) 
	{
		ModelAndView mav = new ModelAndView();
		
		RelicXMLParsing relicParsing = new RelicXMLParsing();
		List<RelicDto> list = new ArrayList<RelicDto>();
		
		// 해당 보물 조회
		list = relicParsing.viewRelic("2", "3", id, "", "");
		
		mav.addObject("relicList", list);
		
		mav.setViewName("relic/treasureDetail");
		
		return mav;
	}
	
	@RequestMapping("/searchRelic")
	public ModelAndView searchRelic(Model model, HttpServletRequest request, 
			@RequestParam("prev") String prev, @RequestParam("searchName") String searchName) 
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
		

		RelicXMLParsing relicParsing = new RelicXMLParsing();
		List<RelicDto> list = new ArrayList<RelicDto>();
		
		if(prev.equals("treasureList"))
		{
			mav.setViewName("relic/treasureList");
			// 보물 검색
			list = relicParsing.viewRelic("2", "4", "", Integer.toString(page), searchName);
		}
		else
		{
			mav.setViewName("relic/collectionList");
			// 소장품 검색
			list = relicParsing.viewRelic("1", "4", "", Integer.toString(page), searchName);
		}
		
		Paging paging = new Paging();

		paging.setPage(page);
		
		int totalCount = Integer.parseInt(list.get(0).getTotalCount());
		paging.setTotalCount(totalCount);
		paging.paging();
		
		mav.addObject("relicList", list);
		mav.addObject("paging", paging);
		
		return mav;
	}
}
