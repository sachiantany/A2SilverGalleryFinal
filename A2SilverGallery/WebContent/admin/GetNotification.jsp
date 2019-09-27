<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "model.Notification" %>
<%@page import = "service.NotificationServiceImp" %>
<%@page import = "service.INotificationService" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
  
  <title>Admin | Update Notification</title>
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
  
</head>

<body id="page-top">

	<!-- Admin Header -->
	

	
	<jsp:include page="adminHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="adminSideMenu.jsp"></jsp:include>
	
	<%
		Notification notification =  (Notification) request.getAttribute("notification");
	%>

	
		<div style = "padding : 40px">
		<form  method = "POST" action= "UpdateNotificationServlet" class = "form-group">

			<table>
					<tr>
						<td>Notification ID</td>
						<td><input type = "text" name = "NID" value = <%=notification.getNID() %> class = "form-control" style = "width : 250%"></td>
					</tr>
			
					
					<tr>
						<td>Employee Name</td>
						<td><input type = "text" name = "eName" value = <%=notification.getEname() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					
					<tr>
						<td>Staff ID</td>
						<td><input type = "text" name = "staffID" value = <%=notification.getStaffID() %> class = "form-control" style = "width : 250%"></td>
					</tr>
					
					
					<tr>
						<td>Massage</td>
						<td><input type = "text" name = "Massages" value = <%=notification.getMassages() %> class = "form-control" style = "width : 250%"></td>
						
					</tr>
					
					
					
					<tr>
							<td colspan="2"><input type="hidden" name="NID" value="<%=notification.getNID()%>" /> 
							<td colspan="2"><input type="submit" value="Update Massage" class="btn btn-success" /> </td>
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