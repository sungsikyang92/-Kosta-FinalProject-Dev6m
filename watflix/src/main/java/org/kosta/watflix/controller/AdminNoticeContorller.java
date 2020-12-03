package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.NoticeService;
import org.kosta.watflix.model.vo.NoticeVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminNoticeContorller {

	@Resource
	NoticeService noticeService;
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("getNoticeList.do")
	public String getNoticeList(String pageNo, Model model) {
		if(pageNo == null) {
			model.addAttribute("noticeList", noticeService.sNoticeGetList());			
		} else {
			model.addAttribute("noticeList", noticeService.sNoticeGetList(pageNo));
		}
		return "notice/noticeList";
	}
	
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(int noticeNo, Model model) {
		model.addAttribute("noticeDetail", noticeService.sNoticeGetDetailNoHits(noticeNo));
		// 조회수 증가 관련 기능 추가 필요
		return "notice/noticeDetail";
	}
	
	@RequestMapping("noticeWriteForm.do")
	public String noticeWrite(Model model){
		return "notice/noticeWriteFrom";
	}
	
	@RequestMapping("noticeUpdateForm.do")
	public String noticeUpdateForm(int noticeNo, Model model) {
		model.addAttribute("noticeUpdateForm", noticeService.sNoticeGetDetailNoHits(noticeNo)); 
		return "notice/noticeUpdateForm";
	}
	//@Secured("ROLE_MEMBER")
		@PostMapping("noticeUpdate.do")
		public String noticeUpdate(NoticeVO noticeVO, int noticeNo, Model model) {
			System.out.println(noticeVO);
			System.out.println(noticeNo);
			noticeService.sNoticeUpdate(noticeVO);
			model.addAttribute("noticeDetail", noticeService.sNoticeGetDetailNoHits(noticeNo));
			// 조회수 증가 관련 기능 추가 필요
			return "notice/noticeDetail";
		}
}
