package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ReportMapper;
import org.kosta.watflix.model.vo.ReportListVO;
import org.kosta.watflix.model.vo.ReportVO;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService {
	@Resource
	ReportMapper reportMapper;

	@Override
	public ReportVO sReportGetDetailNoHits(int reportNo) {
		ReportVO reportVO = reportMapper.mReportGetDetailNoHits(reportNo);
		return reportVO;
	}

	@Override
	public void sReportWriteComments(ReportVO reportVO) {
		reportMapper.mReportWriteComments(reportVO);
	}
	
	@Override
	public void sReportWriteReview(ReportVO reportVO) {
		reportMapper.mReportWriteReview(reportVO);
	}
	// 신고 리스트(리뷰)
	@Override
	public ReportListVO sGetReportReviewList() {
		return sGetReportReviewList("1");
	}
	@Override
	public ReportListVO sGetReportReviewList(String pageNo) {
		int totalPostCount = reportMapper.mGetTotalReportReviewCount();
		PagingBean pagingBean = null;
		if(pageNo==null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		ReportListVO reportListVO = new ReportListVO(reportMapper.mGetReportReviewList(pagingBean), pagingBean);
		return reportListVO;
	}
	// 신고 리스트(평점)
	@Override
	public ReportListVO sGetReportCommentsList() {
		return sGetReportCommentsList("1");
	}
	@Override
	public ReportListVO sGetReportCommentsList(String pageNo) {
		int totalPostCount = reportMapper.mGetTotalReportCommentsCount();
		PagingBean pagingBean = null;
		if(pageNo == null) {
			pagingBean = new PagingBean(totalPostCount);
		}else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		ReportListVO reportListVO = new ReportListVO(reportMapper.mGetReportCommentsList(pagingBean), pagingBean);
		return reportListVO;
	}	
}
