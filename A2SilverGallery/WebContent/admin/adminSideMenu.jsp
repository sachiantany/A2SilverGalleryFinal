<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

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

<body id = "page-top">

	<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="admin.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fab fa-product-hunt"></i>
          <span>Product Manage</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Product:</h6>
          <a class="dropdown-item" href="add-product.jsp">Add Product</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Reports:</h6>
          <a class="dropdown-item" href="product-report.jsp">Product Report</a>
          <a class="dropdown-item" href="export-pdf.jsp">Stock Report</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-box-open"></i>
          <span>Order Management</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Custom Orders:</h6>
          <a class="dropdown-item" href="CReport.jsp">Custom Order Report</a>
         </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-users"></i>
          <span>Staff Manage</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Staff:</h6>
          <a class="dropdown-item" href="AddStaff.jsp">Add Staff</a>
          <a class="dropdown-item" href="StaffList.jsp">Staff List</a>
          <a class="dropdown-item" href="StaffAttendance.jsp">Staff Attendance</a>
          <h6 class="dropdown-header">Staff:</h6>
          <a class="dropdown-item" href="attendanceReport.jsp">Attendance Report</a>
          <a class="dropdown-item" href="RequestSalary.jsp">Salary Report</a>
          
          
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-users"></i>
          <span>Transportation</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
         
          <a class="dropdown-item" href="AddBusService.jsp">Transportation Service</a>
          <a class="dropdown-item" href="BusList.jsp">Transportation List</a>
          <a class="dropdown-item" href="TransportReport.jsp">Transportation Report</a>
        </div>
      </li>
      
    
    
    </ul>
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