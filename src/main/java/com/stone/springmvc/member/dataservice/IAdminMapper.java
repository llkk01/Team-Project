package com.stone.springmvc.member.dataservice;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.stone.springmvc.member.common.Admin;
import com.stone.springmvc.member.common.Member;

@Mapper
public interface IAdminMapper {
	
		//admin id사용가능한지 아닌지 확인(ID중복검사)
		@Select("select if(count(*)=1,0,1) from admin where id=#{id}")
		public boolean idUsableOrNot(String id);
		
		@Select("select * from admin where no=#{no}")
		@Results(value= {
				@Result(property="no", column="no"),
				@Result(property="name", column="name"),
				@Result(property="id", column="id"),
				@Result(property="password", column="password"),
				@Result(property="duty", column="duty")	})
		public Admin adminSerchByNo(@Param("no")int no);

		@Select("select * from admin where id=#{id} and password=#{password}")
		@Results(value= {
				@Result(property="no", column="no"),
				@Result(property="name", column="name"),
				@Result(property="id", column="id"),
				@Result(property="password", column="password"),
				@Result(property="duty", column="duty")	})
		public Admin selectIDPW(@Param("id") String id, @Param("password") String password);

		
		
		
		
}
