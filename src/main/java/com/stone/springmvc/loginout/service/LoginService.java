package com.stone.springmvc.loginout.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.springmvc.member.common.Admin;
import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.member.service.IMemberService;

@Service
public class LoginService implements ILoginService {

	@Autowired
	IMemberService memberService;
	
	//로그인 준비
	@Override
	public boolean loginPrepare() {

		return true;
	}

	//로그인 조회
	@Override
	public Member loginUsable(String id, String password) {
		
		return memberService.selectIDPW(id, password);
	}

	
	
	//Admin 관리자 로그인
	
	//로그인 준비
	@Override
	public boolean adminLoginPrepare() {
		
		return true;
	}
	
	//로그인 조회
	@Override
	public Admin adminLoginUsable(String id, String password) {
		
		return memberService.adminSelectIDPW(id, password);
	}

	
}