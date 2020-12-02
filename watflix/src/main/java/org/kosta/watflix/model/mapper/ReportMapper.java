package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.ReportVO;
@Mapper
public interface ReportMapper {
	// 신고글 상세보기(리뷰, 평점 공통 사용)
	ReportVO mReportGetDetailNoHits(int reportNo);
	// 평점 신고 작성하기
	void mReportWriteComments(ReportVO reportVO);
	// 리뷰 신고 작성하기
	void mReportWriteReview(ReportVO reportVO);	
	// 리뷰 신고 수 조회
	int mGetTotalReportReviewCount();
	// 평점 신고 수 조회
	int mGetTotalReportCommentsCount();
	// 리뷰 신고리스트, 페이징
	List<ReportVO> mGetReportReviewList(PagingBean pagingBean);
	// 평점 신고리스트, 페이징
	List<ReportVO> mGetReportCommentsList(PagingBean paginBean);
	// 내 신고글 보기(평점)
	//List<ReportVO> mGetMyReportReviewList();
	// 내 신고글 보기(리뷰)
	//List<ReportVO> mGetMyReportCommentsList();
}




