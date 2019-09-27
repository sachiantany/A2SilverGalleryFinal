
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>User - Dashboard</title>
  
  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">

</head>

<body id = "page-top">

	<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="guest.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="list-item.jsp">
          <i class="fas fa-gem"></i>
          <span>Jewllary Items</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fab fa-product-hunt"></i>
          <span>Custom Orders</span></a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="custom.jsp">Add Custom Orders</a>
          <a class="dropdown-item" href="COrder_Report.jsp">View Custom Orders</a>

         </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="list-item.jsp">
          <i class="fas fa-shopping-cart"></i>
          <span>My Cart</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="salesReport.jsp">
          <i class="fas fa-money-bill-alt"></i>
          <span>Sales Report</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-users-cog"></i>
          <span>My Profile</span></a>
      </li>
     
    </ul>
    
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