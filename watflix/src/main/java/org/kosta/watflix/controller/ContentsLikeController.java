package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ContentsLikeService;
import org.kosta.watflix.model.vo.ContentsLikeVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ContentsLikeController {
	@Resource
	ContentsLikeService contentsLikeService;
	//컨텐츠좋아요
	@Secured("ROLE_MEMBER")
	@RequestMapping("contentsLikeExist.do")
	@ResponseBody
	public int contentsLikeExsit(String contentsNo) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ContentsLikeVO contentsLikeVO = new ContentsLikeVO();
		ContentsVO contentsVO = new ContentsVO();
		contentsVO.setContentsNo(contentsNo);
		contentsLikeVO.setContentsVO(contentsVO);
		contentsLikeVO.setMemberVO(memberVO);
		return contentsLikeService.sContentsLikeExist(contentsLikeVO);
		
	}
}
