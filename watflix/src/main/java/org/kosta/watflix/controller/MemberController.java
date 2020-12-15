package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.service.MemberService;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.CommentsListVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Resource
	MemberService memberService;
	@Resource
	ReviewService reviewService;
	@Resource
	CommentsService commentsService;
	
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
	@RequestMapping("myPostList.do")
	public String MyPostList(Model model) {
		System.out.println("myPostList.do 실행");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(commentsService.sGetMyCommentsList(mvo.getId()));
		model.addAttribute("commentsListVO", commentsService.sGetMyCommentsList(mvo.getId()));
		model.addAttribute("reviewListVO",reviewService.sGetMyReviewList(mvo.getId()));
		return "my_post_list.tiles";
	}	
	
	// 내 리뷰 리스트 Ajax
	@RequestMapping("myReviewList.do")
	@ResponseBody
	public ReviewListVO myReviewList(String pageNo) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return reviewService.sGetMyReviewList(mvo.getId(), pageNo);
	}
	
	// 내 Comments 리스트 Ajax
	@RequestMapping("myCommentsList.do")
	@ResponseBody
	public CommentsListVO myCommentsList(String pageNo) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return commentsService.sGetMyCommentsList(mvo.getId(), pageNo);
	}
}
