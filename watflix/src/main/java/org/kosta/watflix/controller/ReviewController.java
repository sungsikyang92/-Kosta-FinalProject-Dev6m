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
	@RequestMapping
	public String list(Model model,int reviewNo) {
		model.addattribute("",reviewService.sGetReviewList(pagingBean));
		return "review/list";
	}
	
}
//	@RequestMapping("list.do")
//public ModelAndView list(String pageNo) {
//	return new ModelAndView("board/list","lvo",boardService.getPostList(pageNo));
//}
@RequestMapping("list.do")
public String list(Model model,String pageNo) {
	model.addAttribute("lvo", boardService.getPostList(pageNo));
	return "board/list";
}