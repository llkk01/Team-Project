package com.stone.springmvc.cart.dataservice;

import java.util.List;

import com.stone.springmvc.cart.common.Cart;

public interface ICartDAO {

	//장바구니 보기
	public List<Cart> cartCollectAll(int m_no);
	
	//장바구니 추가
	public void cartAdd(Cart cart);
	
	//장바구니 업데이트
	public void cartUpdate(int no, int count);
	
	//장바구니 삭제
	public void cartDelete(int[] no);
	
	//번호로 해당 장바구니 찾기
	public Cart cartSerchByNo(int no);
}
