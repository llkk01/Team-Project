package com.stone.springmvc.boardreview.service;

import java.util.List;

import com.stone.springmvc.boardreview.common.Review;

public interface IReviewService {

	boolean prepareAddReview();

	void saveReview(Review review);

	List<Review> reviewCollectAll(int p_no);

	Review readReview(int no);

	void updateReview(Review review);

	void deleteReview(int no);

	boolean prepareUpdateReview();
	
	
	
	//Admin
	List<Review> reviewCollectAll2();

}
