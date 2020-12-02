package org.kosta.watflix.model.vo;

public class ProductCategoryVO {
	private int productCategoryNo;
	private String productCategoryName;
	
	public int getProductCategoryNo() {
		return productCategoryNo;
	}

	public void setProductCategoryNo(int productCategoryNo) {
		this.productCategoryNo = productCategoryNo;
	}

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}

	public ProductCategoryVO() {
		super();
	}

	public ProductCategoryVO(int productCategoryNo, String productCategoryName) {
		super();
		this.productCategoryNo = productCategoryNo;
		this.productCategoryName = productCategoryName;
	}

	@Override
	public String toString() {
		return "ProductCategoryVO [productCategoryNo=" + productCategoryNo + ", productCategoryName="
				+ productCategoryName + "]";
	}
	
	
}
