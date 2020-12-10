package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ReviewLikeService;
import org.kosta.watflix.model.vo.ReviewLikeVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReviewLikeController {
	@Resource
	ReviewLikeService reviewLikeService;
	//리뷰좋아요++
	@Secured("ROLE_MEMBER")
	@RequestMapping("reviewLikeAdd.do")
	@ResponseBody
	public String reviewLikeAdd(int reviewNo, String id, Model model) {
		ReviewLikeVO reviewLikeVO = new ReviewLikeVO();
		
		model.addAttribute("reviewLikeAdd",reviewLikeService.sReviewLikeAdd(reviewLikeVO));
		return 
	}
	
	
	
	
}
