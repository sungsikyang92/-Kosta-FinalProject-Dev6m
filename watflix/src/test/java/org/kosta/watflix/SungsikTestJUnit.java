package org.kosta.watflix;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.ReviewMapper;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class SungsikTestJUnit {
	@Resource
	private ReviewMapper reviewMapper;
	@Test
	public void reviewUnitTest() {
		//리뷰등록 테스트
		MemberVO memberVO = new MemberVO();
		memberVO.setId("a");
		memberVO.setPassword("1");
		memberVO.setName("깡상");
		memberVO.setEmail("gmail");
		ReviewVO reviewVO=new ReviewVO();
		reviewVO.setReviewTitle("Test2");
		reviewVO.setReviewContents("테스트중인디?");
		reviewMapper.mReviewWrite(reviewVO);
	}
	
	
	
	
}
