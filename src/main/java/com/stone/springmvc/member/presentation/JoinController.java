package com.stone.springmvc.member.presentation;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.member.service.IMemberService;

@Controller
public class JoinController {
	
	@Autowired
	IMemberService memberService;
	
	//회원가입약관
	@RequestMapping("/agree")
	ModelAndView agreeTerms() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("loginout/JoinAgreeWindow");
		return mv;
	}

	//회원가입 준비
	@GetMapping("/join")
	ModelAndView joinPrepare() {
		ModelAndView mv = new ModelAndView();
		
		memberService.joinPrepare();
		mv.setViewName("loginout/JoinWindow");
		
		return mv;
	}
	
	//회원가입
	@PostMapping("/join")
	ModelAndView join(Member member) {
		ModelAndView mv = new ModelAndView();
		
		memberService.join(member);
		mv.setViewName("loginout/JoinSuccessWindow");
		
		return mv;
	}
	
	//아이디 중복검사준비
	@GetMapping("/idcheck")
	ModelAndView idDuplicationChkReady() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("loginout/IdCheckWindow");
		
		return mv;
	}
	
	//아이디 중복검사
	@PostMapping("/idcheck")
	ModelAndView idDupliacationChk(String id) {
		ModelAndView mv = new ModelAndView();
		boolean usable = memberService.idExistOrNot(id);
		
		mv.addObject("id", id);
		mv.addObject("usable", usable);
		
		mv.setViewName("loginout/IdCheckWindow");
		
		return mv;
	}
	
	//탈퇴준비
	@GetMapping("/leave")
	public ModelAndView leavePrepare(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		mv.addObject("isLogin",loginIn);
		
		mv.setViewName("loginout/LeaveMemberWindow");
			
		return mv;
	}
		
	//회원탈퇴(상태변경)
	@PostMapping("/leave")
	public ModelAndView leaves(Member member, HttpSession session) {
		ModelAndView mv = new ModelAndView();
			
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		mv.addObject("isLogin",loginIn);
		
		memberService.leaveMembers(member);
		mv.addObject("member", member);
		
		mv.setViewName("redirect:/main");
			
		//로그인 되어있을 경우 탈퇴시 로그아웃 진행
		if(session!=null && session.getAttribute("id")!=null) {
			//세션 객체 무효화 
			session.invalidate();		
		}
		return mv;
		}
	
	//마이페이지
	@RequestMapping("/mypage")
	public ModelAndView mypages(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		mv.addObject("isLogin",loginIn);
		mv.setViewName("loginout/MyPageWindow");
		
		return mv;
	}
	
}
