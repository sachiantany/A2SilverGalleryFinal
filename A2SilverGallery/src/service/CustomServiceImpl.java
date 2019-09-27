package service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.tomcat.util.codec.binary.Base64;
import java.util.List;

import model.CustomOrder;
import util.DBConnectionUtil;

public class CustomServiceImpl implements ICustomService {
public String addProduct(CustomOrder product) {
		
		int i=0;
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
		
	    con = DBConnectionUtil.getDBConnection();
		String sql ="insert into customOrder(JType,gemStone,fingerSize,metalWeight,Cdescription,image) values(?,?,?,?,?,?)";
		
			ps =con.prepareStatement(sql);

			ps.setString(1, product.getJType());
			ps.setString(2, product.getGemStone());
			ps.setInt(3,product.getFingerSize());
			ps.setInt(4, product.getMetalWeight());
			ps.setString(5, product.getDescription());
			
			try {
				InputStream is = product.getImage().getInputStream();
				ps.setBlob(6, is);
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
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return "Value Not Inserted";
	}
	
	public List<CustomOrder> readData() {

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
		
		
		List<CustomOrder> list = new ArrayList<>();

		try {

			String query = "select * from customOrder";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {

				
				CustomOrder adminP = new CustomOrder();
				
				adminP.setCID(rs.getInt("CID"));
				adminP.setJType(rs.getString("JType"));
				adminP.setGemStone(rs.getString("gemStone"));
				adminP.setFingerSize(rs.getInt("fingerSize"));
				adminP.setMetalWeight(rs.getInt("metalWeight"));
				adminP.setDescription(rs.getString("Cdescription"));
				
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
	public CustomOrder getItemValues(String CID) {

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
		CustomOrder admin = new CustomOrder();
		
		try {

			String query = "select * from customOrder where CID=?";
			ps = con.prepareStatement(query);
			ps.setString(1,CID);
			rs = ps.executeQuery();

			while (rs.next()) {

				admin.setCID(rs.getInt("CID"));
				admin.setJType(rs.getString("JType"));
				admin.setGemStone(rs.getString("gemStone"));
				admin.setFingerSize(rs.getInt("fingerSize"));
				admin.setMetalWeight(rs.getInt("metalWeight"));
				admin.setDescription(rs.getString("Cdescription"));
				
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
	public void UpdateItemValues(CustomOrder pro) {

		
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

			String query = "update customOrder set JType=?,gemStone=?,fingerSize=?,metalWeight=?,Cdescription=?,image=? where CID=?";
			ps = con.prepareStatement(query);
			
			ps.setString(1,pro.getJType());
			ps.setString(2,pro.getGemStone());
			ps.setInt(3,pro.getFingerSize());
			ps.setInt(4,pro.getMetalWeight());
			ps.setString(5,pro.getDescription());
			
			try {
				InputStream is = pro.getImage().getInputStream();
				ps.setBlob(6,is);
			} catch (IOException e) {
				 //TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			ps.setInt(7,pro.getCID());
			
			ps.executeUpdate();
		

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	public void DeleteItemValues(String CID) {

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

			String query = "delete from customOrder where CID=?";
			ps = con.prepareStatement(query);
			ps.setString(1,CID);
			ps.executeUpdate();

			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
}
