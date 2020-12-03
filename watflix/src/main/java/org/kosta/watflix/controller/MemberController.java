package org.kosta.watflix.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.watflix.model.service.MemberService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
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
}
