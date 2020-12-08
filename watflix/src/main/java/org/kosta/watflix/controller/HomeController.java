package org.kosta.watflix.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.ContentsListVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {	
	
	@Resource
	ContentsService contentsService;
	
	@RequestMapping("home.do")
	public String home(Model model){
		List<ContentsVO> contentsList = contentsService.sGetAllContentsList();
		//네비바를 위한것
		model.addAttribute("navBarTab","HOME");
		//컨테츠 리스트 출력(홈화면에서 상위 슬라이드를 위한것)
		model.addAttribute("contentsList",contentsList);
		//랜덤함수(홈화면에서 상위 슬라이드에 랜덤으로 컨텐츠를 보여주기 위함)
		int random = new Random().nextInt(contentsList.size()-5);
		model.addAttribute("randomIndex",random);
		//조회수 높은 컨텐츠 출력(1~10위)
		model.addAttribute("contentsHighHits",contentsService.sContentsHighHits());
		
		//평점 높은 컨텐츠 출력(1~10위)
		model.addAttribute("contentsHighAvgStars",contentsService.sContentsHighAvgStars());
		
		//영화 타입의 장르를 검색
		model.addAttribute("movieGenreList",contentsService.sGetGenreSelectForType("영화"));
		
		//컨텐츠 리스트 출력(홈화면에서 하위에 있는 전체리스트 출력
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNumber", Integer.toString(0));
		map.put("endNumber", Integer.toString(10));
		map.put("contentsType", "영화");
		model.addAttribute("contentListForType",contentsService.sGetContentsAllForType(map));
		
		return "home.tiles";
	}
	
	@RequestMapping("getContentsAllForType.do")
	@ResponseBody
	public List<ContentsVO> getContentsAllForType(String pageNo,String contentsType) {
		Map<String, String> map = new HashMap<String, String>();
		int totalContentsCountForType = contentsService.sGetTotalContentsCountForType(contentsType);
		int startNumber = (5*(Integer.parseInt(pageNo)-1));
		int endNumber = (5*Integer.parseInt(pageNo)-1);
		System.out.println(startNumber+" "+endNumber);
		if(endNumber>totalContentsCountForType) {
			endNumber = totalContentsCountForType;
		}
		map.put("startNumber", Integer.toString(startNumber));
		map.put("endNumber", Integer.toString(endNumber));
		map.put("contentsType", contentsType);
		return contentsService.sGetContentsAllForType(map);
	}
}
