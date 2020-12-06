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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminNoticeContorller {

	@Resource
	NoticeService noticeService;
		
	@RequestMapping("getNoticeList.do")
	public String getNoticeList(String pageNo, Model model) {
		model.addAttribute("noticeList", noticeService.sNoticeGetList(pageNo));
		return "notice/noticeList";
	}
	// 공지글 작성 관리자만 가능하게 시큐리티작업 필요
	@RequestMapping("noticeWriteForm.do")
	public String noticeWriteForm(){
		return "notice/noticeWriteForm";
	}
	@PostMapping("noticeWrite.do")
	public String noticeWrite(NoticeVO noticeVO, Model model, RedirectAttributes redirectAttributes) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		noticeVO.setMemberVO(memberVO);
		noticeService.sNoticeWrite(noticeVO);
		redirectAttributes.addAttribute("noticeNo", noticeVO.getNoticeNo());
		return "redirect:noticeDetailNoHits.do";
	}
	
	@RequestMapping("noticeDetailNoHits.do")
	public ModelAndView noticeDetailNoHits(int noticeNo) {
		return new ModelAndView("notice/noticeDetail", "noticeDetail", noticeService.sNoticeGetDetailNoHits(noticeNo));
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
	public String noticeDetail(int noticeNo, RedirectAttributes redirectAttributes) {
		// 조회수 올림(세션적용하지 않아 읽었던 글을 다시 읽더라고 조회수 증가함.
		// 로그인시 조회 내역을 저장할 수 있는 리스트를 만들어 세션에 넣는 코드가 필요함. 
		noticeService.sNoticeUpdateHits(noticeNo);		
		//System.out.println(noticeService.sNoticeGetDetailNoHits(noticeNo));
		redirectAttributes.addAttribute("noticeNo", noticeNo);
		return "redirect:noticeDetailNoHits.do";
	}	
	
	@RequestMapping("noticeUpdateForm.do")
	public String noticeUpdateForm(int noticeNo, Model model) {
		model.addAttribute("noticeUpdateForm", noticeService.sNoticeGetDetailNoHits(noticeNo)); 
		return "notice/noticeUpdateForm";
	}
	//@Secured("ROLE_MEMBER")
	@PostMapping("noticeUpdate.do")
	public String noticeUpdate(NoticeVO noticeVO, int noticeNo, RedirectAttributes redirectAttributes) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		noticeVO.setMemberVO(memberVO);
		noticeService.sNoticeUpdate(noticeVO);
		redirectAttributes.addAttribute("noticeNo", noticeNo);
		return "redirect:noticeDetailNoHits.do";
	}
	@PostMapping("noticeDelete.do")
	public String noticeDelete(int noticeNo, RedirectAttributes redirectAttributes) {
		noticeService.sNoticeDelete(noticeNo);
		return "redirect:getNoticeList.do";
	}
}
