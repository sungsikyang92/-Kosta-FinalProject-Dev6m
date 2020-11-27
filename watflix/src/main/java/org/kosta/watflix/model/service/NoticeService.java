package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.NoticeListVO;
import org.kosta.watflix.model.vo.NoticeVO;

public interface NoticeService {
	
	NoticeListVO sNoticeGetList();
	
	NoticeListVO sNoticeGetList(String pageNo);
	
	NoticeVO sNoticeGetDetail(int noticeNo);
	
	void sNoticeUpdate(NoticeVO noticeVO);
}
