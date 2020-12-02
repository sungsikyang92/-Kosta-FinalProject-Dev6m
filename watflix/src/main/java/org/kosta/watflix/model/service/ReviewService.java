package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;

public interface ReviewService {
	//리뷰리스트
	ReviewListVO sGetReviewList(String pageNo);
	//리뷰작성
	void sReviewWrite(ReviewVO reviewVO);
	//리뷰수정
	void sReviewUpdate(ReviewVO reviewVO);
	//리뷰상세보기와 조회수증가방지
	ReviewVO sGetReviewDetailNoHits(int reviewNo);
	//리뷰삭제
	void sReviewDelete(int reviewNo);
	//리뷰조회수증가
	void sReviewHitsUpdate(int reviewNo);
}
