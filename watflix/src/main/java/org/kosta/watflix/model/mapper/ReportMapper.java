package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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
	// 신고 글 삭제
	void mReportDelete(int reportNo);
	// 리뷰 신고 수 조회
	int mGetTotalReportReviewCount();
	// 평점 신고 수 조회
	int mGetTotalReportCommentsCount();
	// 리뷰 신고리스트, 페이징
	List<ReportVO> mGetReportReviewList(PagingBean pagingBean);
	// 평점 신고리스트, 페이징
	List<ReportVO> mGetReportCommentsList(PagingBean paginBean);
	// 신고글 작성 여부 확인(리뷰)
	int mReportCheckReview(ReportVO reportVO);
	// 신고글 작성 여부 확인(평점)
	int mReportCheckComments(ReportVO reportVO);
	// 내가 신고한 리뷰글 수 조회
	int mGetMyTotalReportReviewCount(String id);
	// 내가 신고한 평점글 수 조회
	int mGetMyTotalReportCommentsCount(String id);
	// 내 신고글 보기(리뷰)
	List<ReportVO> mGetMyReportReviewList(@Param("pagingBean") PagingBean pagingBean, @Param("id") String id);
	// 내 신고글 보기(평점)
	List<ReportVO> mGetMyReportCommentsList(@Param("pagingBean") PagingBean pagingBean, @Param("id") String id);
	
	// foreign key 비활성화(리뷰)
	void mDisableForeignkeyReview();
	// foreign key 활성화(리뷰)
	void mEnableForeignkeyReview();
	// foreign key 비활성화(평점)
	void mDisableForeignkeyComments();
	// foreign key 활성화(평점)
	void mEnableForeignkeyComments();
}




