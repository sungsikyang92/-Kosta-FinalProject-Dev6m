package org.kosta.watflix.model.vo;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;

public class ProductCategoryListVO {
	List<ProductCategoryVO> productCategoryList;
	PagingBean pagingBean;
	
	public ProductCategoryListVO() {
		super();
	}

	public ProductCategoryListVO(List<ProductCategoryVO> productCategoryList, PagingBean pagingBean) {
		super();
		this.productCategoryList = productCategoryList;
		this.pagingBean = pagingBean;
	}

	public List<ProductCategoryVO> getProductCategoryList() {
		return productCategoryList;
	}

	public void setProductCategoryList(List<ProductCategoryVO> productCategoryList) {
		this.productCategoryList = productCategoryList;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ProductCategoryListVO [productCategoryList=" + productCategoryList + ", pagingBean=" + pagingBean + "]";
	}
	
}
