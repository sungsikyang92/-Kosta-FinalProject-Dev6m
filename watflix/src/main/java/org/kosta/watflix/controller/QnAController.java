package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.QnAService;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.QnAAnswerListVO;
import org.kosta.watflix.model.vo.QnAAnswerVO;
import org.kosta.watflix.model.vo.QnATypeVO;
import org.kosta.watflix.model.vo.QnAVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String qnaWrite(QnAVO qnaVO,QnATypeVO qnaTypeVO,RedirectAttributes re) {
		// 아래의 1번 문장은 시큐리티를 통해서 세션을 가져와 MemberVO 값을 가져온다.
		//1. SecurityContextHolder.getContext().getAuthentication().getPrincipal() : (MemberVO) 다운캐스팅 USERVO .
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println(memberVO.getId());
		qnaVO.setMemberVO(memberVO);
		// 사용자가 선택한 문의유형 넣어주기
		qnaVO.setQnaTypeVO(qnaTypeVO);
		System.out.println(qnaTypeVO);
		System.out.println(qnaVO);
		qnaService.sQnAWrite(qnaVO);
		re.addAttribute("qnaNo",qnaVO.getQnaNo());
		return "redirect:qnaDetail.do";
	}
	
	// qna 상세보기 
	@RequestMapping("qnaDetail.do")
	public ModelAndView qnaDeteail(int qnaNo) {
		System.out.println(qnaService.sQnADetail(qnaNo));
		return new ModelAndView("qna/qna_detail.tiles","qvo",qnaService.sQnADetail(qnaNo));
	}
	// qna 답변 작성
	@PostMapping("qnaAnswerWrite.do")
	@RequestMapping
	public QnAAnswerListVO qnaAnswerWrite(QnAAnswerVO qnaAnswerVO,int qnaNo,String pageNo) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		qnaAnswerVO.setMemberVO(memberVO);
		QnAVO qnaVO = new QnAVO();
		qnaVO.setQnaNo(qnaNo);
		qnaAnswerVO.setQnaVO(qnaVO);
		qnaService.sQnAAnswerWrite(qnaAnswerVO);
		System.out.println(qnaService.sQnAAnswerByQnANo(qnaNo, pageNo));
		return qnaService.sQnAAnswerByQnANo(qnaNo, pageNo);
	}
}








