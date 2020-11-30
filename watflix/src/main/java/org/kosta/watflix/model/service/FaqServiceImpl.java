package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.FaqMapper;
import org.kosta.watflix.model.vo.FaqVO;
import org.springframework.stereotype.Service;
@Service
public class FaqServiceImpl implements FaqService {

	@Resource
	private FaqMapper faqMapper;
	
	//FAQ 작성
	@Override
	public void sFaqWrite(FaqVO faqVO) {
		// TODO Auto-generated method stub
		faqMapper.mFaqWrite(faqVO);
		
	}

	@Override
	public void sFaqUpdate(FaqVO faqVO) {
		// TODO Auto-generated method stub
		faqMapper.mFaqUpdate(faqVO);
		
	}

	@Override
	public void sFaqDelete(FaqVO faqVO) {
		// TODO Auto-generated method stub
		faqMapper.mFaqDelete(faqVO);
		
	}

	@Override
	public FaqVO sFaqDetail(int faqNo) {
		// TODO Auto-generated method stub
		return faqMapper.mFaqDetail(faqNo);
	}

	@Override
	public FaqListVO sGetFaqList(PagingBean pagingBean) {
		FaqListVO faqListVO=new FaqListVO(faqMapper.mGetFaqList(pagingBean),pagingBean);
		return faqListVO;
	}

	@Override
	public int sGetTotalFaqCount() {
		return faqMapper.mGetTotalFaqCount();
	}

}
