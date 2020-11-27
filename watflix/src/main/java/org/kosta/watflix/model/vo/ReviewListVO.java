package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class ReviewListVO {
	private List<ReviewVO> reviewList;
	private PagingBean pagingBean;
	public ReviewListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewListVO(List<ReviewVO> reviewList, PagingBean pagingBean) {
		super();
		this.reviewList = reviewList;
		this.pagingBean = pagingBean;
	}
	public List<ReviewVO> getReviewList() {
		return reviewList;
	}
	public void setReviewList(List<ReviewVO> reviewList) {
		this.reviewList = reviewList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ReviewListVO [reviewList=" + reviewList + ", pagingBean=" + pagingBean + "]";
	}
	
}
