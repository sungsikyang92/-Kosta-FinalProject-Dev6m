package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ReviewLikeService;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewLikeVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReviewLikeController {
	@Resource
	ReviewLikeService reviewLikeService;
	//리뷰좋아요
	@Secured("ROLE_MEMBER")
	@RequestMapping("reviewLikeExist.do")
	@ResponseBody
	public int reviewLikeExist(int reviewNo) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ReviewLikeVO reviewLikeVO = new ReviewLikeVO();
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setReviewNo(reviewNo);
		reviewLikeVO.setReviewVO(reviewVO);
		reviewLikeVO.setMemberVO(memberVO);
		return reviewLikeService.sReviewLikeExist(reviewLikeVO); 
	}
}
