package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AdminLogin;
import service.AdminServiceImpl;
import service.IAdminService;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AdminLoginServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
	
		AdminLogin login = new AdminLogin();
		
		login.setUname(uname);
		login.setPassword(password);
		
		IAdminService iadmin = new AdminServiceImpl();
		String check = iadmin.CheckAdmin(login);
		
		if(check.equals("True")) {

			HttpSession session = request.getSession();
			session.setAttribute("Admin", uname);
			request.setAttribute("userName", uname);

			response.sendRedirect("admin/admin.jsp");
		}
		else {
			response.sendRedirect("admin/login.jsp");
		}
		
		
	}

}
