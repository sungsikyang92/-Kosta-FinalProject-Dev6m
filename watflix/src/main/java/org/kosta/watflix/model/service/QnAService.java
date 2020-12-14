package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.QnAListVO;
import org.kosta.watflix.model.vo.QnAVO;

public interface QnAService {

	// QnA 작성
	void sQnAWrite(QnAVO qnaVO);
	// QnA 상세보기
	QnAVO sQnADetail(int qnaNo);
	// QnA 개수
	int sGetTotalQnACount();
	// QnA 리스트
	QnAListVO sGetQnAList(String pageNo);
	// QnA 리스트
	QnAListVO sGetQnAList();
	// QnA 삭제(관리자만 삭제 가능)
	void sQnADelete(int qnaNo);

}
