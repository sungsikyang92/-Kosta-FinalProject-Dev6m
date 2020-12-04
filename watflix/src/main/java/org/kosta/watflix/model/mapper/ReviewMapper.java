package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.Authority;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewVO;
@Mapper
public interface ReviewMapper {
	//리뷰작성
	void mReviewWrite(ReviewVO reviewVO);
	//리뷰수정
	void mReviewUpdate(ReviewVO reviewVO);
	//총리뷰개수
	int mGetTotalReviewCount();
	//리뷰리스트 with 페이징
	List<ReviewVO> mGetReviewList(PagingBean pagingBean);
	//리뷰상세보기
	ReviewVO mGetReviewDetail(int reviewNo);
	//리뷰 삭제
	void mReviewDelete(int reviewNo);
	//리뷰 조회수 업데이트
	void mReviewHitsUpdate(int reviewNo);
	// 특정 컨텐츠에 대한 리뷰개수
	int mGetContentsReviewCount(String contentsNo);

}




