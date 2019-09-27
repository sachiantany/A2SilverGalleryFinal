<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
  
    <style>
  input[type = text]{
  border : 1px solid green;
  border-radius: 4px;
  }
  input[type = number]{
  border : 1px solid green;
  }</style>
  
</head>

<body id="page-top">

	<!-- Admin Header -->
	

	
	<jsp:include page="adminHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="adminSideMenu.jsp"></jsp:include>
	
	<div id="content-wrapper">

   	   <div class="container-fluid">
   	   
   	   <!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Transport
							Management</a></li>
					<li class="breadcrumb-item active">Add Transpotation</li>
				</ol>
	
	<div style = "padding : 20px">
	
	
		<form  method = "POST" action= "../AddBusServiceServlet" class = "form-group">
			
			<table>
					<tr>
						<td>Employee Name</td>
						<td><input type = "text" name = "employeeName" class = "form-control" style = "width : 250%" required></td>
					</tr>
			
					
					<tr>
						<td>Employee ID</td>
						<td><input type = "text"  name = "EmployeeID" class = "form-control" style = "width : 250%" required ></td>
					</tr>
					
					<tr>
						<td>Bus Number</td>
						<td><input type = "text" name = "BusNumber" class = "form-control" style = "width : 250%" required></td>
					</tr>
					
					<tr style = "padding :10px">
						<td>Destination</td>
						<td><input type = "text" name = "Destination" class = "form-control" style = "width : 250%" required></td>
					</tr>
					
					<tr>
						<td>Total Cost</td>
						<td><input type = "text" name = "TotalCost" class = "form-control" style = "width : 250%" required></td>
					</tr>
					
					<tr>
							<td colspan="2"><input type="submit" value="Add Employee" class="btn btn-success" /> </td>
						</tr>
						<tr>	
							<td colspan="2"><input type="reset" value="Reset" class="btn btn-warning" /></td>
							
							
													
			</table>

		</form>
	
	</div></div></div>
	
	</div>
		

</body>
</html>