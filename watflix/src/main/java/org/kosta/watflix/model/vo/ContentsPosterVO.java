package org.kosta.watflix.model.vo;

/*포스터사진*/
public class ContentsPosterVO {
	private String contentsPicName;

	public ContentsPosterVO(String contentsPicName) {
		super();
		this.contentsPicName = contentsPicName;
	}

	public ContentsPosterVO() {
		super();
	}

	public String getContentsPicName() {
		return contentsPicName;
	}

	public void setContentsPicName(String contentsPicName) {
		this.contentsPicName = contentsPicName;
	}
	
	
}
