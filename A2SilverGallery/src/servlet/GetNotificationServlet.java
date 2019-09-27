package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Notification;
import model.StaffBusService;
import service.INotificationService;
import service.IStaffBusService;
import service.NotificationServiceImp;
import service.StaffBusServiceImp;

/**
 * Servlet implementation class GetNotificationServlet
 */
@WebServlet("/GetNotificationServlet")
public class GetNotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetNotificationServlet() {
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

		
		
		String NID = request.getParameter("NID");
		INotificationService iNotificationService = new NotificationServiceImp();
		Notification notification = iNotificationService.getNotificationByID(NID);
		
		request.setAttribute("notification", notification);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/GetNotification.jsp");
		
		dispatcher.forward(request, response);
	}

}
