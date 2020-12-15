package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ReportService;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReportListVO;
import org.kosta.watflix.model.vo.ReportTypeVO;
import org.kosta.watflix.model.vo.ReportVO;
import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	@Resource
	private ReportService reportService;
	
	// 신고 게시판(리뷰)
	@RequestMapping("reportReviewBoard.do")
	public ModelAndView reportReviewBoard(String pageNo) {
		return new ModelAndView("report/report_review_board.tiles","reportReviewList",reportService.sGetReportReviewList(pageNo));
	}
	
	// 신고 게시판(평점)
	@RequestMapping("reportCommentsBoard.do")
	public ModelAndView reportCommentsBoard(String pageNo) {
		return new ModelAndView("report/report_comments_board.tiles","reportCommentsList",reportService.sGetReportCommentsList(pageNo));
	}
	
	// 신고 from(리뷰, 평점)으로 이동
	@RequestMapping("reportForm.do")
	public ModelAndView reportReviewForm() {
		return new ModelAndView("report/report_form");
	}

	// 신고글 등록(리뷰, 평점)
	@PostMapping("reportRegister.do")
	public String reportReviewRegister(ReviewVO reviewVO, CommentsVO commentsVO, int reportTypeNo, String reportContents) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = mvo.getId();
		// 신고 VO
		ReportVO reportVO = new ReportVO();
		// 아이디
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		reportVO.setMemberVO(memberVO);
		// 신고 타입
		ReportTypeVO reportTypeVO = new ReportTypeVO();
		reportTypeVO.setReportTypeNo(reportTypeNo);
		reportVO.setReportTypeVO(reportTypeVO);
		// 신고 내용
		reportVO.setReportContents(reportContents);
		// 신고 데이터 저장(리뷰 No, 평점 No 확인)
		if(Integer.toString(reviewVO.getReviewNo()).contentEquals("0")) {
			reportVO.setCommentsVO(commentsVO);
			reportService.sReportWriteComments(reportVO);
		}else {
			reportVO.setReviewVO(reviewVO);
			reportService.sReportWriteReview(reportVO);
		}
		// 트랜잭션 처리후 수정이 필요함
		return "report/report_ok";
	}
	
	// 신고글 삭제
	@PostMapping("deleteReport.do")
	public String deleteReportComments(int reportNo, String commentsNo) {
		reportService.sReportDelete(reportNo);
		if (commentsNo != null) {
			return "redirect:reportCommentsBoard.do";
		}else {
			return "redirect:reportReviewBoard.do";
		}
	}
	
	// 내 신고 리스트(리뷰)
	// ResponseBody는 비동기 통신에 필요한 어노테이션이다.
	@RequestMapping("myReportBoard.do")
	@ResponseBody
	public ReportListVO myReportReviewBoard(String reportPageNo, boolean reportType) {
		System.out.println("myReportBoard.do 실행");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = mvo.getId();
		if(reportType) {
			return reportService.sGetMyReportCommentsList(id, reportPageNo);
		} else {
			return reportService.sGetMyReportReviewList(id, reportPageNo);
		}
	}
	

	// 마이페이지로 이동(임시)
	@RequestMapping("testMyPageBoard.do")
	public ModelAndView testMyPageBoard() {
		return new ModelAndView("report/my_report_board.tiles");
	}

	// 내 신고 리스트(평점)
	//@RequestMapping("myReportCommentsBoard.do")
	//@ResponseBody
	//public ReportListVO myReportCommentsBoard(String pageNo) {
	//	MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	//	String id = mvo.getId();
	//	
	//}	

}



























