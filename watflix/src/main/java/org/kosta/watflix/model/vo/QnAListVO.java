package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class QnAListVO {
	private List<QnAVO> qnaList;
	private PagingBean pagingBean;
	public QnAListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnAListVO(List<QnAVO> qnaList, PagingBean pagingBean) {
		super();
		this.qnaList = qnaList;
		this.pagingBean = pagingBean;
	}
	public List<QnAVO> getQnaList() {
		return qnaList;
	}
	public void setQnaList(List<QnAVO> qnaList) {
		this.qnaList = qnaList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "QnAListVO [qnaList=" + qnaList + ", pagingBean=" + pagingBean + "]";
	}
}
