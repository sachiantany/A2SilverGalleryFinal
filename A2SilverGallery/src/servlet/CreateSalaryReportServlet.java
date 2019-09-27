package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.log.Log;
import com.sun.corba.se.pept.transport.Connection;

import model.Salary;
import service.IStaffService;
import service.StaffServiceImp;
import util.DBConnectionUtil;
import util.StaffQueryUtil;

/**
 * Servlet implementation class CreateSalaryReport
 */
@WebServlet("/CreateSalaryReport")
public class CreateSalaryReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static Connection connection;
	
	private static Statement statement;
	
	private static PreparedStatement preparedStatement;
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateSalaryReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		
		String month = request.getParameter("month");
		String year = request.getParameter("year");
	
		StaffServiceImp iStaffService = new StaffServiceImp();
		iStaffService.calculateStaffSalary(month,year);
		
		//Salary salary = (Salary) iStaffService.calculateStaffSalary(month, year).get(0);

		//response.sendRedirect("admin/StaffSalaryReport.jsp");
		
		request.setAttribute("month", month);
		//request.setAttribute("year", year);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/StaffSalaryReport.jsp");
	
		dispatcher.forward(request, response);
	}

}
