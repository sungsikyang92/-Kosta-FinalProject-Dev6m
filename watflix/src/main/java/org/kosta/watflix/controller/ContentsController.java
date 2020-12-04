package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.vo.ContentsVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContentsController {

	@Resource
	ContentsService contentsService;
	
	@RequestMapping("contentsDetail.do")
	public ModelAndView ContentsDetail(ContentsVO contentsVO) {
		System.out.println(contentsVO.getContentsNo());
		return new ModelAndView("contents/contents_detail.tiles", "contentsVO",contentsService.sFindContentsByNo(contentsVO.getContentsNo()));
	}
}
