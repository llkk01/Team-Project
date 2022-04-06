package com.stone.springmvc.boardnotice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.springmvc.boardnotice.common.Notice;
import com.stone.springmvc.boardnotice.dataservice.INoticeDAO;


@Service
public class NoticeService implements INoticeService{
	@Autowired INoticeDAO noticeDAO;
	
	//모든공지사항출력하다
	@Override
	public List<Notice> collectAll() {
		return noticeDAO.collectAll();
	}
	
	//공지사항등록준비
	@Override
	public boolean prepareAddNotice() {
		return true;
	}
	
	//공지사항등록하다
	@Override
	public void saveNotice(Notice notice) {
		noticeDAO.save(notice);
	}

	//번호로 공지사항찾다(상세내역보기, 수정준비하기)
	@Override
	public Notice readAndView(int no) {
		return noticeDAO.readAndView(no);
	}
	
	//공지사항조회수증가하다
	@Override
	public void viewCount(int no) {
		noticeDAO.viewCount(no);
		
	}
	
	 
	//공지사항 수정 준비하다
	@Override
	public boolean prepareUpdateNotice() {
		return true;
	}
	
	//공지사항 수정하다
	@Override
	public void updateNotice(Notice notice) {
		noticeDAO.update(notice);
	}
	
	//공지사항 삭제하다
	@Override
	public void deleteNotice(int no) {
		noticeDAO.delete(no);
	}

}
