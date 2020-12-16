package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class ProductListVO {
	private List<ProductVO> productList;
	private PagingBean pagingBean;
	public ProductListVO() {
		super();
	}
	public ProductListVO(List<ProductVO> productList, PagingBean pagingBean) {
		super();
		this.productList = productList;
		this.pagingBean = pagingBean;
	}
	public List<ProductVO> getProductList() {
		return productList;
	}
	public void setProductList(List<ProductVO> productList) {
		this.productList = productList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "productListVO [productList=" + productList + ", pagingBean=" + pagingBean + "]";
	}
}

