package com.stone.springmvc.product.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.stone.springmvc.product.common.Attach;
import com.stone.springmvc.product.common.Product;

public interface IProductDAO {
	
	//상품저장하다
	public int save(Product product);
	//제품유형별 상품목록출력하다
	List<Product> productCollectAll(int num);
	//제품상세페이지 출력하다
	public Product productSearchByNo(int no);
	
	public Attach findByAttachNo(int no);
	
	public void updateProduct(Product product);
	//제품수량변경
	public void updateCount(int no, int count);
}
