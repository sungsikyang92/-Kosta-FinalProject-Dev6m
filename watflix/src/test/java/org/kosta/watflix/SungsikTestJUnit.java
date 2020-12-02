package org.kosta.watflix;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.ReviewMapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class SungsikTestJUnit {
	@Resource
	private ReviewService reviewService;
	@Resource
	private ReviewMapper reviewMapper;
	
	@Test
	public void reviewUnitTest() {
		//총 리뷰 수 >> 테스트 당시 1 나옴으로 정상 
//		int totalReviewCount=reviewMapper.mGetTotalReviewCount();
//		System.out.println(totalReviewCount);
//		
		//리뷰 리스트
//		int totalCount=reviewMapper.mGetTotalReviewCount();
//		PagingBean pagingBean = new PagingBean(totalCount);
//		List<ReviewVO> reviewList = reviewMapper.mGetReviewList(pagingBean);
//		for(ReviewVO reviewVO:reviewList)
//			System.out.println(reviewVO);
		
/*		
//		//리뷰등록 테스트 >> 테스트 정상 작동
		MemberVO memberVO = new MemberVO();
		memberVO.setId("a");
//		memberVO.setPassword("1");
//		memberVO.setName("깡상");
//		memberVO.setEmail("gmail");
		ContentsVO contentsVO = new ContentsVO();
		contentsVO.setContentsNo("81171201");
		ReviewVO reviewVO=new ReviewVO();
		reviewVO.setReviewNo(1);
		reviewVO.setMemberVO(memberVO);
		reviewVO.setContentsVO(contentsVO);
		reviewVO.setReviewTitle("Test");
		reviewVO.setReviewContents("테스트중입니다.");
		reviewMapper.mReviewWrite(reviewVO);
//		
 */
		//리뷰등록 테스트 2>> 테스트 정상 작동
//		MemberVO memberVO2 = new MemberVO();
//		memberVO2.setId("b");
//		ContentsVO contentsVO2 = new ContentsVO();
//		contentsVO2.setContentsNo("81171201");
//		ReviewVO reviewVO2=new ReviewVO();
//		reviewVO2.setMemberVO(memberVO2);				v
//		reviewVO2.setContentsVO(contentsVO2);			v
//		reviewVO2.setReviewTitle("Test1");				v
//		reviewVO2.setReviewContents("테스트중입니다.");		v
//		reviewMapper.mReviewWrite(reviewVO2);
		
		//리뷰등록 테스트3
//		for(int i = 0; i<40; i++) {
//			ReviewVO reviewVO = new ReviewVO();
//			reviewVO.setReviewTitle("TestReview"+i);
//			reviewVO.setReviewContents("리뷰콘텐츠테스트"+i);
//			reviewVO.setMemberVO(new MemberVO("b",null,null,null,null,null,null,null,null,0,0,null,null,null));
//			reviewVO.setContentsVO(new ContentsVO("81171201",null,null,null,null,null,null,0,0,0));
//			reviewMapper.mReviewWrite(reviewVO);
//			
//			ReviewVO reviewVO2 = new ReviewVO();
//			reviewVO2.setReviewTitle("리뷰테스트"+i);
//			reviewVO2.setReviewContents("review contents test"+i);
//			reviewVO2.setMemberVO(new MemberVO("b",null,null,null,null,null,null,null,null,0,0,null,null,null));
//			reviewVO2.setContentsVO(new ContentsVO("81171201",null,null,null,null,null,null,0,0,0));
//			reviewMapper.mReviewWrite(reviewVO2);
//			
//			System.out.println("review table에 insert한다 뭐를? " + reviewVO);
//			System.out.println("리뷰 table에 insert한다 뭐를? " + reviewVO2);
//			System.out.println(reviewMapper.mGetTotalReviewCount());
//			
//		}
		//리뷰 상세보기
//		System.out.println(reviewMapper.mGetReviewDetail(8));
		
		//리뷰수정
//		System.out.println(reviewMapper.mGetReviewDetail(8));		//리뷰 수정 전
//		ReviewVO reviewVO = reviewService.sGetReviewDetailNoHits(8);
//		reviewVO.setReviewTitle("깨랑까랑");
//		reviewVO.setReviewContents("경영이형 축지법 알려줭");
//		reviewMapper.mReviewUpdate(reviewVO);
//		System.out.println(reviewMapper.mGetReviewDetail(8));		//리뷰 수정 후 		

		//리뷰삭제
//		int reviewNo=8;
//		reviewMapper.mReviewDelete(reviewNo);
//		System.out.println(reviewMapper.mGetReviewDetail(reviewNo));
		
		//리뷰 조회수 증가
//		System.out.println(reviewMapper.mGetReviewDetail(16).getReviewHits());	//조회수 증가 전
//		reviewMapper.mReviewHitsUpdate(16);
//		System.out.println(reviewMapper.mGetReviewDetail(16).getReviewHits());	//죄호수 증가 후 
		ReviewListVO vo = reviewService.sGetReviewList("1");
		for(ReviewVO rao :vo.getReviewList()) {
			System.out.println(rao);
		}
	}
}
