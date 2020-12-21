package org.kosta.watflix;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.service.ContentsLikeService;
import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.service.FaqService;
import org.kosta.watflix.model.service.MemberService;
import org.kosta.watflix.model.service.NoticeService;
import org.kosta.watflix.model.service.PartyService;
import org.kosta.watflix.model.service.PointHistoryService;
import org.kosta.watflix.model.service.ProductCategoryService;
import org.kosta.watflix.model.service.ProductOrderService;
import org.kosta.watflix.model.service.ProductService;
import org.kosta.watflix.model.service.QnAService;
import org.kosta.watflix.model.service.ReportService;
import org.kosta.watflix.model.service.ReviewLikeService;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReportTypeVO;
import org.kosta.watflix.model.vo.ReportVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class InputTestJUnit {
	@Resource
	private CommentsService commentsService;
	@Resource
	private ContentsLikeService contentsLlikeService;
	@Resource
	private ContentsService contentsService;
	@Resource
	private FaqService faqService;
	@Resource
	private MemberService memberService;
	@Resource
	private NoticeService noticeService;
	@Resource
	private PartyService partyService;
	@Resource
	private PointHistoryService pointHitstoryService;
	@Resource
	private ProductCategoryService productCategoryService;
	@Resource
	private ProductService productService;
	@Resource
	private ProductOrderService productOrderService;
	@Resource
	private QnAService qnAService;
	@Resource
	private ReportService reportService;
	@Resource
	private ReviewLikeService reviewLikeService;
	@Resource
	private ReviewService reviewService;
	
	@Test
	public void inputData() {
		MemberVO memberVO = new MemberVO();
		memberVO.setAgreement("");
		//*/관리자 계정 
		memberVO.setId("admin");
		memberVO.setPassword("admin");
		memberVO.setName("admin");
		memberVO.setTel("010");
		memberVO.setBirth("2020-12-18");
		memberVO.setSex("남성");
		memberVO.setEmail("admin@admin.com");
		memberVO.setAddress("경기 성남시 분당구 대왕판교로 670");
		memberVO.setAgreement("동의");
		memberService.sMemberAdminRegister(memberVO);
		//*/
				
		
		//*/ 여러 개정 생성, 평점&리뷰 작성
		// 회원 생성 정보
		String id="Fuze";
		ArrayList<String> sex = new ArrayList<String>();
		sex.add("남성");
		sex.add("여성");
		ArrayList<String> address = new ArrayList<String>();
		address.add("경기도");
		address.add("강원도");
		address.add("서울");
		address.add("부산");
		address.add("북한");
		int createCount = 61; //생성할 회원 수
		
		// 컨텐츠 정보
		List<ContentsVO> contentsList= contentsService.sGetAllContentsList();
		String contentsNo;
		
		// 평점 글 작성 정보
		CommentsVO commentsVO = new CommentsVO();
		ContentsVO contentsVO = new ContentsVO();
		ArrayList<String> comments = new ArrayList<String>();
		comments.add("재미 있어요.");
		comments.add("볼만 합니다.");
		comments.add("들렸다 가요~~~.");
		comments.add("이제 마지막이 다가오고 있습니다. 모두 힘내세요!");
		
		// 리뷰 글 작성 정보
		ReviewVO reviewVO = new ReviewVO();
		ArrayList<String> reviewContents = new ArrayList<String>();
		reviewContents.add("재미 있으니까 꼭 보세요. 리뷰 끝!");
		reviewContents.add("들어 오는 건 막지 않지만 나가는 건 다르지.");
		reviewContents.add("당신은 낚이셨습니다.");
		reviewContents.add("이제 마지막이 다가오고 있습니다. 모두 힘내세요!");
		ArrayList<String> reviewTitle = new ArrayList<String>();
		reviewTitle.add(" 추천합니다.");
		reviewTitle.add(" 리뷰는 내 글이 가장 깔끔!");
		reviewTitle.add("에 대해 객관적으로 작성함.");
		
		// 신고글 작성 정보
		ReportVO reportWrite = new ReportVO();
		ArrayList<CommentsVO> reportComments = new ArrayList<CommentsVO>();
		ArrayList<ReviewVO> reportReview = new ArrayList<ReviewVO>();
		ReportTypeVO reportTypeVO = new ReportTypeVO();
		ArrayList<Integer> reportTypeNo = new ArrayList<Integer>();
		reportTypeNo.add(1);
		reportTypeNo.add(2);
		ArrayList<String> reportContents = new ArrayList<String>();
		reportContents.add("욕설 신고합니다.");
		reportContents.add("음란한 내용 삭제 해주세요.");
		reportContents.add("욕설 제제 하시는 거죠?");
		reportContents.add("음란사이트 경로 신고합니다.");
		int reportCount = 0;
		
		// 회원 생성후  평점,리뷰 작성 반복 진행
		for (int user=0; user < createCount; user++) {
			// 회원 생성
			memberVO.setId(id+user);
			memberVO.setPassword("123");
			memberVO.setName(id+user);
			memberVO.setTel("010"+user);
			memberVO.setBirth("2020-"+(user%12+1)+"-"+(user%28+1));
			memberVO.setSex(sex.get(user%sex.size()));
			memberVO.setEmail(id+user+"@"+id+user+".com");
			memberVO.setAddress(address.get(user%address.size()));
			memberService.sMemberRegister(memberVO);
			
			// 신고 작성
			if(user != 0) {
				reportWrite.setMemberVO(memberVO);
				for(int report = 0; report < 30; report++) {
					reportTypeVO.setReportTypeNo(reportTypeNo.get(reportCount%reportTypeNo.size()));
					reportWrite.setReportTypeVO(reportTypeVO);
					reportWrite.setReportContents(reportContents.get(reportCount%reportContents.size()));
					reportWrite.setReviewVO(reportReview.get(reportCount));
					reportWrite.setCommentsVO(reportComments.get(reportCount));
					reportService.sReportWriteComments(reportWrite);
					reportService.sReportWriteReview(reportWrite);
					reportCount++;
				}
			}
			
			for (int i=0; i < contentsList.size(); i++) {
				contentsNo =contentsList.get(i).getContentsNo();
								
				// 평점 작성
				memberVO.setPoint(memberVO.getPoint()+10);
				commentsVO.setMemberVO(memberVO);
				commentsVO.setComments(comments.get((i+user) % comments.size()));
				commentsVO.setCommentsStars((i+user) % 10 + 1);
				contentsVO.setContentsNo(contentsNo);
				commentsVO.setContentsVO(contentsVO);
				//평점 작성
				commentsService.sCommentsWrite(commentsVO);
				// 평균 별점을 입력한다.
				contentsService.sUpdateAvgStar((float)commentsService.sSumCommentsStars(contentsNo)/(float)commentsService.sCommentsGetTotalPostCountByContentNo(contentsNo), contentsNo);
				reportComments.add(commentsVO);
				
				// 리뷰 작성
				memberVO.setPoint(memberVO.getPoint()+15);
				reviewVO.setMemberVO(memberVO);
				reviewVO.setReviewContents(reviewContents.get((i+user)%reviewContents.size()));
				reviewVO.setReviewTitle(contentsList.get(i).getContentsTitle()+reviewTitle.get((i+user)%reviewTitle.size()));
				contentsVO.setContentsNo(contentsNo);
				reviewVO.setContentsVO(contentsVO);
				//리뷰 작성
				reviewService.sReviewWrite(reviewVO);
				reportReview.add(reviewVO);
				
			}
		}
		//*/
		
		
		
	}
}






























