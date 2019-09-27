package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Salary;
import model.Staff;
import model.StaffLogin;
import util.DBConnectionUtil;
import util.StaffQueryUtil;
import util.commonUtil;

public class StaffServiceImp implements IStaffService{
	
	/*
	 * Initialize logger
	 * */
	public static final Logger log = Logger.getLogger(StaffServiceImp.class.getName());
	
	private static Connection connection;
	
	private static Statement statement;
	
	private static PreparedStatement preparedStatement;
	
	
	public String CheckAdmin(StaffLogin log) {

		String uname = log.getSid();
		String pass = log.getPassword();

		Connection con = null;
		Statement st = null;
		ResultSet rs = null;

		String userDB = "";
		String passDB = "";

		try {
			try {
				con = DBConnectionUtil.getDBConnection();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			st = con.createStatement();
			rs = st.executeQuery("select staffID,password from staff");

			while (rs.next()) {
				userDB = rs.getString("staffID");
				passDB = rs.getString("password");

				if (uname.equals(userDB) && pass.equals(passDB))
					return "True";
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Invalid user credentials";
		
	}

	@Override
	public void addStaff(Staff staff) {
		String staffID = commonUtil.generateIDs(getStaffIDs()); 
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(StaffQueryUtil.insertIntoStaffTableQuery());
			connection.setAutoCommit(false);
			
			//genereate ID
			staff.setStaffID(staffID);
			preparedStatement.setString(1, staff.getStaffID());
			preparedStatement.setString(2,staff.getEmployeeName());
			preparedStatement.setString(3, staff.getStreetAddress());
			preparedStatement.setString(4, staff.getCity());
			preparedStatement.setString(5,staff.getMobile());
			preparedStatement.setString(6,staff.getEmail());
			preparedStatement.setDouble(7, staff.getBasicSalary());
			preparedStatement.setDouble(8, staff.getFinalSal());
			
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
	 * Get all list of staff
	 * Method alreday implemented in actionOnStaff()
	 * @return ArrayList<Event>
	 * */
	@Override
	public ArrayList<Staff> getStaff() {
		return actionOnStaff(null);
	}

	/*
	 * Retrive the staff info based on staffID provided
	 * Method already implemented in actionOnStaff()
	 * @par StaffID
	 * @return single Staff Info
	 * */
	@Override
	public Staff getStaffByID(String StaffID) {
		return actionOnStaff(StaffID).get(0);
	}

	/*
	 * get the updated staff
	 * @par staffID
	 * @return staff object
	 * */
	@Override
	public Staff updateStaff(String StaffID, Staff staff) {
		/*
		 * Before fetching event it check whether staffID is not null
		 * */
		
		try {
			connection  = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(StaffQueryUtil.updateStaffQuery());
			
			preparedStatement.setString(1, staff.getEmployeeName());
			preparedStatement.setString(2, staff.getStreetAddress());
			preparedStatement.setString(3,staff.getCity());
			preparedStatement.setString(4,staff.getMobile());
			preparedStatement.setString(5, staff.getEmail());
			preparedStatement.setDouble(6, staff.getBasicSalary());
			preparedStatement.setDouble(7, staff.getFinalSal());
			preparedStatement.setString(8, staff.getStaffID());
			
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
		return getStaffByID(StaffID);
	}

	/*
	 * Delete an staff based on staffID provided
	 * @par staffID
	 * */
	@Override
	public void removeStaff(String StaffID) {
		
		// Before deleting check whether staff ID is available
		if(StaffID != null && !StaffID.isEmpty()) {
		//Remove Event Query will retrieved from EventQueryUtil
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(StaffQueryUtil.deleteStafftQuery());
				preparedStatement.setString(1, StaffID);
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
	 * This method returns array list of staff IDs to generate the ID of new Staff
	 * */
	public ArrayList<String> getStaffIDs(){
		ArrayList<String> arrayList = new ArrayList <String>();
		
		/*
		 * List of Staff ID will be retrieved from StaffQueryUtil
		 * */
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(StaffQueryUtil.getStafftIdsQuery());
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
	 * This performs get staff ID and list all Staff Members
	 * */
	ArrayList<Staff> actionOnStaff(String staffID){
		
		ArrayList<Staff> staffList = new ArrayList<Staff>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			//Before fetching checks whether staffID is not null
			//used to operate on a purticular member
			if(staffID != null && !staffID.isEmpty()) {
				preparedStatement = connection.prepareStatement(StaffQueryUtil.selectStafftByIdQuery());;
				preparedStatement.setString(1,staffID);
			}
			else {
				preparedStatement = connection.prepareStatement(StaffQueryUtil.selectAllStaffQuery());
			}
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Staff staff = new Staff();
				staff.setStaffID(resultSet.getString(1));
				staff.setEmployeeName(resultSet.getString(2));
				staff.setStreetAddress(resultSet.getString(3));
				staff.setCity(resultSet.getString(4));
				staff.setMobile(resultSet.getString(5));
				staff.setEmail(resultSet.getString(6));
				staff.setBasicSalary(resultSet.getDouble(7));
				staff.setFinalSal(resultSet.getDouble(8));
				
				staffList.add(staff);
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
		return staffList;
	}
	
	
	 public ArrayList<Salary> calculateStaffSalary(String month, String year){
		ArrayList<Salary> salaryList = new ArrayList<Salary>();
		
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(StaffQueryUtil.calcSalaryQuery1());
			preparedStatement.setString(1, month);
		 	preparedStatement.setString(2,year);

			ResultSet resultSet = preparedStatement.executeQuery();


			while(resultSet.next()) {
				Salary salary = new Salary();
				salary.setStaffID(resultSet.getString(1));
				salary.setEmployeeName(resultSet.getString(2));
				salary.setBasicSalary(resultSet.getDouble(3));
				salary.setFinalSalary(resultSet.getDouble(4));
				
				salaryList.add(salary);
			}
			
		}catch(Exception e) {
			log.log(Level.SEVERE, e.getMessage());
		}finally {
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
		return salaryList;
		
		
	}
	
	

}
