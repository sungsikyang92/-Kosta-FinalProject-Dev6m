package org.kosta.watflix;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.ReportMapper;
import org.kosta.watflix.model.service.ReportService;
import org.kosta.watflix.model.vo.ReportListVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class JaeWooTestUnit {
	@Resource
	private ReportMapper reportMapper;
	
	@Resource
	private ReportService reportService;
	
	@Test
	public void test() {
		/*/
		// 신고 게시물 수 조회 Test
		int totalReportReview = reportMapper.mGetTotalReportReviewCount();
		int totalReportComments = reportMapper.mGetTotalReportCommentsCount();
		System.out.println(totalReportComments + totalReportReview);
		//*/
		
		// 리뷰 신고 게시물 리스트 조회 Test
		/*/
		PagingBean pb = new PagingBean(totalReportReview, 1);
		List<ReportVO> list = reportMapper.mGetReportReviewList(pb);
		for(ReportVO vo:list) {
			System.out.println(vo);
		}
		//*/
		/*/
		ReportListVO lvo = reportService.sGetReportReviewList("1");
		System.out.println(lvo.toString());
		//*/
		
		/*/
		// 평점 신고 게시물 리스트 조회 Test
		PagingBean pb2 = new PagingBean(totalReportComments, 1, 3);
		List<ReportVO> list2 = reportMapper.mGetReportCommentsList(pb2);
		for(ReportVO vo:list2) {
			System.out.println(vo);
		}
		//*/
		
		/*/
		// 11. Report디테일 출력 테스트 >> 테스트 완료
		int reportNo = 1;
		ReportVO reportVO = reportMapper.mReportGetDetailNoHits(reportNo);
		System.out.println(reportVO);
		//*/
		
		/*/
		// 12. Report(Comment)쓰기 테스트 >> 테스트 완료
		ReportVO reportVO = new ReportVO();
		MemberVO memberVO = new MemberVO();
		CommentsVO commentsVO = new CommentsVO();
		ReportTypeVO reportTypeVO = new ReportTypeVO();
		memberVO.setId("java");
		commentsVO.setCommentsNo(1);
		reportTypeVO.setReportTypeNo(2);
		reportVO.setMemberVO(memberVO);
		reportVO.setCommentsVO(commentsVO);
		reportVO.setReportTypeVO(reportTypeVO);
		reportVO.setReportContents("코로나입니다 집에 머무시기를2");
		reportMapper.mReportWriteComments(reportVO); 
		//*/
		
		/*/
		// 12. Report(Review)쓰기 테스트 >> 테스트 완료
		ReportVO reportVO = new ReportVO();
		MemberVO memberVO = new MemberVO();
		ReviewVO reviewVO = new ReviewVO();
		ReportTypeVO reportTypeVO = new ReportTypeVO();
		memberVO.setId("java");
		reviewVO.setReviewNo(2);
		reportTypeVO.setReportTypeNo(2);
		reportVO.setMemberVO(memberVO);
		reportVO.setReviewVO(reviewVO);
		reportVO.setReportTypeVO(reportTypeVO);
		reportVO.setReportContents("코로나입니다 집에 머무시기를");
		reportMapper.mReportWriteReview(reportVO);
		//*/
		
		/*/
		// 신고글 삭제
		reportMapper.mReportDelete(2);
		//*/
		
	}
}
