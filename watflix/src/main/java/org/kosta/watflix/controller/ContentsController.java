package org.kosta.watflix.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.service.ContentsServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContentsController {
	
	@Resource
	ContentsService contentsService;
	
	@RequestMapping("update_contents_admin.do")
	public String updateContents() {
		//크롤링할 웹페이지 주소
		String URL = "https://www.netflix.com/kr/browse/genre/839338";
		Document doc;
        Elements elem;
        
        try {
			doc = Jsoup.connect(URL).get();
		     elem = doc.select(".nm-collections-title-img");
		     //이미지
	        String imgUrl = elem.attr("src");
	        //제목
	        String title =elem.attr("alt");
	        //컨텐츠id, //장르 ID는 해당 컨텐츠에 들어가야지만 수집가능함, 장르는 1개인걸로 가야함
	        String contentsId = elem.attr("data-title-id");
	       
	        //물리적인 프로젝트 경로
	        String path = "C:\\Users\\Mr.K\\Desktop\\공부&회사\\개발공부\\학원\\Spring\\실습2\\springmvcTest\\src\\main\\webapp\\resources\\contents\\";
	        path+=contentsId+"\\";// 최종 주소
	        contentsService.saveImage(imgUrl,path,title);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}
