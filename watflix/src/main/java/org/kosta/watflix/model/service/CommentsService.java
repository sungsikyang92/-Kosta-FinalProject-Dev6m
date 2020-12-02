package org.kosta.watflix.model.service;

import java.util.List;

import org.kosta.watflix.model.vo.CommentsListVO;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.GenreVO;

public interface CommentsService {

	int sCommentsGetTotalPostCount();

	int sCommentsGetTotalPostCountByContentNo(int contentsNo);

	CommentsListVO sCommentsGetList();

	CommentsListVO sCommentsGetList(String pageNo);

	CommentsListVO sCommentsGetListByContentsNo(int contentsNo);

	CommentsListVO sCommentsGetListByContentsNo(String pageNo, int contentsNo);
	
	void sCommentsWrite(CommentsVO commentsVO);
	
	void sCommentsDelete(int commentsNo);
	
}