package org.kosta.watflix.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.ReviewLikeVO;

@Mapper
public interface ReviewLikeMapper {
	
	//리뷰좋아요++
	void mReviewLikeAdd(ReviewLikeVO reviewLikeVO);
	//리뷰좋아요 여부
	int  mReviewLikeExist(ReviewLikeVO reviewLikeVO);
	//리뷰좋아요 제거
	void mReviewLikeRemove(ReviewLikeVO reviewLikeVO);
	//리뷰좋아요 개수
	int mGetReviewLikeCount();

}
