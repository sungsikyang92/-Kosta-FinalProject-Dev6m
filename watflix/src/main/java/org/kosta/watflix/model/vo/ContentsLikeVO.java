package org.kosta.watflix.model.vo;

public class ContentsLikeVO {
	private ContentsVO contentsVO;
	private MemberVO memberVO;
	public ContentsLikeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ContentsLikeVO(ContentsVO contentsVO, MemberVO memberVO) {
		super();
		this.contentsVO = contentsVO;
		this.memberVO = memberVO;
	}
	public ContentsVO getContentsVO() {
		return contentsVO;
	}
	public void setContentsVO(ContentsVO contentsVO) {
		this.contentsVO = contentsVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "ContentsLikeVO [contentsVO=" + contentsVO + ", memberVO=" + memberVO + "]";
	}
	
}
