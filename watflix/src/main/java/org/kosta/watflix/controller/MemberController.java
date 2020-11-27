package org.kosta.myapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.myapp.model.service.MemberService;
import org.kosta.myapp.model.vo.MemberVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	@RequestMapping("findMemberById.do")
	public ModelAndView findMemberById(String id) {
		MemberVO vo = memberService.findMemberById(id);
		if (vo == null)
			return new ModelAndView("member/findMemberById_fail");
		else
			return new ModelAndView("member/findMemberById_ok.tiles", "memberVO", vo);
	}
	//로그아웃완료 후 이동할 페이지 ( spring-security.xml 에 설정 ) 
	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login_fail";
	}
    //spring security에서 로그인 , 로그아웃 처리를 하므로 아래의 login , logout 관련 메서드는 필요없다  
	/*
	 * @RequestMapping(value="login.do",method=RequestMethod.POST) public String
	 * login(MemberVO memberVO,HttpServletRequest request){ MemberVO
	 * vo=memberService.login(memberVO); if(vo==null){ return "member/login_fail";
	 * }else{ request.getSession().setAttribute("mvo", vo); return "home"; } }
	 */
	/*
	 * @RequestMapping("logout.do") public String logout(HttpServletRequest request)
	 * { HttpSession session = request.getSession(false); if (session != null)
	 * session.invalidate(); return "home"; }
	 */
	/* @Secure 어노테이션을 이용해 권한이 부여된 대상들만 서비스를 제공받도록 설정한다 
	  권한이 ROLE_MEMBER 일때만 아래 메서드가 실행된다 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("cafe.do")
	public ModelAndView enterCafe() {		
		return new ModelAndView("member/cafe.tiles", "count", memberService.getMemberCount());
	}

	@Secured("ROLE_MEMBER")
	@RequestMapping("updateForm.do")
	public String updateForm() {
		return "member/updateForm.tiles";
	}

	@Secured("ROLE_MEMBER")
	@PostMapping("updateMemberAction.do")
	public String updateMemberAction(HttpServletRequest request, MemberVO memberVO) {
     // 참고) 회원정보 수정시 권한까지 수정해야 할 경우에는 아래처럼 코딩하면 된다
	/*	
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		List<GrantedAuthority> updatedAuthorities = new ArrayList<>(auth.getAuthorities());
		updatedAuthorities.add(new SimpleGrantedAuthority("ROLE_ADMIN")); 																		
		Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(),
				updatedAuthorities);
		SecurityContextHolder.getContext().setAuthentication(newAuth);
	*/
		////////////////////////////////////////////////////////////////////////////

		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		System.out.println("Spring Security 세션 수정 전 회원정보:" + pvo);		
		memberService.updateMember(memberVO);//service에서 변경될 비밀번호를 암호화한다 
		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
		pvo.setPassword(memberVO.getPassword());
		pvo.setName(memberVO.getName());
		pvo.setAddress(memberVO.getAddress());
		System.out.println("Spring Security 세션 수정 후 회원정보:" + pvo);
		return "member/update_result.tiles";
	}
	@RequestMapping("registerForm.do")
	public String registerForm() {
		return "member/registerForm.tiles";
	}
	@PostMapping("registerMember.do")
	public String register(MemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:registerResultView.do?id=" + vo.getId();
	}

	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/register_result.tiles", "memberVO", vo);
	}

	@RequestMapping("idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		return memberService.idcheck(id);
	}
}
