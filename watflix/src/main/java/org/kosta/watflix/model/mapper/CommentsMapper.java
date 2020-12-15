package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.ReviewVO;
@Mapper
public interface CommentsMapper {
	
	int mCommentsGetTotalPostCount();
	
	int mGetMyTotalCommentsCount(String id);

	int mCommentsGetTotalPostCountByContentNo(String contentsNo);
	
	List<CommentsVO> mCommentsGetAllList(PagingBean pagingBean);
	// 아이디별 comments list
	List<CommentsVO> mCommentsGetMyList(@Param("id") String id, @Param("pagingBean") PagingBean pagingBean);

	List<CommentsVO> mCommentsGetListByContentsNo (@Param("pagingBean") PagingBean pagingBean, @Param("contentsNo") String contentsNo);
	
	void mCommentsWrite(CommentsVO commentsVO);
	// contents 별 comments_star 총합 조회
	int mSumCommentsStars(String contentsNo);
	
	void mCommentsDelete(int commentsNo);
	
	// 내가 작성한 Comments 게시물 전체 수 조회
	int mMyCommentsGetTotalPostCount(String id);
	// 내가 작성한 Comments 게시물 리스트 조회
	List<CommentsVO> mMyCommentsGetAllList(@Param("id")String id, @Param("pagingBean")PagingBean pagingBean);
	// 해당 컨텐츠에서 동일한 아이디가 작성한 comments 유무 조회
	int mCheckWorteOrNot(@Param("userId")String id, @Param("contentsNo")String contentsNo);

}




