package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.Authority;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewVO;
@Mapper
public interface ReviewMapper {

	void mReviewWrite(ReviewVO reviewVO);

	void mReviewUpdate(ReviewVO reviewVO);

	int mGetTotalReviewCount();

	List<ReviewVO> mGetReviewList(PagingBean pagingBean);


}




