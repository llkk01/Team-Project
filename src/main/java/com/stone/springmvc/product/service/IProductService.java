package com.stone.springmvc.product.service;

import java.util.List;

import com.stone.springmvc.product.common.Product;

public interface IProductService {
	
	//괸리자
	public boolean prepareAddProduct();
	public int saveProduct(Product product);
	public void updateProduct(Product product);
	
	//관리자 & 고객
	public List<Product> productCollectAll(int num);
	public Product productSerchByNo(int no);
	
	
	//제품수량변경
	public void updateCount(int no, int count);
	

}
