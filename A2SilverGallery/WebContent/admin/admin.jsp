<%@page import = "model.Staff" %>
<%@page import = "service.StaffServiceImp" %>
<%@page import = "service.IStaffService" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">


<%
		
		if ((request.getSession(false).getAttribute("Admin") == null)) {
	%>
	<jsp:forward page="/admin/login.jsp"></jsp:forward>
	<%
		}
	%> 
	
	
  <jsp:include page="adminHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="adminSideMenu.jsp"></jsp:include>
	
    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
        </ol>

        <!-- Icon Cards-->
        <div class="row">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-comments"></i>
                </div>
                <div class="mr-5">Gold Rate Updates!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="http://goldpricez.com/lk/gram">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-list"></i>
                </div>
                <div class="mr-5">New Tasks!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="StaffAttendance.jsp">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <div class="mr-5">New Orders!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="CReport.jsp">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-life-ring"></i>
                </div>
                <div class="mr-5">New Notifications!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="NotificationList.jsp">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
        </div>

        
        <!-- DataTables Example -->
         <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Employee Table </div>
          <div class="card-body">
            <div class="table-responsive">
		
		
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
	 				<tr>
	 					<th>Staff ID </th>
	 					<th>Employee Name</th>
	 					<th>Street Address </th>
	 					<th>City</th>
	 					<th>Mobile</th>
	 					<th>Email</th>
	 					<th>Basic Salary</th>
	 					
	 				</tr>
	 			</thead>
	 			
	 			<tfoot>
	 				<tr>
	 					<th>Staff ID </th>
	 					<th>Employee Name</th>
	 					<th>Street Address </th>
	 					<th>City</th>
	 					<th>Mobile</th>
	 					<th>Email</th>
	 					<th>Basic Salary</th>
	 					
	 				</tr>
	 			</tfoot>
	 				
	 			<tbody>
	 				<% 
	 					IStaffService iStaffService = new StaffServiceImp();
	 					ArrayList<Staff> arrayList = new ArrayList<Staff>();
	 					arrayList = iStaffService.getStaff();
	 					
	 					for(Staff staff : arrayList){
	
	 				%>
	 			
	 			
	 				<tr>
	 				<td> <%=staff.getStaffID() %> </td>
	 				<td> <%=staff.getEmployeeName() %> </td>
	 				<td> <%=staff.getStreetAddress() %> </td>
	 				<td> <%=staff.getCity() %> </td>
	 				<td> <%=staff.getMobile() %> </td>
	 				<td> <%=staff.getEmail() %> </td>
	 				<td> <%=staff.getBasicSalary() %> </td>
	 				
	 				</tr>
	 				
	 				<%} %>
	 			</tbody>
	 		
	 				
	 			</table>

		</div>
		</div></div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
     
     
     <div>
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright A© A2 Silver Gallery</span>
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
            <span aria-hidden="true">Ã—</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
       <form action="../Home.html" method="get">
 	<div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <input type="submit" class="btn btn-primary" value="Log Out">
        </div>
	</form>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="../vendor/chart.js/Chart.min.js"></script>
  <script src="../vendor/datatables/jquery.dataTables.js"></script>
  <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="../js/demo/datatables-demo.js"></script>
  <script src="../js/demo/chart-area-demo.js"></script>

</body>

</html>
