package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class QnAAnswerListVO {
	private List<QnAAnswerVO> qnaAnswerList;
	private PagingBean pagingBean;
	public QnAAnswerListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnAAnswerListVO(List<QnAAnswerVO> qnaAnswerList, PagingBean pagingBean) {
		super();
		this.qnaAnswerList = qnaAnswerList;
		this.pagingBean = pagingBean;
	}
	public List<QnAAnswerVO> getQnaAnswerList() {
		return qnaAnswerList;
	}
	public void setQnaList(List<QnAAnswerVO> qnaAnswerList) {
		this.qnaAnswerList = qnaAnswerList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "QnAListVO [qnaList=" + qnaAnswerList + ", pagingBean=" + pagingBean + "]";
	}
}
