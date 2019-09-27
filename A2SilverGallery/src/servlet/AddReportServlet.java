package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.report;
import service.IreportService;
import service.IreportServiceImpl;

/**
 * Servlet implementation class AddReportServlet
 */
@WebServlet("/AddReportServlet")
public class AddReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReportServlet() {
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
		
		report report = new report();
		
		report.setreportid(request.getParameter("r-id"));
		report.setSname(request.getParameter("s-name"));
		report.setTattendance(request.getParameter("s-tattendance"));
		report.setHoliday(request.getParameter("s-holi"));
		report.setStatus(request.getParameter("s-status"));
		
		IreportService IreportService = new IreportServiceImpl();
		IreportService.addReport(report);
		
		response.sendRedirect("admin/AttendanceReport.jsp");
	}

}
