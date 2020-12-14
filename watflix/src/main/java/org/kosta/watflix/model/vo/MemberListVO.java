package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class MemberListVO {
	private List<MemberVO> memberList;
	private PagingBean pagingBean;
	public MemberListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberListVO(List<MemberVO> memberList, PagingBean pagingBean) {
		super();
		this.memberList = memberList;
		this.pagingBean = pagingBean;
	}
	public List<MemberVO> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<MemberVO> memberList) {
		this.memberList = memberList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "MemberListVO [memberList=" + memberList + ", pagingBean=" + pagingBean + "]";
	}
	
	
	
}
