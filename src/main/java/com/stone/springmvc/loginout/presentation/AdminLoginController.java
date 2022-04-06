package com.stone.springmvc.loginout.presentation;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.loginout.service.ILoginService;
import com.stone.springmvc.member.common.Admin;

@Controller
public class AdminLoginController {

	@Autowired
	ILoginService loginService;
	
	//Admin 관리자 로그인
	//로그인 준비
	@GetMapping("/adminlogin")
	ModelAndView adminLoginPrepare() {
		ModelAndView mv = new ModelAndView();
		
		if(loginService.adminLoginPrepare()){
			mv.setViewName("admin/Admin_LoginWindow"); //로그인창 이동
		}
		return mv;
	}
	
	//<</login-post>>login(in id:String, in password:String): ModelAndView > HttpSession session 추가 
	//로그인 
	@PostMapping("/adminlogin")
	ModelAndView login(String id, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		//로그인 성공 시
		Admin loginUser = loginService.adminLoginUsable(id, password);
		if(loginUser!=null) {
			//로그인정보 저장
			session.setAttribute("id", id);
			session.setAttribute("userNo", loginUser.getNo());
			session.setAttribute("userId", loginUser.getId());
			session.setAttribute("userName", loginUser.getName());
			mv.addObject("isLogin",loginIn);
					
			mv.setViewName("redirect:/admin_main"); //로그인 성공 시 메인페이지 이동
			} else {
				//로그인 실패 시
				mv.setViewName("admin/Admin_LoginErrorWindow");
			}
			return mv;
	}

	//<</logout-get>>logout(): ModelAndView >(HttpSession sessio)추가
	//로그아웃
	@GetMapping("/adminlogout")
	ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//로그인 되어있을 경우
		if(session!=null && session.getAttribute("id")!=null) {
			//세션 객체를 무효화 시킴
			session.invalidate();
			boolean loginIn = false;
			mv.setViewName("redirect:/admin_main");
			mv.addObject("isLogin",loginIn);
		} 
		return mv;
	}
}