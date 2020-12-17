package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.CommentsMapper;
import org.kosta.watflix.model.mapper.MemberMapper;
import org.kosta.watflix.model.mapper.PointHistoryMapper;
import org.kosta.watflix.model.vo.CommentsListVO;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class CommentsServiceImpl implements CommentsService {
	@Resource
	CommentsMapper commentsMapper;
	@Resource
	MemberMapper memberMapper;
	@Resource
	PointHistoryMapper pointHistoryMapper;
	
	@Override
	public int sCommentsGetTotalPostCount() {
		return commentsMapper.mCommentsGetTotalPostCount();
	}
	
	@Override
	public int sCommentsGetTotalPostCountByContentNo(String contentsNo) {
		return commentsMapper.mCommentsGetTotalPostCountByContentNo(contentsNo);
	}
			
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
		// 컨트롤러에서 전달받은 commentsVo의 신규 글을 db에 저장한다.
		commentsMapper.mCommentsWrite(commentsVO);
		// 포인트 증가 관련
		// 컨트롤러에서 전달받은 memberVO의 point(신규 평점 작성으로 증가한 point)를 member테이블의 point에 저장한다. 
		memberMapper.mMemberPointUpdate(commentsVO.getMemberVO());
		// 컨트롤러에서 전달받은 commentsNo와 id로 history에 넣는다.
		pointHistoryMapper.mPointHistoryAddWithComments(commentsVO.getCommentsNo(), commentsVO.getMemberVO().getId());
		// 평균 별점 관련
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
	public CommentsListVO sMyCommentsGetList(String id, String pageNo) {
		System.out.println(commentsMapper.mMyCommentsGetTotalPostCount(id));
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
}