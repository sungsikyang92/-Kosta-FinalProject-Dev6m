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
//		ReviewListVO vo = reviewService.sGetReviewList(pagingBean);
//		for(ReviewVO reviewVO:vo.getReviewList())
//			System.out.println(reviewVO);
		
//		//리뷰등록 테스트 >> 테스트 정상 작동
//		MemberVO memberVO = new MemberVO();
//		memberVO.setId("a");
//		memberVO.setPassword("1");
//		memberVO.setName("깡상");
//		memberVO.setEmail("gmail");
//		ContentsVO contentsVO = new ContentsVO();
//		contentsVO.setContentsNo("81171201");
//		ReviewVO reviewVO=new ReviewVO();
//		reviewVO.setReviewNo("1");
//		reviewVO.setMemberVO(memberVO);
//		reviewVO.setContentsVO(contentsVO);
//		reviewVO.setReviewTitle("Test2");
//		reviewVO.setReviewContents("테스트중인디?");
//		reviewMapper.mReviewWrite(reviewVO);
		
		//리뷰 상세보기
		System.out.println(reviewMapper.mGetReviewDetail("8"));
		
		
		//리뷰수정
//		System.out.println(reviewMapper.get);
		
		
		
		
		/*
		System.out.println(boardMapper.getPostDetail(1));	//수정전
		PostVO pvo=new PostVO();
		pvo.setTitle("크크루삥뽕");
		pvo.setContent("ㅋㅋ루삥뽕~");
		pvo.setNo(1);
		boardMapper.updatePost(pvo);
		System.out.println(boardMapper.getPostDetail(1));	//수정후
		*/
	
	}
}
