package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Notification;
import model.Staff;
import model.StaffBusService;
import util.BusServiceQueryUtil;
import util.DBConnectionUtil;
import util.NotificationQueryUtil;
import util.StaffQueryUtil;
import util.commonUtil;

public class NotificationServiceImp implements INotificationService {

	/*
	 * Initialize logger
	 * */
	public static final Logger log = Logger.getLogger(NotificationServiceImp.class.getName());
	
	private static Connection connection;
	
	private static Statement statement;
	
	private static PreparedStatement preparedStatement;
	
	
	@Override
	public void addNotification(Notification notification) {
		String NID = commonUtil.generateNotificationIDs(getNotificationIDs()); 
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(NotificationQueryUtil.insertIntoNotificationTableQuery());
			connection.setAutoCommit(false);
			
			//genereate ID
			notification.setNID(NID);
			preparedStatement.setString(1, notification.getNID());
			preparedStatement.setString(2, notification.getStaffID());
			preparedStatement.setString(3,notification.getEname());
			preparedStatement.setString(4, notification.getMassages());
			
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
	public ArrayList<Notification> getNotification() {
		return actionOnNotification(null);
	}


	@Override
	public Notification getNotificationByID(String NID) {
		return actionOnNotification(NID).get(0);
	}

	@Override
	public Notification updateNotification(String NID, Notification notification) {
		try {
			connection  = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(NotificationQueryUtil.updateNotificationQuery());
			
			preparedStatement.setString(1, notification.getStaffID());
			preparedStatement.setString(2,notification.getEname());
			preparedStatement.setString(3, notification.getMassages());
			preparedStatement.setString(4, notification.getNID());

			
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
		return getNotificationByID(NID);
	}

	@Override
	public void removeNotification(String NID) {
		// TODO Auto-generated method stub
		// Before deleting check whether staff ID is available
				if(NID != null && !NID.isEmpty() ) {
				//Remove Event Query will retrieved from EventQueryUtil
					try {
						connection = DBConnectionUtil.getDBConnection();
						preparedStatement = connection.prepareStatement(NotificationQueryUtil.deleteNotificationQuery());
						preparedStatement.setString(1, NID);
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
	
	
	public ArrayList<String> getNotificationIDs(){
		ArrayList<String> arrayList = new ArrayList <String>();
		
		/*
		 * List of Staff ID will be retrieved from StaffQueryUtil
		 * */
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(NotificationQueryUtil.getNotificationIdsQuery());
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
	
	
	
		ArrayList<Notification> actionOnNotification(String nID){
		
		ArrayList<Notification> NotificationList = new ArrayList<Notification>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			if(nID != null && !nID.isEmpty()) {
				preparedStatement = connection.prepareStatement(NotificationQueryUtil.selectNotificationByIdQuery());
				preparedStatement.setString(1,nID);
			}
			else {
				preparedStatement = connection.prepareStatement(NotificationQueryUtil.selectAllNotificationQuery());
			}
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Notification notification = new Notification();
				
				notification.setNID(resultSet.getString(1));
				notification.setStaffID(resultSet.getString(2));
				notification.setEname(resultSet.getString(3));
				notification.setMassages(resultSet.getString(4));
			

				
				NotificationList.add(notification);
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
		return NotificationList;
	}

}


