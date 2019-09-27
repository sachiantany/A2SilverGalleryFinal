package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionUtil extends commonUtil{
	public static Connection getDBConnection() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection connection = DriverManager.getConnection(commonConstants.URL,commonConstants.UN,commonConstants.PWD);
		
		return connection;
}
	
}
