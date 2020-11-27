package org.kosta.watflix.model.service;

/**
 * 페이징 처리를 위한 비즈니스 계층의 클래스 PagingBean method 구현순서 getStartRowNumber()
 * getEndRowNumber() getTotalPage() getTotalPageGroup() getNowPageGroup()
 * getStartPageOfPageGroup() getendPageOfPageGroup() isPreviousPageGroup()
 * isNextPageGroup()
 * 
 * @author jikang
 *
 */
public class PagingBean {
	/**
	 * 현재 페이지
	 */
	private int nowPage = 1;
	/**
	 * 페이지당 게시물 수
	 */
	private int contentNumberPerPage = 5;
	/**
	 * 페이지 그룹당 페이지 수
	 */
	private int pageNumberPerPageGroup = 4;
	/**
	 * database에 저장된 총 게시물 수 
	 */
	private int totalContents;
	
	public PagingBean() {
	}
	
	public PagingBean(int totalContents) {
		this.totalContents = totalContents;
	}
	
	public PagingBean(int totalContents, int nowPage) {
		this.totalContents = totalContents;
		this.nowPage = nowPage;
	}
	
	public int getNowPage() {
		return nowPage;
	}	
	
	public int getStartRowNumber() {
		return ((nowPage - 1) * contentNumberPerPage) + 1;
	}	
	
	public int getEndRowNumber() {
		int endRowNumber = nowPage * contentNumberPerPage;
		if(totalContents < endRowNumber) {
			endRowNumber = totalContents;
		}
		return endRowNumber;
	}	
	
	public int getTotalPage() {
		int num = this.totalContents % this.contentNumberPerPage;
		int totalPage = 0;
		if(num == 0) {
			totalPage = this.totalContents / this.contentNumberPerPage;
		} else {
			totalPage = this.totalContents / this.contentNumberPerPage + 1;
		}
		return totalPage;
	}
	
	public int getTotalPageGroup() {
		int num = this.getTotalPage() % this.pageNumberPerPageGroup;
		int totalPageGroup = 0;
		if (num == 0) {
			totalPageGroup = this.getTotalPage() / this.pageNumberPerPageGroup;
		} else {
			totalPageGroup = this.getTotalPage() / this.pageNumberPerPageGroup + 1;
		}
		return totalPageGroup;
	}
	
	public int getNowPageGroup() {
		int num = this.nowPage % this.pageNumberPerPageGroup;
		int nowPageGroup = 0;
		if(num == 0) {
			nowPageGroup = this.nowPage / this.pageNumberPerPageGroup;
		} else {
			nowPageGroup = this.nowPage / this.pageNumberPerPageGroup + 1;
		}
		return nowPageGroup;
	}
	
	public int getStartOfPageGroup() {
		int num = this.pageNumberPerPageGroup * (this.getNowPageGroup() - 1) + 1;
		return num;
	}
	
	public int getEndPageOfPageGroup() {
		int num = this.getNowPageGroup() * this.pageNumberPerPageGroup;
		if(this.getTotalPage() < num) {
			num = this.getTotalPage();
		}
		return num;
	}
	
	public boolean isPreviousPageGroup() {
		boolean flag = false;
		if(this.getNowPageGroup() > 1) {
			flag = true;
		}
		return flag;
	}
	
	public boolean isNextPageGroup() {
		boolean flag = false;
		if(this.getNowPageGroup() < this.getTotalPageGroup()) {
			flag = true;
		}
		return flag;
	}
}
