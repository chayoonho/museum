package com.museum.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dto.MemberDto;
import com.museum.dto.VocDto;
import com.museum.service.VocService;

@Controller
public class VocController {
	
	@Autowired
	VocService vocSvc;
	
	@RequestMapping("/vocList")//-> 고객의소리 리스트 select
	public ModelAndView vocList(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberDto mdto = (MemberDto)session.getAttribute("loginUser");
		if(mdto == null) {
			mav.setViewName("member/login");
		}else {
			ArrayList<VocDto> list = vocSvc.listVoc(mdto.getId());
			mav.addObject("vocList", list);
			mav.setViewName("voc/vocList");
		}
		System.out.println("MemberDto::"+mdto);
		return mav;

	}
	
	@RequestMapping("vocWriteForm")//->고객의소리 글쓰기폼
	public String vocWriteForm(HttpServletRequest request) {
	
		return "voc/vocWrite";
		
	}
	
	@RequestMapping(value="vocWrite", method=RequestMethod.POST)//-> 고객의소리 글쓰기 insert
	public String vocWrite(@ModelAttribute("dto") @Valid VocDto vocdto,
			BindingResult result, Model model, HttpServletRequest request) {
		
		System.out.println("vocdto::"+vocdto);
		if(result.getFieldError("title") == null) {
			request.setAttribute("message", "제목은 필수입력사항입니다");
			return "voc/vocWrite";
		}else if(result.getFieldError("content") == null) {
			request.setAttribute("message", "내용을 입력해주세요");
			return "voc/vocWrite";
		}

		
		HttpSession session = request.getSession();
		vocSvc.insertVoc(vocdto);
		
		return "voc/vocList";
	}
	
	
	
	
	
	
	
	
}
