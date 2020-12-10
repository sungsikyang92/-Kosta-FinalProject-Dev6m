package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ReviewLikeVO;

public interface ReviewLikeService {
	//리뷰좋아요++
	void sReviewLikeAdd(ReviewLikeVO reviewLikeVO);
	//리뷰좋아요 여부
	int sReviewLikeExist(ReviewLikeVO reviewLikeVO);
	//리뷰좋아요 제거 --
	void sReviewLikeRemove(ReviewLikeVO reviewLikeVO);
	//리뷰좋아요 개수
	int sGetReviewLikeCount();
}
