package com.stone.springmvc.boardnotice.dataservice;

import java.util.List;

import com.stone.springmvc.boardnotice.common.Notice;

public interface INoticeDAO {
	
	
	public void save(Notice notice);

	//int NoticeCount();

	public List<Notice> collectAll();

	public Notice readAndView(int no);
	
	public void viewCount(int no);
	
	void update(Notice notice);

	void delete(int no);

}
