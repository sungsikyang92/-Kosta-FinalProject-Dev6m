package org.kosta.watflix.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.ReportVO;
@Mapper
public interface ReportMapper {
	ReportVO mReportGetDetailNoHits(int reportNo);

	void mReportWriteComments(ReportVO reportVO);
	
	void mReportWriteReview(ReportVO reportVO);

}




