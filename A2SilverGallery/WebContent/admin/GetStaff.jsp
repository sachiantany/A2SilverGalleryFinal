<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "model.Staff" %>
<%@page import = "service.StaffServiceImp" %>
<%@page import = "service.IStaffService" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
  
  <title>Admin | Update Staff</title>
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/add-staff.css" rel="stylesheet">
  
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
	
	<%
		Staff staff =  (Staff) request.getAttribute("staff");
	
	%>
	
	<div class="container-fluid" style = "padding : 15px">
	
	<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Staff
							Management</a></li>
					<li class="breadcrumb-item active">Update Staff Members</li>
				</ol>
				

		<form  method = "POST" action= "UpdateStaffServlet" class = "form-group">

			<table>
					<tr>
						<td>Staff ID</td>
						<td><input type = "text" name = "staffID" dissabled = "dissabled" value = <%=staff.getStaffID() %> class = "form-control" style = "width : 250%"></td>
					</tr>
			
					<tr>
						<td>Employee Name</td>
						<td><input type = "text" name = "employeeName" value = <%=staff.getEmployeeName() %> class = "form-control" style = "width : 250%"></td>
					</tr>
			
					
					<tr>
						<td>Street Address</td>
						<td><input type = "text" name = "streetAddress" value = <%=staff.getStreetAddress() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr>
						<td>City</td>
						<td><input type = "text" name = "city" value = <%=staff.getCity() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr style = "padding :10px">
						<td>Mobile</td>
						<td><input type = "text" name = "mobile" value = <%=staff.getMobile() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr>
						<td>Email</td>
						<td><input type = "email" name = "email" value = <%=staff.getEmail() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr>
						<td>Basic Salary</td>
						<td><input type = "text" name = "basicSalary" value = <%=staff.getBasicSalary() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					<tr>
							<td colspan="2"><input type="hidden" name="staffID" value="<%=staff.getStaffID()%>" /> 
							<td colspan="2"><input type="submit" value="Update Employee" class="btn btn-success" /> </td>
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