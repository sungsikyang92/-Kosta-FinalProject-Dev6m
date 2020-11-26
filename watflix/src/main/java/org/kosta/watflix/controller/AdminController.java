package org.kosta.watflix.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.kosta.watflix.model.service.AdminService;
import org.kosta.watflix.model.service.AdminServiceImpl;
import org.kosta.watflix.model.vo.ContentsVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@Resource
	AdminService adminService;
	
	@RequestMapping("contentsUpdateAdmin.do")
	public String updateContents() {
		String[] genreArr= {"1568","9994"};
		//크롤링할 웹페이지 주소
		String stemplateURL = "https://www.netflix.com/kr/browse/genre/";
		String btemplateURL = "https://www.netflix.com/kr/title/";	//게시물 상세보기 관련 URL
		String sThumbnailURL;
		String bThumbnailURL;
		String path; //사진을 저장할 물리적인 장소
		Document sDoc,bDoc;
        Elements sElems,bElems;
        for(int i=0; i<genreArr.length;i++) {
        	try {
        		sThumbnailURL=stemplateURL+genreArr[i];
            	sDoc = Jsoup.connect(sThumbnailURL).get();
            	sElems = sDoc.select("h1.nm-collections-header-name");
            	String genreName = sElems.text();
            	String genreCode=genreArr[i];
            	
            	//장르 DB에 저장하기
            	if(adminService.findByGenreCode(genreCode)==null) {
            		adminService.genreRegister(genreCode,genreName);
                	System.out.println(genreName+" 장르 저장완료");
            	}
            	
            	sElems = sDoc.select("img.nm-collections-title-img");
    		     for(Element sElem:sElems) {
    		    	 path="C:\\kosta203\\FinalProject\\watflix\\src\\main\\webapp\\resources\\contents\\"; //사진을 저장할 물리적인 장소
    		    	  //이미지
    			        String sImgUrl = sElem.attr("src");
    			        if(sImgUrl.startsWith("http")) {
    			        	//제목
    				        String title=sElem.attr("alt");
    				        //컨텐츠id, //장르 ID는 해당 컨텐츠에 들어가야지만 수집가능함, 장르는 1개인걸로 가야함
    				        String contentsId = sElem.attr("data-title-id");
    				        bThumbnailURL=btemplateURL+contentsId;
    				        path+=contentsId+"\\";// 컨텐츠 ID로된 폴더 생성
    				       
    				        
    				        //해당 컨텐츠의 상세보기로 접근//
    				        bDoc = Jsoup.connect(bThumbnailURL).get();
    				        bElems = bDoc.select("div.title-info-synopsis");
    				        //줄거리
    				        String summary = bElems.text();
    				        bElems = bDoc.select("a.item-genre");
    				        //타입
    				        String type = bElems.text();
    				        //큰썸네일
    				        bElems = bDoc.select("div.hero-image-desktop");
    				        String[] bImgUrlAttr = bElems.attr("style").split("\"");
    				        String bImgUrl = bImgUrlAttr[1];
    				        
    				        //이미지 다운받고 저장하기
    				        adminService.saveThumbnail(sImgUrl,bImgUrl,path,contentsId,title,summary,type,genreCode,genreName);  
    				        
    				        
    			        }		
    		     }
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        }
        
		return "contents/contentsUpdateAdminComplete.jsp";
	}
}
