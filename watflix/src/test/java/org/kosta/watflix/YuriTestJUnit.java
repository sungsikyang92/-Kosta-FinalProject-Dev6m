package org.kosta.watflix;

import javax.annotation.Resource;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.FaqMapper;
import org.kosta.watflix.model.vo.FaqVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class YuriTestJUnit {
	@Resource
	private FaqMapper faqMapper;

	@Test
	public void test(){
		//FAQ 등록 테스트
		FaqVO faqVO = new FaqVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setId("yuki");
		memberVO.setPassword("1234");
		memberVO.setName("유리");
		memberVO.setEmail("mailmilk");
		faqVO.setFaqNo("1");
		faqVO.setMemberVO(memberVO);
		faqVO.setFaqTitle("테스츄");
		faqVO.setFaqContents("테스형");
		faqMapper.mFaqWrite(faqVO);
		System.out.println();
	}
}




















