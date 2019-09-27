package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AdminProduct;
import service.AdminServiceImpl;
import service.IAdminService;

/**
 * Servlet implementation class AdminAddProductServlet
 */
@WebServlet("/AdminAddProductServlet")
@MultipartConfig(maxFileSize = 16177216)

public class AdminAddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminAddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminProduct product = new AdminProduct();
		
		product.setProductName(request.getParameter("product_name"));
		product.setProductCat(request.getParameter("product_categorie"));
		product.setQuantity(Integer.parseInt(request.getParameter("available_quantity")));
		product.setSettingWith(request.getParameter("setting_with"));
		product.setMetalWeight(request.getParameter("metal_weight"));
		product.setStoneWeight(request.getParameter("stone_weight"));
		product.setDescription(request.getParameter("product_description"));
		product.setPrice(Double.parseDouble(request.getParameter("product_price")));
		product.setImage(request.getPart("filebutton"));
		
		IAdminService iAdminService = new AdminServiceImpl();
		iAdminService.addProduct(product);
		
		response.sendRedirect("admin/product-report.jsp");
		
	}

}
