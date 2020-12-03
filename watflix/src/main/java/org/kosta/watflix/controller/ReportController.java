package org.kosta.watflix.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.watflix.model.service.ReportService;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	@Resource
	private ReportService reportService;
	
	// 신고 게시판(리뷰)으로 이동
	@RequestMapping("reportReviewBoard.do")
	public ModelAndView reportReviewBoard() {
		return new ModelAndView("report/report_review_board","ReportReviewList",reportService.sGetReportReviewList());
	}
	// 신고 게시판(리뷰) 페이지 편경
	@RequestMapping("reportReviewBoardNext.do")
	public ModelAndView reportReviewBoardNext(String pageNo) {
		return new ModelAndView("report/report_review_board","ReportReviewList",reportService.sGetReportReviewList(pageNo));
	}
	
	// 신고 게시판(평점)으로 이동
	@RequestMapping("reportCommentsBoard.do")
	public ModelAndView reportCommentsBoard() {
		return new ModelAndView("report/report_comments_board","ReportCommentsList",reportService.sGetReportCommentsList());
	}
	@RequestMapping("reportCommentsBoardNext.do")
	public ModelAndView reportCommentsBoard(String pageNo) {
		return new ModelAndView("report/report_comments_board","ReportCommentsList",reportService.sGetReportCommentsList(pageNo));
	}
	
	// 신고 from(리뷰)으로 이동
	@RequestMapping("reportReviewForm.do")
	public ModelAndView reportReviewForm() {
		return new ModelAndView("report/report_review_form");
	}
	
	// 신고 form(평점)으로 이동
	@RequestMapping("reportCommentsForm.do")
	public ModelAndView reportCommentsFrom() {
		
		return new ModelAndView("report/report_comments_form");
	}
	//MemberVO id = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	// 신고글 등록(리뷰)
	@PostMapping("reportReviewRegister.do")
	public String reportReviewRegister(HttpSession session) {
		
		return "";
	}
	// 신고글 등록(평점)
}



























