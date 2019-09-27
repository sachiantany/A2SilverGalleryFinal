package model;

import javax.servlet.http.Part;

public class CustomOrder {

	private int CID;
	private String JType;
	private String gemStone;
	private int fingerSize;
	private int metalWeight;
	private String description;
	private Part image;
	private String imageData;
	
	
	public int getCID() {
		return CID;
	}
	public void setCID(int cID) {
		CID = cID;
	}
	public String getJType() {
		return JType;
	}
	public void setJType(String jType) {
		JType = jType;
	}
	public String getGemStone() {
		return gemStone;
	}
	public void setGemStone(String gemStone) {
		this.gemStone = gemStone;
	}
	public int getFingerSize() {
		return fingerSize;
	}
	public void setFingerSize(int fingerSize) {
		this.fingerSize = fingerSize;
	}
	public int getMetalWeight() {
		return metalWeight;
	}
	public void setMetalWeight(int metalWeight) {
		this.metalWeight = metalWeight;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Part getImage() {
		return image;
	}
	public void setImage(Part image) {
		this.image = image;
	}
	public String getImageData() {
		return imageData;
	}
	public void setImageData(String imageData) {
		this.imageData = imageData;
	}
	

	
}


