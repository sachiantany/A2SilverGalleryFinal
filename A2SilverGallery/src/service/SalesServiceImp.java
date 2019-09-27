package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Sales;
import util.DBConnectionUtil;
import util.SalesQueryUtil;
import util.commonUtil;

public class SalesServiceImp implements ISalesService{
	
	/*
	 * Initialize logger
	 * */
	public static final Logger log = Logger.getLogger(SalesServiceImp.class.getName());
	
	private static Connection connection;
	
	private static Statement statement;
	
	private static PreparedStatement preparedStatement;
	
	

	@Override
	public void addSales(Sales sales) {
		String salesID = commonUtil.generateSaleIDs(getSalesIDs()); 
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(SalesQueryUtil.insertIntoSalesTableQuery());
			connection.setAutoCommit(false);
			
			//genereate ID
			sales.setSalesID(salesID);
			preparedStatement.setString(1, sales.getSalesID());
			preparedStatement.setString(2, sales.getCustomerName());
			preparedStatement.setString(3, sales.getStaffID());
			preparedStatement.setDouble(4,sales.getDiscount());
			preparedStatement.setDouble(5,sales.getAmount());
			preparedStatement.setDouble(6, sales.getTotal());
			preparedStatement.setString(7, sales.getDate());
		
			
			preparedStatement.executeUpdate();
			connection.commit();
		} catch (ClassNotFoundException | SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		
	}
	
	/*
	 * Get all list of Sales
	 * Method alreday implemented in actionOnSales()
	 * @return ArrayList<Event>
	 * */
	@Override
	public ArrayList<Sales> getSales() {
		return actionOnSales(null);
	}

	/*
	 * Retrive the Sales info based on SalesID provided
	 * Method already implemented in actionOnSales()
	 * @par SalesID
	 * @return single Sales Info
	 * */
	@Override
	public Sales getSalesByID(String SalesID) {
		return actionOnSales(SalesID).get(0);
	}

	/*
	 * get the updated Sales
	 * @par SalesID
	 * @return Sales object
	 * */
	@Override
	public Sales updateSales(String SalesID, Sales sales) {
		/*
		 * Before fetching event it check whether SalesID is not null
		 * */
		
		try {
			connection  = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(SalesQueryUtil.updateSalesQuery());
			
			
		
			preparedStatement.setString(1,sales.getCustomerName());
			preparedStatement.setString(2,sales.getStaffID());
			preparedStatement.setDouble(3, sales.getAmount());
			preparedStatement.setDouble(4, sales.getDiscount());
			preparedStatement.setDouble(5, sales.getTotal());
			preparedStatement.setString(6, sales.getSalesID());
		
			
			preparedStatement.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		}finally {
			/*
			 * Close prepared statement and database connectivity at the end
			 * of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return getSalesByID(SalesID);
	}

	/*
	 * Delete an Sales based on SalesID provided
	 * @par SalesID
	 * */
	@Override
	public void removeSales(String SalesID) {
		
		// Before deleting check whether Sales ID is available
		if(SalesID != null && !SalesID.isEmpty()) {
		//Remove Event Query will retrieved from EventQueryUtil
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(SalesQueryUtil.deleteSalesQuery());
				preparedStatement.setString(1, SalesID);
				preparedStatement.executeUpdate();
				
			} catch (ClassNotFoundException | SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			} finally {
				/*
				 * Close prepared statement and database connectivity at the end
				 * of transaction
				 */
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}

		}

	}
	
	/*
	 * This method returns array list of Sales IDs to generate the ID of new Sales
	 * */
	public ArrayList<String> getSalesIDs(){
		ArrayList<String> arrayList = new ArrayList <String>();
		
		/*
		 * List of Sales ID will be retrieved from SalesQueryUtil
		 * */
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(SalesQueryUtil.getSalesIdsQuery());
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				arrayList.add(resultSet.getString(1));
			}
			
		} catch (ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		}finally {
			/*
			 * closin the prepared statement and database connectivity
			 * */
			try {
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
				}
		}
		return arrayList;
	}
	
	/*
	 * This performs get Sales ID and list all Sales Members
	 * */
	ArrayList<Sales> actionOnSales(String salesID){
		
		ArrayList<Sales> salesList = new ArrayList<Sales>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			//Before fetching checks whether SalesID is not null
			//used to operate on a purticular member
			if(salesID != null && !salesID.isEmpty()) {
				preparedStatement = connection.prepareStatement(SalesQueryUtil.selectSalesByIdQuery());;
				preparedStatement.setString(1,salesID);
			}
			else {
				preparedStatement = connection.prepareStatement(SalesQueryUtil.selectAllSalesQuery());
			}
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Sales sales = new Sales();
				
				sales.setSalesID(resultSet.getString(1));
				sales.setDate(resultSet.getString(2));
				sales.setCustomerName(resultSet.getString(3));
				sales.setStaffID(resultSet.getString(4));
				sales.setDiscount(resultSet.getDouble(5));
				sales.setAmount(resultSet.getDouble(6));
				sales.setTotal(resultSet.getDouble(7));
				
				
				salesList.add(sales);
			}
		} catch (ClassNotFoundException | SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return salesList;
	}

}
