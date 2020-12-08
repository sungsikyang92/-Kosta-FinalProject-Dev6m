package org.kosta.watflix;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.FaqMapper;
import org.kosta.watflix.model.service.FaqService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.FaqListVO;
import org.kosta.watflix.model.vo.FaqVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class YuriTestJUnit {
	@Resource
	FaqService faqService;
	@Resource
	FaqMapper faqMapper;

	@Test
	public void test(){
		//FAQ 등록 테스트  - ok
		
		FaqVO faqVO = new FaqVO();
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId("java");
		memberVO.setPassword("1");
		memberVO.setName("유리");
		memberVO.setEmail("gmail");
		faqVO.setMemberVO(memberVO);
		
		faqVO.setFaqTitle("졸려유");
		faqVO.setFaqContents("테스형");
		faqService.sFaqWrite(faqVO);
		System.out.println();
		
		//FAQ 수정 테스트 - ok
		/*
		faqVO.setFaqTitle("테스테스");
		faqVO.setFaqContents("테스태스테슬라");
		faqService.sFaqUpdate(faqVO);
		System.out.println();
		*/
		
		//FAQ 삭제 테스트 - ok
		/*
		faqVO.setFaqNo(7);
		faqService.sFaqDelete(faqVO);
		System.out.println();
		*/
		
		//FAQ 상세보기 테스트 - ok
		
		//int faqNo=8;
		//faqService.sFaqDetail(faqNo);
		//System.out.println(faqService.sFaqDetail(faqNo));
		
		//FAQ 개수 - ok
		/*
		int totalFaqCount=faqMapper.mGetTotalFaqCount();
		System.out.println(totalFaqCount);
		*/
		//FAQ 리스트 테스트 - ok
		/*
		String pageNo = null;
		FaqListVO fvo = faqService.sGetFaqList();
		System.out.println(faqService.sGetTotalFaqCount());
		for(FaqVO faqVO:fvo.getFaqList())
			System.out.println(faqVO);
		 */
	}
}



