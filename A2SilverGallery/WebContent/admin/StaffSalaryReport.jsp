<%@page import = "model.Salary" %>
<%@page import = "service.StaffServiceImp" %>
<%@page import = "service.IStaffService" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "util.StaffQueryUtil" %>


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
  
  <link href="${pageContext.request.contextPath}/css/add-staff.css" rel="stylesheet">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" crossorigin="anonymous"></script>
  
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

	
		<div class="container" style="padding : 15px">
			 <!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Staff
							Management</a></li>
					<li class="breadcrumb-item active">Salary Report</li>
				</ol>
				
				<%
					//Salary salary =  (Salary) request.getAttribute("salary");	
	 				//String salary =  (String) request.getAttribute("salary");	
	 				
	 				String month  = request.getParameter("month");
	 				String year = request.getParameter("year");
	 				String mName = null;
	 				%>
				
				
				<%
	 				switch(month){
	 				case "1":
	 					mName = "Janury";
	 					break;
	 				case "2":
	 					mName = "February";
	 					break;
	 				case "3":
	 					mName = "March";
	 					break;
	 				case "4":
	 					mName = "April";
	 					break;
	 				case "5":
	 					mName = "May";
	 					break;
	 				case "6":
	 					mName = "June";
	 					break;
	 				case "7":
	 					mName = "July";
	 					break;
	 				case "8":
	 					mName = "August";
	 					break;
	 				case "9":
	 					mName = "September";
	 					break;
	 				case "10":
	 					mName = "October";
	 					break;
	 				case "11":
	 					mName = "November";
	 					break;
	 				case "12":
	 					mName = "December";
	 					break;
	 				}
	 				
	 				
	 				%>
		
			<div align = "Center">
	 			<table id="exportTable" class = "table">
	 				<h2>Salary of Employees</h2>
	 				<h3><%= mName %> <%= year %></h3>
	 				
	 				<tr>
	 					<th>Staff ID </th>
	 					<th>Employee Name</th>
	 					<th>Basic Salary</th>
	 					<th>Final Salary </th>
	 				</tr>
	 			
	 					
	 				
	 				<% 
	 					StaffServiceImp iStaffService = new StaffServiceImp();
	 					ArrayList<Salary> arrayList = new ArrayList<Salary>();	 					
	 					arrayList = iStaffService.calculateStaffSalary(month,year);
	 					
	 					for(Salary sal : arrayList){
	
	 				%>
	 				
	 				<%
	 					double Tempsal = sal.getFinalSalary();
	 					if(Tempsal == 0 ){
	 						sal.setFinalSalary(sal.getBasicSalary());
	 					}
	 				%>
	 				
	 				<tr>
	 				<td> <%=sal.getStaffID() %> </td>
	 				<td> <%=sal.getEmployeeName() %> </td>
	 				<td> <%=sal.getBasicSalary() %> </td>
	 				<td> <%=sal.getFinalSalary() %> </td>
	 				
	 				</tr>
	 				
	 				<%} %>
	 		
	 				
	 			</table>
	 			<br><br><br>
	 			
	 			<% 
	 				double totSalary = 0;
	 				int count = 0;
	 				for(Salary sal : arrayList){
	 					totSalary = totSalary + sal.getFinalSalary();
	 					count++;
	 				}
	 			%>
	 			<div id = "salReport">
	 				<p>Total Salary Distributed among Employees = <%=totSalary %><br>
	 				Average of Salary Distibuted among Employees = <%= totSalary / count %></p>
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