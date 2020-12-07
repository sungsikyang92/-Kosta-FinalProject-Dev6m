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
		//컨테츠 리스트 출력
		model.addAttribute("contentsList",contentsList);
		//랜덤함수
		//int random = new Random().nextInt(contentsList.size()-5);
	//	model.addAttribute("randomIndex",random);
		//조회수 높은 컨텐츠 출력(1~10위)
		model.addAttribute("contentsHighHits",contentsService.sContentsHighHits());
		//평점 높은 컨텐츠 출력(1~10위)
		model.addAttribute("contentsHighAvgStars",contentsService.sContentsHighAvgStars());
		model.addAttribute("GetAllGenreList",contentsService.sGetAllGenreList());
		
		//
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNumber", Integer.toString(0));
		map.put("endNumber", Integer.toString(10));
		map.put("contentsType", "액션 & 어드벤처");
		model.addAttribute("contentListForType",contentsService.sGetContentsAllForType(map));
		
		return "home.tiles";
	}
	
	@RequestMapping("getContentsAllForType.do")
	@ResponseBody
	public List<ContentsVO> getContentsAllForType(String pageNo,String contentsType) {
		Map<String, String> map = new HashMap<String, String>();
		int totalContentsCountForType = contentsService.sGetTotalContentsCountForType(contentsType);
		int startNumber = (5*(Integer.parseInt(pageNo)-1));
		int endNumber = (5*Integer.parseInt(pageNo));
		if(endNumber>totalContentsCountForType) {
			endNumber = totalContentsCountForType;
		}
		System.out.println(contentsType);
		map.put("startNumber", Integer.toString(startNumber));
		map.put("endNumber", Integer.toString(endNumber));
		map.put("contentsType", contentsType);
		return contentsService.sGetContentsAllForType(map);
	}
}
