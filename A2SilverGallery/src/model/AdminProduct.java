package model;


import javax.servlet.http.Part;

public class AdminProduct {

	private int PID;
	private String productName;
	private String productCat;
	private int quantity;
	private String settingWith;
	private String metalWeight;
	private String stoneWeight;
	private String description;
	private double price;
	private Part image;
	private String imageData;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductCat() {
		return productCat;
	}
	public void setProductCat(String productCat) {
		this.productCat = productCat;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getSettingWith() {
		return settingWith;
	}
	public void setSettingWith(String settingWith) {
		this.settingWith = settingWith;
	}
	public String getMetalWeight() {
		return metalWeight;
	}
	public void setMetalWeight(String metalWeight) {
		this.metalWeight = metalWeight;
	}
	public String getStoneWeight() {
		return stoneWeight;
	}
	public void setStoneWeight(String stoneWeight) {
		this.stoneWeight = stoneWeight;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Part getImage() {
		return image;
	}
	public void setImage(Part part) {
		this.image = part;
	}
	public int getPID() {
		return PID;
	}
	public void setPID(int pID) {
		PID = pID;
	}
	public String getImageData() {
		return imageData;
	}
	public void setImageData(String base64Encoded) {
		this.imageData = base64Encoded;
	}
	
	
}
