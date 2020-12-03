package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.NoticeService;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.NoticeVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
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
		model.addAttribute("noticeList", noticeService.sNoticeGetList(pageNo));
		return "notice/noticeList";
	}
	// 공지글 작성 관리자만 가능하게 시큐리티작업 필요
	@RequestMapping("noticeWriteForm.do")
	public String noticeWriteForm(Model model){
		return "notice/noticeWriteForm";
	}
	@PostMapping("noticeWrite.do")
	public String noticeWrite(NoticeVO noticeVO, Model model) {
		noticeService.sNoticeWrite(noticeVO);
		return "notice/noticeDetail";
	}
	
	/**
	 * 공지 디테일 조회
	 * - 공지글의 경우 회원, 비회원이 모두 접근 가능함.
	 * - 조회 했던 이용자가 다시 조회하더라도 조회수가 증가하도록 구현함. 
	 * @param noticeNo
	 * @param model
	 * @return
	 */
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(int noticeNo, Model model) {
		// 조회수 올림(세션적용하지 않아 읽었던 글을 다시 읽더라고 조회수 증가함.
		// 로그인시 조회 내역을 저장할 수 있는 리스트를 만들어 세션에 넣는 코드가 필요함. 
		noticeService.sNoticeUpdateHits(noticeNo);
		
		model.addAttribute("noticeDetail", noticeService.sNoticeGetDetailNoHits(noticeNo));
		return "notice/noticeDetail";
	}
	
	
	
	@RequestMapping("noticeUpdateForm.do")
	public String noticeUpdateForm(int noticeNo, Model model) {
		model.addAttribute("noticeUpdateForm", noticeService.sNoticeGetDetailNoHits(noticeNo)); 
		return "notice/noticeUpdateForm";
	}
	//@Secured("ROLE_MEMBER")
	@PostMapping("noticeUpdate.do")
	public String noticeUpdate(NoticeVO noticeVO, int noticeNo, Model model) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		noticeVO.setMemberVO(memberVO);
		noticeService.sNoticeUpdate(noticeVO);
		model.addAttribute("noticeDetail", noticeService.sNoticeGetDetailNoHits(noticeNo));
		// 조회수 증가 관련 기능 추가 필요
		return "notice/noticeDetail";
	}
}
