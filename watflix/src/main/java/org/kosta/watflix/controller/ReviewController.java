package org.kosta.watflix.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ReviewLikeService;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ReviewController {
	@Resource
	private ReviewService reviewService;
	@Resource
	ReviewLikeService reviewLikeService;
	//콘텐츠리뷰리스트
	@Secured("ROLE_ADMIN")
	@RequestMapping("reviewList.do")
	public String getReviewList(String pageNo, Model model) {
		model.addAttribute("reviewList",reviewService.sGetReviewList(pageNo));
		return "admin/adminReviewList.tiles";
	}
	//컨텐츠별 리뷰리스트
	@RequestMapping("getReviewListByContentsNo.do")
	public String getReviewListByContentsNo(String contentsNo, String pageNo, Model model) {
		model.addAttribute("reviewListByContentsNo", reviewService.sGetReviewListByContentsNo(pageNo, contentsNo));
		model.addAttribute("contentsNo", contentsNo);
		return "review/reviewListByContentsNo";
	}
	
	
	//리뷰 작성 폼(세션 추가 해야 합니다. 현재 페이지 이동만 됨.)
	@Secured("ROLE_MEMBER")
	@RequestMapping("reviewWriteForm.do")
	public String reviewWriteForm(String contentsNo, Model model) {
		//컨텐츠넘버를 넘겨서 리뷰작성과 리스트로돌아갈때 사용하기 위해 추가하였다. 
		model.addAttribute("contentsNo", contentsNo);
		return "review/reviewWriteForm.tiles";
	}
	
	//리뷰 작성 submit(세션 추가 해야 합니다.)
	@Secured("ROLE_MEMBER")
	@PostMapping("reviewWrite.do")
	public String reviewWrite(ReviewVO reviewVO, ContentsVO contentsVO ,RedirectAttributes ra) {
	//System.out.println(contentsVO.getContentsNo()); //컨텐츠넘버 불러오는지 확인을위한것
	
		//아래의 1번 문장은 시큐리티를 통해서 세션을 가져와서 MemberVO값을 가져온다.
	//1.SecurityContextHolder.getContext().getAuthentication().getPrincipal() : (MemberVO)다운캐스팅 USERVO .
	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	MemberVO memberVO = (MemberVO)principal;
	//System.out.println(memberVO.getId());		// MemberVO에서 Id 잘 불러오는지 확인을 위한것
	//2.reviewVo.setMemberVO(다운캐스팅한거넣으라고?);
		reviewVO.setMemberVO(memberVO);
		reviewVO.setContentsVO(contentsVO);
		reviewService.sReviewWrite(reviewVO);
	ra.addAttribute("reviewNo",reviewVO.getReviewNo());
	reviewService.sGetReviewDetailNoHits(memberVO.getId(),reviewVO.getReviewNo());
	return "redirect:reviewDetailNoHits.do";
	}
	
	//리뷰 상세보기(조회수 증가X, 세션추가 불필요?)
	//그러나 조회수가 증가 되지 않는 컨트롤러 메서드이다. (자기자신이 자기글 디테일 보는 경우이다)
	//리뷰 작성 후 자신의 글 확인, 혹은 리뷰 수정 후 확인하는 용도이다.
	@Secured("ROLE_MEMBER")
	@RequestMapping("reviewDetailNoHits.do")
	public String reviewDetailNoHits(int reviewNo,Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberVO = (MemberVO)principal;
		ReviewVO reviewVO = reviewService.sGetReviewDetailNoHits(memberVO.getId(),reviewNo);
		model.addAttribute("rdvo",reviewVO);
		return "review/reviewDetail.tiles";
	}
	
	//리뷰 상세보기(조회수 증가O, 세션 추가 필요함.)
	//작성 후 혹은 수정 후가 아니라 리스트에서 눌러서 들어온 경우로 조회수가 증가한다.
	//그러나 이미 조회한 리뷰인 경우에 한해서 조회수가 증가하지 않도록 한다.
	@Secured("ROLE_MEMBER")
	@RequestMapping("reviewDetail.do")
	public String reviewDetail(int reviewNo, RedirectAttributes rd) {
		reviewService.sReviewHitsUpdate(reviewNo);
		rd.addAttribute("reviewNo",reviewNo);
		return "redirect:reviewDetailNoHits.do";
	}
	
	//리뷰 업데이트폼 이동(세션 추가 필요함)
	@Secured("ROLE_MEMBER")
	@RequestMapping("reviewUpdateForm.do")
	public ModelAndView reviewUpdateForm(int reviewNo) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberVO = (MemberVO)principal;
		return new ModelAndView("review/reviewUpdateForm.tiles","ru",reviewService.sGetReviewDetailNoHits(memberVO.getId(),reviewNo));
	}
	
	//리뷰 업데이트(세션 추가 필요함)
	@Secured("ROLE_MEMBER")
	@PostMapping("reviewUpdate.do")
	public ModelAndView reviewUpdate(ReviewVO reviewVO) {
		reviewService.sReviewUpdate(reviewVO);
		return new ModelAndView("redirect:reviewDetailNoHits.do?reviewNo="+reviewVO.getReviewNo());
	}
	
	//리뷰 삭제기능
	@Secured("ROLE_MEMBER")
	@PostMapping("reviewDelete.do")
	public String reviewDelete(int reviewNo) {
		//변수에 컨텐츠넘버 담기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberVO = (MemberVO)principal;
		String contentsNoforDelete=reviewService.sGetReviewDetailNoHits(memberVO.getId(),reviewNo).getContentsVO().getContentsNo();
		reviewService.sReviewDelete(reviewNo);
		//"redirect:contentsDetail.do? 컨텐츠넘버주기
		return "redirect:contentsDetail.do?contentsNo="+contentsNoforDelete;
	}
	
	// 내 리뷰 리스트 Ajax
	@RequestMapping("myReviewList.do")
	@ResponseBody
	public ReviewListVO myReviewList(String pageNo) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return reviewService.sGetMyReviewList(mvo.getId(), pageNo);
	}
	
}




