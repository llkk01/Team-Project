package com.stone.springmvc.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.springmvc.member.common.Admin;
import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.member.dataservice.IMemberDAO;

@Service
public class MemberService implements IMemberService {

	@Autowired
	IMemberDAO memberDAO;
	
	//회원가입준비하다
	@Override
	public boolean joinPrepare() {
		
		return true;
	}

	//회원가입하다
	@Override
	public void join(Member member) {
		
		memberDAO.saveMemberData(member);
	}

	//아이디중복검사하다
	@Override
	public boolean idExistOrNot(String id) {
		return !memberDAO.idUsableOrNot(id);
	}

	//로그인하다
	@Override
	public Member selectIDPW(String id, String password) {
		
		return memberDAO.selectIDPW(id, password);
	}

	//회원 탈퇴(상태 변경)
	@Override
	public void leaveMembers(Member member) {
		memberDAO.leaveMember(member);
	}
	
	//회원번호 찾기
	@Override
	public Member memberByNo(int no) {
		
		return memberDAO.memberSerchByNo(no);
	}
	
	
	//Admin 관리자용
	
	//회원목록 출력 
	
	@Override
	public List<Member> selectMembers() {
		
		return memberDAO.selectMember();
	}

	//관리자 id,pw 로그인
	@Override
	public Admin adminSelectIDPW(String id, String password) {
		
		return memberDAO.adminSelectIDPW(id, password);
	}

}