package service;

import java.util.ArrayList;
import java.util.logging.Logger;

import model.Staff;
import model.StaffBusService;

public interface IStaffBusService {

public static final Logger log  = Logger.getLogger(IStaffBusService.class.getName());
	

	public void addBus(StaffBusService staffBusService);
	

	public ArrayList<StaffBusService> getStaffBusService();
	

	public StaffBusService getStaffBusServiceByID(String BID);
	

	public StaffBusService updateStaffBusService(String BID, StaffBusService staffBusService);
	

	public void removeStaffBusService(String BID);
}

