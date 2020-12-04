package org.kosta.watflix.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.watflix.model.service.FaqService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.FaqVO;
import org.kosta.watflix.model.vo.MemberVO;
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
	public String list(Model model,String pageNo) {
		if(pageNo==null) {
			model.addAttribute("lvo",faqService.sGetFaqList());
			
		}else {
			model.addAttribute("lvo",faqService.sGetFaqList(pageNo));
		}
		return "faq/faq_list";
		
	}
	// faq 작성 폼 이동
	@RequestMapping("faqWriteForm.do")
	public String faqWriteForm() {
		return "faq/faq_write_form";
	}
	// faq 작성
	
	@PostMapping("faqWrite.do")
	public String faqWrite(FaqVO faqVO,RedirectAttributes ra) {
		/*
		if(session.getAttribute("mvo")==null)  // 로그인 상태가 아니면
			return "redirect:home.do";
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		faqVO.setMemberVO(mvo);  // 작성자 아이디
		*/	
		// 아래의 1번 문장은 시큐리티를 통해서 세션을 가져와 MemberVO 값을 가져온다.
		//1. SecurityContextHolder.getContext().getAuthentication().getPrincipal() : (MemberVO) 다운캐스팅 USERVO .
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println(memberVO.getId());
		faqVO.setMemberVO(memberVO);
		faqService.sFaqWrite(faqVO);
		ra.addAttribute("faqNo",faqVO.getFaqNo());
		return "redirect:faqDetail.do";
	}
	
	// faq 상세보기
	@RequestMapping("faqDetail.do")
	public ModelAndView faqDetail(int faqNo) {
		return new ModelAndView("faq/faq_detail","fvo",faqService.sFaqDetail(faqNo));
	}
	
	// faq 삭제
	@PostMapping("faqDelete.do")
	public String faqDelete(int faqNo) {
		faqService.sFaqDelete(faqNo);
		return "redirect:faqList.do";
	}
	//faq 수정 폼 이동
	@RequestMapping("faqUpdateForm.do")
	public String faqUpdateForm(int faqNo, Model model) {
		model.addAttribute("fvo",faqService.sFaqDetail(faqNo));
	return "faq/faq_update_form";
}
	//faq 수정
	@PostMapping("faqUpdate.do")
		public String faqUpdate(FaqVO faqVO, Model model) {
		// System.out.println();
		faqService.sFaqUpdate(faqVO);
		model.addAttribute("fvo",faqService.sFaqDetail(faqVO.getFaqNo()));
		return "faq/faq_detail";
	}
}
