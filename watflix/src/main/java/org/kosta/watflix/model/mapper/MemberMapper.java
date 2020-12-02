package org.kosta.watflix.model.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.Authority;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ProductOrderVO;
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
	int mMemberPointCheck(String id);
	void mMemberPointUp(Map<String, Object> map);
	List<ProductOrderVO> mMemberProductOrderHistory(String id);
}




