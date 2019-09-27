package service;

import java.util.List;

import model.CustomOrder;


public interface ICustomService {
	
	
	public String addProduct(CustomOrder product);
	
	public List<CustomOrder> readData();
	
	public CustomOrder getItemValues(String PID);
	
	public void UpdateItemValues(CustomOrder admin);
	
	public void DeleteItemValues(String PID);	
}
