package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.CommentsMapper;
import org.kosta.watflix.model.vo.CommentsListVO;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.ReviewListVO;
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
	
	//@Override
	//public CommentsListVO sCommentsGetList() {
	//	System.out.println("sCommentsGetList() 실행");
	//	return sCommentsGetList("1");
	//}
	
	@Override
	public CommentsListVO sCommentsGetList(String pageNo) {
		int totalPostCount = commentsMapper.mCommentsGetTotalPostCount();
		PagingBean pagingBean = null;
		int pageNumberPerPageGroup=5;
		if(pageNo==null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			int contentNumberPerPage=10;
			pagingBean = new PagingBean(totalPostCount, contentNumberPerPage, pageNumberPerPageGroup, Integer.parseInt(pageNo));
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
	// contents 별 comments_star 총합 조회
	@Override
	public int sSumCommentsStars(String contentsNo) {
		return commentsMapper.mSumCommentsStars(contentsNo);
	}

	@Override
	public void sCommentsDelete(int commentsNo) {
		commentsMapper.mCommentsDelete(commentsNo);		
	}

	// 내가 작성한 Comments 게시물 리스트
	@Override
	public CommentsListVO sMyCommentsGetList(String id) {
		return sMyCommentsGetList(id, "1");
	}
	@Override
	public CommentsListVO sMyCommentsGetList(String id, String pageNo) {
		int myCommentsTotalCount = commentsMapper.mMyCommentsGetTotalPostCount(id);
		PagingBean pagingBean = null;
		if(pageNo == null) {
			pagingBean = new PagingBean(myCommentsTotalCount);
		}else {
			pagingBean = new PagingBean(myCommentsTotalCount, Integer.parseInt(pageNo));
		}
		CommentsListVO commentsListVO = new CommentsListVO(commentsMapper.mMyCommentsGetAllList(id, pagingBean),pagingBean);
		return commentsListVO;
	}
	// 해당 컨텐츠에 user의 아이디로 작성한 comments 유무 확인
	@Override
	public int sCheckWorteOrNot(String userId, String contentsNo) {
		return commentsMapper.mCheckWorteOrNot(userId, contentsNo);
				
	}

	// commentsNo에 대응하는 comments 게시물 조회
	@Override
	public CommentsVO sGetCommentsByCommentsNo(int commentsNo) {
		return commentsMapper.mGetCommentsByCommentsNo(commentsNo);
	}

	// 내 comments 리스트
		@Override
		public CommentsListVO sGetMyCommentsList(String id) {
			System.out.println("sGetMyCommentsList(id) 실행");
			return sGetMyCommentsList(id, "1");
		}
		@Override
		public CommentsListVO sGetMyCommentsList(String id, String pageNo) {
			System.out.println("sGetMyCommentsList(id, pageNo) 실행");
			int myCommentsTotalCount = commentsMapper.mGetMyTotalCommentsCount(id);
			System.out.println("myCommentsTotalCount : "+myCommentsTotalCount);
			PagingBean pagingBean = null;
			if(pageNo == null) {
				pagingBean = new PagingBean(myCommentsTotalCount);
			}else {
				pagingBean = new PagingBean(myCommentsTotalCount, Integer.parseInt(pageNo));
			}
			CommentsListVO commentsListVO = new CommentsListVO(commentsMapper.mCommentsGetMyList(id, pagingBean), pagingBean);
			System.out.println("commentsListVO : " + commentsListVO);
			return commentsListVO;
		}

}
