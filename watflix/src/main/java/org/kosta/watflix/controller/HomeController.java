package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.ContentsListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {	
	
	@Resource
	ContentsService contentsService;
	
	@RequestMapping("home.do")
	public String home(Model model){
		int totalContents = contentsService.sGetTotalContentsCount();
		PagingBean pagingBean = new PagingBean(totalContents);
		ContentsListVO contentsListVO = contentsService.sGetAllContentsList(pagingBean);
		//컨테츠 리스트 출력
		model.addAttribute("contentsListVO",contentsListVO);
		//조회수 높은 컨텐츠 출력(1~10위)
		model.addAttribute("contentsHighHits",contentsService.sContentsHighHits());
		//평점 높은 컨텐츠 출력(1~10위)
		model.addAttribute("contentsHighAvgStars",contentsService.sContentsHighAvgStars());
		model.addAttribute("GetAllGenreList",contentsService.sGetAllGenreList());
		
		return "home.tiles";
	}	
	
	
}
