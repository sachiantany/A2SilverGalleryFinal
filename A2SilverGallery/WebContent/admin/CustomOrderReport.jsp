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
            
              <table class="table" id="dataTable" width="100%" cellspacing="0">
                <thead>
                   <tr>
                    <th>ID</th>
                    <th>image</th>
                    <th>Jewelary Type</th>
                    <th>Gem Stone</th>
                    <th>size</th>
                    <th>Metal Weight</th>
                    <th>description</th>
                    
                  </tr>
                </thead>

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

			
                  </tr>
                  <% 
                  
			}
	
			%>
                 
                </tbody>
              </table>
            </div>
          </div>

        </div>

      </div>
     

    </div>
    <!-- /.content-wrapper -->

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
