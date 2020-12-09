package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.QnAMapper;
import org.kosta.watflix.model.vo.QnAListVO;
import org.kosta.watflix.model.vo.QnAVO;
import org.springframework.stereotype.Service;
@Service
public class QnAServiceImpl implements QnAService {
	@Resource
	private QnAMapper qnaMapper;
	
	// QnA 작성
	@Override
	public void sQnAWrite(QnAVO qnaVO) {
		qnaMapper.mQnAWrite(qnaVO);
		
	}
	
	// QnA 상세보기
	@Override
	public QnAVO sQnADetail(int qnaNo) {
		return qnaMapper.mQnADetail(qnaNo);
	}
	
	// QnA 개수
	@Override
	public int sGetTotalQnACount() {
		return 0;
	}

	// QnA 리스트 페이징빈
	@Override
	public QnAListVO sGetQnAList(String pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	// QnA 리스트 
	@Override
	public QnAListVO sGetQnAList() {
		return null;
	}
	
	// QnA 삭제
	@Override
	public void sQnADelete(int qnaNo) {
		qnaMapper.mQnADelete(qnaNo);
	}

}
