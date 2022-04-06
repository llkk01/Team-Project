package com.stone.springmvc.loginout.service;

import com.stone.springmvc.member.common.Admin;
import com.stone.springmvc.member.common.Member;

public interface ILoginService {

	//로그인 준비
	public boolean loginPrepare();
	
	//로그인 조회
	public Member loginUsable(String id, String password); 
	
	
	
	//Admin 관리자 로그인
	
	//로그인 준비
	public boolean adminLoginPrepare();
	
	//로그인 조회
	public Admin adminLoginUsable(String id, String password); 
	
}