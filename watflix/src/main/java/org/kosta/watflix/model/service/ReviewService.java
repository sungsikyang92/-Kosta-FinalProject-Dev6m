package org.kosta.watflix.model.service;

import java.util.HashMap;

import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;

public interface ReviewService {
	//리뷰리스트 pageNo 없는 ver 
	ReviewListVO sGetReviewList();
	//리뷰리스트
	ReviewListVO sGetReviewList(String pageNo);
	//컨텐츠별리뷰리스트
	ReviewListVO sGetReviewListByContentsNo(String pageNo, String contentsNo);
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
	//리뷰추천수증가
	void sReviewLikesUpdate(int reviewNo);
	//리뷰추천수감소
	void sReviewLikesRemove(int reviewNo);
}
