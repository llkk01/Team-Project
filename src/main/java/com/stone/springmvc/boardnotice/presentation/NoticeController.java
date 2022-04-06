package com.stone.springmvc.boardnotice.presentation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.boardnotice.common.Notice;
import com.stone.springmvc.boardnotice.service.*;
import com.stone.springmvc.member.common.Admin;

@Controller
public class NoticeController {

	@Autowired INoticeService noticeService;
	
	//관리자용공지사항목록출력
	@GetMapping("/adminnoticelist")
	ModelAndView noticeCollectAll2(HttpSession session) {
		List<Notice> notices=noticeService.collectAll();
		boolean isLogin = (session.getAttribute("id")!=null)?true:false;
		boolean isAdmin = (session.getAttribute("id")!=null)&&(session.getAttribute("id").equals("admin"))?true:false;
		
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("admin/Admin_NoticeListWindow");
		mv.addObject("notices", notices);
		mv.addObject("isLogin", isLogin);
		mv.addObject("isAdmin", isAdmin);
		return mv;	
	}
		
		//관리자용 공지사항상세보기
		@GetMapping("/adminnoticedetail/{no}")
		ModelAndView printNoticeDetail2(@PathVariable int no, HttpSession session) {
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
			
		noticeService.viewCount(no);
		Notice notice = noticeService.readAndView(no);
			
		Boolean isWriter = null;
		if(session != null) {
			String userId = (String)session.getAttribute("userId");
			if(userId!=null) {	
				if(userId.equals(notice.getWriter().getId())) {
					isWriter = true;
				}else {
					isWriter = false;
				}
			}
		}
			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/Admin_NoticeDetailWindow");
		mv.addObject("isLogin",loginIn);
		mv.addObject("isWriter",isWriter);
		mv.addObject("notice", notice);
		return mv;
	}
	
	
	
	
	//공지사항등록준비
	@GetMapping("/noticeadd")
	ModelAndView prepareAddNotice(HttpSession session) {
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		
		ModelAndView mv = new ModelAndView();
		if(noticeService.prepareAddNotice()) {
			mv.addObject("loginIn", loginIn);
			mv.setViewName("notice/NoticeAddWindow");
			return mv;
		}
		return null;
	}
	
	//공지사항등록
	@PostMapping("/noticeadd")
	ModelAndView addNotice(Notice notice, HttpSession session) {
		int adminNo = (int) session.getAttribute("userNo");
		
		Admin 관리자 = new Admin();
		관리자.setNo(adminNo);
		notice.setWriter(관리자);
		
		noticeService.saveNotice(notice);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adminnoticelist");
		return mv;
	}
	
	
	
	//공지사항변경준비
	@GetMapping("/noticeupdate/{no}")
	ModelAndView prepareUpdateNotice(@PathVariable int no, HttpSession session) {
		boolean loginIn = (session.getAttribute("id")!=null)?true:false;
		Notice notice = noticeService.readAndView(no);
		
		ModelAndView mv = new ModelAndView();
		if(noticeService.prepareUpdateNotice()) {
			mv.setViewName("notice/NoticeUpdateWindow");
			mv.addObject("isLogin",loginIn);
			mv.addObject("notice", notice);
			return mv;
		}
		return null;
	}
	
	//공지사항변경
	@PostMapping("/noticeupdate")
	ModelAndView updateNotice(Notice notice) {
		
		noticeService.updateNotice(notice);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adminnoticelist");
		
		return mv;
	}
	
	//공지사항삭제
	@GetMapping("/noticedelete/{no}")
	ModelAndView deleteNotice(@PathVariable int no) {
		noticeService.deleteNotice(no);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adminnoticelist");
		return mv;
	}
	
	
	/* 고객용 */
	//고객용 공지사항목록출력
		@GetMapping("/noticelist")
		ModelAndView noticeCollectAll(HttpSession session) {
			List<Notice> notices=noticeService.collectAll();
			boolean isLogin = (session.getAttribute("id")!=null)?true:false;
		
			ModelAndView  mv =new ModelAndView();
			mv.setViewName("notice/NoticeListWindow");
			mv.addObject("notices", notices);
			mv.addObject("isLogin", isLogin);
			return mv;	
		}
		
		//고객용 공지사항상세보기
		@GetMapping("/noticedetail/{no}")
		ModelAndView printNoticeDetail(@PathVariable int no, HttpSession session) {
			boolean loginIn = (session.getAttribute("id")!=null)?true:false;
			
			noticeService.viewCount(no);
			Notice notice = noticeService.readAndView(no);
			
			Boolean isWriter = null;
			if(session != null) {
				String userId = (String)session.getAttribute("userId");
				if(userId!=null) {	
					if(userId.equals(notice.getWriter().getId())) {
						isWriter = true;
					}else {
						isWriter = false;
					}
				}
			}
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("notice/NoticeDetailWindow");
			mv.addObject("isLogin",loginIn);
			mv.addObject("isWriter",isWriter);
			mv.addObject("notice", notice);
			return mv;
		}
}
