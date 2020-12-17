package org.kosta.watflix.model.vo;

public class QnAAnswerVO {
	private int answerNo;
	private String answerContents;
	private String answerPostedTime;
	private MemberVO memberVO;
	private QnAVO qnaVO;
	public QnAAnswerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnAAnswerVO(int answerNo, String answerContents, String answerPostedTime, MemberVO memberVO, QnAVO qnaVO) {
		super();
		this.answerNo = answerNo;
		this.answerContents = answerContents;
		this.answerPostedTime = answerPostedTime;
		this.memberVO = memberVO;
		this.qnaVO = qnaVO;
	}
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}
	public String getAnswerContents() {
		return answerContents;
	}
	public void setAnswerContents(String answerContents) {
		this.answerContents = answerContents;
	}
	public String getAnswerPostedTime() {
		return answerPostedTime;
	}
	public void setAnswerPostedTime(String answerPostedTime) {
		this.answerPostedTime = answerPostedTime;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public QnAVO getQnaVO() {
		return qnaVO;
	}
	public void setQnaVO(QnAVO qnaVO) {
		this.qnaVO = qnaVO;
	}
	@Override
	public String toString() {
		return "QnAAnswerVO [answerNo=" + answerNo + ", answerContents=" + answerContents + ", answerPostedTime="
				+ answerPostedTime + ", memberVO=" + memberVO + ", qnaVO=" + qnaVO + "]";
	}
	
}