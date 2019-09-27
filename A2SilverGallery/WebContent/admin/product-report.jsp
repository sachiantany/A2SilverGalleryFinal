<!DOCTYPE html>
<%@page import="java.io.OutputStream"%>
<%@page import="java.util.List"%>
<%@page import="service.AdminServiceImpl"%>
<%@page import="service.IAdminService"%>
<%@page import="model.AdminProduct"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">

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
    
    <%
					String PID2 = request.getParameter("PID2");
	
					IAdminService iadmin2 = new AdminServiceImpl();
	
					iadmin2.DeleteItemValues(PID2);
	
	%>

    <div id="content-wrapper">

      <div class="container-fluid">
      
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Product Management</a>
          </li>
          <li class="breadcrumb-item active">Product Report</li>
        </ol>

       
        
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Jewelry Item Table </div>
          <div class="card-body">
            <div class="table-responsive">
            
            <%
	IAdminService iadmin= new AdminServiceImpl();
    List<AdminProduct> list = iadmin.readData();
 
	Iterator<AdminProduct> iter = list.iterator();
%>
            
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                   <tr>
                    <th>ID</th>
                    <th>image</th>
                    <th>Name</th>
                    <th>categories</th>
                    <th>quantity</th>
                    <th>settings</th>
                    <th>metal</th>
                    <th>stone</th>
                    <th>description</th>
                    <th>price (Rs.)</th>
                    <th>Update</th>
                    <th>Delete</th>
                    
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>ID</th>
                    <th>image</th>
                    <th>Name</th>
                    <th>categories</th>
                    <th>quantity</th>
                    <th>settings</th>
                    <th>metal</th>
                    <th>stone</th>
                    <th>description</th>
                    <th>price (Rs.)</th>
                    <th>Update</th>
                    <th>Delete</th>
                    
                  </tr>
                </tfoot>
                <tbody>
                <% 	
			while(iter.hasNext()){
				AdminProduct ap = new AdminProduct();
				ap = iter.next();
					
		%>
       
                  <tr>
                    <td><%= ap.getPID() %></td>
                    <td >
					<img src="data:image/png;base64,<%=ap.getImageData()%>" width="240" height="240"/>     
					</td>
					<td><%= ap.getProductName() %></td>
					<td><%= ap.getProductCat() %></td>
					<td><%= ap.getQuantity() %></td>
					<td><%= ap.getSettingWith() %></td>
					<td><%= ap.getMetalWeight() %></td>
					<td><%= ap.getStoneWeight() %></td>
					<td><%= ap.getDescription() %></td>
					<td><%= ap.getPrice() %></td>
					<td><a style="color:red;" href="update-product.jsp?PID=<%= ap.getPID()%>" >Edit</a></td>
					<td><a style="color:red;" onclick="return confirm('Are you sure you want to delete?')" href="product-report.jsp?PID2=<%= ap.getPID()%>" >Delete</a></td>
			
                  </tr>
                  <% 
                  
			}
	
			%>
                 
                </tbody>
              </table>
            </div>
          </div>
          <div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <a id="singlebutton" href="add-product.jsp" class="btn btn-primary">ADD NEW ITEM</a>
  <a id="singlebutton" href="export-pdf.jsp" class="btn btn-primary">PDF VIEW</a> </div>
  </div>
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>A2 SILVER GALLERY</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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
