package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ReviewLikeMapper;
import org.kosta.watflix.model.mapper.ReviewMapper;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewLikeVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReviewLikeServiceImpl implements ReviewLikeService {
	@Resource
	ReviewLikeMapper reviewLikeMapper;
	@Resource
	ReviewMapper reviewMapper;
	//리뷰좋아요 여부
	@Transactional
	@Override
	public int sReviewLikeExist(ReviewLikeVO reviewLikeVO) {
		int reviewLikeExist = reviewLikeMapper.mReviewLikeExist(reviewLikeVO);
		if(reviewLikeExist == 0) {
			reviewLikeMapper.mReviewLikeAdd(reviewLikeVO);
			reviewMapper.mReviewLikesUpdate(reviewLikeVO.getReviewVO().getReviewNo());
		}else{
			reviewLikeMapper.mReviewLikeRemove(reviewLikeVO);
			reviewMapper.mReviewLikesRemove(reviewLikeVO.getReviewVO().getReviewNo());
		}
		return reviewLikeExist;
	}
	//리뷰좋아요 개수
	@Override
	public int sGetReviewLikeCount() {
		return reviewLikeMapper.mGetReviewLikeCount();
	}
	// 상세 접속시 좋아요 유무 체크용
	@Override
	public int sGetReviewExist(int reviewNo, String id) {
		ReviewLikeVO reviewLikeVO = new ReviewLikeVO();
		MemberVO memberVO = new MemberVO();
		ReviewVO reviewVO = new ReviewVO();
		memberVO.setId(id);
		reviewVO.setReviewNo(reviewNo);
		reviewLikeVO.setMemberVO(memberVO);
		reviewLikeVO.setReviewVO(reviewVO);
		
		return reviewLikeMapper.mReviewLikeExist(reviewLikeVO);
	}
	
	
}
