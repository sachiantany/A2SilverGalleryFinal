<%@page import = "model.Staff" %>
<%@page import = "service.StaffServiceImp" %>
<%@page import = "service.IStaffService" %>
<%@page import = "java.util.ArrayList" %>


<head>

<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
  
  <title>Admin | Add Staff</title>
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
  
</head>

<body id="page-top">

	<!-- Admin Header -->
	
	
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
	
	
		<div class="container-fluid" style="padding : 15px">
			 <!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Staff
							Management</a></li>
					<li class="breadcrumb-item active">Staff List</li>
				</ol>
		
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
	 					<th>Update</th>
	 					<th>Delete</th>
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
	 					<th>Update</th>
	 					<th>Delete</th>
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
	 				<td>
	 					<form method="post" action="../GetStaffServlet">
	 						<input type="hidden" name="staffID" value = "<%= staff.getStaffID() %>"></input>
	 						<button type = "submit" class = "btn btn-outline-info waves-effect px-3"><i class = "fas fa-edit" aread-hidden="false"></i></button>
	 					</form>
	 				</td>
	 				
	 				<td>
	 					<form method="post" action="../DeleteStaffServlet">
	 						<input type="hidden" name="staffID" value = "<%= staff.getStaffID() %>"></input>
	 						<button type = "submit" onclick="return confirm('Are you sure you want to delete?')" class = "btn btn-outline-danger waves-effect px-3"><i class = "fas fa-trash-alt" aread-hidden="true"></i></button>
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