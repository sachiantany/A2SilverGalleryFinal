<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Staff - Custom Orders</title>

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

<body id="page-top">

	<jsp:include page="guestHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="guestSidebar.jsp"></jsp:include>

    <div id="content-wrapper">

      <div class="container-fluid">

				
				<!-- Page Content -->


				<H3>Add New Custom Order</H3>
				<hr>

				<form class="form-horizontal" action="../AddCustomOrderServlet"
					method="post" enctype="multipart/form-data">

					<fieldset class="formaddproduct">

						

						<!-- Select Basic -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="J_Type">Jewellary Type
								</label>
							<div class="col-md-4">
								<select id="J_Type" name="J_Type"
									class="form-control">
									<option>Ring</option>
									<option>Bangle</option>
									<option>Necklace</option>
									<option>Pendant</option>
									<option>Earrings</option>
									<option>Anklet</option>
									<option>Headband</option>
								</select>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="gem_stone">Desired
								Gem Stone</label>
							<div class="col-md-4">
								<input id="gem_stone" name="gem_stone"
									placeholder="Eg: Blue Gem" class="form-control input-md"
									required="" type="text">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="finger_size">Finger
								Size (If any)</label>
							<div class="col-md-4">
								<input id="finger_size" name="finger_size"
									placeholder="Eg: 22" class="form-control input-md"
									required="" type="text">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="metal_weight">Metal
								Weight (from grams)</label>
							<div class="col-md-4">
								<input id="metal_weight" name="metal_weight"
									placeholder="Eg: 24" class="form-control input-md"
									required="" type="text">

							</div>
						</div>

						<!-- Text input-->
						

						<!-- Textarea -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="product_description">Order
								Description</label>
							<div class="col-md-4">
								<textarea class="form-control" id="product_description"
									name="product_description"></textarea>
							</div>
						</div>

						

						<!-- File Button -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="filebutton">Sample
								Design</label>
							<div class="col-md-4">

								<input id="filebutton" name="filebutton" class="input-file"
									type="file">

							</div>
						</div>

						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="singlebutton"></label>
							<div class="col-md-4">
								<button id="singlebutton" name="singlebutton"
									class="btn btn-primary">Place the Order</button>
								
									<input type="reset" id="singlebutton" value="Reset" 
									class="btn btn-primary" />

							</div>
						</div>

					</fieldset>
				</form>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span></span>
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
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin.min.js"></script>

</body>

</html>
