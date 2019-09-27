package util;

public class BusServiceQueryUtil {
	
	public static String createBusTableQuery() {
		String query = "CREATE TABLE StaffBusService("+
						"staffID varchar(10) not null,"+
						"Ename varchar(20),"+
						"BusNo int,"+
						"Destination varchar(20),"+
						"cost double"+
						"primary key(staffID)"+
						")";
		return query;
	}
	
	public static String dropBusTableQuery() {
		String query = " DROP TABLE IF EXISTS StaffBusService ";
		return query;
	}
	
	public static String insertIntoBusTableQuery() {
		String query = "insert into StaffBusService(BID,staffID,Ename,BusNo,Destination,cost) values(?,?,?,?,?,?)";
		return query;
	}
	
	public static String selectBusByIdQuery() {
		String query  = "select  * from StaffBusService where StaffBusService.BID = ?";
		return query;
	}
	
	public static String selectAllStaffBusServiceQuery() {
		String query = "select * from StaffBusService";
		return query;
	}

	public static String deleteStaffBusServiceQuery() {
		String query = "delete from StaffBusService where StaffBusService.BID = ?";
		return query;
	}
	
	public static String updateStaffBusServiceQuery() {
		String query = "update StaffBusService set staffID = ?, eName = ?, BusNo = ?, Destination = ?, cost = ? where BID= ?";
		return query;
	}
	
	public static String getStaffBusServiceIdsQuery() {
		String query = "select s1.BID from StaffBusService as s1";
		return query;
	}
	
	
}
