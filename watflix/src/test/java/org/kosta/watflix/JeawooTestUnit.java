package org.kosta.watflix;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.ReportMapper;
import org.kosta.watflix.model.service.ReportService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml", "file:src/main/webapp/WEB-INF/spring-security.xml"})
public class JeawooTestUnit {
	@Resource
	private ReportService reportService;
	@Resource
	private ReportMapper reportMapper;
	
	@Test
	public void reportUnitTest() {
		//신고 삭제
	}
	
}
