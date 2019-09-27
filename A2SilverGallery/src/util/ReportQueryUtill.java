package util;

public class ReportQueryUtill {

	public static String createreportTableQuery() {
		String query = "CREATE TABLE report("+
						"report_Id INT(11) not null,"+
						"sName varchar(45),"+
						"tAttendance varchar(45),"+
						"holidays varchar(45),"+
						"status varchar(45),"+
						"primary key(report_Id)"+
						")";
		return query;
	}
	
	/*
	 *This returns the query for drop table if exist 
	 *@return String
	 * */
	public static String dropreportTableQuery() {
		String query = " DROP TABLE IF EXISTS report ";
		return query;
	}
	
	/*
	 * This returns the insert query for report Table
	 * @return String
	 * */
	public static String insertIntoreportTableQuery() {
		String query = "insert into report(reporte_Id,sName,tAttendance,holidays,status) values(?,?,?,?,?)";
		return query;
	}
	
	/*
	 * Returns the query for select a particular report
	 * @returns String
	 * */
	public static String selectreportByIdQuery() {
		String query  = "select  * from report where report.reporte_Id = ?";
		return query;
	}
	
	/*
	 * Select all report Query
	 * @return String
	 * */
	public static String selectAllreportQuery() {
		String query = "select * from report";
		return query;
	}
	
	/*
	 * delete report Query
	 * @return String
	 * */
	public static String deletereportQuery() {
		String query = "delete from report where report.report_Id = ?";
		return query;
	}
	
	/*
	 * return update query for report
	 * @retrn report
	 * */
	public static String updatereportQuery() {
		String query = "update report set sName = ?, tAttendance = ?, holidays = ?, status=?, where attendance_Id= ?";
		return query;
	}
	
	/*
	 * get reportIds Query
	 * */
	public static String getreportIdsQuery() {
		String query = "select r.report_Id from report as r";
		return query;
	}
}
