package util;

public class StaffQueryUtil {
	
	
	/*
	 * Query for create Staff table
	 * */
	public static String createStaffTableQuery() {
		String query = "CREATE TABLE staff("+
						"staffId varchar(10) not null,"+
						"employeeName varchar(20),"+
						"streetAddress varchar(50),"+
						"city varchar(20),"+
						"mobile varchar(10),"+
						"email varchar(50)"+
						"basicSalary double"+
						"finalSalary double"+
						"primary key(staffId)"+
						")";
		return query;
	}
	
	/*This query return the final salary of employees by adding the sale comission*/
	public static String calcSalaryQuery1() {
		String query = "select st.staffID,st.employeeName,st.basicSalary,(st.basicSalary+(sum(totalPrice)*5/100))" + 
				" from staff st LEFT JOIN sales s" + 
				" on st.staffID = s.staffID" + 
				" and month(saleDate) = ?"+ 
				" and year(saledate) = ?"+ 
				" group by st.staffID,st.employeeName";
		
		return query;
	}
	
	
	
	
	
	/*This query return the final salary of employees by adding the sale comission*/
	public static String calcSalaryQuery() {
		String query = "select st.staffID,st.employeeName,(st.basicSalary+(sum(total)*5/100))" + 
				" from sales s, staff st" + 
				" where st.staffID = s.staffID" + 
				" and month(saleDate) = ?"+ 
				" and year(saledate) = ?"+ 
				" group by st.staffID,st.employeeName";
		
		return query;
	}
	
	
	/*
	 *This returns the query for drop table if exist 
	 *@return String
	 * */
	public static String dropStaffTableQuery() {
		String query = " DROP TABLE IF EXISTS staff ";
		return query;
	}
	
	/*
	 * This returns the insert query for staff Table
	 * @return String
	 * */
	public static String insertIntoStaffTableQuery() {
		String query = "insert into staff(staffID,employeeName,streetAddress,city,mobile,email,basicSalary,finalSalary) values(?,?,?,?,?,?,?,?)";
		return query;
	}
	
	/*
	 * Returns the query for select a particular Staff
	 * @returns String
	 * */
	public static String selectStafftByIdQuery() {
		String query  = "select  * from staff where staff.staffId = ?";
		return query;
	}
	
	/*
	 * Select all staff Query
	 * @return String
	 * */
	public static String selectAllStaffQuery() {
		String query = "select * from staff";
		return query;
	}
	
	/*
	 * delete staff Query
	 * @return String
	 * */
	public static String deleteStafftQuery() {
		String query = "delete from staff where staff.staffID = ?";
		return query;
	}
	
	/*
	 * return update query for staff
	 * @retrn staff
	 * */
	public static String updateStaffQuery() {
		String query = "update staff set employeeName = ?, streetAddress = ?, city = ?, mobile = ?, email = ?,basicSalary = ?,finalSalary = ? where staffId= ?";
		return query;
	}
	
	/*
	 * get StaffIds Query
	 * */
	public static String getStafftIdsQuery() {
		String query = "select s.staffId from staff as s";
		return query;
	}
}
