<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
  
  <title>Admin | Add Staff</title>
  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">
    <link href="../css/add-staff.css" rel="stylesheet">
  
</head>

<body id="page-top">


<%
		
		if ((request.getSession(false).getAttribute("Admin") == null)) {
	%>
	<jsp:forward page="/admin/login.jsp"></jsp:forward>
	<%
		}
	%> 
	
	
	<!-- Admin Header -->
	

	
	<jsp:include page="adminHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="adminSideMenu.jsp"></jsp:include>
		
	<div id="content-wrapper">

   	   <div class="container-fluid">
   	   
   	   <!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Staff
							Management</a></li>
					<li class="breadcrumb-item active">Add Staff Members</li>
				</ol>
   	   
		<form  method = "POST" action= "../AddStaffServlet" class = "form-group">
			<div   class="tbl">
			<table>
			

					<tr>
						<td>Employee Name</td>
						<td><input type = "text" name = "employeeName" class = "form-control" style = "width : 250%" required></td>
					</tr>

					<tr>
						<td>Street Address</td>
						<td><input type = "text" name = "streetAddress" class = "form-control" style = "width : 250%" required></td>
					</tr>
					
					<tr>
						<td>City</td>
						<td><input type = "text" name = "city" class = "form-control" style = "width : 250%" required></td>
					</tr>
					
					<tr style = "padding :10px">
						<td>Mobile</td>
						<td><input type = "text" name = "mobile" class = "form-control" style = "width : 250%" required minlength = "10" maxlength="10"></td>
					</tr>
					
					<tr>
						<td>Email</td>
						<td><input type = "email" name = "email" class = "form-control" style = "width : 250%" required></td>
					</tr>
					
					<tr>
						<td>Basic Salary</td>
						<td><input type = "text" name = "basicSalary" class = "form-control" style = "width : 250%" required></td>
					</tr>
					
					<tr>
							<td colspan="2"><input type="submit" value="Add Employee" class="btn btn-success" /> </td>
						</tr>
						<tr>	
							<td colspan="2"><input type="reset" value="Reset" class="btn btn-warning" /></td>
						</tr>
													
			</table>
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