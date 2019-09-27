package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Staff;
import model.StaffBusService;
import util.BusServiceQueryUtil;
import util.DBConnectionUtil;
import util.StaffQueryUtil;
import util.commonUtil;

public class StaffBusServiceImp implements IStaffBusService {

	/*
	 * Initialize logger
	 * */
	public static final Logger log = Logger.getLogger(StaffServiceImp.class.getName());
	
	private static Connection connection;
	
	private static Statement statement;
	
	private static PreparedStatement preparedStatement;
	
	
	@Override
	public void addBus(StaffBusService staffBusService) {
		String BID = commonUtil.generateBusIDs(getBusIDs()); 

		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(BusServiceQueryUtil.insertIntoBusTableQuery());
			connection.setAutoCommit(false);
			
			//genereate ID
			staffBusService.setBID(BID);
			preparedStatement.setString(1, staffBusService.getBID());
			preparedStatement.setString(2, staffBusService.getStaffID());
			preparedStatement.setString(3,staffBusService.getEname());
			preparedStatement.setInt(4, staffBusService.getBusNo());
			preparedStatement.setString(5, staffBusService.getDestination());
			preparedStatement.setDouble(6, staffBusService.getCost());
			
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

	@Override
	public ArrayList<StaffBusService> getStaffBusService() {
		return actionOnStaffBusService(null);
	}


	@Override
	public StaffBusService getStaffBusServiceByID(String BID) {
		return actionOnStaffBusService(BID).get(0);
	}

	@Override
	public StaffBusService updateStaffBusService(String BID, StaffBusService staffBusService) {
		try {
			connection  = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(BusServiceQueryUtil.updateStaffBusServiceQuery());
			
			preparedStatement.setString(1, staffBusService.getStaffID());
			preparedStatement.setString(2,staffBusService.getEname());
			preparedStatement.setInt(3, staffBusService.getBusNo());
			preparedStatement.setString(4, staffBusService.getDestination());
			preparedStatement.setDouble(5, staffBusService.getCost());
			preparedStatement.setString(6, staffBusService.getBID());
			
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
		return getStaffBusServiceByID(BID);
	}

	@Override
	public void removeStaffBusService(String BID) {
		// TODO Auto-generated method stub
		// Before deleting check whether staff ID is available
				if(BID != null && !BID.isEmpty()) {
				//Remove Event Query will retrieved from EventQueryUtil
					try {
						connection = DBConnectionUtil.getDBConnection();
						preparedStatement = connection.prepareStatement(BusServiceQueryUtil.deleteStaffBusServiceQuery());
						preparedStatement.setString(1, BID);
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
	
	public ArrayList<String> getBusIDs(){
		ArrayList<String> arrayList = new ArrayList <String>();
		
		/*
		 * List of Staff ID will be retrieved from StaffQueryUtil
		 * */
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(BusServiceQueryUtil.getStaffBusServiceIdsQuery());
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
	
	
	
	
		ArrayList<StaffBusService> actionOnStaffBusService(String bID){
		
		ArrayList<StaffBusService> BusList = new ArrayList<StaffBusService>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			if(bID != null && !bID.isEmpty()) {
				preparedStatement = connection.prepareStatement(BusServiceQueryUtil.selectBusByIdQuery());
				preparedStatement.setString(1,bID);
			}
			else {
				preparedStatement = connection.prepareStatement(BusServiceQueryUtil.selectAllStaffBusServiceQuery());
			}
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				StaffBusService staffBusService = new StaffBusService();
				
				staffBusService.setBID(resultSet.getString(1));
				staffBusService.setStaffID(resultSet.getString(2));
				staffBusService.setEname(resultSet.getString(3));
				staffBusService.setBusNo(resultSet.getInt(4));
				staffBusService.setDestination(resultSet.getString(5));
				staffBusService.setCost(resultSet.getDouble(6));

				
				BusList.add(staffBusService);
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
		return BusList;
	}

}


