package service;

import java.util.List;

import model.attendance;

public interface IattendanceService {

	public String addattendance(attendance attendance);
	
	public List<attendance> readData();
	
	public attendance getAttendanceByID(String attendanceid);
	
	public void updateAttendance(attendance attendance);
	
	public void DeleteAttendance(String attendanceid);
}
