package org.kosta.watflix;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.MemberMapper;
import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.service.MemberService;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class SanghoonTestJUnit {

	@Resource
	MemberService memberService;
	@Resource
	ContentsService contentsService;
	
	@Resource
	MemberMapper memberMapper;
//	회원가입 테스트 완료
	@Test
	public void test(){
		MemberVO memberVO = new MemberVO();
		memberVO.setId("java14");
		memberVO.setPassword("123");
		memberVO.setName("테스트");
		memberVO.setEmail("email");
		memberVO.setTel("123");
		memberVO.setBirth("1992-09-03");
		memberVO.setSex("남성");
		memberVO.setAddress("경기도");
		memberVO.setAgreement("동의");
		memberService.sMemberRegister(memberVO);
		

	System.out.println(contentsService.sFindContentsByNo("70001473"));
	}

/* 회원정보수정 테스트 및 로그인시간,로그인실패횟수 증가 테스트 완료
	@Test
	public void test(){
		MemberVO memberVO = new MemberVO();
		memberVO.setId("java14");
		memberVO.setPassword("123");
		memberVO.setName("뚱보");
		memberVO.setEmail("email");
		memberVO.setTel("12346546");
		memberVO.setBirth("1992-09-03");
		memberVO.setSex("남성");
		memberVO.setAddress("경기도");
		memberVO.setAgreement("동의");
		System.out.println(memberService.sFindMemberById("java14"));
		memberService.sMemberUpdate(memberVO);
		System.out.println(memberService.sFindMemberById("java14"));
		
		memberService.sMemberLoginTimeUpdate("java14");
		System.out.println(memberService.sFindMemberById("java14"));
	}
*/
/*
	@Test
	public void test(){
		System.out.println(memberService.sMemberPointCheck("java"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id","java");
		map.put("pointUp",4);
		memberMapper.mMemberPointUp(map);
		System.out.println(memberService.sMemberPointCheck("java"));
		memberService.sMemberProductOrderHistory("java14");	
	}
	*/
}





















