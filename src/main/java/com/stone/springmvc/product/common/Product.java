package com.stone.springmvc.product.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	
	int no;
	String name;	//제품이름
	String detail;	//제품설명
	int price;		//제품가격
	int num;		//상품종류(ex, 배스밤1, 샴푸2 등등)
	int quan;		//수량
	String state;	//상태 (1.판매가능/2.품절/3.기타)
	List<MultipartFile> attachFiles;
	List<Attach> attachs;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getQuan() {
		return quan;
	}
	public void setQuan(int quan) {
		this.quan = quan;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public List<MultipartFile> getAttachFiles() {
		return attachFiles;
	}
	public void setAttachFiles(List<MultipartFile> attachFiles) {
		this.attachFiles = attachFiles;
	}
	public List<Attach> getAttachs() {
		if(attachFiles!=null && attachs==null) {
			this.attachs = new ArrayList<Attach>();
			for(MultipartFile multipartFile:attachFiles) {
				Attach attach=new Attach();
				attach.setName(multipartFile.getOriginalFilename());
				attach.setSize(multipartFile.getSize());
				attach.setProduct(this);
				attachs.add(attach);
			}		
		}
		return attachs;
	}
	public void setAttachs(List<Attach> attachs) {
		for(Attach attach:attachs) {
			attach.setProduct(this);
		}
		this.attachs = attachs;
	}
	

}
