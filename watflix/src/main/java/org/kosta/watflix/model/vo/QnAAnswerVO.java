package org.kosta.watflix.model.vo;

public class QnAAnswerVO {
	private int answerNo;
	private String answerContents;
	private String answerPostedTime;
	public QnAAnswerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnAAnswerVO(int answerNo, String answerContents, String answerPostedTime) {
		super();
		this.answerNo = answerNo;
		this.answerContents = answerContents;
		this.answerPostedTime = answerPostedTime;
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
}
