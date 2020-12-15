package org.kosta.watflix.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ContentsLikeService;
import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.service.ReviewLikeService;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.ContentsLikeVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {	
	
	@Resource
	ContentsService contentsService;
	@Resource
	ReviewService reviewService;
	@Resource
	ReviewLikeService reviewLikeService;
	@Resource
	ContentsLikeService contentsLikeService;
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
		
		
		//평점높은 컨텐츠
		model.addAttribute("highAgeStar",contentsService.sContentsHighAvgStars());
		
		//최다등록평점 컨텐츠
		model.addAttribute("highCommentsCount",contentsService.sContentsHighCommentsCount());
		
		//좋아요 유지를 위한 로그인 여부 체크
		MemberVO memberVO = new MemberVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(!(auth instanceof AnonymousAuthenticationToken)) {
			// 로그인 상태 System.out.println("로그인");
			memberVO=(MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			int result=-1;
//			String contNO="";
//			List<ContentsVO> list = contentsService.sGetAllContentsList();
//			for(int i=0 ; i< list.size() ; i++) {
//				contNO = list.get(i).getContentsNo();
//				result = contentsLikeService.sIsLike(memberVO.getId() , contNO);
//				list.get(i).setContentsLikeStatus(result);
//			}
//			model.addAttribute("contentsHighHits",list);	
			model.addAttribute("highHits",contentsService.sContentsHighHitsLogin(memberVO.getId()));
		}else {
			memberVO.setId("guest");//비로그인상태
			model.addAttribute("highHits",contentsService.sContentsHighHits());	
		}
		
		
//			model.addAttribute("sContentsHighHitsLogin",contentsService.sContentsHighHitsLogin());
		//평점 높은 컨텐츠 출력(1~10위)
		model.addAttribute("contentsHighAvgStars",contentsService.sContentsHighAvgStars());
		
		//영화 타입의 장르를 검색
		model.addAttribute("movieGenreList",contentsService.sGetGenreSelectForType("영화"));
		
		//컨텐츠 리스트 출력(홈화면에서 하위에 있는 전체리스트 출력)
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNumber", Integer.toString(0));
		map.put("endNumber", Integer.toString(10));
		map.put("contentsType", "영화");
		model.addAttribute("contentListForType",contentsService.sGetContentsAllForType(map));
		
		return "home.tiles";
	}
}
