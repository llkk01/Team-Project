package com.stone.springmvc.boardnotice.service;

import java.util.List;

import com.stone.springmvc.boardnotice.common.Notice;

public interface INoticeService {

	boolean prepareAddNotice();

	void saveNotice(Notice notice);

	public List<Notice> collectAll();

	public Notice readAndView(int no);
	
	public void viewCount(int no);
	
	boolean prepareUpdateNotice();

	void updateNotice(Notice notice);

	void deleteNotice(int no);


}
