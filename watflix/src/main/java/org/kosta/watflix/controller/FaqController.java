package org.kosta.watflix.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.watflix.model.service.FaqService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.FaqVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FaqController {
	@Resource
	FaqService faqService;
	
	// faq 리스트 출력
	@RequestMapping("faqList.do")
	public String faqList(Model model,String pageNo) {
		model.addAttribute("faqListVO",faqService.sGetFaqList(pageNo));
		return "faq/faq_list.tiles";
	}
	// faq 작성 폼 이동
	@Secured("ROLE_ADMIN")
	@RequestMapping("faqWriteForm.do")
	public String faqWriteForm() {
		return "admin/adminFaqWriteForm.tiles";
	}
	// faq 작성
	@Secured("ROLE_ADMIN")
	@PostMapping("faqWrite.do")
	public String faqWrite(FaqVO faqVO,RedirectAttributes ra) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		faqVO.setMemberVO(memberVO);
		faqService.sFaqWrite(faqVO);
		ra.addAttribute("faqNo",faqVO.getFaqNo());
		return "redirect:faqDetailNoHitsForAdmin.do";
	}
	
	// faq 상세보기 (조회수 증가o)
	@Secured("ROLE_MEMBER")
	@RequestMapping("faqDetail.do")
	public String faqDetail(int faqNo, RedirectAttributes ra) {
		faqService.sFaqUpdateHits(faqNo);
		ra.addAttribute("faqNo", faqNo);
		return "redirect:faqDetailNoHits.do";
	}
	
	// faq 상세보기 (조회수 증가x) 
	@Secured("ROLE_MEMBER")
	@RequestMapping("faqDetailNoHits.do")
	public ModelAndView faqDetailNohits(int faqNo) {
		return new ModelAndView("faq/faq_detail.tiles","fvo",faqService.sFaqDetailNoHits(faqNo));
	}
	
	// faq 상세보기 (조회수 증가x) 
	@Secured("ROLE_ADMIN")
	@RequestMapping("faqDetailNoHitsForAdmin.do")
	public ModelAndView faqDetailNoHitsForAdmin(int faqNo) {
		return new ModelAndView("admin/adminFaqDetail.tiles","fvo",faqService.sFaqDetailNoHits(faqNo));
	}
	
	// faq 삭제
	@Secured("ROLE_ADMIN")
	@PostMapping("faqDelete.do")
	public String faqDelete(int faqNo) {
		faqService.sFaqDelete(faqNo);
		return "redirect:adminFaqList.do";
	}
	//faq 수정 폼 이동
	@Secured("ROLE_ADMIN")
	@RequestMapping("faqUpdateForm.do")
	public String faqUpdateForm(int faqNo, Model model) {
		model.addAttribute("fvo",faqService.sFaqDetail(faqNo));
	return "admin/adminFaqUpdateForm.tiles";
}
	//faq 수정
	@Secured("ROLE_ADMIN")
	@PostMapping("faqUpdate.do")
		public String faqUpdate(FaqVO faqVO, RedirectAttributes ra ) {
		// System.out.println();
		faqService.sFaqUpdate(faqVO);
		ra.addAttribute("faqNo", faqVO.getFaqNo());
		return "redirect:faqDetailNoHitsForAdmin.do";
	}
}
