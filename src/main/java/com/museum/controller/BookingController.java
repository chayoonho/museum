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

import com.museum.dto.BookingDto;
import com.museum.dto.MemberDto;
import com.museum.dto.Paging;
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
		HttpSession session =request.getSession();
		
		MemberDto mdto = (MemberDto) session.getAttribute("loginUser");
		
		mav.addObject("programDto", programSvc.getProgram(num));
		mav.addObject("bookingList", bookingSvc.selectBookingAll(mdto.getId()) );
		mav.setViewName("booking/bookingForm");
		
		return mav;		
	}
	
	@RequestMapping(value="booking", method=RequestMethod.POST)
	public ModelAndView booking(@ModelAttribute("dto")BookingDto bookingdto, 			
			Model model, HttpServletRequest request) {
			ModelAndView mav= new ModelAndView();
			HttpSession session=request.getSession();
			bookingSvc.insertBooking(bookingdto);
			
			MemberDto mdto = (MemberDto) session.getAttribute("loginUser");
			mav.addObject("bookingList", bookingSvc.selectBookingAll(mdto.getId()) );
			mav.setViewName("mypage/mypageBookingList");
			return mav;
		}
	
	@RequestMapping("bookingList")
	public ModelAndView programList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		MemberDto mdto = (MemberDto) session.getAttribute("loginUser");
				
		mav.addObject("bookingList", bookingSvc.selectBookingAll(mdto.getId()) );
		mav.setViewName("mypage/mypageBookingList");

		return mav;
	}
	
	@RequestMapping("bookingDetail")
	public ModelAndView programDetail(@RequestParam("num") int num
			/*@RequestParam("program_num") int program_num*/) {
		ModelAndView mav = new ModelAndView();
	
		/* mav.addObject("programDto", programSvc.getProgram(program_num)); */ 

		mav.addObject("bookingDto", bookingSvc.getBooking(num));
		mav.setViewName("booking/bookingDetail");

		return mav;
	}
	
	@RequestMapping("bookingUpdateForm")
	public ModelAndView bookingUpdateForm(@RequestParam("num") int num, 
		/*@RequestParam("program_num") int program_num,*/
		HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		/* mav.addObject("programDto", programSvc.getProgram(program_num)); */
		mav.addObject("bookingDto", bookingSvc.getBooking(num));
		mav.setViewName("booking/bookingUpdateForm");
		
		return mav;		
	}
	@RequestMapping("bookingConfirmForm")
	public String bookingConfirmForm(@RequestParam("num") int num) {
		return "booking/bookingConfirmForm?"+num;
	}
	
	
	@RequestMapping(value = "bookingUpdate", method = RequestMethod.POST)
	public ModelAndView bookingUpdate(@ModelAttribute("dto") BookingDto bookingdto) {
		ModelAndView mav = new ModelAndView();
		bookingSvc.updateBoard(bookingdto);
		
		mav.addObject("bookingDto", bookingSvc.getBooking(bookingdto.getNum()));
		mav.setViewName("booking/bookingConfirmForm");
		return mav;
	}
	
	@RequestMapping("bookingCancel")
	public String bookingCancel(HttpServletRequest request, @RequestParam("num") int num,
			Model model) {
		bookingSvc.cancelBooking(num);
		
		HttpSession session = request.getSession();
		MemberDto mdto = (MemberDto) session.getAttribute("loginUser");
		
		model.addAttribute("bookingList", bookingSvc.selectBookingAll(mdto.getId()) );
		return "mypage/mypageBookingList";
	}
	
}
