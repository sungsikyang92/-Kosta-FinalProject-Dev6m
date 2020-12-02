package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class ContentsListVO {
	List<ContentsVO> contentsList;
	PagingBean pagingBean;
	
	public List<ContentsVO> getContentsList() {
		return contentsList;
	}
	public void setContentsList(List<ContentsVO> contentsList) {
		this.contentsList = contentsList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
	public ContentsListVO() {
		super();
	}
	
	public ContentsListVO(List<ContentsVO> contentsList, PagingBean pagingBean) {
		super();
		this.contentsList = contentsList;
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ContentsListVO [contentsList=" + contentsList + ", pagingBean=" + pagingBean + "]";
	}
	
	
	

}
