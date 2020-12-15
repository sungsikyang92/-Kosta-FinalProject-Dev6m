package org.kosta.watflix.model.service;

import java.util.List;

import org.kosta.watflix.model.vo.CommentsListVO;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.GenreVO;
import org.kosta.watflix.model.vo.ReviewListVO;

public interface CommentsService {
	// comments 갯수 조회
	int sCommentsGetTotalPostCount();
	// contents 별 comments 갯수 조회
	int sCommentsGetTotalPostCountByContentNo(String contentsNo);
	// comments 리스트 조회
	//CommentsListVO sCommentsGetList();
	// comments 리스트 조회
	CommentsListVO sCommentsGetList(String pageNo);
	// contents 별 comments 리스트 조회
	CommentsListVO sCommentsGetListByContentsNo(String contentsNo);
	// contents 별 comments 리스트 조회
	CommentsListVO sCommentsGetListByContentsNo(String pageNo, String contentsNo);
	// comments 쓰기
	void sCommentsWrite(CommentsVO commentsVO);
	// contents 별 comments_star 총합 조회
	int sSumCommentsStars(String contentsNo);
	// comments 삭제
	void sCommentsDelete(int commentsNo);
	//내가 작성한 Comments 게시물 리스트
	CommentsListVO sMyCommentsGetList(String id);
	CommentsListVO sMyCommentsGetList(String id, String pageNo);
	// 해당 컨텐츠에 user의 아이디로 작성한 comments 유무 확인
	int sCheckWorteOrNot(String userId, String contentsNo);
	// 아이디별 comments list
	CommentsListVO sGetMyCommentsList(String id);
	CommentsListVO sGetMyCommentsList(String id, String pageNo);

}