package org.kosta.watflix;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.service.ContentsLikeService;
import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.service.FaqService;
import org.kosta.watflix.model.service.MemberService;
import org.kosta.watflix.model.service.NoticeService;
import org.kosta.watflix.model.service.PartyService;
import org.kosta.watflix.model.service.PointHistoryService;
import org.kosta.watflix.model.service.ProductCategoryService;
import org.kosta.watflix.model.service.ProductOrderService;
import org.kosta.watflix.model.service.ProductService;
import org.kosta.watflix.model.service.QnAService;
import org.kosta.watflix.model.service.ReportService;
import org.kosta.watflix.model.service.ReviewLikeService;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class InputTestJUnit {
	@Resource
	private CommentsService commetsService;
	@Resource
	private ContentsLikeService contentsLlikeService;
	@Resource
	private ContentsService contentsService;
	@Resource
	private FaqService faqService;
	@Resource
	private MemberService memberService;
	@Resource
	private NoticeService noticeService;
	@Resource
	private PartyService partyService;
	@Resource
	private PointHistoryService pointHitstoryService;
	@Resource
	private ProductCategoryService productCategoryService;
	@Resource
	private ProductService productService;
	@Resource
	private ProductOrderService productOrderService;
	@Resource
	private QnAService qnAService;
	@Resource
	private ReportService reportService;
	@Resource
	private ReviewLikeService reviewLikeService;
	@Resource
	private ReviewService reviewService;
	
	@Test
	public void inputData() {
		MemberVO memberVO = new MemberVO();
		memberVO.setAgreement("");
		//*/
		// 관리자 계정 (관리자 권한은 sql 쿼리 직접 입력
		memberVO.setId("admin");
		memberVO.setPassword("admin");
		memberVO.setName("admin");
		memberVO.setTel("010");
		memberVO.setBirth("2020-12-18");
		memberVO.setSex("남성");
		memberVO.setEmail("admin@admin.com");
		memberVO.setAddress("경기 성남시 분당구 대왕판교로 670");
		//memberService.sMemberAdminRegister(memberVO);
		//*/
		//*/
		//계정 생성
		String id="java";
		String Tel="010";
		String birth="2020-12-";
		//*/
		
		
		
		
		
		/*
		 * 더미데이터 넣을 때 사용
		 * for(int i = 0; i<7 ; i++) { System.out.println(i % 3); }
		 */
		
		/*/
		// 전체 컨텐츠 리스트
		List<ContentsVO> contentsList= contentsService.sGetAllContentsList();
		for (int i=0; i < contentsList.size(); i++) {
			System.out.println(contentsList.get(0).getContentsNo());
		}
		//*/
		
		
	}
}






























