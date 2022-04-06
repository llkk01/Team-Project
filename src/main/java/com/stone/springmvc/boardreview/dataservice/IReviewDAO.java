package com.stone.springmvc.boardreview.dataservice;

import java.util.List;

import com.stone.springmvc.boardreview.common.Review;

public interface IReviewDAO {

	void save(Review review);

	List<Review> reviewCollectAll(int p_no);

	Review readReview(int no);
	
	void update(Review review);

	void delete(int no);
	
	
	
	
	//Admin
	List<Review> reviewCollectAll2();

}
