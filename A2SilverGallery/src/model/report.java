package model;

public class report {

	private String reportid;

	private String sname;
	
	private String tattendance;
	
	private String holiday;
	
	private String status;

	public String getreportid() {
		return reportid;
	}

	public void setreportid(String staffid) {
		this.reportid = staffid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getTattendance() {
		return tattendance;
	}

	public void setTattendance(String tattendance) {
		this.tattendance = tattendance;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
