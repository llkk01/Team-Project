package com.stone.springmvc.contents.presentation;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.member.common.Member;


@Controller
public class MainController {

	//메인
	@GetMapping("/main")
	ModelAndView mainPage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member member = new Member();
		
		mv.setViewName("MainWindow"); //메인페이지	
		
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		mv.addObject("isLogin",loginIn);
		mv.addObject("member", member);
		
		return mv;
	}
	
	
	//관리자 메인
	@GetMapping("/admin_main")
	ModelAndView admin_mainPage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member member = new Member();
		
		mv.setViewName("Admin_MainWindow"); //메인페이지	
		
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		mv.addObject("isLogin",loginIn);
		mv.addObject("member", member);
		
		return mv;
	}
	
	//매장 안내
	@RequestMapping("/store")
	ModelAndView stores() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("StoreInfoWindow");
		return mv;
	}
	
	//이벤트 안내
	@GetMapping("/event")
	public ModelAndView event() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("EventWindow");
		return mv;
	}
	
	//워시소개
	 @RequestMapping("/washinfo")
	   ModelAndView washinfos() {
	      ModelAndView mv = new ModelAndView();
	      
	      mv.setViewName("WashInfoWindow");
	      
	      return mv;
	   }
	
}
