package org.kosta.watflix.controller;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.kosta.watflix.model.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//jh
public class AdminController {
   
   @Resource
   AdminService adminService;
      
   @RequestMapping("contentsUpdateAdmin.do")
   public String updateContents() {
	  double count;
      String[] genreArr= {"1568","2638104"};
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

               //장르 DB에 저장하기
               if(adminService.findByGenreCode(genreCode)==null) {
                  adminService.genreRegister(genreCode,genreName);
                  bw.write(genreName+" 장르 저장완료");
                  bw.newLine();
                  System.out.println(genreName+" 장르 저장완료");
               }
               
               sElems = sDoc.select("img.nm-collections-title-img");
               for(int a=0;a<20;a++) {
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
                        //줄거리
                        String summary = bElems.text();
                        bElems = bDoc.select("div.title-info-metadata-wrapper>.item-genre");
                        //타입
                        String type = bElems.text();
                        //개봉일
                        bElems = bDoc.select("span.item-year");
                        String date = bElems.text();
                        //상영시간
                        bElems = bDoc.select(".item-runtime>.duration");
                        String runningTime = bElems.text();
                        //출연배우
                        bElems = bDoc.select(".item-starring>.title-data-info-item-list");
                        String actor = bElems.text();
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
}