package com.stone.springmvc.member.presentation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.member.service.IMemberService;

@Controller
public class AdminMemberController {
	
	@Autowired
	IMemberService memberService;
	
	
	//회원목록 출력
	@RequestMapping("/memberList")
	public ModelAndView memberList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		List<Member> list = memberService.selectMembers();
		
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		mv.addObject("members", list);
		mv.addObject("isLogin",loginIn);
		
		mv.setViewName("admin/Admin_MemberListWindow");
		
		return mv;
	}

}