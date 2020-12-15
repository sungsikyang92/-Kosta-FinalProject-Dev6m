package org.kosta.watflix;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.CommentsMapper;
import org.kosta.watflix.model.mapper.ContentsMapper;
import org.kosta.watflix.model.mapper.ReportMapper;
import org.kosta.watflix.model.mapper.ReviewMapper;
import org.kosta.watflix.model.service.ReportService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class JaeWooTestUnit {
	@Resource
	private ReportMapper reportMapper;
	@Resource
	private ReviewMapper reviewMapper;
	@Resource
	private CommentsMapper commentsMapper;
	@Resource
	private ContentsMapper contentsMapper;
	
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
		
		/*/
		// 신고글 작성 여부 체크
		ReportVO reportVO = new ReportVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setId("java");
		reportVO.setMemberVO(memberVO);
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setReviewNo(1);
		reportVO.setReviewVO(reviewVO);
		CommentsVO commentsVO = new CommentsVO();
		commentsVO.setCommentsNo(1);
		reportVO.setCommentsVO(commentsVO);
		System.out.println(reportMapper.mReportCheckReview(reportVO));
		System.out.println(reportMapper.mReportCheckComments(reportVO));
		//*/
		
		/*/
		// 내가 작성한 신고글 수 조회
		String id="java";
		int myReportReview = reportMapper.mGetMyTotalReportReviewCount(id);
		int myReportComments = reportMapper.mGetMyTotalReportCommentsCount(id);
		System.out.println(myReportComments + myReportReview);
		//*/
		
		/*/
		// 내 신고글 리스트 보기
		//MemberVO memberVO = new MemberVO();
		//memberVO.setId("java");
		//String id ="java";
		PagingBean pagingBean = new PagingBean(myReportReview,1);
		System.out.println("test1");
		PagingBean pagingBean2 = new PagingBean(myReportComments,1);
		System.out.println("test2");
		List<ReportVO> rvo= reportMapper.mGetMyReportReviewList(pagingBean, id);
		System.out.println("test3");
		List<ReportVO> rvo2=reportMapper.mGetMyReportCommentsList(pagingBean2, id);
		for(ReportVO vo:rvo) {
			System.out.println(vo);
		}
		System.out.println("----");
		for(ReportVO vo:rvo2) {
			System.out.println(vo);
		}
		//*/
		
		/*/
		// 내 리뷰 리스트 보기
		int total = reviewMapper.mGetMyTotalReviewCount("java");
		PagingBean pagingBean = new PagingBean(total, 1);
		System.out.println(reviewMapper.mGetMyReviewList("java", pagingBean));;
		//*/
		
		/*/
		// 내 평점 리스트 보기
		int total = commentsMapper.mMyCommentsGetTotalPostCount("spring");
		PagingBean pagingBean = new PagingBean(total, 1);
		System.out.println(commentsMapper.mMyCommentsGetAllList("spring", pagingBean));
		//*/
		
		/*/
		//컨텐츠 검색
		String contentsTitle = "인";
		System.out.println(contentsMapper.mGetSearchContents(contentsTitle));
		System.out.println(contentsMapper.mGetSearchGenre(contentsTitle));
		//*/
	}
}
