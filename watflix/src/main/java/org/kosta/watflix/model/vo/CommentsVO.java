package org.kosta.watflix.model.vo;

public class CommentsVO {
	private int commentsNo;
	private MemberVO memberVO;
	private ContentsVO contentsVO;
	private String comments;
	private int commentsStars;
	private String commentsPostedTime;
	public CommentsVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentsVO(int commentsNo, MemberVO memberVO, ContentsVO contentsVO, String comments, int commentsStars,
			String commentsPostedTime) {
		super();
		this.commentsNo = commentsNo;
		this.memberVO = memberVO;
		this.contentsVO = contentsVO;
		this.comments = comments;
		this.commentsStars = commentsStars;
		this.commentsPostedTime = commentsPostedTime;
	}
	public int getCommentsNo() {
		return commentsNo;
	}
	public void setCommentsNo(int commentsNo) {
		this.commentsNo = commentsNo;
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
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getCommentsStars() {
		return commentsStars;
	}
	public void setCommentsStars(int commentsStars) {
		this.commentsStars = commentsStars;
	}
	public String getCommentsPostedTime() {
		return commentsPostedTime;
	}
	public void setCommentsPostedTime(String commentsPostedTime) {
		this.commentsPostedTime = commentsPostedTime;
	}
	@Override
	public String toString() {
		return "CommentsVO [commentsNo=" + commentsNo + ", memberVO=" + memberVO + ", contentsVO=" + contentsVO
				+ ", comments=" + comments + ", commentsStars=" + commentsStars + ", commentsPostedTime="
				+ commentsPostedTime + "]";
	}
}
