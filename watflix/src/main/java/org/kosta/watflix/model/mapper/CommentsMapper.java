package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.CommentsVO;
@Mapper
public interface CommentsMapper {
	
	int mCommentsGetTotalPostCount();

	int mCommentsGetTotalPostCountByContentNo(int contentsNo);
	
	List<CommentsVO> mCommentsGetAllList(PagingBean pagingBean);

	List<CommentsVO> mCommentsGetListByContentsNo (@Param("pagingBean") PagingBean pagingBean, @Param("contentsNo") int contentsNo);
	
	void mCommentsWrite(CommentsVO commentsVO);
	
	void mCommentsDelete(int commentsNo);
}




