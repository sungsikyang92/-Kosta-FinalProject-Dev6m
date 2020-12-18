package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.MemberService;
import org.kosta.watflix.model.service.PointHistoryService;
import org.kosta.watflix.model.service.ReviewLikeService;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
	@Resource
	PointHistoryService pointHistoryService;
	@Resource
	MemberService memberService;
	//콘텐츠리뷰리스트
	@Secured("ROLE_ADMIN")
	@RequestMapping("reviewList.do")
	public String getReviewList(String pageNo, Model model) {
		model.addAttribute("reviewList",reviewService.sGetReviewList(pageNo));
		// 전체게시물조회 메인화면과 각 게시판에서 페이징과 버튼을 사용하지 않기 위해 사용한다.
		model.addAttribute("forNotUsePagingAndBtn", false);
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
	@Transactional
	@PostMapping("reviewWrite.do")
	public String reviewWrite(ReviewVO reviewVO, ContentsVO contentsVO ,RedirectAttributes ra) {
	MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	int point = memberVO.getPoint();
	memberVO.setPoint(point+15);
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
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
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
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
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
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String contentsNoforDelete=reviewService.sGetReviewDetailNoHits(memberVO.getId(),reviewNo).getContentsVO().getContentsNo();
		reviewService.sReviewDelete(reviewNo);
		System.out.println(reviewNo);
		return "redirect:contentsDetail.do?contentsNo="+contentsNoforDelete;
	}
	
	//관리자 리뷰 삭제
	@PostMapping("adminReviewDelete.do")
	public String adminReviewDelete(int reviewNo) {
		reviewService.sReviewDelete(reviewNo);
		return "report/report_ok";
	}
	
	//관리자 리뷰 상세보기 popup 창 띄우기
	@RequestMapping("reviewByReviewNo.do")
	public ModelAndView reviewByReviewNo(int reviewNo) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return new ModelAndView("report/reviewByReviewNo","rdvo",reviewService.sGetReviewDetailNoHits(memberVO.getId(),reviewNo));
	}
	
	//해당 컨텐츠에 접속한 유저의 아이디로 작성된 review가 있는지 확인
	@Secured("ROLE_MEMBER")
	@RequestMapping("checkReviewExist.do")
	@ResponseBody
	public int checkReviewExist(String reviewNo) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = memberVO.getId();
		//유저가 작성한 리뷰가 존재할 경우 0 이상의 값을 받는다.
		return reviewService.sCheckReviewExist(id, reviewNo);
	}
}




