<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "model.Sales" %>
<%@page import = "service.SalesServiceImp" %>
<%@page import = "service.ISalesService" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
  
  <title>Guest | Update Sales</title>
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
  
</head>

<body id="page-top">

	

	<!--  Header -->
	

	
	<jsp:include page="guestHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="guestSidebar.jsp"></jsp:include>
	
	<%
		Sales sales =  (Sales) request.getAttribute("sales");
	%>
	
		<div style = "padding : 20px">
		<form  method = "POST" action= "UpdateSalesServlet" class = "form-group">

			<table>
					<tr>
						<td>Sales ID</td>
						<td><input type = "text" name = "salesID" value = <%=sales.getSalesID() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr>
						<td>Customer Name</td>
						<td><input type = "text" name = "formName" value = <%=sales.getCustomerName() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr>
						<td>Staff ID</td>
						<td><input type = "text" name = "staffID" value = <%=sales.getStaffID() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr style = "padding :10px">
						<td>Amount</td>
						<td><input type = "text" name = "subTotal" value = <%=sales.getAmount() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr>
						<td>Discount</td>
						<td><input type = "text" name = "discount" value = <%=sales.getDiscount() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr>
						<td>Total</td>
						<td><input type = "text" name = "totalPrice" value = <%=sales.getTotal() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr>
							<td colspan="2"><input type="hidden" name="salesID" value="<%=sales.getSalesID()%>" /> 
							<td colspan="2"><input type="submit" value="Update" class="btn btn-success" /> </td>
					</tr>

													
			</table>

		</form>
		</div>
		</div>
      
  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
  <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
  
</body>
</html>