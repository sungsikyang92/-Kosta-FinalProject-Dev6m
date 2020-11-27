package org.kosta.watflix.model.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.FaqVO;
@Mapper
public interface FaqMapper {

	void mFaqWrite(FaqVO faqVO);

}




