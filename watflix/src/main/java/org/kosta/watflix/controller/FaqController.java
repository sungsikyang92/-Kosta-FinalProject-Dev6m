package org.kosta.watflix.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.watflix.model.service.FaqService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.FaqVO;
import org.kosta.watflix.model.vo.MemberVO;
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
		/*
		if(session.getAttribute("mvo")==null)  // 로그인상태가 아니면
			return "redirect:home.do";
		*/
		faqService.sFaqDelete(faqNo);
		return "redirect:faqList.do";
	}
	@PostMapping("faqUpdate.do")
		public String faqUpdate(FaqVO faqVO) {
		faqService.sFaqUpdate(faqVO);
		return "redirect:faqDetail.do";
	}
}
