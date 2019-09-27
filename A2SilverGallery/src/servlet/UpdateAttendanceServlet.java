package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.attendance;
import service.IattendanceService;
import service.IattendanceServiceImpl;

/**
 * Servlet implementation class UpdateAttendanceServlet
 */
@WebServlet("/UpdateAttendanceServlet")
public class UpdateAttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAttendanceServlet() {
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
		
		attendance attendance = new attendance();
		
		attendance.setAttendanceid(request.getParameter("product_id"));
		attendance.setSname(request.getParameter("product_name"));
		attendance.setTattendance(request.getParameter("available_quantity"));
		attendance.setHoliday(request.getParameter("setting_with"));		
		
		IattendanceService iattendanceService = new IattendanceServiceImpl();
		iattendanceService.updateAttendance(attendance);
		
		response.sendRedirect("admin/AttendanceList.jsp");
	}

}
