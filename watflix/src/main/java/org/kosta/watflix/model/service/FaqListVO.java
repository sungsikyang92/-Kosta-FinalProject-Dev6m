package org.kosta.watflix.model.service;

import java.util.List;

import org.kosta.watflix.model.vo.FaqVO;

public class FaqListVO {
	private List<FaqVO> faqList;
	private PagingBean pagingBean;
	public FaqListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FaqListVO(List<FaqVO> faqList, PagingBean pagingBean) {
		super();
		this.faqList = faqList;
		this.pagingBean = pagingBean;
	}
	public List<FaqVO> getFaqList() {
		return faqList;
	}
	public void setFaqList(List<FaqVO> faqList) {
		this.faqList = faqList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "FaqListVO [faqList=" + faqList + ", pagingBean=" + pagingBean + "]";
	}


}
