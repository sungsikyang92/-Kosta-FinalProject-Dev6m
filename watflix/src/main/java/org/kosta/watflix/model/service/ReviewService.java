package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;

public interface ReviewService {
	
	ReviewListVO sGetReviewList(PagingBean pagingBean);
	
	void sReviewWrite(ReviewVO reviewVO);
	
	void sReviewUpdate(ReviewVO reviewVO);
	
	ReviewVO sGetReviewDetailNoHits(String reviewNo);
}
