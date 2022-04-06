package com.stone.springmvc.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.springmvc.cart.common.Cart;
import com.stone.springmvc.cart.dataservice.ICartDAO;

@Service
public class CartService implements ICartService {

	@Autowired
	ICartDAO cartDAO;
	

	//장바구니 목록
	@Override
	public List<Cart> cartCollectAll(int m_no) {
		return cartDAO.cartCollectAll(m_no);
	}
	
	//장바구니 저장
	@Override
	public void cartAdd(Cart cart) {
		cartDAO.cartAdd(cart);
	}
	
	//장바구니 수정
	@Override
	public void cartUpdate(int no, int count) {
		cartDAO.cartUpdate(no,count);
	}
	
	//장바구니 삭제
	@Override
	public void cartDelete(int[] no) {
		cartDAO.cartDelete(no);
		
	}
	
	//번호로 장바구니조회
	@Override
	public Cart cartSerchByNo(int no) {
		return cartDAO.cartSerchByNo(no);
	}
	
}
