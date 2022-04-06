package com.stone.springmvc.boardreview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.springmvc.boardnotice.common.Notice;
import com.stone.springmvc.boardreview.common.Review;
import com.stone.springmvc.boardreview.dataservice.IReviewDAO;

@Service
public class ReviewService implements IReviewService{
	@Autowired IReviewDAO reviewDAO;
	
	@Override
	public List<Review> reviewCollectAll(int p_no) {
		return reviewDAO.reviewCollectAll(p_no);
	}
	
	@Override
	public boolean prepareAddReview() {
		return true;
	}
	
	@Override
	public void saveReview(Review review) {
		reviewDAO.save(review);
	}
	
	@Override
	public Review readReview(int no) {
		return reviewDAO.readReview(no);
	}
	
	
	@Override
	public boolean prepareUpdateReview() {
		return true;
	}
	
	@Override
	public void updateReview(Review review) {
		reviewDAO.update(review);
	}
	
	@Override
	public void deleteReview(int no) {
		reviewDAO.delete(no);
	}
	
	
	
	
	//Admin
	@Override
	public List<Review> reviewCollectAll2() {
		return reviewDAO.reviewCollectAll2();
	}
}
