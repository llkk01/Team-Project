package com.stone.springmvc.cart.presentation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.cart.common.Cart;
import com.stone.springmvc.cart.service.ICartService;
import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.member.service.IMemberService;
import com.stone.springmvc.product.common.Product;
import com.stone.springmvc.product.service.IProductService;

@Controller
public class CartController {
	
	@Autowired ICartService cartService;
	@Autowired IProductService productService;
	@Autowired IMemberService memberService;

	//장바구니 담기
	@PostMapping("/cart/{p_no}")
	public ModelAndView cartAdd(@PathVariable int p_no, Cart cart, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		int userNum = (int)session.getAttribute("userNo");
		
		//로그인한 회원(=작성자 회원) 새게시물에 작성자 set해주기
		Member memberN = new Member();
		memberN.setNo(userNum);
		cart.setMember(memberN);
		
		Product productN = new Product();
		productN.setNo(p_no);
		cart.setProduct(productN);
		
		cartService.cartAdd(cart);
		
		mv.setViewName("redirect:/productdetail/"+p_no);
		
		return mv;
	}
	
	
	//장바구니 담기 성공시
	@GetMapping("/cart")
	public String successCart() {
		return "cart/CartSuccessWindow";
	}
	
	
	//장바구니 목록
	@GetMapping("/cartlist/{m_no}")
	ModelAndView cartCollectAll(@PathVariable int m_no, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		List<Cart> carts = cartService.cartCollectAll(m_no);
		List<Product> products = new ArrayList<Product>();
		
		//장바구니에 있는 모든 제품정보담기
		for(int i=0; i<carts.size(); i++) {
			int p_no = carts.get(i).getProduct().getNo();
			Product product = productService.productSerchByNo(p_no);
			products.add(product);
		}
		
		mv.setViewName("cart/CartListWindow");
		mv.addObject("carts", carts);
		mv.addObject("products", products);
		mv.addObject("isLogin",loginIn);
		
		return mv;
	}
	
	//장바구니 수량변경
	@PostMapping("/cartupdate")
	public ModelAndView cartUpdate(Cart cart, HttpSession session) {
		cartService.cartUpdate(cart.getNo(),cart.getCount());
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/cartlist/"+session.getAttribute("userNo"));
		return mv;
	}
	
	//장바구니 삭제
	@PostMapping("/cartdelete")
	public ModelAndView cartDelete(int[] no, HttpSession session) {
		cartService.cartDelete(no);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/cartlist/"+session.getAttribute("userNo"));
		
		return mv;
	}
	
	//장바구니 구매버튼 클릭시
	@GetMapping("/payment")
	public ModelAndView payment(HttpSession session) {
		int userNo = (int) session.getAttribute("userNo");
		Member member = memberService.memberByNo(userNo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", member);
		mv.setViewName("cart/PaymentWindow");
		return mv;
	}
	
	
	//결제창에서 결제하기 클릭시
	@PostMapping("/payment")
	public ModelAndView cartPay(int[] no, HttpSession session) {
		
		for(int i=0; i<no.length; i++) {
			//카트번호로 장바구니찾기
			Cart serchCart = cartService.cartSerchByNo(no[i]);
			int payNo = serchCart.getProduct().getNo();
			int payCount = serchCart.getCount();
			productService.updateCount(payNo, payCount);
		}
		cartService.cartDelete(no);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/cartlist/"+session.getAttribute("userNo"));
		
		return mv;
	}
	
}
