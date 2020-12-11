package org.kosta.watflix.model.service;


import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ReviewLikeMapper;
import org.kosta.watflix.model.mapper.ReviewMapper;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewLikeVO;
import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource
	ReviewMapper reviewMapper;
	@Resource
	ReviewLikeMapper reviewLikeMapper;
	
	//리뷰리스트불러오기 pageNo 없는 ver
	@Override
	public ReviewListVO sGetReviewList() {
		return sGetReviewList("1");
	}
	//리뷰리스트불러오기
	@Override
	public ReviewListVO sGetReviewList(String pageNo) {
		int reviewTotalCount = reviewMapper.mGetTotalReviewCount();
		PagingBean pagingBean = null;
		if(pageNo == null) {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(reviewTotalCount,contentNumberPerPage,pageNumberPerPageGroup);
		}else {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(reviewTotalCount,contentNumberPerPage,pageNumberPerPageGroup,Integer.parseInt(pageNo));
		}
		ReviewListVO reviewListVO = new ReviewListVO(reviewMapper.mGetReviewList(pagingBean),pagingBean);
		return reviewListVO;
	}
	
	///컨텐츠별리뷰리스트 불러오기  
	@Override
	public ReviewListVO sGetReviewListByContentsNo(String pageNo, String contentsNo) {
		int reviewTotalCountByContentsNo = reviewMapper.mGetContentsReviewCount(contentsNo);
		PagingBean pagingBean = null;
		if(pageNo == null) {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(reviewTotalCountByContentsNo,contentNumberPerPage,pageNumberPerPageGroup);
		}else {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(reviewTotalCountByContentsNo,contentNumberPerPage,pageNumberPerPageGroup,Integer.parseInt(pageNo));
			
		}
		ReviewListVO reviewListVO = new ReviewListVO(reviewMapper.mGetReviewListByContentsNo(pagingBean,contentsNo), pagingBean);
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

	//리뷰상세보기와 조회수증가방지
	@Override
	public ReviewVO sGetReviewDetailNoHits(int reviewNo) {
		return reviewMapper.mGetReviewDetail(reviewNo);
	}

	//리뷰 삭제 
	@Override
	public void sReviewDelete(int reviewNo) {
		reviewMapper.mReviewDelete(reviewNo);
	}
	
	//리뷰 조회수 증가
	@Override
	public void sReviewHitsUpdate(int reviewNo) {
		reviewMapper.mReviewHitsUpdate(reviewNo);
	}
	
	//리뷰추천수증가
	@Override
	public void sReviewLikesUpdate(int reviewNo) {
		reviewMapper.mReviewLikesUpdate(reviewNo);
	}
	
	//리뷰추천수감소
	@Override
	public void sReviewLikesRemove(int reviewNo) {
		reviewMapper.mReviewLikesRemove(reviewNo);
	}
	
	// 내 리뷰 리스트
	@Override
	public ReviewListVO sGetMyReviewList(String id) {
		return sGetMyReviewList(id, "1");
	}
	@Override
	public ReviewListVO sGetMyReviewList(String id, String pageNo) {
		int myReviewTotalCount = reviewMapper.mGetMyTotalReviewCount(id);
		PagingBean pagingBean = null;
		if(pageNo == null) {
			pagingBean = new PagingBean(myReviewTotalCount);
		}else {
			pagingBean = new PagingBean(myReviewTotalCount, Integer.parseInt(pageNo));
		}
		ReviewListVO reviewListVO = new ReviewListVO(reviewMapper.mGetMyReviewList(id, pagingBean), pagingBean);
		return reviewListVO;
	}


}
