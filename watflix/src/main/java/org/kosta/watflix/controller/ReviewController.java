package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	@Resource
	private ReviewService reviewService;
	//리뷰 리스트
	@RequestMapping("reviewList.do")
	public String list(Model model,String pageNo) {
		model.addAttribute("lvo",reviewService.sGetReviewList(pageNo));
		return "review/review_list";
	}
	
}
