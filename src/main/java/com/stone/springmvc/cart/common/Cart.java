package com.stone.springmvc.cart.common;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.product.common.Product;

public class Cart {

	//장바구니
	int no;			//제품번호
//	int member;	//로그인한 회원번호(member의 no/m_no)
//	int product;//제품의 고유번호(product의 no/p_no)
	Member member;	//로그인한 회원번호(member의 no/m_no)
	Product product;//제품의 고유번호(product의 no/p_no)
	int count;		//장바구니의 제품 개수
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	

	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	//	public int getMember() {
//		return member;
//	}
//	public void setMember(int member) {
//		this.member = member;
//	}
//	public int getProduct() {
//		return product;
//	}
//	public void setProduct(int product) {
//		this.product = product;
//	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	

}
