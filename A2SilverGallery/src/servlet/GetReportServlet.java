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
 * Servlet implementation class GetReportServlet
 */
@WebServlet("/GetReportServlet")
public class GetReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReportServlet() {
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
		
		String report_ID = request.getParameter("reportid");
		
		IreportService ireportService = new IreportServiceImpl();
		report report = ireportService.getReportByID(report_ID);
		
		request.setAttribute("report", report);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("");
		
		dispatcher.forward(request, response);
	}

}
