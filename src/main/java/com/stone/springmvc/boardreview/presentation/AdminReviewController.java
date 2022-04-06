package com.stone.springmvc.boardreview.presentation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.boardreview.common.Review;
import com.stone.springmvc.boardreview.service.IReviewService;

@Controller
public class AdminReviewController {
	
	@Autowired IReviewService reviewService;
	
	//전체리뷰가져오기
	@GetMapping("/admin_reviewlist")
	public ModelAndView reviewList(HttpSession session) {
		List<Review> reviews = reviewService.reviewCollectAll2();
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("reviews", reviews);
		mv.addObject("isLogin",loginIn);
		mv.setViewName("admin/Admin_ReviewListWindow");
		
		return mv;
	}

}
