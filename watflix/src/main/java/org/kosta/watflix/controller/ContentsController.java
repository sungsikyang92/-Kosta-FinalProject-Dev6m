package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.ContentsVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView ContentsDetail(ContentsVO contentsVO, String commentsPageNo, String reviewPageNo) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("contents/contents_detail.tiles");
		modelAndView.addObject("contentsVO", contentsService.sFindContentsByNo(contentsVO.getContentsNo()));
		modelAndView.addObject("contentsNo", contentsVO.getContentsNo());
		
		if(commentsPageNo==null)
			commentsPageNo = "1"; 
		
		if(reviewPageNo==null)
			reviewPageNo = "1";
		
		if(commentsPageNo!=null) {
			modelAndView.addObject("commentsListByContentsNo", commentsService.sCommentsGetListByContentsNo(commentsPageNo, contentsVO.getContentsNo()));
		} 
		if(reviewPageNo!=null) {
			modelAndView.addObject("lvo", reviewService.sGetReviewList(reviewPageNo));
		}
		System.out.println(contentsVO.getContentsNo());
		return modelAndView;
	}
	
	@RequestMapping("contentsByMovie.do")
	public String contentsByMovie(Model model) {
		model.addAttribute("contentsList",contentsService.sGetContentsSelectForType("영화"));
		model.addAttribute("genre",contentsService.sGetAllGenreList());
		return "contents/contentsByMovie.tiles";
	}
}
