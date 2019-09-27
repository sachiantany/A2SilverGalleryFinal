package service;

import java.util.List;

import model.AdminLogin;
import model.AdminProduct;

public interface IAdminService {

	public String CheckAdmin(AdminLogin log);
	
	public String addProduct(AdminProduct product);
	
	public List<AdminProduct> readData();
	
	public AdminProduct getItemValues(String PID);
	
	public void UpdateItemValues(AdminProduct admin);
	
	public void DeleteItemValues(String PID);
}
