package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class CommentsListVO {
	private List<CommentsVO> list;
	private PagingBean pagingBean;
	public CommentsListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentsListVO(List<CommentsVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<CommentsVO> getList() {
		return list;
	}
	public void setList(List<CommentsVO> list) {
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
		return "CommentsListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
}
