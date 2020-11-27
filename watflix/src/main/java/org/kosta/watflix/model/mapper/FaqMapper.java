package org.kosta.watflix.model.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.FaqVO;
@Mapper
public interface FaqMapper {

	FaqVO mFaqDetail(int faqNo);

	void mFaqWrite(FaqVO faqVO);

	void mFaqUpdate(FaqVO faqVO);

	void mFaqDelete(FaqVO faqVO);

}




