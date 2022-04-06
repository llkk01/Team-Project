package com.stone.springmvc.cart.dataservice;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stone.springmvc.cart.common.Cart;

@Repository
public class CartDAO implements ICartDAO {
	
	
	@Autowired ICartMapper cartMapper;
	
	//장바구니 목록 
	@Transactional
	@Override
	public List<Cart> cartCollectAll(int m_no) {
		return cartMapper.cartSelectAll(m_no);
	}
	

	//장바구니 추가
	@Transactional
	@Override
	public void cartAdd(Cart cart) {
		cartMapper.saveCartAdd(cart);
		
	}

	//장바구니 업데이트
	@Transactional
	@Override
	public void cartUpdate(int no, int count) {
		cartMapper.cartUpdate(no, count);
		
	}

	//장바구니 삭제
	@Transactional
	@Override
	public void cartDelete(int[] no) {
		for(int i : no) {
			cartMapper.cartDelete(i);
		}
	}
	//번호로 장바구니 찾기
	@Transactional
	@Override
	public Cart cartSerchByNo(int no) {
		return cartMapper.cartSerchByNo(no);
	}

	
}
