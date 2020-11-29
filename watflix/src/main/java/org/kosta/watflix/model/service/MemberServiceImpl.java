package org.kosta.watflix.model.service;

import java.util.List;

import javax.annotation.Resource;
import javax.annotation.Resources;

import org.kosta.watflix.model.mapper.MemberMapper;
import org.kosta.watflix.model.vo.Authority;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	/*
	 *  비밀번호 암호화처리를 위한 객체를 주입받는다
	 *  spring-security.xml 에서 bean 설정이 되어 있음 	
	 */
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	@Resource
	private MemberMapper memberMapper;

	// 회원가입시 반드시 권한까지 부여되도록 트랜잭션 처리한다
	@Transactional
	@Override
	public void sMemberRegister(MemberVO memberVO) {
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
			String encodedPwd = passwordEncoder.encode(memberVO.getPassword());
			memberVO.setPassword(encodedPwd);
			memberMapper.mMemberRegister(memberVO);	
			Authority authority = new Authority("ROLE_MEMBER",memberVO.getId());
		// 회원권한 저장
			memberMapper.mGradeRegister(authority);
	}
	
	//사용자 찾기
	@Override
	public MemberVO sFindMemberById(String id) {
		return memberMapper.mFindMemberById(id);
	}
	
	//사용자 권한 확인
	@Override
	public List<Authority> sFindAuthorityById(String id) {
		return memberMapper.mFindAuthorityById(id);
	}
	
	//아이디 중복확인
	@Override
	public String idcheck(String id) {
		MemberVO vo = memberMapper.mFindMemberById(id);
		return (vo == null) ? "ok" : "fail";
	}
	
	//아이디 탈퇴
	@Override
	public void sMemberLeave(String id) {
		memberMapper.mMemberLeave(id);
	}

	//계정상태가 정상인 사용자 찾기
	@Override
	public MemberVO sFindMemberByIdWithStatusNormal(String id) {
		return memberMapper.mFindMemberByIdWithStatusNormal(id);
	}

	//사용자 정보 업데이트
	@Override
	public void sMemberUpdate(MemberVO memberVO) {
		String encodedPwd = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPwd);
		memberMapper.mMemberUpdate(memberVO);
	}

	//로그인시 로그인 시간 업데이트
	@Override
	public void sMemberLoginTimeUpdate(String id) {
		memberMapper.mMemberLoginTimeUpdate(id);
	}
	
	//로그인 실패시 실패횟수 업데이트
	@Override
	public void sMemberLoginFailUp(String id) {
		memberMapper.mMemberLoginFailUp(id);
	}
}



