package com.stone.springmvc.member.dataservice;

import java.util.List;

import com.stone.springmvc.member.common.Admin;
import com.stone.springmvc.member.common.Member;

public interface IMemberDAO {

	//아이디 사용가능한지 아닌지 확인(ID중복검사)
	public boolean idUsableOrNot(String id);
	
	//회원정보 저장
	public void saveMemberData(Member member);
	
	//회원 ID,PW 조회
	public Member selectIDPW(String id, String password);
	
	//회원번호 찾기
	public Member memberSerchByNo(int no);
	
	
	//회원 탈퇴(상태 변경)
	public void leaveMember(Member member);
	
	
	//Admin 관리자용
	
	//회원목록 출력 
	public List<Member> selectMember();
	
	//관리자 id,pw 로그인
	public Admin adminSelectIDPW(String id, String password);
}