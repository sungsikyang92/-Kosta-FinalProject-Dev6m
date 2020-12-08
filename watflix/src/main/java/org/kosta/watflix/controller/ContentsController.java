package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.ContentsVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContentsController {

	@Resource
	ContentsService contentsService;
	@Resource
	ReviewService reviewService;
	
	@RequestMapping("contentsDetail.do")
	public String ContentsDetail(Model model, ContentsVO contentsVO, String pageNo) {
		//콘텐츠불러오기
		model.addAttribute("contentsVO", contentsService.sFindContentsByNo(contentsVO.getContentsNo()));
		//콘텐츠리뷰리스트
		model.addAttribute("reviewListByContentsNo",reviewService.sGetReviewListByContentsNo(pageNo, contentsVO.getContentsNo()));
		model.addAttribute("contentsNo", contentsVO.getContentsNo());
		return "contentsDetail_reviewList.tiles";
	}
}
