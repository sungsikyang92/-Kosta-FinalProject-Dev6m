package org.kosta.watflix.model.service;

import java.util.List;

import org.kosta.watflix.model.vo.Authority;
import org.kosta.watflix.model.vo.MemberVO;

public interface MemberService {
	void sMemberRegister(MemberVO memberVO);
	void sMemberUpdate(MemberVO memberVO);
	void sMemberLeave(String id);
	void sMemberLoginTimeUpdate(String id);
	void sMemberLoginFailUp(String id);
	MemberVO sFindMemberById(String id);
	MemberVO sFindMemberByIdWithStatusNormal(String id);
	List<Authority> sFindAuthorityById(String id);
	String idcheck(String id);
	

	
	
	
	
}
