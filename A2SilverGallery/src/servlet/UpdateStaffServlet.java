package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Staff;
import service.IStaffService;
import service.StaffServiceImp;

/**
 * Servlet implementation class UpdateStaffServlet
 */
@WebServlet("/UpdateStaffServlet")
public class UpdateStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStaffServlet() {
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
		
		Staff staff = new Staff();
		String staffID  = request.getParameter("staffID");
		staff.setStaffID(staffID);
		staff.setEmployeeName(request.getParameter("employeeName"));
		staff.setStreetAddress(request.getParameter("streetAddress"));
		staff.setCity(request.getParameter("city"));
		staff.setMobile(request.getParameter("mobile"));
		staff.setEmail(request.getParameter("email"));
		staff.setBasicSalary(Double.parseDouble(request.getParameter("basicSalary")));
		
		IStaffService iStaffService = new StaffServiceImp();
		iStaffService.updateStaff(staffID, staff);
		
		response.sendRedirect("admin/StaffList.jsp");
	}

}
