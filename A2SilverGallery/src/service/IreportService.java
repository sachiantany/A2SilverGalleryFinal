package service;

import java.util.List;

import model.report;

public interface IreportService {

	public String addReport(report report);
	
	public List<report> readData();
	
	public report getReportByID(String reportid);
	
	public void updateReport(String reportid, report report);
	
	public void DeleteReport(String reportid);
	
	
}
