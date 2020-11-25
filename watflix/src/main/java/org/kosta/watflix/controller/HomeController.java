package org.kosta.watflix.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {	
	@RequestMapping("home.do")
	public String home(){
		//Spring Security 권한 출력해서 로그인 상태와 비로그인상태를 확인해본다  
		//System.out.println("home "+SecurityContextHolder.getContext().getAuthentication().getPrincipal());		
		return "home.tiles";
	}	
	/*	spring-security.xml에 아래와 같이 설정되어 있음 
		로그인 하였으나 권한이 없는 요청을 하였을 경우 보여지는 페이지를 지정  
		spring-security.xml 에 설정되어있음 
		<security:access-denied-handler error-page="/accessDeniedView.do"/>
	 */
	@RequestMapping("accessDeniedView.do")
	public String accessDeniedView() {
		return "auth/accessDeniedView";
	}
}
