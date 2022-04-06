package com.stone.springmvc.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stone.springmvc.product.common.Product;
import com.stone.springmvc.product.dataservice.IProductDAO;

@Service
public class ProductService implements IProductService {
	
	@Autowired IProductDAO productDAO;
	
	//상품등록준비
	@Override
	public boolean prepareAddProduct() {
		return true;
	}
	//상품목록출력
	@Override
	public int saveProduct(Product product) {
		return productDAO.save(product);
	}
	
	@Override
	public List<Product> productCollectAll(int num) {
		return productDAO.productCollectAll(num);
	}
	
	@Override
	public Product productSerchByNo(int no) {
		return productDAO.productSearchByNo(no);
	}
	
	@Override
	public void updateProduct(Product product) {
		productDAO.updateProduct(product);
	}
	
	//제품잔여수량 변경
	@Override
	public void updateCount(int no, int count) {
		productDAO.updateCount(no, count);
		
	}
}
