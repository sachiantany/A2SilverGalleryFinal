<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin - Add Product</title>

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

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Product
							Management</a></li>
					<li class="breadcrumb-item active">Add Product</li>
				</ol>

				<!-- Page Content -->


				<H3>ADD NEW JEWELLRY ITEM</H3>
				<hr>

				<form class="form-horizontal" action="../AdminAddProductServlet"
					method="post" enctype="multipart/form-data">

					<fieldset class="formaddproduct">

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="product_name">PRODUCT
								NAME</label>
							<div class="col-md-4">
								<input id="product_name" name="product_name"
									placeholder="PRODUCT NAME" class="form-control input-md"
									required="" type="text">

							</div>
						</div>

						<!-- Select Basic -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="product_categorie">PRODUCT
								CATEGORY</label>
							<div class="col-md-4">
								<select id="product_categorie" name="product_categorie"
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
							<label class="col-md-4 control-label" for="available_quantity">AVAILABLE
								QUANTITY</label>
							<div class="col-md-4">
								<input id="available_quantity" name="available_quantity"
									placeholder="AVAILABLE QUANTITY" class="form-control input-md"
									required="" type="text">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="setting_with">SETTING
								WITH</label>
							<div class="col-md-4">
								<input id="setting_with" name="setting_with"
									placeholder="SETTING WITH" class="form-control input-md"
									required="" type="text">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="metal_weight">METAL
								WEIGHT</label>
							<div class="col-md-4">
								<input id="metal_weight" name="metal_weight"
									placeholder="METAL WEIGHT" class="form-control input-md"
									required="" type="text">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="stone_weight">STONES
								WEIGHT</label>
							<div class="col-md-4">
								<input id="stone_weight" name="stone_weight"
									placeholder="STONES WEIGHT" class="form-control input-md"
									required="" type="text">

							</div>
						</div>

						<!-- Textarea -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="product_description">PRODUCT
								DESCRIPTION</label>
							<div class="col-md-4">
								<textarea class="form-control" id="product_description"
									name="product_description"></textarea>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="product_price">PRODUCT
								PRICE</label>
							<div class="col-md-4">
								<input id="product_price" name="product_price"
									placeholder="PRODUCT PRICE" class="form-control input-md"
									required="" type="text">

							</div>
						</div>

						<!-- File Button -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="filebutton">PRODUCT
								IMAGE</label>
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
									class="btn btn-primary">ADD PRODUCT</button>
								<a id="singlebutton" href="product-report.jsp"
									class="btn btn-primary">PRODUCT REPORT</a>

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
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin.min.js"></script>

</body>

</html>
