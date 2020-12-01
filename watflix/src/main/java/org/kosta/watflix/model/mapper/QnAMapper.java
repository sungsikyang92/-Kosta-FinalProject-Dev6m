package org.kosta.watflix.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.QnAVO;

@Mapper
public interface QnAMapper {
	// QnA 작성
	void mQnAWrite(QnAVO qnaVO);

}
