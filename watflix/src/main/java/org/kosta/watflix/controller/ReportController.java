package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ReportService;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReportTypeVO;
import org.kosta.watflix.model.vo.ReportVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	@Resource
	private ReportService reportService;
	
	// 신고 게시판(리뷰)
	@RequestMapping("reportReviewBoard.do")
	public ModelAndView reportReviewBoard() {
		return new ModelAndView("report/report_review_board","reportReviewList",reportService.sGetReportReviewList());
	}
	@RequestMapping("reportReviewBoardNext.do")
	public ModelAndView reportReviewBoardNext(String pageNo) {
		return new ModelAndView("report/report_review_board","reportReviewList",reportService.sGetReportReviewList(pageNo));
	}
	
	// 신고 게시판(평점)
	@RequestMapping("reportCommentsBoard.do")
	public ModelAndView reportCommentsBoard() {
		return new ModelAndView("report/report_comments_board","reportCommentsList",reportService.sGetReportCommentsList());
	}
	@RequestMapping("reportCommentsBoardNext.do")
	public ModelAndView reportCommentsBoard(String pageNo) {
		return new ModelAndView("report/report_comments_board","reportCommentsList",reportService.sGetReportCommentsList(pageNo));
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

	// 신고글 등록(리뷰)
	@PostMapping("reportReviewRegister.do")
	public String reportReviewRegister(int reviewNo, int reportTypeNo, String reportContents) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = mvo.getId();
		// 신고할 리뷰VO
		ReportVO reportVO = new ReportVO();
		// 아이디
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		reportVO.setMemberVO(memberVO);
		// 리뷰No
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setReviewNo(reviewNo);
		reportVO.setReviewVO(reviewVO);
		// 신고 타입
		ReportTypeVO reportTypeVO = new ReportTypeVO();
		reportTypeVO.setReportTypeNo(reportTypeNo);
		reportVO.setReportTypeVO(reportTypeVO);
		// 신고 내용
		reportVO.setReportContents(reportContents);
		// 신고
		reportService.sReportWriteReview(reportVO);
		// 트랜잭션 처리후 수정이 필요함
		return "report/report_ok";
	}
	// 신고글 등록(평점)
	@PostMapping("reportCommentsRegister.do")
	public String reportCommentsRegister(int commentsNo, int reportTypeNo, String reportContents) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = mvo.getId();
		// 신고할 리뷰VO
		ReportVO reportVO = new ReportVO();
		// 아이디
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		reportVO.setMemberVO(memberVO);
		// 평점No
		CommentsVO commentsVO= new CommentsVO();
		commentsVO.setCommentsNo(commentsNo);
		reportVO.setCommentsVO(commentsVO);
		// 신고 타입
		ReportTypeVO reportTypeVO = new ReportTypeVO();
		reportTypeVO.setReportTypeNo(reportTypeNo);
		reportVO.setReportTypeVO(reportTypeVO);
		// 신고 내용
		reportVO.setReportContents(reportContents);
		// 신고
		reportService.sReportWriteComments(reportVO);
		// 트랜잭션 처리 후 수정이 필요함
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
	@RequestMapping("myReportReviewBoard.do")
	public ModelAndView myReportReviewBoard() {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = mvo.getId();
		return new ModelAndView("report/my_report_review_board","myReportReviewList",reportService.sGetMyReportReviewList(id));
	}
}



























