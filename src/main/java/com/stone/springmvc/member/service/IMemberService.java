package com.stone.springmvc.member.service;


import java.util.List;

import com.stone.springmvc.member.common.Admin;
import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.product.common.Attach;

public interface IMemberService {

	//회원가입준비하다
	public boolean joinPrepare();
	
	//회원가입하다
	public void join(Member member);

	//아이디중복검사하다
	public boolean idExistOrNot(String id);
	
	//로그인하다
	public Member selectIDPW(String id, String password);
	
	//회원탈퇴하다(상태변경)
	public void leaveMembers(Member member);
	
	//회원번호 찾기
	public Member memberByNo(int no);
	
	
	//Admin 관리자용
	
	//회원목록 출력 
	public List<Member> selectMembers();
	
	//관리자 id,pw 로그인
	public Admin adminSelectIDPW(String id, String password);
	
}