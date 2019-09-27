<%@page import="model.CustomOrder"%>
<%@page import="service.CustomServiceImpl"%>
<%@page import="service.ICustomService"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.CustomOrder"%>

<%@page import="service.ICustomService"%>
<%@page import="service.CustomServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
  
<title>Order Report</title>
<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin.css" rel="stylesheet">

</head>
<body id="page-top">

<jsp:include page="guestHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="guestSidebar.jsp"></jsp:include>

    <div id="content-wrapper">

      <div class="container-fluid">
    
    <%
					String CID2 = request.getParameter("CID2");
	
					ICustomService icustom = new CustomServiceImpl();
	
					icustom.DeleteItemValues(CID2);
	
	%>


      

       
        
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Jewelry Item Table </div>
          <div class="card-body">
            <div class="table-responsive">
            
            <%
	ICustomService icustom1 = new CustomServiceImpl();
    List<CustomOrder> list1 = icustom1.readData();
 
	Iterator<CustomOrder> iter = list1.iterator();
%>
            
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                   <tr>
                    <th>ID</th>
                    <th>image</th>
                    <th>Jewelary Type</th>
                    <th>Gem Stone</th>
                    <th>size</th>
                    <th>Metal Weight</th>
                    <th>description</th>
                    <th>Update</th>
                    <th>Delete</th>
                    
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>ID</th>
                    <th>image</th>
                    <th>Jewelary Type</th>
                    <th>Gem Stone</th>
                    <th>size</th>
                    <th>Metal Weight</th>
                    <th>description</th>
                    <th>Update</th>
                    <th>Delete</th>
                    
                  </tr>
                </tfoot>
                <tbody>
                <% 	
			while(iter.hasNext()){
				CustomOrder O = new CustomOrder();
				O = iter.next();
					
		%>
       
                  <tr>
                    <td><%=O.getCID()%></td>
                    <td >
					<img src="data:image/png;base64,<%=O.getImageData()%>" width="240" height="240"/>     
					</td>
					<td><%= O.getJType() %></td>
					<td><%= O.getGemStone() %></td>					
					<td><%= O.getFingerSize() %></td>
					<td><%= O.getMetalWeight() %></td>
					<td><%= O.getDescription() %></td>
					<td><a style="color:red;" href="UpdateOrder.jsp?CID=<%= O.getCID()%>" >Edit</a></td>
					<td><a style="color:red;" href="COrder_Report.jsp?CID2=<%= O.getCID()%>" >Delete</a></td>
			
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
    <a id="singlebutton" href="custom.jsp" class="btn btn-primary">ADD NEW ITEM</a>
    
  <a id="singlebutton" href="customOrderPdf.jsp" class="btn btn-primary">REPORT</a> </div>
  </div>
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
