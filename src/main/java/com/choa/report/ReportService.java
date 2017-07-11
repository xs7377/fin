package com.choa.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.util.PageMaker;
import com.choa.util.RowMaker;

@Service
public class ReportService {

	@Inject
	private ReportDAO reportDAO;
	
	
	public Map<String, Object> reportList(int curPage) throws Exception{
		return reportDAO.reportList(curPage);
	}
	
	public ReportDTO reportView(int num) throws Exception{
		return reportDAO.reportView(num);
	}
	
	public ReportDTO reportCheck(ReportDTO reportDTO) throws Exception{
		return reportDAO.reportCheck(reportDTO);
	}
	
	public int report(ReportDTO reportDTO) throws Exception{
		return reportDAO.report(reportDTO);
	}
	
	public int reportRead(int num) throws Exception{
		return reportDAO.reportRead(num);
	}
	
	public int reportDelete(int num) throws Exception{
		return reportDAO.reportDelete(num);
	}
	
	
	public int reportCount(String to_id) throws Exception{
		return reportDAO.reportCount(to_id);
	}
	
	public int reportRollback(int num) throws Exception{
		return reportDAO.reportRollback(num);
	}
	
}
