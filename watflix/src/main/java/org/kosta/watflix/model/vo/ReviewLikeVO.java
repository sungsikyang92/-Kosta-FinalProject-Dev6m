package org.kosta.watflix.model.vo;

public class ReviewLikeVO {
	private ReviewVO reviewVO;
	private MemberVO memberVO;
	public ReviewLikeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewLikeVO(ReviewVO reviewVO, MemberVO memberVO) {
		super();
		this.reviewVO = reviewVO;
		this.memberVO = memberVO;
	}
	public ReviewVO getReviewVO() {
		return reviewVO;
	}
	public void setReviewVO(ReviewVO reviewVO) {
		this.reviewVO = reviewVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "ReviewLikeVO [reviewVO=" + reviewVO + ", memberVO=" + memberVO + "]";
	}
	
}
