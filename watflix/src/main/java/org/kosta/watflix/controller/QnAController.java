package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.QnAService;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.QnAAnswerListVO;
import org.kosta.watflix.model.vo.QnAAnswerVO;
import org.kosta.watflix.model.vo.QnATypeVO;
import org.kosta.watflix.model.vo.QnAVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class QnAController {
	@Resource
	QnAService qnaService;
	
	// qna 리스트 출력
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminQnaList.do")
	public String adminList(Model model, String pageNo) {
		if(pageNo==null) {
			System.out.println(qnaService.sGetQnAList());
			model.addAttribute("lvo",qnaService.sGetQnAList());
		}else {
			System.out.println(qnaService.sGetQnAList(pageNo));
			model.addAttribute("lvo",qnaService.sGetQnAList(pageNo));
		}
		return "admin/qna_list.tiles";
	}
	// qna 작성 폼 이동
	@Secured("ROLE_MEMBER")
	@RequestMapping("qnaWriteForm.do")
	public String qnaWriteForm() {
		return "qna/qna_write_form.tiles";
	}
	// qna 작성
	@Secured("ROLE_MEMBER")
	@RequestMapping("qnaWrite.do")
	public String qnaWrite(QnAVO qnaVO,QnATypeVO qnaTypeVO,RedirectAttributes re) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
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
	@Secured("ROLE_MEMBER")
	@RequestMapping("qnaDetail.do")
	public String qnaDeteail(int qnaNo, Model model) {
		System.out.println(qnaService.sQnADetail(qnaNo));
		model.addAttribute("qvo", qnaService.sQnADetail(qnaNo));
		model.addAttribute("answerListVO", qnaService.sQnAAnswerByQnANo(qnaNo, null));
		return "qna/qna_detail.tiles";
	}
	// qna 상세보기 
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminQnaDetail.do")
	public String adminQnaDeteail(int qnaNo, Model model) {
		System.out.println(qnaService.sQnADetail(qnaNo));
		model.addAttribute("qvo", qnaService.sQnADetail(qnaNo));
		model.addAttribute("answerListVO", qnaService.sQnAAnswerByQnANo(qnaNo, null));
		return "admin/qna_detail.tiles";
	}
	// qna 답변 작성
	@Secured("ROLE_ADMIN")
	@PostMapping("qnaAnswerWrite.do")
	public String qnaAnswerWrite(QnAAnswerVO qnaAnswerVO,int qnaNo, RedirectAttributes re) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		qnaAnswerVO.setMemberVO(memberVO);
		QnAVO qnaVO = new QnAVO();
		qnaVO.setQnaNo(qnaNo);
		qnaAnswerVO.setQnaVO(qnaVO);
		qnaService.sQnAAnswerWrite(qnaAnswerVO);
		re.addAttribute("qnaNo", qnaNo);
		return "redirect:qnaAnswerList.do";
	}
	// qna 답변 리스트
	@ResponseBody
	@Secured("ROLE_MEMBER")
	@RequestMapping("qnaAnswerList.do")
	public QnAAnswerListVO qnaAnswerList(int qnaNo,String pageNo) {
		return qnaService.sQnAAnswerByQnANo(qnaNo, pageNo);
	}
	// qna 삭제 
	@Secured("ROLE_MEMBER")
		@PostMapping("qnaDelete.do") 
		public String qnaDelete(int qnaNo) {
			qnaService.sQnADelete(qnaNo);
			return "redirect:qnaList.do";
	}
	// qna 리스트 출력
	@Secured("ROLE_MEMBER")
	@RequestMapping("qnaListById.do")
	public String qnaListById(Model model, String pageNo) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = memberVO.getId();
		if(pageNo==null) {
			System.out.println(qnaService.sGetQnAListById(null, id));
			model.addAttribute("lvo",qnaService.sGetQnAListById(null, id));
		}else {
			System.out.println(qnaService.sGetQnAListById(pageNo, id));
			model.addAttribute("lvo",qnaService.sGetQnAListById(pageNo, id));
		}
		return "qna/qna_list.tiles";
	}
}








