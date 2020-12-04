package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ReportMapper;
import org.kosta.watflix.model.vo.ReportListVO;
import org.kosta.watflix.model.vo.ReportVO;
import org.springframework.stereotype.Service;

// 트랜잭션 처리 필요함. springmvc12-transaction의 Service 참고
@Service
public class ReportServiceImpl implements ReportService {
	@Resource
	ReportMapper reportMapper;
	// 신고글 상세보기
	@Override
	public ReportVO sReportGetDetailNoHits(int reportNo) {
		ReportVO reportVO = reportMapper.mReportGetDetailNoHits(reportNo);
		return reportVO;
	}
	
	// 신고글 작성(평점)
	@Override
	public void sReportWriteComments(ReportVO reportVO) {
		reportMapper.mReportWriteComments(reportVO);
	}
	
	// 신고글 작성(리뷰)
	@Override
	public void sReportWriteReview(ReportVO reportVO) {
		reportMapper.mReportWriteReview(reportVO);
	}
	
	// 신고글 삭제
	@Override
	public void sReportDelete(int reportNo) {
		reportMapper.mReportDelete(reportNo);		
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
