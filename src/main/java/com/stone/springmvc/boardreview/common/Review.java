package com.stone.springmvc.boardreview.common;

import java.sql.Date;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.product.common.Product;

public class Review {
	int no;
	Product product; //p_no
	String title;
	String contents;
	Member writer; //writer
	Date rdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Member getWriter() {
		return writer;
	}
	public void setWriter(Member writer) {
		this.writer = writer;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	

	

}
