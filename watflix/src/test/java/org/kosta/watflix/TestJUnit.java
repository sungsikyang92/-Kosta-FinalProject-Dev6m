package org.kosta.watflix;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.NoticeMapper;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.NoticeVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class TestJUnit {
	
	@Resource
	NoticeMapper noticeMapper;
	
	@Test
	public void test(){
		
	}
}




















