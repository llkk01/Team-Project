package com.stone.springmvc.product.presentation;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.product.common.Product;
import com.stone.springmvc.product.service.IProductService;

@Controller
public class Admin_ProductController {
	
	@Autowired IProductService productService;
	
	//상품등록준비
	@GetMapping("/productadd")
	public ModelAndView prepareAddProduct(HttpSession session) {
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		boolean prepare = productService.prepareAddProduct();
		
		ModelAndView mv = new ModelAndView();
		
			if(prepare) {
				mv.setViewName("admin/Admin_ProductAddWindow");
				mv.addObject("isLogin", loginIn);
				return mv;
			}
		return null;
	}
	
	//상품등록
	@PostMapping("/productadd")
	public ModelAndView addProduct(Product product, HttpSession session) {
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		//1. 저장하고 제품번호가져옴
		int product_no = productService.saveProduct(product);
		
		//첨부파일이 있을 때
		if(product.getAttachFiles() != null) {
			//2. 상품번호로 폴더만들기
			String boardPath=session.getServletContext().getRealPath("/upload/items");
			System.out.println(session.getServletContext().getRealPath("/upload/items")); //경로확인
			String 상품번호경로 = boardPath+"//"+product_no;
			File folder=new File(상품번호경로);
			folder.mkdir();
			//3. 폴더에 첨부파일 저장				//List<MultipartFile>
			for(MultipartFile  multipartFile: product.getAttachFiles()) {
				File 첨부파일 = new File(상품번호경로+"//"+multipartFile.getOriginalFilename());
				//예: File 첨부파일 = new File("D://........//upload/board/제품번호/파일의원래이름");
				try {
					multipartFile.transferTo(첨부파일);
				} catch (Exception e) {	e.printStackTrace();}
			}
		}
		//4. 경로 지정
		ModelAndView mv = new ModelAndView();
		mv.addObject("name", product.getName());
		mv.addObject("isLogin",loginIn);
		mv.setViewName("redirect:/admin_productlist/"+product.getNum());
		
		return mv;
	}
	
	//상품리스트_관리자용(state가 '1'정상인 전제)
	@GetMapping("/admin_productlist/{num}")
	public ModelAndView productCollectAll(@PathVariable int num, HttpSession session) {
		List<Product> products = productService.productCollectAll(num);
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("products", products);
		mv.addObject("isLogin",loginIn);
		mv.setViewName("admin/Admin_ProductListWindow");
		return mv;
	}
	
	
	//상품상세페이지&수정페이지출력
	@GetMapping("/admin_productdetail/{no}")
	public ModelAndView printProductDetail(@PathVariable int no, HttpSession session) {
		Product product = productService.productSerchByNo(no);
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("product", product);
		mv.addObject("isLogin",loginIn);
		mv.setViewName("admin/Admin_ProductUpdateWindow");
		return mv;
	}
	
	//상품수정
	@PostMapping("/productupdate")
	public ModelAndView updateProduct(Product product) {
		productService.updateProduct(product);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/admin_productlist/"+product.getNum());
		return mv;
	}
	
	
	
	
	

}
