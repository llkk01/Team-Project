package com.stone.springmvc.product.dataservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stone.springmvc.product.common.Attach;
import com.stone.springmvc.product.common.Product;

@Repository
public class ProductDAO implements IProductDAO {
	
	@Autowired IProductMapper productMapper;
	@Autowired IAttachMapper attachMapper;

	//상품등록준비
	@Transactional
	@Override
	public int save(Product product) {
		productMapper.saveOnlyProduct(product);
		attachMapper.saveAttachs(product.getAttachs());
		return product.getNo();
	}
	//상품목록출력
	@Transactional
	@Override
	public List<Product> productCollectAll(int num) {
		return productMapper.selectAll(num);
	}
	
	@Transactional
	@Override
	public Product productSearchByNo(int no) {
		return productMapper.findByNo(no);
	}
	
	@Transactional
	@Override
	public Attach findByAttachNo(int no) {
		return attachMapper.findByNo(no);
	}
	
	//관리자 상품수정
	@Transactional
	@Override
	public void updateProduct(Product product) {
		productMapper.updateProduct(product);
	}
	
	@Transactional
	@Override
	public void updateCount(int no, int count) {
		productMapper.updateCount(no, count);
		
	}

}
