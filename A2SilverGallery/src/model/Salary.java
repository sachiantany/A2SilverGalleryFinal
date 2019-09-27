package model;

public class Salary {
	private String StaffID;
	private String employeeName;
	private String month;
	private String year;
	private double finalSalary;
	private double basicSalary;

	
	public double getBasicSalary() {
		return basicSalary;
	}
	public void setBasicSalary(double basicSalary) {
		this.basicSalary = basicSalary;
	}
	public String getStaffID() {
		return StaffID;
	}
	public void setStaffID(String staffID) {
		StaffID = staffID;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getMonth() {
		return month;
	}
	public String setMonth(String month) {
		return this.month = month;
	}
	public String getYear() {
		return year;
	}
	public String setYear(String year) {
		return this.year = year;
	}
	public double getFinalSalary() {
		return finalSalary;
	}
	public void setFinalSalary(double finalSalary) {
		this.finalSalary = finalSalary;
	}
	
	

}
