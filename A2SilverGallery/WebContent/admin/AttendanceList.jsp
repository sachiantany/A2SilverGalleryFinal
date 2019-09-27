<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@page import = "model.attendance" %>
	<%@page import = "service.IattendanceServiceImpl" %>
	<%@page import = "service.IattendanceService" %>
	<%@page import = "java.util.ArrayList" %>
	
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
  
  	<title>Admin | Add Attendance</title>
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
		<div style = "padding : 20px">
		
			<div align = "Center" id = "attendanceList">
			
			<% 
	 				IattendanceService iattendanceService = new IattendanceServiceImpl();
	 					List<attendance> arrayList = iattendanceService.readData();
	 					Iterator<attendance> iter = arrayList.iterator();
	 					
	 					
	
	 				%>
	 			<table class = "table table-striped table-responsive table-hover table-striped">
	 				<h2>List Of Attendance</h2>
	 				<tr>
	 					<th>Attendance ID </th>
	 					<th>Employee Name</th>
	 					<th>Date </th>
	 					<th>Time Arrived</th>
	 					<th>Update</th>
	 					<th>Delete</th>
	 				</tr>
	 				
	 				 <% 	
			while(iter.hasNext()){
				attendance at = new attendance();
				at = iter.next();
					
		%>
	 				
	 				<tr>
	 				<td> <%=at.getAttendanceid() %> </td>
	 				<td> <%=at.getSname() %> </td>
	 				<td> <%=at.getTattendance() %> </td>
	 				<td> <%=at.getHoliday() %> </td>
	 				
					<td><a style="color:red;" href="UpdateAttendance.jsp?attendance_id=<%= at.getAttendanceid()%>" >Edit</a></td>
					<td>
	 					<form method="post" action="../DeleteAttendanceServlet">
	 						<input type="hidden" name="attendanceid" value = "<%= at.getAttendanceid() %>"></input>
	 						<button type = "submit" class = "btn btn-outline-danger waves-effect px-3"><i class = "fas fa-trash-alt" aread-hidden="true"></i></button>
	 					</form>
	 				</td>	 				</tr>
	 				
	 				<%} %>
	 		
	 				
	 			</table>
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