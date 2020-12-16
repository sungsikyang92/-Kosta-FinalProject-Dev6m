package org.kosta.watflix.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.MemberMapper;
import org.kosta.watflix.model.vo.Authority;
import org.kosta.watflix.model.vo.MemberListVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.PartyListVO;
import org.kosta.watflix.model.vo.ProductOrderVO;
import org.kosta.watflix.model.vo.ReportListVO;
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
	
	// 관리자 회원가입시 권한을 두개 준다.
	@Transactional
	@Override
	public void sMemberAdminRegister(MemberVO memberVO) {
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
		String encodedPwd = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPwd);
		memberMapper.mMemberRegister(memberVO);	
		Authority member = new Authority("ROLE_MEMBER",memberVO.getId());
		Authority admin = new Authority("ROLE_ADMIN",memberVO.getId());
		// 회원권한 저장
		memberMapper.mGradeRegister(member);
		memberMapper.mGradeRegister(admin);
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
	@Transactional
	@Override
	public void sMemberUpdate(MemberVO memberVO) {
		String encodedPwd = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPwd);
		memberMapper.mMemberUpdate(memberVO);
	}

	//로그인시 로그인 시간 및 실패횟수 0로 업데이트
	@Override
	public void sMemberLoginTimeUpdate(String id) {
		memberMapper.mMemberLoginTimeUpdate(id);
	}
	
	//로그인 실패시 실패횟수 업데이트
	@Override
	public void sMemberLoginFailUp(String id) {
		memberMapper.mMemberLoginFailUp(id);
	}

	//포인트 조회
	@Override
	public int sMemberPointCheck(String id) {
		return memberMapper.mMemberPointCheck(id);
	}
	//포인트 증가, 이 기능은 로그인을 위한 기능임,
	//리뷰쓰기,평점쓰기등의 포인트를 증가시켜야하는 서비스에서는 mapper쪽에 있는 기능을 사용하기 바람
	@Override
	public void sMemberPointUpdate(MemberVO memberVO) {
		memberMapper.mMemberPointUpdate(memberVO);
	}

	//포인트 사용내역(상품 구매내역)
	@Override
	public List<ProductOrderVO> sMemberProductOrderHistory(String id) {
		return memberMapper.mMemberProductOrderHistory(id);
	}

	@Override
	public MemberListVO sMemberAllList() {
		return sMemberAllList("1");
	}

	@Override
	public MemberListVO sMemberAllList(String pageNo) {
		int totalMemberCount = memberMapper.mMemberAllCount();
		PagingBean pagingBean = null;
		if(pageNo == null) {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(totalMemberCount,contentNumberPerPage,pageNumberPerPageGroup);
		}else {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(totalMemberCount, contentNumberPerPage,pageNumberPerPageGroup,Integer.parseInt(pageNo));
		}		
		MemberListVO memberListVO = new MemberListVO(memberMapper.mMemberAllList(pagingBean),pagingBean);
		return memberListVO;
	}	
	
	@Override
	public int sMemberAllCount() {
		return memberMapper.mMemberAllCount();
	}

	@Override
	public void sMemberStatusUpdate(String id, int accStatusNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("accStatusNo", accStatusNo);
		memberMapper.mMemberStatusUpdate(map);
		
	}

	

}



