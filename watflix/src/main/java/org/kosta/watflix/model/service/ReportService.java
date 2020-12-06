package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ReportListVO;
import org.kosta.watflix.model.vo.ReportVO;

public interface ReportService {
	// 신고 디테일 (조회수 X)
	ReportVO sReportGetDetailNoHits(int reportNo);
	// 신고 쓰기 (평점)
	void sReportWriteComments(ReportVO reportVO);
	// 신고 쓰기 (리뷰)
	void sReportWriteReview(ReportVO reportVO);
	// 신고 글 삭제
	void sReportDelete(int reportNo);
	// 신고 리스트(리뷰) 
	ReportListVO sGetReportReviewList();
	ReportListVO sGetReportReviewList(String pageNo);
	// 신고 리스트(평점)
	ReportListVO sGetReportCommentsList();
	ReportListVO sGetReportCommentsList(String pageNo);
}

