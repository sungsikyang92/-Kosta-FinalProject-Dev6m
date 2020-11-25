package org.kosta.watflix.model.vo;

public class ReviewVO {
	private String reviewNo;
	private String reviewTitle;
	private String reviewContents;
	private int reviewHits;
	private int reviewLikes;
	private String reviewPostedDate;
	private MemberVO memberVO;
	private ContentsVO contentsVO;
	
	public ReviewVO() {
		super();
	}
	public ReviewVO(String reviewNo, String reviewTitle, String reviewContents, int reviewHits, int reviewLikes, String reviewPostedDate, MemberVO memberVO, ContentsVO contentsVO) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContents = reviewContents;
		this.reviewHits = reviewHits;
		this.reviewLikes = reviewLikes;
		this.reviewPostedDate = reviewPostedDate;
		this.memberVO = memberVO;
		this.contentsVO = contentsVO;
	}
	public String getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public int getReviewHits() {
		return reviewHits;
	}
	public void setReviewHits(int reviewHits) {
		this.reviewHits = reviewHits;
	}
	public int getReviewLikes() {
		return reviewLikes;
	}
	public void setReviewLikes(int reviewLikes) {
		this.reviewLikes = reviewLikes;
	}
	public String getReviewPostedDate() {
		return reviewPostedDate;
	}
	public void setReviewPostedDate(String reviewPostedDate) {
		this.reviewPostedDate = reviewPostedDate;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public ContentsVO getContentsVO() {
		return contentsVO;
	}
	public void setContentsVO(ContentsVO contentsVO) {
		this.contentsVO = contentsVO;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContents=" + reviewContents
				+ ", reviewHits=" + reviewHits + ", reviewLikes=" + reviewLikes + ", reviewPostedDate="
				+ reviewPostedDate + ", memberVO=" + memberVO + ", contentsVO=" + contentsVO + "]";
	}
	
}
