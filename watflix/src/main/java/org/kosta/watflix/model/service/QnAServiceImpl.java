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
		return qnaMapper.mGetTotalQnACount();
	}

	// QnA 리스트 페이징빈
	@Override
	public QnAListVO sGetQnAList(String pageNo) {
		int totalPostCount = qnaMapper.mGetTotalQnACount();
		PagingBean pagingBean=null;
		if(pageNo==null) {
			pagingBean = new PagingBean(totalPostCount);
		}else {
			pagingBean = new PagingBean(totalPostCount,Integer.parseInt(pageNo));
		}
		QnAListVO qnaListVO=new QnAListVO(qnaMapper.mGetQnAList(pagingBean),pagingBean);
		return qnaListVO;
	}

	// QnA 리스트 
	@Override
	public QnAListVO sGetQnAList() {
		return sGetQnAList("1");
	}
	
	// QnA 삭제
	@Override
	public void sQnADelete(int qnaNo) {
		qnaMapper.mQnADelete(qnaNo);
	}

}
