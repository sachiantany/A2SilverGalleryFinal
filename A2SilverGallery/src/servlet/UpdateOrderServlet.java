package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomOrder;
import service.ICustomService;
import service.CustomServiceImpl;

@WebServlet("/UpdateOrderServlet")
@MultipartConfig(maxFileSize = 16177216)

public class UpdateOrderServlet  extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
CustomOrder product = new CustomOrder();
		
		product.setCID(Integer.parseInt(request.getParameter("CID")));
		product.setJType(request.getParameter("J_Type"));
		product.setGemStone(request.getParameter("gem_stone"));
		product.setFingerSize(Integer.parseInt(request.getParameter("finger_size")));
		product.setMetalWeight(Integer.parseInt(request.getParameter("metal_weight")));
		product.setDescription(request.getParameter("product_description"));
		product.setImage(request.getPart("singlebutton"));
		
		ICustomService iCustomService = new CustomServiceImpl();
		iCustomService.UpdateItemValues(product);
	 
		response.sendRedirect("guest/COrder_Report.jsp");
		
	}

}