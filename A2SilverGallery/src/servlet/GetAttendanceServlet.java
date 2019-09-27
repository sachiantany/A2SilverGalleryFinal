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
 * Servlet implementation class GetAttendanceServlet
 */
@WebServlet("/GetAttendanceServlet")
public class GetAttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAttendanceServlet() {
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
		
		String attendance_ID = request.getParameter("attendanceid");
		
		IattendanceService iattendanceService = new IattendanceServiceImpl();
		attendance attendance = iattendanceService.getAttendanceByID(attendance_ID);
		
		request.setAttribute("attendance", attendance);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("");
		
		dispatcher.forward(request, response);
	}

}
