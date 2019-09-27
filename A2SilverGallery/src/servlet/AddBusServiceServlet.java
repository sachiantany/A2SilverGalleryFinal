package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StaffBusService;
import service.IStaffBusService;
import service.StaffBusServiceImp;

/**
 * Servlet implementation class AddBusServiceServlet
 */
@WebServlet("/AddBusServiceServlet")
public class AddBusServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBusServiceServlet() {
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
		
		StaffBusService staffBusService = new StaffBusService();
		
		staffBusService.setStaffID(request.getParameter("EmployeeID"));
		staffBusService.setEname(request.getParameter("employeeName"));
		staffBusService.setBusNo(Integer.parseInt(request.getParameter("BusNumber")));
		staffBusService.setDestination(request.getParameter("Destination"));
		staffBusService.setCost(Double.parseDouble(request.getParameter("TotalCost")));
		
		IStaffBusService iStaffBusService = new StaffBusServiceImp();
		
		iStaffBusService.addBus(staffBusService);
		
		response.sendRedirect("admin/BusList.jsp");
		
		
	}

}
