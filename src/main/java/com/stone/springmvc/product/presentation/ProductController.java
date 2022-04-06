package com.stone.springmvc.product.presentation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.product.common.Product;
import com.stone.springmvc.product.service.IProductService;

@Controller
public class ProductController {
	
	@Autowired IProductService productService;
	
	//상품리스트_고객용(state가 '1'정상인 전제)
	@GetMapping("/productlist/{num}")
	public ModelAndView productCollectAll(@PathVariable int num, HttpSession session) {
		List<Product> products = productService.productCollectAll(num);
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("products", products);
		mv.addObject("isLogin",loginIn);
		mv.setViewName("product/ProductListWindow");
		
		return mv;
	}
	
	//상품상세페이지출력
	@GetMapping("/productdetail/{no}")
	public ModelAndView printProductDetail(@PathVariable int no, HttpSession session) {
		Product product = productService.productSerchByNo(no);
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("product", product);
		mv.addObject("isLogin",loginIn);
		mv.setViewName("product/ProductDetailWindow");
		return mv;
	}
	
}
