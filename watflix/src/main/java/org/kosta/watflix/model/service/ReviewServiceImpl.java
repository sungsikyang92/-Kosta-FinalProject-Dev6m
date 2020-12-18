package org.kosta.watflix.model.service;


import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.MemberMapper;
import org.kosta.watflix.model.mapper.PointHistoryMapper;
import org.kosta.watflix.model.mapper.ReviewLikeMapper;
import org.kosta.watflix.model.mapper.ReviewMapper;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource
	ReviewMapper reviewMapper;
	@Resource
	ReviewLikeMapper reviewLikeMapper;
	@Resource
	MemberMapper memberMapper;
	@Resource
	PointHistoryMapper pointHistoryMapper;
	
	//리뷰리스트불러오기 pageNo 없는 ver
	//@Override
	//public ReviewListVO sGetReviewList() {
	//	return sGetReviewList("1");
	//}
	//리뷰리스트불러오기
	@Override
	public ReviewListVO sGetReviewList(String pageNo) {
		int reviewTotalCount = reviewMapper.mGetTotalReviewCount();
		PagingBean pagingBean = null;
		int pageNumberPerPageGroup=5;
		if(pageNo == null) {
			pagingBean = new PagingBean(reviewTotalCount);
		}else {
			int contentNumberPerPage=10;
			pagingBean = new PagingBean(reviewTotalCount, contentNumberPerPage, pageNumberPerPageGroup, Integer.parseInt(pageNo));
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
	@Transactional
	@Override
	public void sReviewWrite(ReviewVO reviewVO) {
		reviewMapper.mReviewWrite(reviewVO);
		memberMapper.mMemberPointUpdate(reviewVO.getMemberVO());
		pointHistoryMapper.mPointHistoryAddWithReview(reviewVO.getReviewNo(), reviewVO.getMemberVO().getId());
		System.out.println("히스토리에넣음");
	}
	
	//리뷰업데이트
	@Override
	public void sReviewUpdate(ReviewVO reviewVO) {
		reviewMapper.mReviewUpdate(reviewVO);
	}

	//리뷰상세보기와 조회수증가방지
	@Override
//	public ReviewVO sGetReviewDetailNoHits(int reviewNo) { id
//		return reviewMapper.mGetReviewDetail(reviewNo);
//	}			reviewNo랑 id를 넣어야함
	public ReviewVO sGetReviewDetailNoHits(String id, int reviewNo) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("reviewNo", reviewNo);		
		return reviewMapper.mGetReviewDetail(map);
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
	public ReviewListVO sGetMyReviewList(String id, String pageNo) {
		System.out.println(reviewMapper.mGetMyTotalReviewCount(id));
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

	//해당 컨텐츠에 접속한 유저의 아이디로 작성된 review가 있는지 확인
	@Override
	public int sCheckReviewExist(String id, String contentsNo) {
		return reviewMapper.mCheckReviewExist(id, contentsNo);
	}


}
