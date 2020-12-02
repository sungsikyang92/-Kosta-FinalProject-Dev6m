package org.kosta.watflix.model.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.FaqVO;
@Mapper
public interface FaqMapper {
	// FAQ 상세보기
	FaqVO mFaqDetail(int faqNo);
	// FAQ 작성
	void mFaqWrite(FaqVO faqVO);
	// FAQ 수정
	void mFaqUpdate(FaqVO faqVO);
	// FAQ 삭제
	void mFaqDelete(FaqVO faqVO);
	// FAQ 리스트
	List<FaqVO> mGetFaqList(PagingBean pagingBean);
	// 총 FAQ 개수
	int mGetTotalFaqCount();
}




