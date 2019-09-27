package service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.codec.binary.Base64;

import model.AdminLogin;
import model.AdminProduct;
import util.DBConnectionUtil;

public class AdminServiceImpl implements IAdminService{

	public String CheckAdmin(AdminLogin log) {

		String uname = log.getUname();
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
			rs = st.executeQuery("select Uname,Password from admin");

			while (rs.next()) {
				userDB = rs.getString("Uname");
				passDB = rs.getString("Password");

				if (uname.equals(userDB) && pass.equals(passDB))
					return "True";
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Invalid user credentials";
		
	}
	
	
	public String addProduct(AdminProduct product) {
		
		int i=0;
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
		
	    try {
			con = DBConnectionUtil.getDBConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql ="insert into product(Jname,Jcatogorie,Jquantity,Jsetting,JmetalW,JstoneW,Jdescription,Jprice,image) values(?,?,?,?,?,?,?,?,?)";
		
			ps =con.prepareStatement(sql);

			ps.setString(1, product.getProductName());
			ps.setString(2, product.getProductCat());
			ps.setInt(3,product.getQuantity());
			ps.setString(4, product.getSettingWith());
			ps.setString(5, product.getMetalWeight());
			ps.setString(6, product.getStoneWeight());
			ps.setString(7, product.getDescription());
			ps.setDouble(8, product.getPrice());
			
			try {
				InputStream is = product.getImage().getInputStream();
				ps.setBlob(9, is);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			i=ps.executeUpdate();
			
			if(i!=0) {
				return "True";
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return "Value Not Inserted";
	}
	
	public List<AdminProduct> readData() {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DBConnectionUtil.getDBConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		List<AdminProduct> list = new ArrayList<>();

		try {

			String query = "select * from product";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {

				
				AdminProduct adminP = new AdminProduct();
				
				adminP.setPID(rs.getInt("JID"));
				adminP.setProductName(rs.getString("Jname"));
				adminP.setProductCat(rs.getString("Jcatogorie"));
				adminP.setQuantity(rs.getInt("Jquantity"));
				adminP.setSettingWith(rs.getString("Jsetting"));
				adminP.setMetalWeight(rs.getString("JmetalW"));
				adminP.setStoneWeight(rs.getString("JstoneW"));
				adminP.setDescription(rs.getString("Jdescription"));
				adminP.setPrice(rs.getDouble("Jprice"));
				
				byte[] content = rs.getBytes("image");
				String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
				adminP.setImageData(base64Encoded);
				
			
				list.add(adminP);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	
	//Get the values from database by id no
	public AdminProduct getItemValues(String PID) {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DBConnectionUtil.getDBConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		AdminProduct admin = new AdminProduct();
		
		try {

			String query = "select * from product where JID=?";
			ps = con.prepareStatement(query);
			ps.setString(1,PID);
			rs = ps.executeQuery();

			while (rs.next()) {

				admin.setPID(rs.getInt("JID"));
				admin.setProductName(rs.getString("Jname"));
				admin.setProductCat(rs.getString("Jcatogorie"));
				admin.setQuantity(rs.getInt("Jquantity"));
				admin.setSettingWith(rs.getString("Jsetting"));
				admin.setMetalWeight(rs.getString("JmetalW"));
				admin.setStoneWeight(rs.getString("JstoneW"));
				admin.setDescription(rs.getString("Jdescription"));
				admin.setPrice(rs.getDouble("Jprice"));
				
				byte[] content = rs.getBytes("image");
				String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
				admin.setImageData(base64Encoded);
				
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return admin;
	}
	
	//Item update method 
	public void UpdateItemValues(AdminProduct admin) {

		
		Connection con = null;
		PreparedStatement ps = null;


		try {
			con = DBConnectionUtil.getDBConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		

		try {

			String query = "update product set Jname=?,Jcatogorie=?,Jquantity=?,Jsetting=?,JmetalW=?,JstoneW=?,Jdescription=?,Jprice=?,image=? where JID=?";
			ps = con.prepareStatement(query);
			
			ps.setString(1,admin.getProductName());
			ps.setString(2,admin.getProductCat());
			ps.setInt(3,admin.getQuantity());
			ps.setString(4,admin.getSettingWith());
			ps.setString(5,admin.getMetalWeight());
			ps.setString(6,admin.getStoneWeight());
			ps.setString(7,admin.getDescription());
			ps.setDouble(8,admin.getPrice());
			
			try {
				InputStream is = admin.getImage().getInputStream();
				ps.setBlob(9,is);
			} catch (IOException e) {
				 //TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			ps.setInt(10,admin.getPID());
			
			ps.executeUpdate();
		

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	public void DeleteItemValues(String PID) {

		Connection con = null;
		PreparedStatement ps = null;
		

		try {
			con = DBConnectionUtil.getDBConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		

		try {

			String query = "delete from product where JID=?";
			ps = con.prepareStatement(query);
			ps.setString(1,PID);
			ps.executeUpdate();

			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
}

