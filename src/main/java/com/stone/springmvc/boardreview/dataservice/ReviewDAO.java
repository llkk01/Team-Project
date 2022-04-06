package com.stone.springmvc.boardreview.dataservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stone.springmvc.boardreview.common.Review;

@Repository
public class ReviewDAO implements IReviewDAO{
	@Autowired IReviewMapper reviewMapper;

	@Transactional
	@Override
	public void save(Review review) {
		reviewMapper.save(review);
	}
	
	@Transactional
	@Override
	public List<Review> reviewCollectAll(int p_no) {
		return reviewMapper.reviewCollectAll(p_no);
	}
	
	@Transactional
	@Override
	public Review readReview(int no) {
		return reviewMapper.readReview(no);
	}
	
	
	@Transactional
	@Override
	public void update(Review review) {
		reviewMapper.update(review);
	}
	
	@Transactional
	@Override
	public void delete(int no) {
		reviewMapper.delete(no);
	}
	
	
	//Admin
	@Transactional
	@Override
	public List<Review> reviewCollectAll2() {
		return reviewMapper.reviewCollectAll2();
	}
}
