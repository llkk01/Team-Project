package com.stone.springmvc.loginout.presentation;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.loginout.service.ILoginService;
import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.member.service.IMemberService;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_ADDPeer;

@Controller
public class LoginController {

	@Autowired
	ILoginService loginService;
	IMemberService memberService;
	
	
	//로그인 준비
	@GetMapping("/login")
	ModelAndView loginPrepare() {
		ModelAndView mv = new ModelAndView();
		
		if(loginService.loginPrepare()){
			mv.setViewName("loginout/LoginWindow"); //로그인창 이동
		}
		return mv;
	}
	
	//<</login-post>>login(in id:String, in password:String): ModelAndView > HttpSession session 추가 
	//로그인 
	@PostMapping("/login")
	ModelAndView login(String id, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		boolean loginIn = (session.getAttribute("id")!=null)?true:false;

		//로그인 성공 시
		Member loginUser = loginService.loginUsable(id, password);

		
		if(loginUser!=null) {
			//로그인정보 저장
			session.setAttribute("id", id);
			session.setAttribute("userNo", loginUser.getNo());
			session.setAttribute("userId", loginUser.getId());
			session.setAttribute("userName", loginUser.getName());
			session.setAttribute("userState", loginUser.getState());
			mv.addObject("isLogin",loginIn);
			
			if(session.getAttribute("userState").equals("1")) { 
				mv.setViewName("redirect:/main"); //로그인 성공 시 메인페이지 이동
			}
			if(session.getAttribute("userState").equals("2")) { //상태가 2일 경우(탈퇴한 회원)
				session.invalidate();//세션무효화(로그아웃)
				mv.setViewName("loginout/LeaveLoginErrorWindow");
			}
			
		}else{
			//로그인 실패 시
			mv.setViewName("loginout/LoginErrorWindow");
		}	
		
		return mv;
	}

	//<</logout-get>>logout(): ModelAndView >(HttpSession sessio)추가
	//로그아웃
	@GetMapping("/logout")
	ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//로그인 되어있을 경우
		if(session!=null && session.getAttribute("id")!=null) {
			//세션 객체를 무효화 시킴
			session.invalidate();
			boolean loginIn = false;
			mv.setViewName("redirect:/main");
			mv.addObject("isLogin",loginIn);
		} 
		return mv;
	}
	
	
}
