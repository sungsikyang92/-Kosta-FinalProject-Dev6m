package org.kosta.watflix.model.vo;

public class ProductOrderVO {
	private int orderNo;
	private ProductVO productVO;
	private int QUANTITY;
	private MemberVO memberVO;
	private String PURCHASED_TIME;
	
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
	public int getQUANTITY() {
		return QUANTITY;
	}
	public void setQUANTITY(int qUANTITY) {
		QUANTITY = qUANTITY;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getPURCHASED_TIME() {
		return PURCHASED_TIME;
	}
	public void setPURCHASED_TIME(String pURCHASED_TIME) {
		PURCHASED_TIME = pURCHASED_TIME;
	}
	public ProductOrderVO() {
		super();
	}
	public ProductOrderVO(int orderNo, ProductVO productVO, int qUANTITY, MemberVO memberVO, String pURCHASED_TIME) {
		super();
		this.orderNo = orderNo;
		this.productVO = productVO;
		QUANTITY = qUANTITY;
		this.memberVO = memberVO;
		PURCHASED_TIME = pURCHASED_TIME;
	}
	@Override
	public String toString() {
		return "ProductOrderVO [orderNo=" + orderNo + ", productVO=" + productVO + ", QUANTITY=" + QUANTITY
				+ ", memberVO=" + memberVO + ", PURCHASED_TIME=" + PURCHASED_TIME + "]";
	}
}
