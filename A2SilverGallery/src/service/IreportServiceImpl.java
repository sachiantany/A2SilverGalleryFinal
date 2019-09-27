package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.report;
import util.DBConnectionUtil;

public class IreportServiceImpl implements IreportService{

	@Override
	public String addReport(report report) {
		
		int i=0;
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
		
	    try {
			con = DBConnectionUtil.getDBConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql ="insert into report(report_id,sName,tAttendance,holidays,status) values(?,?,?,?,?)";
		
			ps =con.prepareStatement(sql);

			ps.setString(1, report.getreportid());
			ps.setString(2, report.getSname());
			ps.setString(3, report.getTattendance());
			ps.setString(4, report.getHoliday());
			ps.setString(5, report.getStatus());
				
			i=ps.executeUpdate();
			
			if(i!=0) {
				return "True";
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return "Value Not Inserted";
	}

	@Override
	public List<report> readData() {
		
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
		
		
		List<report> list = new ArrayList<>();

		try {

			String query = "select * from report";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {

				
				report report = new report();
				
				report.setreportid(rs.getString("Report_Id"));
				report.setSname(rs.getString("sName"));
				report.setTattendance(rs.getString("tAttendance"));
				report.setHoliday(rs.getString("Holidays"));
				report.setStatus(rs.getString("Status"));
			
				list.add(report);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public report getReportByID(String reportid) {
		
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
		report admin = new report();
		
		try {

			String query = "select * from report where report_Id=?";
			ps = con.prepareStatement(query);
			ps.setString(1,reportid);
			rs = ps.executeQuery();

			while (rs.next()) {

				admin.setreportid(rs.getString("Report_Id"));
				admin.setSname(rs.getString("Sname"));
				admin.setTattendance(rs.getString("TAttendance"));
				admin.setHoliday(rs.getString("Holidays"));
				admin.setStatus(rs.getString("Status"));
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return admin;
	}

	@Override
	public void updateReport(String reportid, report report) {
		
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

			String query = "update report set sName=?,tAttendance=?,holidays=?,status=? where report_Id=?";
			ps = con.prepareStatement(query);
			
			ps.setString(1,report.getSname());
			ps.setString(2,report.getTattendance());
			ps.setString(3,report.getHoliday());
			ps.setString(4,report.getStatus());

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public void DeleteReport(String reportid) {
		
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

			String query = "delete from report where report_Id=?";
			ps = con.prepareStatement(query);
			ps.setString(1,reportid);
			ps.executeUpdate();

			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	
}
