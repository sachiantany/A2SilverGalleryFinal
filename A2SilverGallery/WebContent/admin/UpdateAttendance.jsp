<%@page import="model.attendance"%>
<%@page import="service.IattendanceServiceImpl"%>
<%@page import="service.IattendanceService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin - Update Attendance</title>

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="../vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin.css" rel="stylesheet">
<link href="../css/styleaddproduct.css" rel="stylesheet">
</head>
<body>

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


		
		<%
					
					String attendanceid = (request.getParameter("attendance_id"));

					IattendanceService iattendance = new IattendanceServiceImpl();

					attendance at = iattendance.getAttendanceByID(attendanceid);
		%>
		

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Page Content -->

				<H3>UPDATE ATTENDANCE</H3>
				<hr>

				<form class="form-horizontal" action="../UpdateAttendanceServlet" method="post" >

					<fieldset class="formaddproduct">
					
					<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="product_name">Attendance
								Id</label>
							<div class="col-md-4">
								<input id="product_name" name="product_id"
									value="<%= at.getAttendanceid()%>" placeholder="Attendance ID"
									class="form-control input-md" required="" type="text">

							</div>
						</div>
					

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="product_name">Staff
								Name</label>
							<div class="col-md-4">
								<input id="product_name" name="product_name"
									value="<%= at.getSname()%>" placeholder="staff name"
									class="form-control input-md" required="" type="text">

							</div>
						</div>

						

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="available_quantity">Date
								</label>
							<div class="col-md-4">
								<input id="available_quantity" value="<%= at.getTattendance()%>"
									name="available_quantity" placeholder="total attendance"
									class="form-control input-md" required="" type="text">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="setting_with">Time Arrived
								</label>
							<div class="col-md-4">
								<input id="setting_with" value="<%= at.getHoliday()%>"
									name="setting_with" placeholder="holiday"
									class="form-control input-md" required="" type="text">

							</div>
						</div>

						
						
						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="singlebutton"></label>
							<div class="col-md-4">
								<button id="singlebutton" name="singlebutton"
									class="btn btn-primary">UPDATE ATTENDANCE</button>
							</div>
						</div>

					</fieldset>
				</form>

			</div>
			</div>
	
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright © Your Website 2019</span>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.content-wrapper -->


	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js" type="text/javascript"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"
		type="text/javascript"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin.min.js" type="text/javascript"></script>

</body>
</html>