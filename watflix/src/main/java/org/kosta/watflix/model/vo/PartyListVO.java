package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class PartyListVO {
	private List<PartyVO> partyList;
	private PagingBean pagingBean;
	
	public PartyListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PartyListVO(List<PartyVO> partyList, PagingBean pagingBean) {
		super();
		this.partyList = partyList;
		this.pagingBean = pagingBean;
	}

	public List<PartyVO> getPartyList() {
		return partyList;
	}

	public void setPartyList(List<PartyVO> partyList) {
		this.partyList = partyList;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "PartyListVO [partyList=" + partyList + ", pagingBean=" + pagingBean + "]";
	}
	
	
	
}
