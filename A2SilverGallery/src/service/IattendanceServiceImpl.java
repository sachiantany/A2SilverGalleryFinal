package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.attendance;
import util.DBConnectionUtil;

public class IattendanceServiceImpl implements IattendanceService{

	@Override
	public String addattendance(attendance attendance) {
		
		int i=0;
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
		
	    con = DBConnectionUtil.getDBConnection();
		String sql ="insert into attendance(attendanceId,sName,tAttendance,holidays) values(?,?,?,?)";
		
			ps =con.prepareStatement(sql);

			ps.setString(1, attendance.getAttendanceid());
			ps.setString(2, attendance.getSname());
			ps.setString(3, attendance.getTattendance());
			ps.setString(4, attendance.getHoliday());
				
			i=ps.executeUpdate();
			
			if(i!=0) {
				return "True";
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Value Not Inserted";
	}

	@Override
	public List<attendance> readData() {
		
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
		
		
		List<attendance> list = new ArrayList<>();

		try {

			String query = "select * from attendance";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {

				
				attendance attendance = new attendance();
				
				attendance.setAttendanceid(rs.getString("AttendanceId"));
				attendance.setSname(rs.getString("SName"));
				attendance.setTattendance(rs.getString("TAttendance"));
				attendance.setHoliday(rs.getString("Holidays"));
			
				list.add(attendance);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public attendance getAttendanceByID(String attendanceid) {
		
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
		attendance admin = new attendance();
		
		try {

			String query = "select * from attendance where attendanceId=?";
			ps = con.prepareStatement(query);
			ps.setString(1,attendanceid);
			rs = ps.executeQuery();

			while (rs.next()) {

				admin.setAttendanceid(rs.getString("attendanceId"));
				admin.setSname(rs.getString("Sname"));
				admin.setTattendance(rs.getString("TAttendance"));
				admin.setHoliday(rs.getString("Holidays"));
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return admin;
	}

	@Override
	public void updateAttendance(attendance attendance) {
		
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

			String query = "update attendance set sName=?,tAttendance=?,holidays=? where attendanceId=?";
			ps = con.prepareStatement(query);
			
			ps.setString(1,attendance.getSname());
			ps.setString(2,attendance.getTattendance());
			ps.setString(3,attendance.getHoliday());
			ps.setString(4, attendance.getAttendanceid());
			
			ps.executeUpdate();

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public void DeleteAttendance(String attendanceid) {
		
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

			String query = "delete from attendance where attendanceId=?";
			ps = con.prepareStatement(query);
			ps.setString(1,attendanceid);
			ps.executeUpdate();

			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

}
