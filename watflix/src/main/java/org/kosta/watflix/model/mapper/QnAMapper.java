package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.QnAVO;

@Mapper
public interface QnAMapper {
	// QnA 작성
	void mQnAWrite(QnAVO qnaVO);
	// QnA 상세보기
	QnAVO mQnADetail(int QnANo);
	// QnA 리스트
	List<QnAVO> mGetQnAList(PagingBean pagingBean);
	// QnA 삭제
	void mQnADelete(int qnaNo);
	// QnA 갯수 불러오기
	int mGetTotalQnACount();
}
