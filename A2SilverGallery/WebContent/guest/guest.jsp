<%@page import = "model.Sales" %>
<%@page import = "service.SalesServiceImp" %>
<%@page import = "service.ISalesService" %>
<%@page import = "java.util.ArrayList" %><!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>User - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">



  <jsp:include page="guestHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="guestSidebar.jsp"></jsp:include>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="guest.jsp">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Staff</li>
        </ol>

        <!-- Page Content -->
        
        <h1>Welcome!</h1>
        <hr> <div class="card mb-3">
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
	 				
	 				</tr>
	 				<%} %>
	 				</tbody>
	 				
	 				
	 		
	 				
	 			</table>
		</div>
	</div>
	</div>
	</div>
      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="../Home.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../js/sb-admin.min.js"></script>

</body>

</html>
