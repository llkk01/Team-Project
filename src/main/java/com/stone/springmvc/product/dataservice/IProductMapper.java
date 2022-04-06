package com.stone.springmvc.product.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.stone.springmvc.product.common.Product;

@Mapper
public interface IProductMapper {
	
	@Insert("insert into product(name,detail,price,num,quan,state) values(#{name},#{detail},#{price},#{num},#{quan},#{state})")
	@SelectKey(statement="select last_insert_id()", keyProperty="no", before=false, resultType=int.class)
	void saveOnlyProduct(Product product);//attachs가 저장안됨
	//product.getNo()->발생된 키값가짐
	
	@Select("select * from product where no=#{no}")
	@Results(value = {
	         @Result(property="no", column="no"),
	         @Result(property="name", column="name"),
	         @Result(property="detail", column="detail"),
	         @Result(property="price", column="price"),
	         @Result(property="num", column="num"),
	         @Result(property="quan", column="quan"),
	         @Result(property="state", column="state"),
	         @Result(property="attachs", javaType=List.class, column="no",many=@Many(select="com.stone.springmvc.product.dataservice.IAttachMapper.selectByProductNo"))   })
	Product findByNo(int no);																								
	
	//상품수정
	@Update("update product set name=#{name}, detail=#{detail}, price=#{price}, quan=#{quan}, state=#{state}  where no=#{no}")
	void updateProduct(Product product);	
	
	//상품전체출력
	@Select("select * from product where state='1' and num=#{num}")
	@Results(value = {
	         @Result(property="no", column="no"),
	         @Result(property="name", column="name"),
	         @Result(property="detail", column="detail"),
	         @Result(property="price", column="price"),
	         @Result(property="num", column="num"),
	         @Result(property="quan", column="quan"),
	         @Result(property="state", column="state"),
	         @Result(property="attachs", javaType=List.class, column="no",
	         many=@Many(select="com.stone.springmvc.product.dataservice.IAttachMapper.selectByProductNo"))   })
	List<Product> selectAll(int num);
	
    //void delete(int no);
	@Update("update product set quan=quan-#{count} where no=#{no}")
	void updateCount(@Param("no") int no, @Param("count") int count);	

}
