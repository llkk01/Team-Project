package com.stone.springmvc.boardnotice.common;

import java.sql.Date;

import com.stone.springmvc.member.common.Admin;

public class Notice {
	int no;
	String title;
	String contents;
	Admin writer;//객체간의 관계는 참조로 구현한다.
	Date rdate;
	int views; //조회수
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Admin getWriter() {
		return writer;
	}
	public void setWriter(Admin writer) {
		this.writer = writer;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
}
