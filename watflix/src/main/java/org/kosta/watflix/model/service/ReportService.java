package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ReportVO;

public interface ReportService {
	
	ReportVO sReportGetDetailNoHits(int reportNo);

	void sReportWrite(ReportVO reportVO);
}
