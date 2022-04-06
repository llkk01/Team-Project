package com.stone.springmvc.cart.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.stone.springmvc.cart.common.Cart;


@Mapper
public interface ICartMapper {
	
	//장바구니 담기
	@Insert("insert into cart(m_no,p_no,count) values(#{member.no},#{product.no},#{count})")
	void saveCartAdd(Cart cart);
	
	//장바구니 목록출력
	@Select("select * from cart where m_no=#{m_no}")
	@Results(value = {
	         @Result(property="no", column="no"),
	         @Result(property="member", column="m_no", one=@One(select="com.stone.springmvc.member.dataservice.IMemberMapper.memberSerchByNo")),
	         @Result(property="product", column="p_no", one=@One(select="com.stone.springmvc.product.dataservice.IProductMapper.findByNo")),
	         @Result(property="count", column="count")
	         })
	List<Cart> cartSelectAll(@Param("m_no") int m_no);
	
    //장바구니 수량변경
	@Update("update cart set count=#{count} where no=#{no}")
	void cartUpdate(@Param("no") int no, @Param("count") int count);
	
	
	//장바구니 삭제
	@Delete("delete from cart where no=#{no}")
	void cartDelete(@Param("no") int no);
	
	
	//번호로 장바구니 찾기
	@Select("select * from cart where no=#{no}")
	@Results(value = {
	         @Result(property="no", column="no"),
	         @Result(property="member", column="m_no", one=@One(select="com.stone.springmvc.member.dataservice.IMemberMapper.memberSerchByNo")),
	         @Result(property="product", column="p_no", one=@One(select="com.stone.springmvc.product.dataservice.IProductMapper.findByNo")),
	         @Result(property="count", column="count")
	         })
	Cart cartSerchByNo(@Param("no") int no);

}
