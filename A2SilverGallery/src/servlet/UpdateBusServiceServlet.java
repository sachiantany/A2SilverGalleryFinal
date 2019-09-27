package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StaffBusService;
import service.IStaffBusService;
import service.IStaffService;
import service.StaffBusServiceImp;
import service.StaffServiceImp;

/**
 * Servlet implementation class UpdateBusServiceServlet
 */
@WebServlet("/UpdateBusServiceServlet")
public class UpdateBusServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBusServiceServlet() {
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
		String BID = request.getParameter("BID");
		staffBusService.setBID(BID);
		staffBusService.setStaffID(request.getParameter("staffID"));
		staffBusService.setEname(request.getParameter("eName"));
		staffBusService.setBusNo(Integer.parseInt(request.getParameter("BusNo")));
		staffBusService.setDestination(request.getParameter("Destinaton"));
		staffBusService.setCost(Double.parseDouble(request.getParameter("Cost")));
		
		IStaffBusService iStaffBusService = new StaffBusServiceImp();
		iStaffBusService.updateStaffBusService(BID, staffBusService);
		
		response.sendRedirect("admin/BusList.jsp");
		
	}

}
