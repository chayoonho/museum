package com.museum.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dto.MemberDto;
import com.museum.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	
	@RequestMapping("loginForm") //->login.jsp
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST) 
	public String login(@ModelAttribute("dto") @Valid MemberDto memberdto,
			BindingResult result, Model model, HttpServletRequest request) {
		
		if(result.getFieldError("id") != null) {
			model.addAttribute("message", "���̵� �Է��ϼ���" );
			return "member/login";
		} else if( result.getFieldError("pwd") != null) {
			model.addAttribute("message", "��й�ȣ�� �Է��ϼ���" );
			return "member/login";
		}
		
		MemberDto mdto = ms.getMember(memberdto.getId() );
		if( mdto == null ) {
			model.addAttribute("message", "ID�� �Է��ϼ���");
			return "member/login";
		} else if( mdto.getPwd() == null) {
			model.addAttribute("message"," ������ ���� �ʿ�");
			return "member/login";
		} else if( !mdto.getPwd().equals(memberdto.getPwd() )) {
			model.addAttribute("message", "��й�ȣ�� �Է��ϼ���");
			return "member/login";
		} else if( mdto.getPwd().equals(memberdto.getPwd() )) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mdto);
			return "redirect:/";
		}else {
			model.addAttribute("message","ERROR�߻� �α��� �Ұ�");
			return "member/login";
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	
	@RequestMapping("agreement")
	public String agreement() {
		return "member/agreement";
	}
	
	@RequestMapping(value="signupForm", method=RequestMethod.POST)
	public String signupForm() {
		return "member/signup";
	}
	
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public String signup(@ModelAttribute("dto") @Valid MemberDto memberdto,
			BindingResult result, Model model, HttpServletRequest request,
			@RequestParam(value="reid", required=false) String reid,
			@RequestParam(value="pwdCheck", required = false) String pwdCheck) {
		
		model.addAttribute("reid", reid);
		if(result.getFieldError("id") != null) {
			model.addAttribute("message","���̵� �Է��� �ʼ������Դϴ�");
			return "member/signup";
		} else if(result.getFieldError("pwd") != null) {
			model.addAttribute("message","��й�ȣ �Է��� �ʼ������Դϴ�");
			return "member/signup";
		} else if(result.getFieldError("name") != null) {
			model.addAttribute("message","���� �Է��� �ʼ������Դϴ�");
			return "member/signup";
		} else if(result.getFieldError("email") != null) {
			model.addAttribute("message","�̸��� �Է��� �ʼ������Դϴ�");
			return "member/signup";
		} else if( reid == null || (reid != null && !reid.equals(memberdto.getId() )  )) {
			model.addAttribute("message", "���̵� �ߺ�üũ�� ���� �����̽��ϴ�");
			return "member/signup";
		} else if( pwdCheck == null || ( pwdCheck!=null && !pwdCheck.equals(memberdto.getPwd() ))) {
			model.addAttribute("message", "��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�");
			return "member/signup";
		}
		ms.insertMember(memberdto);
		model.addAttribute("message", "ȸ�������� �Ϸ�Ǿ����ϴ�. �α��� ���ּ���");
		return "member/login";
	}
	
	@RequestMapping("idCheck")
	public ModelAndView idCheck(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		
		MemberDto mdto = ms.getMember(id);
		int result=0;
		if(mdto == null) result = -1;
		else result = 1;
		mav.addObject("result",result);
		mav.addObject("id",id);
		mav.setViewName("member/idcheck");
		
		return mav;
	}
	
	
	@RequestMapping("/myPageForm")
	public ModelAndView myPageForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		mav.setViewName("mypage/mypageform");
		
		return mav;
	}
	
	
	@RequestMapping("/memberInfo")
	public ModelAndView memberInfo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberDto mdto = (MemberDto)session.getAttribute("loginUser");
		mav.setViewName("mypage/memberInfo");
		return mav;
	}
	
	
	@RequestMapping("/memberEditForm")
	public ModelAndView memberEditForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberDto mdto = (MemberDto)session.getAttribute("loginUser");
		
		mav.addObject("dto",mdto);
		mav.setViewName("member/editMemberForm");
		
		return mav;
	}
	
	@RequestMapping(value="memberEdit", method=RequestMethod.POST)
	public String memberEdit(@ModelAttribute("dto") @Valid MemberDto memberdto,
			BindingResult result, Model model, HttpServletRequest request) {
		
		if(result.getFieldError("pwd") != null) {
			request.setAttribute("message", result.getFieldError("pwd").getDefaultMessage());
			return "member/editMemberForm";
		}else if(result.getFieldError("email")!=null) {
			request.setAttribute("message", result.getFieldError("email").getDefaultMessage());
			return "member/editMemberForm";
		}else if(result.getFieldError("phone")!=null) {
			request.setAttribute("message", result.getFieldError("phone").getDefaultMessage());
			return "member/editMemberForm";
		}
		ms.updateMember(memberdto);
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", memberdto);
		return "mypage/memberInfo";
	}
	
	
	@RequestMapping("memberDeleteForm")
	public ModelAndView memberDeleteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberDto mdto = (MemberDto)session.getAttribute("loginUser");
		
		mav.addObject("dto",mdto);
		mav.setViewName("member/deleteMemberForm");
		return mav;
	}
	
	@RequestMapping(value="memberDelete", method=RequestMethod.POST)
	public String memberDelete(@ModelAttribute("dto") @Valid MemberDto memberdto,
			BindingResult result, Model model, HttpServletRequest request) {
		
		if(result.getFieldError("pwd") != null) {
			request.setAttribute("message", result.getFieldError("pwd").getDefaultMessage());
			return "member/deleteMemberForm";
		}
		ms.deleteMember(memberdto);
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", memberdto);
		return "redirect:/main";
	}
}
