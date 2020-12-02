package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ReportService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	@Resource
	private ReportService reportService;
	
	// 신고 게시판(리뷰)으로 이동
	@RequestMapping("reporBoard.do")
	public ModelAndView reportWriteFrom() {
		return new ModelAndView("report/report_board","ReportReviewList",reportService.sGetReportReviewList());
	}
	
	// 신고 게시판(평점)으로 이동
}
