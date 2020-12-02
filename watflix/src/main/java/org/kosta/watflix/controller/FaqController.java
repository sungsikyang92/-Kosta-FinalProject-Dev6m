package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.FaqService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.FaqVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	/*
	@RequestMapping("faqWrite.do")
	public ModelAndView faqWrite(FaqVO faqVO, RedirectAttributes ra,int faqNo) {
		faqService.sFaqWrite(faqVO);
		ra.addAttribute("faqNo",faqVO.getFaqNo());
		return new ModelAndView("faq/faq_write","fvo",faqService.sFaqWrite(faqVO,faqNo));
	}
	*/
	// faq 상세보기
	@RequestMapping("faqDetail.do")
	public ModelAndView faqDetail(FaqVO faqVO, int faqNo) {
		return new ModelAndView("faq/faq_detail","fvo",faqService.sFaqDetail(faqNo));
	}
}
