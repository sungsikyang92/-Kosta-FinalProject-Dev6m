package org.kosta.watflix.model.vo;

public class ProductOrderVO {
	private int orderNo;
	private ProductVO productVO;
	private int quantity;
	private MemberVO memberVO;
	private String purchasedTime;
	public ProductOrderVO() {
		super();
	}
	public ProductOrderVO(int orderNo, ProductVO productVO, int quantity, MemberVO memberVO, String purchasedTime) {
		super();
		this.orderNo = orderNo;
		this.productVO = productVO;
		this.quantity = quantity;
		this.memberVO = memberVO;
		this.purchasedTime = purchasedTime;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getPurchasedTime() {
		return purchasedTime;
	}
	public void setPurchasedTime(String purchasedTime) {
		this.purchasedTime = purchasedTime;
	}
	@Override
	public String toString() {
		return "ProductOrderVO [orderNo=" + orderNo + ", productVO=" + productVO + ", quantity=" + quantity
				+ ", memberVO=" + memberVO + ", purchasedTime=" + purchasedTime + "]";
	}
	
	
}
