package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.QnAService;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.QnAVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	// qna 작성
	@RequestMapping("qnaWrite.do")
	public String qnaWrite(QnAVO qnaVO,RedirectAttributes re) {
		// 아래의 1번 문장은 시큐리티를 통해서 세션을 가져와 MemberVO 값을 가져온다.
		//1. SecurityContextHolder.getContext().getAuthentication().getPrincipal() : (MemberVO) 다운캐스팅 USERVO .
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println(memberVO.getId());
		qnaVO.setMemberVO(memberVO);
		qnaService.sQnAWrite(qnaVO);
		re.addAttribute("qnaNo",qnaVO.getQnaNo());
		return "redirect:qnaDetail.do";
	}
	
	// qna 상세보기 
	@RequestMapping("qnaDetail.do")
	public ModelAndView qnaDeteail(int qnaNo) {
		return new ModelAndView("qna/qna_detail.tiles","qvo",qnaService.sQnADetail(qnaNo));
	}
}








