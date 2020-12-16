package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ReviewLikeVO;

public interface ReviewLikeService {
	//리뷰좋아요 여부
	int sReviewLikeExist(ReviewLikeVO reviewLikeVO);
	//리뷰좋아요 개수
	int sGetReviewLikeCount();
	//리뷰상세보기 시 좋아요 유무체크용
	int sGetReviewExist(int reviewNo, String id);
}
