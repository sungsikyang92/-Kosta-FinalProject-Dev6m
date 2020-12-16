package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;


public class ProductOrderListVO {
	
	 private List<ProductOrderVO> productOrderList;
	 private PagingBean pagingBean;
	public ProductOrderListVO() {
		super();
	}
	public ProductOrderListVO(List<ProductOrderVO> productOrderList, PagingBean pagingBean) {
		super();
		this.productOrderList = productOrderList;
		this.pagingBean = pagingBean;
	}
	public List<ProductOrderVO> getProductOrderList() {
		return productOrderList;
	}
	public void setProductOrderList(List<ProductOrderVO> productOrderList) {
		this.productOrderList = productOrderList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ProductOrderListVO [productOrderList=" + productOrderList + ", pagingBean=" + pagingBean + "]";
	}
	

	 
	 
}
