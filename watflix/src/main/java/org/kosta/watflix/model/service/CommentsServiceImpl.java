package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.CommentsMapper;
import org.kosta.watflix.model.vo.CommentsListVO;
import org.kosta.watflix.model.vo.CommentsVO;
import org.springframework.stereotype.Service;

@Service
public class CommentsServiceImpl implements CommentsService {
	@Resource
	CommentsMapper commentsMapper;
	
	@Override
	public int sCommentsGetTotalPostCount() {
		return commentsMapper.mCommentsGetTotalPostCount();
	}
	
	@Override
	public int sCommentsGetTotalPostCountByContentNo(String contentsNo) {
		return commentsMapper.mCommentsGetTotalPostCountByContentNo(contentsNo);
	}
	
	@Override
	public CommentsListVO sCommentsGetList() {
		return sCommentsGetList("1");
	}
	
	@Override
	public CommentsListVO sCommentsGetList(String pageNo) {
		int totalPostCount = commentsMapper.mCommentsGetTotalPostCount();
		PagingBean pagingBean = null;
		if(pageNo==null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		CommentsListVO commentsListVO = new CommentsListVO(commentsMapper.mCommentsGetAllList(pagingBean), pagingBean);
		return commentsListVO;
	}
	
	@Override
	public CommentsListVO sCommentsGetListByContentsNo(String contentsNo) {
		return sCommentsGetListByContentsNo("1", contentsNo);
	}
	
	@Override
	public CommentsListVO sCommentsGetListByContentsNo(String pageNo, String contentsNo) {
		int totalPostCount = commentsMapper.mCommentsGetTotalPostCountByContentNo(contentsNo);
		PagingBean pagingBean = null;
		if(pageNo==null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		CommentsListVO commentsListVO = new CommentsListVO(commentsMapper.mCommentsGetListByContentsNo(pagingBean, contentsNo), pagingBean);
		return commentsListVO;
	}

	@Override
	public void sCommentsWrite(CommentsVO commentsVO) {
		commentsMapper.mCommentsWrite(commentsVO);		
	}

	@Override
	public void sCommentsDelete(int commentsNo) {
		commentsMapper.mCommentsDelete(commentsNo);
		
	}
}
