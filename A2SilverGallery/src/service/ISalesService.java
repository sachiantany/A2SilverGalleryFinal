package service;

import java.util.ArrayList;
import java.util.logging.Logger;

import model.Sales;

public interface ISalesService {

	public static final Logger log  = Logger.getLogger(ISalesService.class.getName());
	
	
	/*
	 *Add Sales Into Staff Table 
	 */
	public void addSales(Sales sales);
	
	/*
	 * Display the list of Sales in the Database
	 * */
	public ArrayList<Sales> getSales();
	
	/*
	 * To get apurticular Sales by ID
	 * @input par SalesID
	 * @return Sales
	 * */
	public Sales getSalesByID(String SalesID);
	
	/*
	 * Update an existing Sales Data
	 * @input par SalesID
	 * @return Sales
	 * */
	public Sales updateSales(String SalesID, Sales sales);
	
	/*
	 * Remove existing Sales
	 * @par SalesID
	 * */
	public void removeSales(String SalesID);
}
