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
		return "notice/noticeList.tiles";
	}
	// 관리자 공지 리스트
	@Secured("ROLE_ADMIN")
	@RequestMapping("getNoticeListAdmin.do")
	public String getNoticeListAdmin(String pageNo, Model model) {
		model.addAttribute("noticeList", noticeService.sNoticeGetList(pageNo));
		return "admin/adminNoticeList.tiles";
	}
	// 관리자 공지 작성 폼
	@Secured("ROLE_ADMIN")
	@RequestMapping("noticeWriteForm.do")
	public String noticeWriteForm(String pageNo, Model model){
		model.addAttribute("pageNo", pageNo);
		return "admin/adminNoticeWriteForm.tiles";
	}
	// 관리자 공지 작성
	@Secured("ROLE_ADMIN")
	@PostMapping("noticeWrite.do")
	public String noticeWrite(NoticeVO noticeVO, Model model, RedirectAttributes redirectAttributes) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		noticeVO.setMemberVO(memberVO);
		noticeService.sNoticeWrite(noticeVO);
		redirectAttributes.addAttribute("noticeNo", noticeVO.getNoticeNo());
		return "redirect:noticeDetailNoHits.do";
	}
	// 공지 디테일 조회수 증가 x
	@RequestMapping("noticeDetailNoHits.do")
	public ModelAndView noticeDetailNoHits(int noticeNo, String pageNo, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("notice/noticeDetail.tiles");
		modelAndView.addObject("noticeDetail", noticeService.sNoticeGetDetailNoHits(noticeNo));
		modelAndView.addObject("pageNo", pageNo);
		return modelAndView;
	}
	// 관리자 공지 디테일 조회수 증가 x
	@Secured("ROLE_ADMIN")
	@RequestMapping("noticeDetailNoHitsAdmin.do")
	public ModelAndView noticeDetailNoHitsAdmin(int noticeNo, String pageNo, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/adminNoticeDetail.tiles");
		modelAndView.addObject("noticeDetail", noticeService.sNoticeGetDetailNoHits(noticeNo));
		modelAndView.addObject("pageNo", pageNo);
		return modelAndView;
	}

	// 공지 디테일 조회수 증가 o
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(int noticeNo, String pageNo, RedirectAttributes redirectAttributes) {
		// 조회수 올림(세션적용하지 않아 읽었던 글을 다시 읽더라고 조회수 증가함.
		// 로그인시 조회 내역을 저장할 수 있는 리스트를 만들어 세션에 넣는 코드가 필요함. 
		noticeService.sNoticeUpdateHits(noticeNo);		
		redirectAttributes.addAttribute("noticeNo", noticeNo);
		redirectAttributes.addAttribute("pageNo", pageNo);
		return "redirect:noticeDetailNoHits.do";
	}	
	// 관리자 공지 디테일 조회수 증가 o
	@Secured("ROLE_ADMIN")
	@RequestMapping("noticeDetailAdmin.do")
	public String noticeDetailAdmin(int noticeNo, String pageNo, RedirectAttributes redirectAttributes) {
		// 조회수 올림(세션적용하지 않아 읽었던 글을 다시 읽더라고 조회수 증가함.
		// 로그인시 조회 내역을 저장할 수 있는 리스트를 만들어 세션에 넣는 코드가 필요함. 
		noticeService.sNoticeUpdateHits(noticeNo);		
		redirectAttributes.addAttribute("noticeNo", noticeNo);
		redirectAttributes.addAttribute("pageNo", pageNo);
		return "redirect:noticeDetailNoHitsAdmin.do";
	}	
	// 공지 업데이트 폼
	@Secured("ROLE_ADMIN")
	@PostMapping("noticeUpdateForm.do")
	public String noticeUpdateForm(int noticeNo, String pageNo, Model model) {
		model.addAttribute("noticeUpdateForm", noticeService.sNoticeGetDetailNoHits(noticeNo));
		model.addAttribute("pageNo", pageNo);
		return "admin/adminNoticeUpdateForm.tiles";
	}
	// 공지 업데이트
	@Secured("ROLE_ADMIN")
	@PostMapping("noticeUpdate.do")
	public String noticeUpdate(NoticeVO noticeVO, int noticeNo, String pageNo, RedirectAttributes redirectAttributes) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		noticeVO.setMemberVO(memberVO);
		noticeService.sNoticeUpdate(noticeVO);
		redirectAttributes.addAttribute("noticeNo", noticeNo);
		redirectAttributes.addAttribute("pageNo", pageNo);
		return "redirect:noticeDetailNoHitsAdmin.do";
	}
	// 공지 삭제
	@Secured("ROLE_ADMIN")
	@PostMapping("noticeDelete.do")
	public String noticeDelete(int noticeNo, String pageNo, RedirectAttributes redirectAttributes) {
		noticeService.sNoticeDelete(noticeNo);
		redirectAttributes.addAttribute("pageNo", pageNo);
		return "redirect:getNoticeListAdmin.do";
	}
	// 공지 삭제 체크박스
	@Secured("ROLE_ADMIN")
	@PostMapping("noticeDeleteByCheckbox.do")
	public String noticeDelete(int[] deleteCheckbox, String pageNo, RedirectAttributes redirectAttributes) {
		for(int i = 0; i < deleteCheckbox.length; i++) {
			noticeService.sNoticeDelete(deleteCheckbox[i]);
		}
		redirectAttributes.addAttribute("pageNo", pageNo);
		return "redirect:getNoticeList.do";
	}
	
}
