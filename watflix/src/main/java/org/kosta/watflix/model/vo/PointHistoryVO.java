package org.kosta.watflix.model.vo;

public class PointHistoryVO {
	private int pointHistoryNo;
	private String id;
	private ReviewVO reviewVO;
	private CommentsVO commentsVO;
	private ContentsVO contentsVO;
	private ProductOrderVO productOrderVO;
	private int point;
	private String pointHistoryContents;
	private String currentTime;
	
	public PointHistoryVO() {
		super();
	}

	public PointHistoryVO(int pointHistoryNo, String id, ReviewVO reviewVO, CommentsVO commentsVO,
			ContentsVO contentsVO, ProductOrderVO productOrderVO, int point, String pointHistoryContents,
			String currentTime) {
		super();
		this.pointHistoryNo = pointHistoryNo;
		this.id = id;
		this.reviewVO = reviewVO;
		this.commentsVO = commentsVO;
		this.contentsVO = contentsVO;
		this.productOrderVO = productOrderVO;
		this.point = point;
		this.pointHistoryContents = pointHistoryContents;
		this.currentTime = currentTime;
	}

	public int getPointHistoryNo() {
		return pointHistoryNo;
	}

	public void setPointHistoryNo(int pointHistoryNo) {
		this.pointHistoryNo = pointHistoryNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ReviewVO getReviewVO() {
		return reviewVO;
	}

	public void setReviewVO(ReviewVO reviewVO) {
		this.reviewVO = reviewVO;
	}

	public CommentsVO getCommentsVO() {
		return commentsVO;
	}

	public void setCommentsVO(CommentsVO commentsVO) {
		this.commentsVO = commentsVO;
	}

	public ContentsVO getContentsVO() {
		return contentsVO;
	}

	public void setContentsVO(ContentsVO contentsVO) {
		this.contentsVO = contentsVO;
	}

	public ProductOrderVO getProductOrderVO() {
		return productOrderVO;
	}

	public void setProductOrderVO(ProductOrderVO productOrderVO) {
		this.productOrderVO = productOrderVO;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPointHistoryContents() {
		return pointHistoryContents;
	}

	public void setPointHistoryContents(String pointHistoryContents) {
		this.pointHistoryContents = pointHistoryContents;
	}

	public String getCurrentTime() {
		return currentTime;
	}

	public void setCurrentTime(String currentTime) {
		this.currentTime = currentTime;
	}

	@Override
	public String toString() {
		return "PointHistoryVO [pointHistoryNo=" + pointHistoryNo + ", id=" + id + ", reviewVO=" + reviewVO
				+ ", commentsVO=" + commentsVO + ", contentsVO=" + contentsVO + ", productOrderVO=" + productOrderVO
				+ ", point=" + point + ", pointHistoryContents=" + pointHistoryContents + ", currentTime=" + currentTime
				+ "]";
	}
	
}
