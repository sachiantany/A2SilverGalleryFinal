package service;

import java.util.ArrayList;
import java.util.logging.Logger;


import model.Staff;
import model.StaffLogin;

public interface IStaffService {

	public static final Logger log  = Logger.getLogger(IStaffService.class.getName());
	
	
	public String CheckAdmin(StaffLogin log);
	/*
	 *Add Staff Into Staff Table 
	 */
	public void addStaff(Staff staff);
	
	/*
	 * Display the list of Staff in the Database
	 * */
	public ArrayList<Staff> getStaff();
	
	/*
	 * To get apurticular Staff by ID
	 * @input par StaffID
	 * @return Staff
	 * */
	public Staff getStaffByID(String StaffID);
	
	/*
	 * Update an existing staff Data
	 * @input par StaffID
	 * @return Staff
	 * */
	public Staff updateStaff(String StaffID, Staff staff);
	
	/*
	 * Remove existing Staff
	 * @par StaffID
	 * */
	public void removeStaff(String StaffID);
}
