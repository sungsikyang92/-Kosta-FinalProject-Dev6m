package org.kosta.watflix.controller;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.kosta.watflix.model.service.AdminService;
import org.kosta.watflix.model.service.MemberService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.service.ProductOrderService;
import org.kosta.watflix.model.vo.CommentsListVO;
import org.kosta.watflix.model.vo.MemberListVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ProductOrderListVO;
import org.kosta.watflix.model.vo.ProductOrderVO;
import org.kosta.watflix.model.vo.ReportListVO;
import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.service.FaqService;
import org.kosta.watflix.model.service.ReportService;
import org.kosta.watflix.model.service.ReviewService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {
   
   @Resource
   AdminService adminService;
   @Resource
   MemberService memberService;
   @Resource
   ReviewService reviewService;
   @Resource
   CommentsService commentsService;
   @Resource
   ReportService reportService;
   @Resource
   ProductOrderService productOrderService;
   @Resource
   FaqService faqService;
   
   	@Secured("ROLE_ADMIN")
	@RequestMapping("adminHome.do")
	public String adminHome(){
		return "adminHome.tiles";
	}
   
   //컨텐츠 크롤링
   @RequestMapping("contentsUpdateAdmin.do")
   public String updateContents() {
	  double count;
      String[] genreArr= {"1568","2638104","7424","783","26009","11177","83","83059"};
      //크롤링할 웹페이지 주소
      String stemplateURL = "https://www.netflix.com/kr/browse/genre/";
      String btemplateURL = "https://www.netflix.com/kr/title/";   //게시물 상세보기 관련 URL
      String sThumbnailURL;
      String bThumbnailURL;
      String path; //사진을 저장할 물리적인 장소
      Document sDoc,bDoc;
      Elements sElems,bElems;
      /*로그 코드*/
      String logPath="C:\\kosta203\\log.txt";
      FileWriter fw;
	try{
		fw = new FileWriter(logPath,true);
		BufferedWriter bw = new BufferedWriter(fw); 
      for(int i=0; i<genreArr.length;i++) {
    	  try {
			bw.write(genreArr.length+"중"+(i+1)+"번째 장르 다운 시작");
			bw.newLine();
			System.out.println(genreArr.length+"중"+(i+1)+"번째 장르 다운 시작");
        	   count = 0;
        	   sThumbnailURL=stemplateURL+genreArr[i];
               sDoc = Jsoup.connect(sThumbnailURL).get();
               sElems = sDoc.select("h1.nm-collections-header-name");
        	   String genreName = sElems.text();
               String genreCode=genreArr[i];
               bw.write("장르명: "+genreName+" 장르코드: "+genreCode);
               bw.newLine();
               //장르 DB에 없으면 저장하기
               if(adminService.findByGenreCode(genreCode)==0) {
            	   adminService.genreRegister(genreCode,genreName);
                   bw.write(genreName+" 장르 저장완료");
                   bw.newLine();
                   System.out.println(genreName+" 장르 저장완료");
               }
               else {
            	   System.out.println("장르 건너뛰기");
            	   continue;
               }

               sElems = sDoc.select("img.nm-collections-title-img");
               for(int a=0;a<80;a++) {
            	   Element sElem = sElems.get(a);
                  path="C:\\kosta203\\FinalProject\\-Kosta-FinalProject-Dev6m\\watflix\\src\\main\\webapp\\resources\\contents\\"; //사진을 저장할 물리적인 장소
                   //이미지
                     String sImgUrl = sElem.attr("src");
                     if(sImgUrl.startsWith("http")) {
                    	 bw.write(count+". sImgUrl: "+sImgUrl);
                    	 bw.newLine();
                        //제목
                        String title=sElem.attr("alt");
                        bw.write("title: "+title);
                        bw.newLine();
                        //컨텐츠id, //장르 ID는 해당 컨텐츠에 들어가야지만 수집가능함, 장르는 1개인걸로 가야함
                        String contentsId = sElem.attr("data-title-id");
                        bw.write("contentsId: "+contentsId);
                        bw.newLine();
                        bThumbnailURL=btemplateURL+contentsId;
                        path+=contentsId+"\\";// 컨텐츠 ID로된 폴더 생성
                       
                        
                        //해당 컨텐츠의 상세보기로 접근//
                        bDoc = Jsoup.connect(bThumbnailURL).get();
                        bElems = bDoc.select("div.title-info-synopsis");
                        //상영시간
                        bElems = bDoc.select(".item-runtime>.duration");
                        String runningTime = bElems.text();
                        //줄거리
                        String summary = bElems.text();
                        bElems = bDoc.select("div.title-info-metadata-wrapper>.item-genre");
                        //타입
                        String type = bElems.text();
                        //타입에 TV 또는 영화가 없는상황
                        if((!type.contains("TV"))&&(!type.contains("영화"))) {
                        	if(runningTime.contains("시즌")) {
                        		type="TV "+type;
                        	}
                        	else {
                        		type+=" 영화";
                        	}
                        }
                        //개봉일
                        bElems = bDoc.select("span.item-year");
                        String date = bElems.text();
                       
                        //출연배우
                        bElems = bDoc.select(".item-starring>.title-data-info-item-list");
                        String actor = bElems.text();
                        if(actor==null) {
                        	actor="";
                        }
                        //관람등급
                        bElems = bDoc.select(".maturity-number");
                        String age = bElems.text();
                        //제작자
                        bElems = bDoc.select(".item-creators>.title-data-info-item-list");
                        String producer = bElems.text();
                        //큰썸네일
                        bElems = bDoc.select("div.hero-image-desktop");
                        String[] bImgUrlAttr = bElems.attr("style").split("\"");
                        String bImgUrl = bImgUrlAttr[1];
                        bw.write("bImgUrl: "+bImgUrl);
                        bw.newLine();
                        //이미지 다운받고 저장하기
                        adminService.saveThumbnail(sImgUrl,bImgUrl,path,contentsId,title,summary,type,date,runningTime,actor,age,producer,genreCode,genreName); 
                        System.out.println((int)((++count/sElems.size())*100)+"% 완료");
                        System.out.println("count: "+count+" sElems.size() : "+sElems.size());
                        bw.write("==================================================");
                        bw.newLine();
                     }      
               }
               System.out.println(genreArr.length+"중"+(i+1)+"번째 장르 다운 끝");
               bw.write(genreArr.length+"중"+(i+1)+"번째 장르 다운 끝");
               bw.newLine();
               bw.newLine();
               bw.flush(); //버퍼의 내용을 파일에 쓰기
          } catch (IOException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }
      }
	}catch (Exception e) {
    		  e.printStackTrace();
	}
	return "contents/contentsUpdateAdminComplete";
	}   
   //관리자- 멤버관리 페이지
   @Secured("ROLE_ADMIN")
   @RequestMapping("adminControlMember.do")
   public String adminControlMember(Model model, String pageNo) {
	   MemberListVO memberListVO = memberService.sMemberAllList(pageNo);
	   model.addAttribute("MLVO", memberListVO);
	   return "admin/adminControlMember.tiles";
   }
// 관리자 전체 게시물 조회 페이지로 이동
   @Secured("ROLE_ADMIN")
   @RequestMapping("allPostForAdmin.do")
   public String allPostForAdmin(Model model) {
	   System.out.println("allPostForAdmin.do 실행");
	   // comments 리스트를 불러온다.
	   model.addAttribute("commentsList", commentsService.sCommentsGetList(null));
	   // review 리스트를 불러온다.
	   model.addAttribute("reviewList", reviewService.sGetReviewList(null));
	   // reportComments 리스트를 불러온다.
	   model.addAttribute("reportCommentsList", reportService.sGetReportCommentsList());
	   // 전체게시물조회 메인화면과 각 게시판에서 페이징과 버튼을 사용하지 않기 위해 사용한다.
	   model.addAttribute("forNotUsePagingAndBtn", true);
	   return "allPostForAdmin.tiles";	   
   }
	// 신고 리스트( 관리자페이지 )
	// ResponseBody는 비동기 통신에 필요한 어노테이션이다.
    @Secured("ROLE_ADMIN")
	@RequestMapping("reportBoardAdmin.do")
	@ResponseBody
	public ReportListVO reportBoardAdmin(String reportPageNo, boolean reportType) {
		System.out.println("reportBoardAdmin.do 실행");
		if(reportType) {
			return reportService.sGetReportCommentsList(reportPageNo);
		} else {
			return reportService.sGetReportReviewList(reportPageNo);
		}
	}
   
   //계정 정지 or 정지해제
	@Secured("ROLE_ADMIN")
	@RequestMapping("updateMemberStatus.do")
   public String updateMemberStatus(String id, int accstatus, String nowPage) {
	  String pageNo = nowPage;
	  if(pageNo == "") {
		  pageNo="1";
	  }
	   memberService.sMemberStatusUpdate(id,accstatus);
	   return "redirect:adminControlMember.do?pageNo="+pageNo;
   }
   //모든고객의 구매내역 조회
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminProductOrderList.do")
   public String adminProductOrderList(String pageNo,Model model) {
	   MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//모든 고객에 대한 구매내역 총건수
		int productOrderCount = productOrderService.sProductOrderCountForAll();
		PagingBean pagingBean;
		
		if(pageNo==null) {
			pagingBean = new PagingBean(productOrderCount);
		}
		else {
			pagingBean = new PagingBean(productOrderCount, Integer.parseInt(pageNo));
		}
		List<ProductOrderVO> list = productOrderService.sProductOrderForAllList(pagingBean);
		ProductOrderListVO polvo = new ProductOrderListVO(list, pagingBean);
		model.addAttribute("productOrderListVO",polvo);
		return "admin/adminProductOrderList.tiles";
   }
   
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminFaqList.do")
	public String adminFaqList(Model model,String pageNo) {
		model.addAttribute("faqListVO",faqService.sGetFaqList(pageNo));
		return "admin/adminFaqList.tiles";
	}
	
}
