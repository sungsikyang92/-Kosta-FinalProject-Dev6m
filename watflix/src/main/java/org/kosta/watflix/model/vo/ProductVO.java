package org.kosta.watflix.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private int productNo;
	private String productName;
	private int productPoint;
	private String productDetail;
	private ProductCategoryVO productCategoryVO;
	private String productPic;
	private String productBrand;
	private int productStock;
	private ProStatusVO proStatusVO;
	
	private MultipartFile productPicFile;

	public ProductVO() {
		super();
	}

	public ProductVO(int productNo, String productName, int productPoint, String productDetail,
			ProductCategoryVO productCategoryVO, String productPic, String productBrand, int productStock,
			ProStatusVO proStatusVO, MultipartFile productPicFile) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPoint = productPoint;
		this.productDetail = productDetail;
		this.productCategoryVO = productCategoryVO;
		this.productPic = productPic;
		this.productBrand = productBrand;
		this.productStock = productStock;
		this.proStatusVO = proStatusVO;
		this.productPicFile = productPicFile;
	}

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

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public ProStatusVO getProStatusVO() {
		return proStatusVO;
	}

	public void setProStatusVO(ProStatusVO proStatusVO) {
		this.proStatusVO = proStatusVO;
	}

	public MultipartFile getProductPicFile() {
		return productPicFile;
	}

	public void setProductPicFile(MultipartFile productPicFile) {
		this.productPicFile = productPicFile;
	}

	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", productPoint=" + productPoint
				+ ", productDetail=" + productDetail + ", productCategoryVO=" + productCategoryVO + ", productPic="
				+ productPic + ", productBrand=" + productBrand + ", productStock=" + productStock + ", proStatusVO="
				+ proStatusVO + ", productPicFile=" + productPicFile + "]";
	}

	
	
}
