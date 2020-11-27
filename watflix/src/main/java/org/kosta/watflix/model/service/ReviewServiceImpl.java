package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ReviewMapper;
import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource
	private ReviewMapper reviewMapper;
	
	//리뷰리스트불러오기
	@Override
	public ReviewListVO sGetReviewList(PagingBean pagingBean) {
		ReviewListVO reviewListVO=new ReviewListVO(reviewMapper.mGetReviewList(pagingBean),pagingBean);
		return reviewListVO;
	}
	
	//리뷰작성
	@Override
	public void sReviewWrite(ReviewVO reviewVO) {
		reviewMapper.mReviewWrite(reviewVO);
	}
	
	//리뷰업데이트
	@Override
	public void sReviewUpdate(ReviewVO reviewVO) {
		reviewMapper.mReviewUpdate(reviewVO);
	}

	@Override
	public ReviewVO sGetReviewDetailNoHits(String reviewNo) {
		return reviewMapper.mGetReviewDetail(reviewNo);
	}




}
