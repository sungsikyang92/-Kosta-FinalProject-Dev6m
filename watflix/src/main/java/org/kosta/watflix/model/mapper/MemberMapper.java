package org.kosta.watflix.model.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.Authority;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ProductOrderVO;
import org.kosta.watflix.model.vo.ReportVO;
import org.kosta.watflix.model.vo.ReviewVO;
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
	void mMemberPointUpdate(MemberVO memberVO);
	int mMemberAllCount();
	List<ProductOrderVO> mMemberProductOrderHistory(String id);
	// 멤버리스트, 페이징
	List<MemberVO> mMemberAllList(PagingBean pagingBean);
	//멤버 정지 or 정지해제
	void mMemberStatusUpdate(HashMap<String, Object> map);

	
	
}




