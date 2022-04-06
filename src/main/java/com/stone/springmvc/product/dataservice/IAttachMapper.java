package com.stone.springmvc.product.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.stone.springmvc.product.common.Attach;

@Mapper
public interface IAttachMapper {
	@Insert("insert into attach(name,size,p_no) values(#{name},#{size},#{product.no})")
	void save(Attach 첨부);
	
	//bulk insert
	@Insert({
        "<script>",        
        "insert into attach(name,size,p_no) values ",    
        "<foreach collection='attachs' item='attach' index='index' separator=','>",
        "(#{attach.name}, #{attach.size}, #{attach.product.no})",
        "</foreach>",
        "</script>"})
	void saveAttachs(@Param(value="attachs")List<Attach> attachs);
	
	@Select("select * from attach where p_no=#{p_no}")
	List<Attach> selectByProductNo(@Param("p_no") int 상품번호);	
		
	@Select("select * from attach where no=#{no}")
	@Results(value = {
	         @Result(property="no", column="no"),
	         @Result(property="name", column="name"),
	         @Result(property="size", column="size"),
	         @Result(property="product.no", column="p_no")})	
	Attach findByNo(@Param("no") int 첨부번호);
}
