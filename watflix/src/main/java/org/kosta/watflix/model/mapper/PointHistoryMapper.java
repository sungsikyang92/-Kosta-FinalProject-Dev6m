package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.PointHistoryVO;
import org.kosta.watflix.model.vo.ProductOrderVO;

@Mapper
public interface PointHistoryMapper {
	
	//리뷰글쓰기로 인한 포인트추가내역(15 포인트)
	void mPointHistoryAddWithReview(@Param("reviewNo")int reviewNo, @Param("id")String id);
	//평점글쓰기로 인한 포인트추가내역(10 포인트)
	void mPointHistoryAddWithComments(@Param("commentsNo")int commentsNo, @Param("id")String id);
	//주문으로 인한 포인트감소내역
	void mPointHistoryAddWithOrder(@Param("productOrderVO")ProductOrderVO productOrderVO, @Param("point")int point);
	//포인트사용내역 개수
	int mProductHistoryGetTotalCount(String id);
	List<PointHistoryVO> mMemberPointHistoryCheck(@Param("id")String id, @Param("pagingBean")PagingBean pagingBean);
}
