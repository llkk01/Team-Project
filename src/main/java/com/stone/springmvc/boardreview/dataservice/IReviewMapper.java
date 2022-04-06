package com.stone.springmvc.boardreview.dataservice;

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

import com.stone.springmvc.boardreview.common.Review;

@Mapper
public interface IReviewMapper {
	
	@Insert("insert into review(title,contents,writer,p_no,rdate) values(#{title},#{contents},#{writer.no},#{product.no},current_timestamp)")
	public void save(Review review);
	
	@Select("select * from review where p_no=#{p_no}")
	@Results(value= {
			@Result(property="no", column="no"),
			@Result(property="product", column="p_no", one=@One(select="com.stone.springmvc.product.dataservice.IProductMapper.findByNo")),
			@Result(property="title", column="title"),
			@Result(property="writer", column="writer", one=@One(select="com.stone.springmvc.member.dataservice.IMemberMapper.memberSerchByNo"))
			
	})
	public List<Review> reviewCollectAll(@Param("p_no") int p_no);
	
	//리뷰가져오기
	@Select("select * from review where no=#{no}")
	@Results(value= {
			@Result(property="no", column="no"),
			@Result(property="contents", column="contents"),
			@Result(property="rdate", column="rdate"),
			@Result(property="writer", column="writer", one=@One(select="com.stone.springmvc.member.dataservice.IMemberMapper.memberSerchByNo")),
			@Result(property="product", column="p_no", one=@One(select="com.stone.springmvc.product.dataservice.IProductMapper.findByNo"))
	})
	public Review readReview(int no);
	
	//리뷰업데이트
	@Update("update review set contents=#{contents} where no=#{no}")
	public void update(Review review);
	
	//리뷰삭제
	@Delete("delete from review where no=#{no}")
	public void delete(int no);
	
	
	
	
	//Admin
	@Select("select * from review order by no desc")
	@Results(value= {
			@Result(property="no", column="no"),
			@Result(property="product", column="p_no", one=@One(select="com.stone.springmvc.product.dataservice.IProductMapper.findByNo")),
			@Result(property="contents", column="contents"),
			@Result(property="writer", column="writer", one=@One(select="com.stone.springmvc.member.dataservice.IMemberMapper.memberSerchByNo"))
	})
	public List<Review> reviewCollectAll2();
}

	