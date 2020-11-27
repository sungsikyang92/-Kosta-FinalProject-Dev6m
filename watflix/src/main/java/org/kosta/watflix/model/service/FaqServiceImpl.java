package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.FaqMapper;
import org.kosta.watflix.model.vo.FaqVO;

public class FaqServiceImpl implements FaqService {

	@Resource
	private FaqMapper faqMapper;
	
	//FAQ 작성
	@Override
	public void sFaqWrite(FaqVO faqVO) {
		// TODO Auto-generated method stub
		faqMapper.mFaqWrite(faqVO);
		
	}

}
