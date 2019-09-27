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
 * Servlet implementation class AddSalesServlet
 */
@WebServlet("/AddSalesServlet")
public class AddSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AddSalesServlet() {
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
		
		Sales sales = new Sales();
		
		sales.setCustomerName(request.getParameter("formName"));
		sales.setDate(request.getParameter("Date"));
		sales.setStaffID(request.getParameter("staffID"));
		sales.setAmount(Double.parseDouble(request.getParameter("subTotal")));;
		sales.setDiscount(Double.parseDouble(request.getParameter("discount")));
		sales.setTotal(Double.parseDouble(request.getParameter("totalPrice")));
		
		ISalesService iSalesService = new SalesServiceImp();
		iSalesService.addSales(sales);
		
		response.sendRedirect("guest/SalesList.jsp");
	
	}

}
