package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.FaqListVO;
import org.kosta.watflix.model.vo.FaqVO;


public interface FaqService {
	// FAQ 작성
	void sFaqWrite(FaqVO faqVO); 
	// FAQ 수정
	void sFaqUpdate(FaqVO faqVO);
	// FAQ 상세보기
	FaqVO sFaqDetail(int faqNo);
	// FAQ 개수
	int sGetTotalFaqCount();
	// FAQ 리스트
	FaqListVO sGetFaqList(String pageNo);
	// FAQ 리스트
	FaqListVO sGetFaqList();
	// FAQ 삭제 
	void sFaqDelete(int faqNo);
	// FAQ 조회 수 증가
	void sFaqUpdateHits(int faqNo);
	// FAQ 상세보기 및 조회수 증가 방지
	FaqVO sFaqDetailNoHits(int faqNo);
}


