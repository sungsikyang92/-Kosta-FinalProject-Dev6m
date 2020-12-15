package org.kosta.watflix.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.service.MemberService;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.service.PointHistoryService;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.PointHistoryListVO;
import org.kosta.watflix.model.vo.PointHistoryVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Resource
	MemberService memberService;
	
	@Resource
	ReviewService reviewService;
	
	@Resource
	PointHistoryService pointHistoryService;
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "loginForm.tiles";
	}
	
	//로그인 실패
	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login_fail";
	}
	
	//로그인 후 안내페이지
	@RequestMapping("login_result.do")
	public String login() {
		return "member/login_result";
	}
	
	//로그아웃 후 안내페이지
	@RequestMapping("logout_result.do")
	public String logout() {
		return "member/logout_result";
	}
	//회원가입폼(이용약관) 이동
	@RequestMapping("memberRegisterFormTerms.do")
	public String memberRegisterFormTerms(){
		return "member/registerFormTerms.tiles";
	}
	//회원가입폼 이동
	@RequestMapping("memberRegisterForm.do")
	public String memberRegisterForm(String IsSelect, Model model){
		//마케팅 수신동의 여부
		model.addAttribute("ISselectMarketing",IsSelect);
		return "member/registerForm.tiles";
	}
	//회원가입
	@PostMapping("memberRegister.do")
	public String memberRegister(MemberVO memberVO){
		System.out.println(memberVO.getAddress());
		memberService.sMemberRegister(memberVO);
		return "redirect:memberRegister_result.do?id="+memberVO.getId();
	}
	//회원가입 후 안내페이지
	@RequestMapping("memberRegister_result.do")
	public String memberRegisterResult(MemberVO memberVO,Model model) {
		model.addAttribute("id",memberVO.getId());
		return "member/memberRegister_result";
	}
	//아이디 중복체크
	@ResponseBody
	@PostMapping("memberIdCheck.do")
	public String memberIdCheck(String id) {
		return memberService.idcheck(id);
	}
	
	//회원정보수정폼으로 이동
	@Secured("ROLE_MEMBER")
	@RequestMapping("memberUpdateForm.do")
	public String memberUpdateForm() {
		return "member/updateForm.tiles";
	}
	
	//회원정보 수정
	@Secured("ROLE_MEMBER")
	@PostMapping("memberUpdate.do")
	public String memberUpdate(MemberVO memberVO) {
		memberService.sMemberUpdate(memberVO);
		//System.out.println(memberVO.getAddress());
		//System.out.println(memberVO.getAgreement());
		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		pvo.setPassword(memberVO.getPassword());
		pvo.setName(memberVO.getName());
		pvo.setTel(memberVO.getTel());
		pvo.setEmail(memberVO.getEmail());
		pvo.setAddress(memberVO.getAddress());
		pvo.setAgreement(memberVO.getAgreement());
		pvo.setSex(memberVO.getSex());
		pvo.setBirth(memberVO.getBirth());
		return "redirect:update_result.do?id="+memberVO.getId();
	}
	//회원정보 수정 결과
	@Secured("ROLE_MEMBER")
	@RequestMapping("update_result.do")
	public String memberUpdateResult(MemberVO memberVO,Model model) {
		model.addAttribute("id",memberVO.getId());
		return "member/update_result";
	}
	
	/*이용약관동의 start*/
	@RequestMapping("watflixMustAgree.do")
	public String watflixMustAgree() {
		return "member/watflixMustAgree";
	}
	@RequestMapping("watflixMustPersonal.do")
	public String watflixMustPersonal() {
		return "member/watflixMustPersonal";
	}
	@RequestMapping("watflixSelectMarketing.do")
	public String watflixSelectMarketing() {
		return "member/watflixSelectMarketing";
	}
	/*이용약관동의 end*/
	
	// 내 게시물 리스트
	@RequestMapping("MyPostList.do")
	public String MyPostList(Model model) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("reviewListVO",reviewService.sGetMyReviewList(mvo.getId()));
		return "my_post_list.tiles";
	}
	
	//포인트사용내역 조회
	@RequestMapping("memberPointHistoryCheck.do")
	public String memberPointHistoryCheck(Model model,String pageNo) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		PagingBean pagingBean=null;
		int totalMemberSelectPoint = pointHistoryService.sProductHistoryGetTotalCount(mvo.getId());
		System.out.println("총 포인트사용내역 건수"+totalMemberSelectPoint);
		if(pageNo==null) {
			pagingBean = new PagingBean(totalMemberSelectPoint);
		}
		else {
			pagingBean = new PagingBean(totalMemberSelectPoint, Integer.parseInt(pageNo));
		}
		
		List<PointHistoryVO> list = pointHistoryService.sMemberPointHistoryCheck(mvo.getId(),pagingBean);
		model.addAttribute("pointHistoryListVO",new PointHistoryListVO(list,pagingBean));
		return "member/pointHistoryCheck.tiles";
	}
	
}
