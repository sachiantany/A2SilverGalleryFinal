<%@page import = "model.Sales" %>
<%@page import = "service.SalesServiceImp" %>
<%@page import = "service.ISalesService" %>
<%@page import = "java.util.ArrayList" %>


<head>

<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
  
  <title>Guest | Manage Sales</title>
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
  
</head>

<body id="page-top">

	<!-- Admin Header -->
	
	
	
	

	
	<jsp:include page="guestHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="guestSidebar.jsp"></jsp:include>
	
	<div class="container-fluid" style="padding : 15px">
		
			 <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Sales Table </div>
          <div class="card-body">
            <div class="table-responsive">
            
	 			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	 				
	 				
	 			<thead>
	 				
	 				<tr>
	 					<th>Sales ID </th>
	 					<th>Customer Name</th>
	 					<th>Staff ID</th>
	 					<th>Amount </th>
	 					<th>Discount</th>
	 					<th>Total</th>
	 					<th>Update</th>
	 					<th>Delete</th>
	 				</tr>
	 				</thead>
	 				
	 				<tfoot>
	 					<tr>
	 					<th>Sales ID </th>
	 					<th>Customer Name</th>
	 					<th>Staff ID</th>
	 					<th>Amount </th>
	 					<th>Discount</th>
	 					<th>Total</th>
	 					<th>Update</th>
	 					<th>Delete</th>
	 					</tr>				
	 				</tfoot>
	 				
	 				<tbody> 
	 				<%	
	 				ISalesService iSalesService = new SalesServiceImp();
 					ArrayList<Sales> arrayList = new ArrayList<Sales>();
 					arrayList = iSalesService.getSales();
	 				
	 				
	 				for(Sales sales : arrayList){ 
	 				%>				
	 				<tr>
	 				<td> <%=sales.getSalesID() %> </td>
	 				<td> <%=sales.getCustomerName() %> </td>
	 				<td> <%=sales.getStaffID() %> </td>		
	 				<td> <%=sales.getAmount() %> </td>
	 				<td> <%=sales.getDiscount() %> </td>
	 				<td> <%=sales.getTotal() %> </td>
	 				<td>
	 					<form method="post" action="../GetSalesServlet">
	 						<input type="hidden" name="salesID" value = "<%= sales.getSalesID() %>"></input>
	 						<button type = "submit" class = "btn btn-outline-info waves-effect px-3"><i class = "fas fa-edit" aread-hidden="false"></i></button>
	 					</form>
	 				</td>
	 				
	 				<td>
	 					<form method="post" action="../DeleteSalesServlet">
	 						<input type="hidden" name="salesID" value = "<%= sales.getSalesID() %>"></input>
	 						<button type = "submit" class = "btn btn-outline-danger waves-effect px-3"><i class = "fas fa-trash-alt" aread-hidden="true"></i></button>
	 					</form>
	 				</td>
	 				</tr>
	 				<%} %>
	 				</tbody>
	 				
	 				
	 		
	 				
	 			</table>
		</div>
	</div>
	</div>
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