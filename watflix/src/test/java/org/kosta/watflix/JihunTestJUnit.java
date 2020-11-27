package org.kosta.watflix;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.NoticeMapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.NoticeVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/*
 *    TDD : 테스트 주도 개발(test-driven development, TDD)은 
 *            매우 짧은 개발 사이클을 반복하는 소프트웨어 개발 프로세스
 *            
 *    JUnit: 자바 단위 테스트를 위한 TDD 프레임워크
 *    
 *    아래 라이브러리가 maven의 pom.xml에 추가되어야 한다. 
       <!-- spring junit  -->
  <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
            <version>${org.springframework-version}</version>            
        </dependency>
        <!-- Test : 기존 4.7에서 4.9로 수정 -->
  <dependency>
   <groupId>junit</groupId>
   <artifactId>junit</artifactId>
   <version>4.9</version>
   <scope>test</scope>
  </dependency>  
 */  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class JihunTestJUnit {
	@Resource
	private NoticeMapper noticeMapper;
	@Test
	public void test(){
		
		//1. 리스트 출력 테스트
		int totalPostCount = noticeMapper.mNoticeGetTotalPostCount();
		PagingBean pagingBean = new PagingBean(totalPostCount);
		List<NoticeVO> list = noticeMapper.mNoticeGetList(pagingBean);
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
}




















