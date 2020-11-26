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
	private int contentsAvgStars;
	private int contentsLikes;
	private int contentsHits;
	
	
	public ContentsVO() {
		super();
	}

	public ContentsVO(String contentsNo, String contentsTitle, String contentsType, GenreVO genreVO,
			String contentsSummary, String contentsSmallThumbnail, String contentsBigThumbnail) {
		super();
		this.contentsNo = contentsNo;
		this.contentsTitle = contentsTitle;
		this.contentsType = contentsType;
		this.genreVO = genreVO;
		this.contentsSummary = contentsSummary;
		this.contentsSmallThumbnail = contentsSmallThumbnail;
		this.contentsBigThumbnail = contentsBigThumbnail;
	}



	public ContentsVO(String contentsNo, String contentsTitle, String contentsType, GenreVO genreVO,
			String contentsSummary, String contentsSmallThumbnail, String contentsBigThumbnail, int contentsAvgStars,
			int contentsLikes, int contentsHits) {
		super();
		this.contentsNo = contentsNo;
		this.contentsTitle = contentsTitle;
		this.contentsType = contentsType;
		this.genreVO = genreVO;
		this.contentsSummary = contentsSummary;
		this.contentsSmallThumbnail = contentsSmallThumbnail;
		this.contentsBigThumbnail = contentsBigThumbnail;
		this.contentsAvgStars = contentsAvgStars;
		this.contentsLikes = contentsLikes;
		this.contentsHits = contentsHits;
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

	public int getContentsAvgStars() {
		return contentsAvgStars;
	}

	public void setContentsAvgStars(int contentsAvgStars) {
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
	
	
}
