package com.stone.springmvc.member.dataservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stone.springmvc.member.common.Admin;
import com.stone.springmvc.member.common.Member;

@Repository
public class MemberDAO implements IMemberDAO {

   @Autowired IMemberMapper memberMapper;
   @Autowired IAdminMapper adminMapper;
   
   
   //admin+member 아이디 사용가능한지 아닌지 확인(ID중복검사)
   @Transactional
   @Override
   public boolean idUsableOrNot(String id) {
      boolean usable = ((memberMapper.idUsableOrNot(id)==false)||(adminMapper.idUsableOrNot(id)==false))?true:false;
      
      return usable;
   }
   
   //회원정보 저장
   @Transactional
   @Override
   public void saveMemberData(Member member) {
      memberMapper.saveMemberData(member);
      
   }

   //회원 ID,PW 조회
   @Transactional
   @Override
   public Member selectIDPW(String id, String password) {
      return memberMapper.selectIDPW(id, password);
   }

   //회원번호 찾기
   @Transactional
   @Override
   public Member memberSerchByNo(int no) {
      return memberMapper.memberSerchByNo(no);
   }

   
   //회원 탈퇴(상태 변경)
   @Transactional
   @Override
   public void leaveMember(Member member) {
	   memberMapper.leaveMember(member);
   }
   
   
   //Admin 관리자용
   
   //회원목록 출력 
   @Transactional
   @Override
   public List<Member> selectMember() {
      return memberMapper.selectMember();
   }

   //관리자 아이디비밀번호 조희
   @Override
   public Admin adminSelectIDPW(String id, String password) {
      
      return adminMapper.selectIDPW(id, password);
   }


}