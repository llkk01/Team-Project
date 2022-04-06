package com.stone.springmvc.boardnotice.dataservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stone.springmvc.boardnotice.common.Notice;

@Repository
public class NoticeDAO implements INoticeDAO {
	
	@Autowired INoticeMapper noticeMapper;
	
	//공지사항 저장하다
	@Transactional
	@Override
	public void save(Notice notice) {
		noticeMapper.save(notice);
	}
	
	//공지사항목록출력하다
	@Transactional
	@Override
	public List<Notice> collectAll() {
		return noticeMapper.collectAll();
	}
	
	//총게시물수구하기
//	@Transactional
//	@Override
//	public int NoticeCount() {
//		return noticeMapper.NoticeCount();
//	}
	
	@Transactional
	@Override
	public Notice readAndView(int no) {
		return noticeMapper.readAndView(no);
	}
	
	//조회수증가하다
	@Transactional
	@Override
	public void viewCount(int no) {
		noticeMapper.viewCount(no);
	}
	
	//공지사항수정하다
	@Transactional
	@Override
	public void update(Notice notice) {
		noticeMapper.update(notice);
	}
	
	//공지사항삭제하다
	@Transactional
	@Override
	public void delete(int no) {
		noticeMapper.delete(no);
	}

}
