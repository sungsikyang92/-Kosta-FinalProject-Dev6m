package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.QnAMapper;
import org.kosta.watflix.model.vo.QnAVO;
import org.springframework.stereotype.Service;
@Service
public class QnAServiceImpl implements QnAService {
	@Resource
	private QnAMapper qnaMapper;
	 
	// QnA 작성
	@Override
	public void sQnAWrite(QnAVO qnaVO) {
		// TODO Auto-generated method stub
		qnaMapper.mQnAWrite(qnaVO);
	}

}
