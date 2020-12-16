package org.kosta.watflix.model.vo;

public class GenreVO {
	private String genreCode;
	private String genreName;
	public GenreVO(String genreCode, String genreName) {
		super();
		this.genreCode = genreCode;
		this.genreName = genreName;
	}
	public GenreVO() {
		super();
	}
	public String getGenreCode() {
		return genreCode;
	}
	public void setGenreCode(String genreCode) {
		this.genreCode = genreCode;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	@Override
	public String toString() {
		return "GenreVO [genreCode=" + genreCode + ", genreName=" + genreName + "]";
	}
	
	
	
}
