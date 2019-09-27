<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notifications</title>
</head>
<body>

</body>
</html><%@page import = "model.Notification" %>
<%@page import = "service.NotificationServiceImp" %>
<%@page import = "service.INotificationService" %>
<%@page import = "java.util.ArrayList" %>


<head>

<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
  
  <title>Admin | Notification Table</title>
  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">
  
</head>

<body id="page-top">

	<!-- Admin Header -->
	

	
	<jsp:include page="guestHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="guestSidebar.jsp"></jsp:include>
		<div style = "padding : 20px">
		
			<div align = "Center" id = "eventList">
	 			<table class = "table table-striped table-responsive table-hover table-striped">
	 				<h2>New Notifications</h2>
	 				<tr>
	 					
	 					<th>Notification Number</th>
	 					<th>Employee Name </th>
	 					<th>Massage</th>
	 				
	 				</tr>
	 				
	 				<% 
	 					INotificationService iNotificationService = new NotificationServiceImp();
	 					ArrayList<Notification> arrayList = new ArrayList<Notification>();
	 					arrayList = iNotificationService.getNotification();
	 					
	 					for(Notification notification : arrayList){
	
	 				%>
	 				
	 				<tr>
	 				
	 				<td> <%=notification.getNID() %> </td>
	 				<td> <%=notification.getEname() %> </td>
	 				<td> <%=notification.getMassages() %> </td>

	 				</tr>
	 				
	 				<%} %>
	 		
	 				
	 			</table>
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