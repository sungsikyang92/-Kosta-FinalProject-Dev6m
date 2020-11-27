package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.NoticeListVO;
import org.kosta.watflix.model.vo.NoticeVO;

public interface NoticeService {
	
	NoticeVO sNoticeGetDetail(int noticeNo);
	void sNoticeUpdate(NoticeVO noticeVO);
	void sNoticeWrite(NoticeVO noticeVO);
}
