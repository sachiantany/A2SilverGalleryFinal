package util;

public class AttendanceQueryUtill {

	public static String createattendanceTableQuery() {
		String query = "CREATE TABLE attendance("+
						"attendanceId INT(11) not null,"+
						"sName varchar(45),"+
						"tAttendance varchar(45),"+
						"holidays varchar(45),"+
						"primary key(attendance-Id)"+
						")";
		return query;
	}
	
	/*
	 *This returns the query for drop table if exist 
	 *@return String
	 * */
	public static String dropattendanceTableQuery() {
		String query = " DROP TABLE IF EXISTS attendance ";
		return query;
	}
	
	/*
	 * This returns the insert query for attendance Table
	 * @return String
	 * */
	public static String insertIntoattendanceTableQuery() {
		String query = "insert into attendance(attendanceId,sName,tAttendance,holidays) values(?,?,?,?)";
		return query;
	}
	
	/*
	 * Returns the query for select a particular attendance
	 * @returns String
	 * */
	public static String selectattendancetByIdQuery() {
		String query  = "select  * from attendance where attendance.attendanceId = ?";
		return query;
	}
	
	/*
	 * Select all attendance Query
	 * @return String
	 * */
	public static String selectAllattendanceQuery() {
		String query = "select * from attendance";
		return query;
	}
	
	/*
	 * delete attendance Query
	 * @return String
	 * */
	public static String deleteattendanceQuery() {
		String query = "delete from attendance where attendance.attendanceId = ?";
		return query;
	}
	
	/*
	 * return update query for attendance
	 * @retrn attendance
	 * */
	public static String updateattendanceQuery() {
		String query = "update attendance set sName = ?, tAttendance = ?, holidays = ?, where attendanceId= ?";
		return query;
	}
	
	/*
	 * get attendanceIds Query
	 * */
	public static String getattendanceIdsQuery() {
		String query = "select a.attendanceId from attendance as a";
		return query;
	}
}
