package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;

public interface ReviewService {
	//리뷰리스트
	ReviewListVO sGetReviewList(PagingBean pagingBean);
	//리뷰작성
	void sReviewWrite(ReviewVO reviewVO);
	//리뷰수정
	void sReviewUpdate(ReviewVO reviewVO);
	//리뷰상세보기와 조회수증가방지
	ReviewVO sGetReviewDetailNoHits(String reviewNo);
	//크크루삥뽕빵뽕삥
}
