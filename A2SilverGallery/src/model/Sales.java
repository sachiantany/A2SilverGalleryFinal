package model;

public class Sales {
	private String salesID;
	private String formName;
	private String staffID;
	private double discount;
	private double subTotal;
	private double totalPrice;
	private String date;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSalesID() {
		return salesID;
	}
	public void setSalesID(String salesID) {
		this.salesID = salesID;
	}
	
	public String getCustomerName() {
		return formName;
	}
	public void setCustomerName(String customerName) {
		this.formName = customerName;
	}
	public double getAmount() {
		return subTotal;
	}
	public void setAmount(double subTotal) {
		this.subTotal= subTotal;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public double getTotal() {
		return totalPrice;
	}
	public void setTotal(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getStaffID() {
		return staffID;
	}
	public void setStaffID(String staffID) {
		this.staffID = staffID;  
		
	}
	
	
	
	
}
