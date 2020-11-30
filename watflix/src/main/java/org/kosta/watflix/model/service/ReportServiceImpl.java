package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ReportMapper;
import org.kosta.watflix.model.vo.ReportVO;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService {
	@Resource
	ReportMapper reportMapper;

	@Override
	public ReportVO sReportGetDetailNoHits(int reportNo) {
		ReportVO reportVO = reportMapper.mReportGetDetailNoHits(reportNo);
		return reportVO;
	}

	@Override
	public void sReportWrite(ReportVO reportVO) {
		reportMapper.mReportWrite(reportVO);
		
	}

	@Override
	public void sReportDelete(int reviewNo) {
		reportMapper.mReportDelete(reviewNo);
	}
}
