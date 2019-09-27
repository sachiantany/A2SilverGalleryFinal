package model;

public class StaffBusService {

	private String staffID;
	private String BID;
	private String Ename;
	private int BusNo;
	private String Destination;
	private double cost;
	
	
	public String getBID() {
		return BID;
	}
	public void setBID(String bID) {
		BID = bID;
	}
	public String getStaffID() {
		return staffID;
	}
	public void setStaffID(String staffID) {
		this.staffID = staffID;
	}
	public String getEname() {
		return Ename;
	}
	public void setEname(String ename) {
		Ename = ename;
	}
	public int getBusNo() {
		return BusNo;
	}
	public void setBusNo(int busNo) {
		BusNo = busNo;
	}
	public String getDestination() {
		return Destination;
	}
	public void setDestination(String destination) {
		Destination = destination;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	
	
	
	
}
