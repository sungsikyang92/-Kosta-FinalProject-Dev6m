package org.kosta.watflix;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.service.NoticeService;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
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
	private NoticeService noticeService;
	@Resource
	private CommentsService commentsService;
	@Test
	public void test(){
		
		//1. Notice리스트 출력 테스트 >> 테스트 완료
		//NoticeListVO noticeListVO = noticeService.sNoticeGetList();
		//List<NoticeVO> list = noticeListVO.getList();
		//for(int i = 0; i < list.size(); i++) {
		//	System.out.println(list.get(i));
		//}
		
		//2. Notice디테일 출력 테스트 >> 테스트 완료
		//int noticeNo = 1;
		//NoticeVO noticeVO = noticeService.sNoticeGetDetail(noticeNo);
		//System.out.println(noticeVO);
		
		//3. Notice수정 테스트 >> 테스트 완료
		//int noticeNo = 1;
		//NoticeVO noticeVO = noticeService.sNoticeGetDetail(noticeNo);
		//noticeVO.setNoticeTitle("배부르다");
		//noticeVO.setNoticeContents("청년다방 낫배드");
		//noticeService.sNoticeUpdate(noticeVO);
		//System.out.println(noticeService.sNoticeGetDetail(noticeNo));
		
		//4. Notice쓰기 테스트 >> 테스트 완료
		//NoticeVO noticeVO = new NoticeVO();
		//MemberVO memberVO = new MemberVO();
		//memberVO.setId("jikang");
		//noticeVO.setMemberVO(memberVO);
		//noticeVO.setNoticeTitle("오늘은 토요일");
		//noticeVO.setNoticeContents("코로나입니다 집에 머무시기를");
		//noticeService.sNoticeWrite(noticeVO);
		//System.out.println(noticeService.sNoticeGetDetailNoHits(14));
		
		// 5. Notice조회수 증가 테스트 >> 테스트 완료
		//int noticeNo = 1;
		//noticeService.sNoticeUpdateHits(noticeNo);
		//NoticeVO noticeVO = noticeService.sNoticeGetDetailNoHits(noticeNo);
		//System.out.println(noticeVO);
		
		// 6. Notice 삭제 테스트 
		//int noticeNo = 14;
		//noticeService.sNoticeDelete(noticeNo);
		//NoticeVO noticeVO = noticeService.sNoticeGetDetailNoHits(noticeNo);
		//System.out.println(noticeVO);
		
		// 7. Comment 리스트 출력 테스트(컨텐츠 상관 x) >> 테스트 완료
		//CommentsListVO commentsListVO = commentsService.sCommentsGetList();
		//List<CommentsVO> list = commentsListVO.getList();
		//for(int i = 0; i < list.size(); i++) {
		//	System.out.println(list.get(i));
		//}
		
		// 8. Comment 리스트 출력 테스트(컨텐츠 상관 o) >> 테스트 완료
		//int contentsNo = 60004481;
		//CommentsListVO commentsListVO = commentsService.sCommentsGetListByContentsNo(contentsNo);
		//List<CommentsVO> list = commentsListVO.getList();
		//for(int i = 0; i < list.size(); i++) {
		//	System.out.println(list.get(i));s
		//}
		
		// 9. Comments 쓰기 테스트 >> 테스트 완료
		//String contentsNo = "60004481";
		//CommentsVO commentsVO = new CommentsVO();
		//MemberVO memberVO = new MemberVO();
		//ContentsVO contentsVO = new ContentsVO();
		//memberVO.setId("jikang");
		//contentsVO.setContentsNo(contentsNo);
		//commentsVO.setMemberVO(memberVO);
		//commentsVO.setContentsVO(contentsVO);
		//commentsVO.setComments("소니의 스파이더맨 기대합니다.");
		//commentsVO.setCommentsStars(7);
		//commentsService.sCommentsWrite(commentsVO);
		
		// 10. Comments 삭제 테스트 >> 테스트 완료
		//int commentsNo = 34;
		//commentsService.sCommentsDelete(commentsNo);
	}
}




















