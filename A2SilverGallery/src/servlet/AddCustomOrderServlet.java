package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomOrder;
import service.CustomServiceImpl;
import service.ICustomService;



/**
 * Servlet implementation class AddCustomOrderServlet
 */
@WebServlet("/AddCustomOrderServlet")
@MultipartConfig(maxFileSize = 16177216)

public class AddCustomOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddCustomOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CustomOrder product = new CustomOrder();
		
		product.setJType(request.getParameter("J_Type"));
		product.setGemStone(request.getParameter("gem_stone"));
		product.setFingerSize(Integer.parseInt(request.getParameter("finger_size")));
		product.setMetalWeight(Integer.parseInt(request.getParameter("metal_weight")));
		product.setDescription(request.getParameter("product_description"));
		product.setImage(request.getPart("filebutton"));
		
		ICustomService iCustomService = new CustomServiceImpl();
		iCustomService.addProduct(product);
		
		response.sendRedirect("guest/custom.jsp");
		
	}

}
