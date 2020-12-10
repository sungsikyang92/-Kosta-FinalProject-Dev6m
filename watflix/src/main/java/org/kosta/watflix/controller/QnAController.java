package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.QnAService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnAController {
	@Resource
	QnAService qnaService;
	
	// qna 리스트 출력
	@RequestMapping("qnaList.do")
	public String list(Model model, String pageNo) {
		if(pageNo==null) {
			model.addAttribute("lvo",qnaService.sGetQnAList());
		}else {
			model.addAttribute("lvo",qnaService.sGetQnAList(pageNo));
		}
		return "qna/qna_list.tiles";
	}
	// qna 작성 폼 이동
	@RequestMapping("qnaWriteForm.do")
	public String qnaWriteForm() {
		return "qna/qna_write_form.tiles";
	}
}








