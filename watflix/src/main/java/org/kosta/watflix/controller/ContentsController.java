package org.kosta.watflix.controller;

import java.util.ArrayList;
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
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
	public String ContentsDetail(Model model, ContentsVO contentsVO, String commentsPageNo, String reviewPageNo, String countComments) {
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
	public List<ContentsVO> getContentsAllForTypeAndGenre(Model model,String pageNo,String contentsType,String genreCode,String sortType) {
		Map<String, String> map = new HashMap<String, String>();
		List<ContentsVO> list = new ArrayList<ContentsVO>();
		MemberVO memberVO = new MemberVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		int startNumber = (5*(Integer.parseInt(pageNo)-1)+1);
		int endNumber = (5*Integer.parseInt(pageNo));
		map.put("startNumber", Integer.toString(startNumber));
		map.put("endNumber", Integer.toString(endNumber));
		map.put("contentsType", contentsType);
		map.put("genreCode", genreCode);
		//로그인된 경우
		if(!(auth instanceof AnonymousAuthenticationToken)) {
			memberVO=(MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(sortType.equals("New")) {
				list = contentsService.sGetAllContentsForGenreListSortByNewLogin(map,memberVO.getId());
			}
			else if(sortType.equals("Old")) {
				list = contentsService.sGetAllContentsForGenreListSortByOldLogin(map,memberVO.getId());
			}
			else {
				list = contentsService.sGetContentsAllForTypeAndGenreLogin(map,memberVO.getId());
			}
		}
		//비로그인인 경우
		else {
			if(sortType.equals("New")) {
				list = contentsService.sGetAllContentsForGenreListSortByNew(map);
			}
			else if(sortType.equals("Old")) {
				list = contentsService.sGetAllContentsForGenreListSortByOld(map);
			}
			else {
				list = contentsService.sGetContentsAllForTypeAndGenre(map);
			}
		}
		
		
		return list;
	}
	
	//정렬기준에 따른 컨텐츠리스트
	@ResponseBody
	@RequestMapping("sortingContents.do")
	public List<ContentsVO> test(String sortType,String contentsType, String pageNo) {
		
		Map<String, String> map = new HashMap<String, String>();
		List<ContentsVO> list = new ArrayList<ContentsVO>();
		MemberVO memberVO = new MemberVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		int startNumber = (5*(Integer.parseInt(pageNo)-1)+1);
		int endNumber = (5*Integer.parseInt(pageNo));
		
		map.put("startNumber", Integer.toString(startNumber));
		map.put("endNumber", Integer.toString(endNumber));
		map.put("contentsType", contentsType);
		
		//로그인된 경우
		if(!(auth instanceof AnonymousAuthenticationToken)) {
			memberVO=(MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(sortType.equals("New")) {
				list = contentsService.sGetAllContentsListSortByNewLogin(map,memberVO.getId());
			}
			else if(sortType.equals("Old")) {
				list = contentsService.sGetAllContentsListSortByOldLogin(map,memberVO.getId());
			}
			else {
				list = contentsService.sGetContentsAllForTypeLogin(map,memberVO.getId());
			}
		}
		//비로그인인 경우
		else {
			if(sortType.equals("New")) {
				list = contentsService.sGetAllContentsListSortByNew(map);
			}
			else if(sortType.equals("Old")) {
				list = contentsService.sGetAllContentsListSortByOld(map);
			}
			else {
				list = contentsService.sGetContentsAllForType(map);
			}
		}
		return list;
	}	
	
	//타입별 장르가져오기
	@ResponseBody
	@RequestMapping("getGenreSelectForType.do")
	public List<GenreVO> getGenreSelectForType(String contentsType){
		//타입에 따른 장르를 검색
		return contentsService.sGetGenreSelectForType(contentsType);
	}
	
	//컨텐츠 검색
	@RequestMapping("contentsByTitle.do")
	public String contentsByTitle(Model model, String contentsTitle) {
		model.addAttribute("contentsList",contentsService.sGetContentsSelectForTitle(contentsTitle));
		model.addAttribute("genreList",contentsService.sGenreSelectForTitle(contentsTitle));
		if(contentsTitle.length() < 2) {
			model.addAttribute("titleLength", contentsTitle);
		}
		return "contents/contentsByTitle.tiles";
	}
	
	//인기컨텐츠
	@RequestMapping("getContentsHighHitsList.do")
	@ResponseBody
	public List<ContentsVO> getContentsHighHitsList(){
		List<ContentsVO> list = new ArrayList<ContentsVO>();
		MemberVO memberVO = new MemberVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		//로그인된 경우
		if(!(auth instanceof AnonymousAuthenticationToken)) {
			memberVO=(MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			list = contentsService.sContentsHighHitsLogin(memberVO.getId());
		}
		//비로그인인 경우
		else {
			list = contentsService.sContentsHighHits();
		}
		return list;
		
	}
	//평점높은컨텐츠
	@RequestMapping("getContentsHighAvgStarsList.do")
	@ResponseBody
	public List<ContentsVO> getContentsHighAvgStarsList(){
		List<ContentsVO> list = new ArrayList<ContentsVO>();
		MemberVO memberVO = new MemberVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		//로그인된 경우
		if(!(auth instanceof AnonymousAuthenticationToken)) {
			memberVO=(MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			list = contentsService.sContentsHighAvgStarsLogin(memberVO.getId());
		}
		//비로그인인 경우
		else {
			list = contentsService.sContentsHighAvgStars();
		}
		return list;
		
	}
	//최다등록평점컨텐츠
	@RequestMapping("getContentsHighCommentsCountList.do")
	@ResponseBody
	public List<ContentsVO> getContentsHighCommentsCountList(){
		List<ContentsVO> list = new ArrayList<ContentsVO>();
		MemberVO memberVO = new MemberVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		//로그인된 경우
		if(!(auth instanceof AnonymousAuthenticationToken)) {
			memberVO=(MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			list = contentsService.sContentsHighCommentsCountLogin(memberVO.getId());
		}
		//비로그인인 경우
		else {
			list = contentsService.sContentsHighCommentsCount();
		}
		return list;
		
	}
}
