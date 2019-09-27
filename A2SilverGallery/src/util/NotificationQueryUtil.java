package util;

public class NotificationQueryUtil {
	
	public static String createNotificationTableQuery() {
		String query = "CREATE TABLE Notification("+
						"NID varchar(10)"+
						"staffID varchar(10) not null,"+
						"Ename varchar(20),"+
						"Massages varchar(1000),"+"primary key(NID)"+
						")";
		return query;
	}
	
	public static String dropNotificationTableQuery() {
		String query = " DROP TABLE IF EXISTS Notification ";
		return query;
	}
	
	public static String insertIntoNotificationTableQuery() {
		String query = "insert into Notification(NID,staffID,Ename,Massages) values(?,?,?,?)";
		return query;
	}
	
	public static String selectNotificationByIdQuery() {
		String query  = "select  * from Notification where Notification.NID = ?";
		return query;
	}
	
	public static String selectAllNotificationQuery() {
		String query = "select * from Notification";
		return query;
	}

	public static String deleteNotificationQuery() {
		String query = "delete from Notification where Notification.NID = ?";
		return query;
	}
	
	public static String updateNotificationQuery() {
		String query = "update Notification set staffID = ?, eName = ?, Massages = ? where NID= ?";
		return query;
	}
	
	public static String getNotificationIdsQuery() {
		String query = "select s1.NID from Notification as s1";
		return query;
	}
	
	
}
