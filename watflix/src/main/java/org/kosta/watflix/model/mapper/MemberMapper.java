package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.Authority;
import org.kosta.watflix.model.vo.MemberVO;
@Mapper
public interface MemberMapper {

	void mMemberRegister(MemberVO memberVO);
	void mGradeRegister(Authority authority);
	MemberVO mFindMemberById(String id);
	MemberVO mFindMemberByIdWithStatusNormal(String id);
	void mMemberLeave(String id);
	List<Authority> mFindAuthorityById(String id);
	void mMemberUpdate(MemberVO memberVO);
	void mMemberLoginTimeUpdate(String id);
	void mMemberLoginFailUp(String id);
}




