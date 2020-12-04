package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ReviewController {
	@Resource
	private ReviewService reviewService;
	//리뷰 리스트
	@RequestMapping("reviewList.do")
	public String reviewList(Model model,String pageNo) {
		model.addAttribute("lvo",reviewService.sGetReviewList(pageNo));
		return "review/reviewList";
	}
	//리뷰 작성 폼(세션 추가 해야 합니다. 현재 페이지 이동만 됨.)
	@RequestMapping("reviewWriteForm.do")
	public String reviewWriteForm() {
		return "review/reviewWriteForm";
	}
	
	//리뷰 작성 submit(세션 추가 해야 합니다.)
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
	return "redirect:reviewDetailNoHits.do";
	}
	
	//리뷰 상세보기(조회수 증가X, 세션추가 불필요?)
	//그러나 조회수가 증가 되지 않는 컨트롤러 메서드이다. (자기자신이 자기글 디테일 보는 경우이다)
	//리뷰 작성 후 자신의 글 확인, 혹은 리뷰 수정 후 확인하는 용도이다. 
	@RequestMapping("reviewDetailNoHits.do")
	public ModelAndView reviewDetailNoHits(int reviewNo) {
		return new ModelAndView("review/reviewDetail","rdvo",reviewService.sGetReviewDetailNoHits(reviewNo));
	}
	
	//리뷰 상세보기(조회수 증가O, 세션 추가 필요함.)
	//작성 후 혹은 수정 후가 아니라 리스트에서 눌러서 들어온 경우로 조회수가 증가한다.
	//그러나 이미 조회한 리뷰인 경우에 한해서 조회수가 증가하지 않도록 한다.
	@RequestMapping("reviewDetail.do")
	public String reviewDetail(int reviewNo, RedirectAttributes rd) {
		reviewService.sReviewHitsUpdate(reviewNo);
		rd.addAttribute("reviewNo",reviewNo);
		return "redirect:reviewDetailNoHits.do";
	}
	
	//리뷰 업데이트폼 이동(세션 추가 필요함)
	@RequestMapping("reviewUpdateForm.do")
	public ModelAndView reviewUpdateForm(int reviewNo) {
		return new ModelAndView("review/reviewUpdateForm","ru",reviewService.sGetReviewDetailNoHits(reviewNo));
	}
	
	//리뷰 업데이트(세션 추가 필요함)
	@PostMapping("reviewUpdate.do")
	public ModelAndView reviewUpdate(ReviewVO reviewVO) {
		reviewService.sReviewUpdate(reviewVO);
		return new ModelAndView("redirect:reviewDetailNoHits.do?reviewNo="+reviewVO.getReviewNo());
	}
}

