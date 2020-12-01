package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ReportVO;

public interface ReportService {
	// 신고 디테일 (조회수 X)
	ReportVO sReportGetDetailNoHits(int reportNo);
	// 신고 쓰기 (평점)
	void sReportWriteComments(ReportVO reportVO);
	// 신고 쓰기 (리뷰)
	void sReportWriteReview(ReportVO reportVO);
	//신고 삭제
	void sReportDelete(int reviewNo);

}
