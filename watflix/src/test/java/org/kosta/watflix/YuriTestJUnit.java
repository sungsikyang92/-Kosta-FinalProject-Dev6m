package org.kosta.watflix;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.FaqMapper;
import org.kosta.watflix.model.mapper.QnAMapper;
import org.kosta.watflix.model.service.FaqService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.service.QnAService;
import org.kosta.watflix.model.vo.FaqListVO;
import org.kosta.watflix.model.vo.FaqVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.QnAListVO;
import org.kosta.watflix.model.vo.QnAVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})

/*
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
		/*
		int faqNo=8;
		//faqService.sFaqDetail(faqNo);
		System.out.println(faqService.sFaqDetail(faqNo));
		*/

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
		//FAQ 조회 수 증가 - ok
		/*
		faqService.sFaqUpdateHits(18);
		System.out.println(faqService.sFaqDetail(18).getFaqHits()); 
		
	}
	*/

public class YuriTestJUnit{
	@Resource
	QnAMapper qnaMapper;
	
	@Resource
	QnAService qnaService;
	
	@Test
	public void test(){
	// QnA 작성 - ok
	QnAVO qnaVO = new QnAVO(); 
	MemberVO memberVO = new MemberVO();
	
	memberVO.setId("yuki");
	memberVO.setPassword("1");
	memberVO.setName("유리");
	memberVO.setEmail("gmail");
	qnaVO.setMemberVO(memberVO);
	/*
	qnaVO.setQnaTitle("안녕하세요.");
	qnaVO.setQnaContents("회원탈퇴는 어떻게 하나요?");
	qnaService.sQnAWrite(qnaVO);
	System.out.println(qnaVO);
	*/
	// QnA 상세보기 - ok
	/*
	int qnaNo=1;
	qnaService.sQnADetail(qnaNo);
	System.out.println(qnaService.sQnADetail(qnaNo));
	*/
	// QnA 삭제 -   ok
	/*
	int qnaNo=2;
	qnaService.sQnADelete(qnaNo);
	System.out.println(qnaVO.getQnaNo());
	*/
	// QnA 갯수 불러오기 - ok
	/*
	int totalQnACount=qnaMapper.mGetTotalQnACount();
	System.out.println(totalQnACount);
	*/
	// QnA 리스트 불러오기 -  ok
	String pageNo = null;
	QnAListVO qvo = qnaService.sGetQnAList();
	System.out.println(qnaService.sGetTotalQnACount());
	for(QnAVO qnaVO1:qvo.getQnaList())
		System.out.println(qnaVO1);
	}
}








