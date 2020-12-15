package org.kosta.watflix.model.vo;

import java.util.List;

/*컨텐츠*/
public class ContentsVO {
	private String contentsNo;
	private String contentsTitle;
	private String contentsType;
	private GenreVO genreVO; //컨텐츠코드와 네임을 담기위한 변수 선언
	private String contentsSummary;
	private String contentsSmallThumbnail;
	private String contentsBigThumbnail;
	private String contentsDate;
	private String contentsRunningtime;
	private String contentsActor;
	private String contentsProducer;
	private String contentsAge;
	private float contentsAvgStars;
	private int contentsLikes;
	private int contentsHits;
	private int contentsReviewCount;
	private int contentsLikeStatus;

	public ContentsVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ContentsVO(String contentsNo, String contentsTitle, String contentsType, GenreVO genreVO,
			String contentsSummary, String contentsSmallThumbnail, String contentsBigThumbnail, String contentsDate,
			String contentsRunningtime, String contentsActor, String contentsProducer, String contentsAge,
			float contentsAvgStars, int contentsLikes, int contentsHits, int contentsReviewCount) {
		super();
		this.contentsNo = contentsNo;
		this.contentsTitle = contentsTitle;
		this.contentsType = contentsType;
		this.genreVO = genreVO;
		this.contentsSummary = contentsSummary;
		this.contentsSmallThumbnail = contentsSmallThumbnail;
		this.contentsBigThumbnail = contentsBigThumbnail;
		this.contentsDate = contentsDate;
		this.contentsRunningtime = contentsRunningtime;
		this.contentsActor = contentsActor;
		this.contentsProducer = contentsProducer;
		this.contentsAge = contentsAge;
		this.contentsAvgStars = contentsAvgStars;
		this.contentsLikes = contentsLikes;
		this.contentsHits = contentsHits;
		this.contentsReviewCount = contentsReviewCount;
		this.contentsLikeStatus = contentsLikeStatus;
	}
	public String getContentsNo() {
		return contentsNo;
	}
	public void setContentsNo(String contentsNo) {
		this.contentsNo = contentsNo;
	}
	public String getContentsTitle() {
		return contentsTitle;
	}
	public void setContentsTitle(String contentsTitle) {
		this.contentsTitle = contentsTitle;
	}
	public String getContentsType() {
		return contentsType;
	}
	public void setContentsType(String contentsType) {
		this.contentsType = contentsType;
	}
	public GenreVO getGenreVO() {
		return genreVO;
	}
	public void setGenreVO(GenreVO genreVO) {
		this.genreVO = genreVO;
	}
	public String getContentsSummary() {
		return contentsSummary;
	}
	public void setContentsSummary(String contentsSummary) {
		this.contentsSummary = contentsSummary;
	}
	public String getContentsSmallThumbnail() {
		return contentsSmallThumbnail;
	}
	public void setContentsSmallThumbnail(String contentsSmallThumbnail) {
		this.contentsSmallThumbnail = contentsSmallThumbnail;
	}
	public String getContentsBigThumbnail() {
		return contentsBigThumbnail;
	}
	public void setContentsBigThumbnail(String contentsBigThumbnail) {
		this.contentsBigThumbnail = contentsBigThumbnail;
	}
	public String getContentsDate() {
		return contentsDate;
	}
	public void setContentsDate(String contentsDate) {
		this.contentsDate = contentsDate;
	}
	public String getContentsRunningtime() {
		return contentsRunningtime;
	}
	public void setContentsRunningtime(String contentsRunningtime) {
		this.contentsRunningtime = contentsRunningtime;
	}
	public String getContentsActor() {
		return contentsActor;
	}
	public void setContentsActor(String contentsActor) {
		this.contentsActor = contentsActor;
	}
	public String getContentsProducer() {
		return contentsProducer;
	}
	public void setContentsProducer(String contentsProducer) {
		this.contentsProducer = contentsProducer;
	}
	public String getContentsAge() {
		return contentsAge;
	}
	public void setContentsAge(String contentsAge) {
		this.contentsAge = contentsAge;
	}
	public float getContentsAvgStars() {
		return contentsAvgStars;
	}
	public void setContentsAvgStars(float contentsAvgStars) {
		this.contentsAvgStars = contentsAvgStars;
	}
	public int getContentsLikes() {
		return contentsLikes;
	}
	public void setContentsLikes(int contentsLikes) {
		this.contentsLikes = contentsLikes;
	}
	public int getContentsHits() {
		return contentsHits;
	}
	public void setContentsHits(int contentsHits) {
		this.contentsHits = contentsHits;
	}
	public int getContentsReviewCount() {
		return contentsReviewCount;
	}
	public void setContentsReviewCount(int contentsReviewCount) {
		this.contentsReviewCount = contentsReviewCount;
	}
	public int getContentsLikeStatus() {
		return contentsLikeStatus;
	}
	public void setContentsLikeStatus(int contentsLikeStatus) {
		this.contentsLikeStatus = contentsLikeStatus;
	}
	@Override
	public String toString() {
		return "ContentsVO [contentsNo=" + contentsNo + ", contentsTitle=" + contentsTitle + ", contentsType="
				+ contentsType + ", genreVO=" + genreVO + ", contentsSummary=" + contentsSummary
				+ ", contentsSmallThumbnail=" + contentsSmallThumbnail + ", contentsBigThumbnail="
				+ contentsBigThumbnail + ", contentsDate=" + contentsDate + ", contentsRunningtime="
				+ contentsRunningtime + ", contentsActor=" + contentsActor + ", contentsProducer=" + contentsProducer
				+ ", contentsAge=" + contentsAge + ", contentsAvgStars=" + contentsAvgStars + ", contentsLikes="
				+ contentsLikes + ", contentsHits=" + contentsHits + ", contentsReviewCount=" + contentsReviewCount
				+ ", contentsLikeStatus=" + contentsLikeStatus + "]";
	}
}
