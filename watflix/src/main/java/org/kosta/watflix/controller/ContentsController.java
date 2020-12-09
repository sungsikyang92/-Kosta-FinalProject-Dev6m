package org.kosta.watflix.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.GenreVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContentsController {

	@Resource
	ContentsService contentsService;
	@Resource
	ReviewService reviewService;
	@Resource
	CommentsService commentsService;
	
	@RequestMapping("contentsDetail.do")
	public String ContentsDetail(Model model, ContentsVO contentsVO, String commentsPageNo, String reviewPageNo) {
		//CommentsListByContentsNo in ContentsDetail
		model.addAttribute("contentsVO", contentsService.sFindContentsByNo(contentsVO.getContentsNo()));
		model.addAttribute("commentsListByContentsNo", commentsService.sCommentsGetListByContentsNo(commentsPageNo, contentsVO.getContentsNo()));
		//ReviewListByContentsNo in ContentsDetail
		model.addAttribute("reviewListByContentsNo",reviewService.sGetReviewListByContentsNo(reviewPageNo, contentsVO.getContentsNo()));
		model.addAttribute("contentsNo", contentsVO.getContentsNo());
		return "c_commentsList_reviewList.tiles";
	}
	
	//영화카테고리 페이지
	@RequestMapping("contentsByMovie.do")
	public String contentsByMovie(Model model) {
		//네비바를 위한것
		model.addAttribute("navBarTab","MOVIE");
		model.addAttribute("contentsList",contentsService.sGetContentsSelectForType("영화"));
		model.addAttribute("genreList",contentsService.sGetGenreSelectForType("영화"));
		
		return "contents/contentsByMovie.tiles";
	}
	
	//TV카테고리 페이지
	@RequestMapping("contentsByTV.do")
	public String contentsByTV(Model model) {
		//네비바를 위한것
		model.addAttribute("navBarTab","TV");
		model.addAttribute("contentsList",contentsService.sGetContentsSelectForType("TV"));
		model.addAttribute("genreList",contentsService.sGetGenreSelectForType("TV"));
		
		return "contents/contentsByTV.tiles";
	}
	
	//장르 & 타입별 컨텐츠 리스트
	@RequestMapping("getContentsAllForTypeAndGenre.do")
	@ResponseBody
	public List<ContentsVO> getContentsAllForTypeAndGenre(Model model,String pageNo,String contentsType,String genreCode) {
		Map<String, String> map = new HashMap<String, String>();
		int startNumber,endNumber;
		startNumber = (5*(Integer.parseInt(pageNo)-1));
		endNumber = (5*Integer.parseInt(pageNo)-1);

		map.put("startNumber", Integer.toString(startNumber));
		map.put("endNumber", Integer.toString(endNumber));
		map.put("contentsType", contentsType);
		map.put("genreCode", genreCode);
		return contentsService.sGetContentsAllForTypeAndGenre(map);
	}
	//타입 전체 컨텐츠 리스트
	@RequestMapping("getContentsAllForType.do")
	@ResponseBody
	public List<ContentsVO> getContentsAllForType(String pageNo,String contentsType) {
		Map<String, String> map = new HashMap<String, String>();
		int totalContentsCountForType = contentsService.sGetTotalContentsCountForType(contentsType);
		int startNumber = (5*(Integer.parseInt(pageNo)-1));
		int endNumber = (5*Integer.parseInt(pageNo)-1);
		if(endNumber>totalContentsCountForType) {
			endNumber = totalContentsCountForType;
		}
		map.put("startNumber", Integer.toString(startNumber));
		map.put("endNumber", Integer.toString(endNumber));
		map.put("contentsType", contentsType);
		return contentsService.sGetContentsAllForType(map);
	}
	//타입별 장르가져오기
	@ResponseBody
	@RequestMapping("getGenreSelectForType.do")
	public List<GenreVO> getGenreSelectForType(String contentsType){
		//타입에 따른 장르를 검색
		return contentsService.sGetGenreSelectForType(contentsType);
	}
	
}
