package model;

public class Notification {

	private String NID;
	private String Ename;
	private String staffID;
	private String Massages;
	
	
	public String getStaffID() {
		return staffID;
	}
	public void setStaffID(String staffID) {
		this.staffID = staffID;
	}
	public String getNID() {
		return NID;
	}
	public void setNID(String nID) {
		NID = nID;
	}
	public String getEname() {
		return Ename;
	}
	public void setEname(String ename) {
		Ename = ename;
	}
	public String getMassages() {
		return Massages;
	}
	public void setMassages(String Massages) {
		this.Massages = Massages;
	}
	
}
