package org.kosta.watflix.model.service;

import java.io.IOException;

import org.kosta.watflix.model.vo.GenreVO;

public interface AdminService {
 
	void saveThumbnail(String sImgUrl, String bImgUrl, String path, String contentsId,String title,String summary,String type,String genreCode, String genreName) throws IOException ;

	void genreRegister(String genreCode, String genreName);

	GenreVO findByGenreCode(String genreCode);

}
