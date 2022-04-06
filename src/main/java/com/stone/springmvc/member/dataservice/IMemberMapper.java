package com.stone.springmvc.member.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Result;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.product.common.Product;
@Mapper
public interface IMemberMapper {

	//아이디 사용가능한지 아닌지 확인(ID중복검사)
	@Select("select if(count(*)=1,0,1) from member where id=#{id}")
	public boolean idUsableOrNot(String id);
	
	//회원정보 저장
	@Insert("insert into member(name,id,password,tel,date,gender,post,address,detailaddress,email) values(#{name},#{id},#{password},#{tel},#{date},#{gender},#{post},#{address},#{detailaddress},#{email})")
	public void saveMemberData(Member member);
	
	//회원 ID,PW 조회
	@Select("select * from member where id=#{id} and password=#{password}")
	@Results(value= {
			@Result(property="no", column="no"),
			@Result(property="name", column="name"),
			@Result(property="id", column="id"),
			@Result(property="password", column="password"),
			@Result(property="date", column="date"),
			@Result(property="gender", column="gender"),
			@Result(property="post", column="post"),
			@Result(property="address", column="address"),
			@Result(property="detailaddress", column="detailaddress"),
			@Result(property="email", column="email")	})
	public Member selectIDPW(@Param("id") String id, @Param("password") String password);
	
	//회원번호 찾기
	@Select("select * from member where no=#{no}")
	@Results(value= {
			@Result(property="no", column="no"),
			@Result(property="name", column="name"),
			@Result(property="id", column="id"),
			@Result(property="password", column="password"),
			@Result(property="date", column="date"),
			@Result(property="gender", column="gender"),
			@Result(property="post", column="post"),
			@Result(property="address", column="address"),
			@Result(property="detailaddress", column="detailaddress"),
			@Result(property="email", column="email")	})
	public Member memberSerchByNo(@Param("no") int no);

	//회원 탈퇴(상태 변경)
	@Update("update member set state=#{state} where no=#{no}")
	public void leaveMember(Member member);
	
	
	//Admin 관리자용
	
	//회원목록 출력 
	@Select("select * from member")
	@Results(value= {
			@Result(property="no", column="no"),
			@Result(property="name", column="name"),
			@Result(property="id", column="id"),
			@Result(property="password", column="password"),
			@Result(property="date", column="date"),
			@Result(property="gender", column="gender"),
			@Result(property="post", column="post"),
			@Result(property="address", column="address"),
			@Result(property="detailaddress", column="detailaddress"),
			@Result(property="email", column="email"),
			@Result(property="state", column="state"),
			@Result(property="rdate", column="rdate")	})
	public List<Member> selectMember();
	
}