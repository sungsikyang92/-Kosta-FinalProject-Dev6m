package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class ReportListVO {
	private List<ReportVO> list;
	private PagingBean pagingBean;
	
	public ReportListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportListVO(List<ReportVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<ReportVO> getList() {
		return list;
	}
	public void setList(List<ReportVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ReportListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}	
}

