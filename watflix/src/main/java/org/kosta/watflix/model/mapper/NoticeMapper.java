package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.NoticeVO;
@Mapper
public interface NoticeMapper {
	
	int mNoticeGetTotalPostCount();
	
	List<NoticeVO> mNoticeGetList(PagingBean pageingBean);
	
	NoticeVO mNoticeGetDetailNoHits(int noticeNo);
	
	void mNoticeUpdateHits(int noticeNo);
	
	void mNoticeUpdate(NoticeVO noticeVO);

	void mNoticeWrite(NoticeVO noticeVO);
	
	void mNoticeDelete(int noticeNo);

}




