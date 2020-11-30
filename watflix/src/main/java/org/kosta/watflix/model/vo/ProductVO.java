package org.kosta.watflix.model.vo;

public class ProductVO {
	private int productNo;
	private String productName;
	private int productPoint;
	private String productDetail;
	private ProductCategoryVO productCategoryVO;
	private String productPic;
	private String productBrand;
	private String productStock;
		
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPoint() {
		return productPoint;
	}
	public void setProductPoint(int productPoint) {
		this.productPoint = productPoint;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	public ProductCategoryVO getProductCategoryVO() {
		return productCategoryVO;
	}
	public void setProductCategoryVO(ProductCategoryVO productCategoryVO) {
		this.productCategoryVO = productCategoryVO;
	}
	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductStock() {
		return productStock;
	}
	public void setProductStock(String productStock) {
		this.productStock = productStock;
	}
	public ProductVO() {
		super();
	}
	public ProductVO(int productNo, String productName, int productPoint, String productDetail,
			ProductCategoryVO productCategoryVO, String productPic, String productBrand, String productStock) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPoint = productPoint;
		this.productDetail = productDetail;
		this.productCategoryVO = productCategoryVO;
		this.productPic = productPic;
		this.productBrand = productBrand;
		this.productStock = productStock;
	}
	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", productPoint=" + productPoint
				+ ", productDetail=" + productDetail + ", productCategoryVO=" + productCategoryVO + ", productPic="
				+ productPic + ", productBrand=" + productBrand + ", productStock=" + productStock + "]";
	}
	
	
	

}
