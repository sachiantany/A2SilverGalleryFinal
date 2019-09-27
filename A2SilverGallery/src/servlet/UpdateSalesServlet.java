package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Sales;
import service.ISalesService;
import service.SalesServiceImp;

/**
 * Servlet implementation class UpdateSalesServlet
 */
@WebServlet("/UpdateSalesServlet")
public class UpdateSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSalesServlet() {
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
		
		Sales sales = new Sales();
		String salesID  = request.getParameter("salesID");
		sales.setCustomerName(request.getParameter("formName"));
		sales.setStaffID(request.getParameter("staffID"));
		sales.setAmount(Double.parseDouble(request.getParameter("subTotal")));
		sales.setDiscount(Double.parseDouble(request.getParameter("discount")));
		sales.setTotal(Double.parseDouble(request.getParameter("totalPrice")));
		
		ISalesService iSalesService = new SalesServiceImp();
		iSalesService.updateSales(salesID, sales);
		
		response.sendRedirect("guest/SalesList.jsp");
	}

}
