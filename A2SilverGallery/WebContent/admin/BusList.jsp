<%@page import = "model.StaffBusService" %>
<%@page import = "service.StaffBusServiceImp" %>
<%@page import = "service.IStaffBusService" %>
<%@page import = "java.util.ArrayList" %>


<head>

<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
  
  <title>Admin | Add Bus Service</title>
  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">
  
</head>

<body id="page-top">

	<!-- Admin Header -->
	

	
	<jsp:include page="adminHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="adminSideMenu.jsp"></jsp:include>
		
		<div class="container-fluid"style="padding : 15px">
			<!--Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="index.jsp">Transport Management</a></li>
					<li class="breadcrumb-item active">Transpotation List<li></ol>
		
	<!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Transport List</div>
          <div class="card-body">
            <div class="table-responsive">
            
            
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
	 				
	 				<tr>
	 					
	 					<th>BID</th>
	 					<th>Employee ID</th>
	 					<th>Employee Name </th>
	 					<th>Bus Number</th>
	 					<th>Destination</th>
	 					<th>Cost</th>
	 					<th>Update</th>
	 					<th>Delete</th>
	 				</tr>
	 			</thead>
	 			
	 			<tfoot>
	 				<tr>
	 					<th>BID</th>
	 					<th>Employee ID</th>
	 					<th>Employee Name </th>
	 					<th>Bus Number</th>
	 					<th>Destination</th>
	 					<th>Cost</th>
	 					<th>Update</th>
	 					<th>Delete</th>
	 				</tr>
	 			</tfoot>
	 			
	 			<tbody>
	 				
	 				<% 
	 					IStaffBusService iStaffBusService = new StaffBusServiceImp();
	 					ArrayList<StaffBusService> arrayList = new ArrayList<StaffBusService>();
	 					arrayList = iStaffBusService.getStaffBusService();
	 					
	 					for(StaffBusService staffBusService : arrayList){
	
	 				%>
	 				
	 				<tr>
	 				
	 				<td> <%=staffBusService.getBID() %> </td>
	 				<td> <%=staffBusService.getStaffID() %> </td>
	 				<td> <%=staffBusService.getEname() %> </td>
	 				<td> <%=staffBusService.getBusNo() %> </td>
	 				<td> <%=staffBusService.getDestination() %> </td>
	 				<td> <%=staffBusService.getCost() %> </td>
	 				<td>
	 					<form method="post" action="../GetBusServiceServlet">
	 						<input type="hidden" name="BID" value = "<%= staffBusService.getBID() %>"></input>
	 						<button type = "submit" class = "btn btn-outline-info waves-effect px-3"><i class = "fas fa-edit" aread-hidden="false"></i></button>
	 					</form>
	 				</td>
	 				
	 				<td>
	 					<form method="post" action="../DeleteBusServiceServlet">
	 						<input type="hidden" name="BID" value = "<%= staffBusService.getBID() %>"></input>
	 						<button type = "submit" class = "btn btn-outline-danger waves-effect px-3"><i class = "fas fa-trash-alt" aread-hidden="true"></i></button>
	 					</form>
	 				</td>
	 				</tr>
	 				
	 				
	 				
	 				<%} %>
	 				</tbody>
	 		
	 				
	 			</table>
	 			
		</div>
		<div>
								<a id="singlebutton" href="AddBusService.jsp"
									class="btn btn-primary">ADD TRANSPORT</a>
								<a id="singlebutton" href="TransportReport.jsp"
									class="btn btn-primary">TRANSPORT REPORT</a>

							</div>
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