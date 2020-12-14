package org.kosta.watflix.model.vo;

public class ReviewVO {
	private int reviewNo;
	private String reviewTitle;
	private String reviewContents;
	private int reviewHits;
	private int reviewLikes;
	private String reviewPostedTime;
	private MemberVO memberVO;
	private ContentsVO contentsVO;
	private int reviewLikeStatus;
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewVO(int reviewNo, String reviewTitle, String reviewContents, int reviewHits, int reviewLikes,
			String reviewPostedTime, MemberVO memberVO, ContentsVO contentsVO, int reviewLikeStatus) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContents = reviewContents;
		this.reviewHits = reviewHits;
		this.reviewLikes = reviewLikes;
		this.reviewPostedTime = reviewPostedTime;
		this.memberVO = memberVO;
		this.contentsVO = contentsVO;
		this.reviewLikeStatus = reviewLikeStatus;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
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
	public String getReviewPostedTime() {
		return reviewPostedTime;
	}
	public void setReviewPostedTime(String reviewPostedTime) {
		this.reviewPostedTime = reviewPostedTime;
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
	public int getReviewLikeStatus() {
		return reviewLikeStatus;
	}
	public void setReviewLikeStatus(int reviewLikeStatus) {
		this.reviewLikeStatus = reviewLikeStatus;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContents=" + reviewContents
				+ ", reviewHits=" + reviewHits + ", reviewLikes=" + reviewLikes + ", reviewPostedTime="
				+ reviewPostedTime + ", memberVO=" + memberVO + ", contentsVO=" + contentsVO + ", reviewLikeStatus="
				+ reviewLikeStatus + "]";
	}
	
}
