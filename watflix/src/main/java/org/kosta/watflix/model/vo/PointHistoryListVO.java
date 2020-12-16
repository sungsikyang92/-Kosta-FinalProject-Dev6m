package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class PointHistoryListVO {
	List<PointHistoryVO> pointHistoryList;
	PagingBean pagingBean;
	public PointHistoryListVO() {
		super();
	}
	public PointHistoryListVO(List<PointHistoryVO> pointHistoryList, PagingBean pagingBean) {
		super();
		this.pointHistoryList = pointHistoryList;
		this.pagingBean = pagingBean;
	}
	public List<PointHistoryVO> getPointHistoryList() {
		return pointHistoryList;
	}
	public void setPointHistoryList(List<PointHistoryVO> pointHistoryList) {
		this.pointHistoryList = pointHistoryList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "PointHistoryListVO [pointHistoryList=" + pointHistoryList + ", pagingBean=" + pagingBean + "]";
	}
	
}
