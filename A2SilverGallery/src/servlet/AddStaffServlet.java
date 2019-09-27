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
 * Servlet implementation class AddStaffServlet
 */
@WebServlet("/AddStaffServlet")
public class AddStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AddStaffServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		Staff staff = new Staff();
		
		staff.setEmployeeName(request.getParameter("employeeName"));
		staff.setStreetAddress(request.getParameter("streetAddress"));
		staff.setCity(request.getParameter("city"));
		staff.setMobile(request.getParameter("mobile"));
		staff.setEmail(request.getParameter("email"));
		staff.setBasicSalary(Double.parseDouble(request.getParameter("basicSalary")));
		
		IStaffService iStaffService = new StaffServiceImp();
		iStaffService.addStaff(staff);
		
		response.sendRedirect("admin/StaffList.jsp");
	}

}
