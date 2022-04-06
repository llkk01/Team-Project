package com.stone.springmvc.boardreview.presentation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.boardreview.common.Review;
import com.stone.springmvc.boardreview.service.*;
import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.product.common.Product;
import com.stone.springmvc.product.service.IProductService;

@Controller
public class ReviewController {
   @Autowired
   IReviewService reviewService;
   @Autowired
   IProductService productService;

   // 리뷰리스트
   @GetMapping("/reviewlist/{p_no}")
   ModelAndView reviewCollectAll(@PathVariable int p_no, Review review, HttpSession session) {
      boolean loginIn = (session.getAttribute("id") != null) ? true : false;
      List<Review> reviews = reviewService.reviewCollectAll(p_no);
      ModelAndView mv = new ModelAndView();

      mv.setViewName("review/ReviewListWindow");
      mv.addObject("p_no", p_no);
      mv.addObject("isLogin", loginIn);
      mv.addObject("reviews", reviews);
      return mv;
   }

   // 리뷰등록준비
   @GetMapping("/reviewadd/{p_no}")
   public ModelAndView prepareAddReview(@PathVariable int p_no, HttpSession session) {
      boolean loginIn = (session.getAttribute("id") != null) ? true : false;
      ModelAndView mv = new ModelAndView();

      if (reviewService.prepareAddReview()) {
         mv.addObject("p_no", p_no);
         mv.addObject("isLogin", loginIn);
         mv.setViewName("review/ReviewAddWindow");
         return mv;
      }
      return null;
   }

   // 리뷰등록
   @PostMapping("/reviewadd/{p_no}")
   public ModelAndView addReview(@PathVariable int p_no, Review review, HttpSession session) {
      boolean loginIn = (session.getAttribute("id") != null) ? true : false;
      ModelAndView mv = new ModelAndView();
      Product product = productService.productSerchByNo(p_no);
      review.setProduct(product);

      int userNo = (int) session.getAttribute("userNo");
      Member member = new Member();
      member.setNo(userNo);

      review.setWriter(member);
      reviewService.saveReview(review);
      mv.addObject("isLogin", loginIn);
      mv.setViewName("redirect:/reviewlist/"+p_no);
      return mv;
   }

   // 리뷰상세페이지
   @GetMapping("/reviewdetail/{no}")
   public ModelAndView printReviewDetail(@PathVariable int no, HttpSession session) {
      boolean loginIn = (session.getAttribute("id") != null) ? true : false;
      Review review = reviewService.readReview(no);
      ModelAndView mv = new ModelAndView();
      
      Boolean isWriter = null;
      if(session != null) {
         String userId = (String)session.getAttribute("userId");
         if(userId!=null) {   
            if(userId.equals(review.getWriter().getId())) {
               isWriter = true;
            }else {
               isWriter = false;
            }
         }
      }

      mv.setViewName("review/ReviewDetailWindow");
      mv.addObject("no", no);
      mv.addObject("isLogin", loginIn);
      mv.addObject("isWriter", isWriter);
      mv.addObject("review", review);
      return mv;
   }

   // 리뷰수정준비
   @GetMapping("/reviewupdate/{no}")
   public ModelAndView prepareUpdateReview(@PathVariable int no, HttpSession session) {
      boolean loginIn = (session.getAttribute("id") != null) ? true : false;
      ModelAndView mv = new ModelAndView();
      Review review = reviewService.readReview(no);

      if (reviewService.prepareUpdateReview()) {
         mv.setViewName("review/ReviewUpdateWindow");
         mv.addObject("isLogin", loginIn);
         mv.addObject("review", review);
         return mv;
      }
      return null;
   }

   // 리뷰수정
   @PostMapping("/reviewupdate")
   public ModelAndView updateReview(Review review, HttpSession session) {
      boolean loginIn = (session.getAttribute("id") != null) ? true : false;
      reviewService.updateReview(review);

      ModelAndView mv = new ModelAndView();
      mv.addObject("isLogin", loginIn);
      mv.setViewName("redirect:/reviewdetail/"+review.getNo());
      return mv;
   }

   // 리뷰 삭제
   @GetMapping("/reviewdelete/{no}")
   public ModelAndView deleteReview(@PathVariable int no) {
      
      Review review = reviewService.readReview(no);
      reviewService.deleteReview(no);

      ModelAndView mv = new ModelAndView();
      mv.setViewName("redirect:/reviewlist/"+review.getProduct().getNo());

      return mv;
   }

}