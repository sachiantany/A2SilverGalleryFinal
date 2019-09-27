package util;

public class SalesQueryUtil {
	
	/*
	 * Query for create Sales table
	 * */
	public static String createSalesTableQuery() {
		String query = "CREATE TABLE sales("+
						"salesId varchar(10) not null,"+
						"formName varchar(20),"+
						"staffID varchar(20),"+
						"discount double"+
						"subTotal double"+
						"totalPrice double"+
						"primary key(salesId)"+
						")";
		return query;
	}
	
	/*
	 *This returns the query for drop table if exist 
	 *@return String
	 * */
	public static String dropSalesTableQuery() {
		String query = " DROP TABLE IF EXISTS sales ";
		return query;
	}
	
	/*
	 * This returns the insert query for Sales Table
	 * @return String
	 * */
	public static String insertIntoSalesTableQuery() {
		String query = "insert into sales(salesID,formName,staffID,discount,subTotal,totalPrice,saleDate) values(?,?,?,?,?,?,?)";
		return query;
	}
	
	/*
	 * Returns the query for select a particular Sales
	 * @returns String
	 * */
	public static String selectSalesByIdQuery() {
		String query  = "select  * from sales where sales.salesId = ?";
		return query;
	}
	
	/*
	 * Select all Sales Query
	 * @return String
	 * */
	public static String selectAllSalesQuery() {
		String query = "select * from sales";
		return query;
	}
	
	/*
	 * delete Sales Query
	 * @return String
	 * */
	public static String deleteSalesQuery() {
		String query = "delete from sales where sales.salesID = ?";
		return query;
	}
	
	/*
	 * return update query for Sales
	 * @retrn Sales
	 * */
	public static String updateSalesQuery() {
		String query = "update sales set formName = ?, staffID = ?, discount = ?, subTotal = ?,totalPrice = ? where salesId= ?";
		return query;
	}
	
	/*
	 * get SalesIds Query
	 * */
	public static String getSalesIdsQuery() {
		String query = "select s.staffId from sales as s";
		return query;
	}
}
