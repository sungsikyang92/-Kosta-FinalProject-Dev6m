package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ReviewLikeMapper;
import org.kosta.watflix.model.vo.ReviewLikeVO;
import org.springframework.stereotype.Service;

@Service
public class ReviewLikeServiceImpl implements ReviewLikeService {
	@Resource
	ReviewLikeMapper reviewLikeMapper;
	//리뷰좋아요++
	@Override
	public void sReviewLikeAdd(ReviewLikeVO reviewLikeVO) {
		reviewLikeMapper.mReviewLikeAdd(reviewLikeVO);
	}
	//리뷰좋아요 여부
	@Override
	public int sReviewLikeExist(ReviewLikeVO reviewLikeVO) {
		return reviewLikeMapper.mReviewLikeExist(reviewLikeVO);
	}
	//리뷰좋아요 제거
	@Override
	public void sReviewLikeRemove(ReviewLikeVO reviewLikeVO) {
		reviewLikeMapper.mReviewLikeRemove(reviewLikeVO);
		
	}
	//리뷰좋아요 개수
	@Override
	public int sGetReviewLikeCount() {
		return reviewLikeMapper.mGetReviewLikeCount();
	}
	
	
}
