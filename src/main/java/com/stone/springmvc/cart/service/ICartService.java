package com.stone.springmvc.cart.service;

import java.util.List;

import com.stone.springmvc.cart.common.Cart;

public interface ICartService {
	
	//장바구니 목록
	public List<Cart> cartCollectAll(int m_no);
	//장바구니 저장
	public void cartAdd(Cart cart);
	//장바구니 수정
	public void cartUpdate(int no, int count);
	//장바구니 삭제
	public void cartDelete(int[] no);
	
	public Cart cartSerchByNo(int no);
}
