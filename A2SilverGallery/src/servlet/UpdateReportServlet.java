package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.report;
import service.IreportService;
import service.IreportServiceImpl;


/**
 * Servlet implementation class UpdateReportServlet
 */
@WebServlet("/UpdateReportServlet")
public class UpdateReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReportServlet() {
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
		
		report.setreportid(request.getParameter("product_name1"));
		report.setSname(request.getParameter("product_name"));
		report.setTattendance(request.getParameter("available_quantity"));
		report.setHoliday(request.getParameter("setting_with"));	
		report.setStatus(request.getParameter("metal_weight"));		
		
		IreportService ireportService = new IreportServiceImpl();
		ireportService.addReport(report);
		
		response.sendRedirect("admin/ReportList.jsp");
	}

}
