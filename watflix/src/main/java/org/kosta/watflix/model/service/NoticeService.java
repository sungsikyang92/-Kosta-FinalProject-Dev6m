package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.NoticeListVO;

public interface NoticeService {
	
	NoticeListVO sNoticeGetList();
	
	NoticeListVO sNoticeGetList(String pageNo);
	
}
