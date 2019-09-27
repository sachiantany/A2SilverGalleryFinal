package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IStaffBusService;
import service.IStaffService;
import service.StaffBusServiceImp;
import service.StaffServiceImp;

/**
 * Servlet implementation class DeleteBusServiceServlet
 */
@WebServlet("/DeleteBusServiceServlet")
public class DeleteBusServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBusServiceServlet() {
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
		
		String BID = request.getParameter("BID");
		
		IStaffBusService iStaffBusService  = new StaffBusServiceImp();
		iStaffBusService.removeStaffBusService(BID);
		
		response.sendRedirect("admin/BusList.jsp");
		
	}

}
