<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Browse Products</title>

  <!-- Custom fonts for this template-->
  <link href="resources/theme1//vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/theme1/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <div class="sidebar-brand d-flex align-items-center justify-content-center">
        <div style="color: white" class="sidebar-brand-text mx-3">b2b Medical Supplies</div>
      </div>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
      <form action="pharmacyHomePage" method="get">
          <span> 
          	<input class="btn btn-primary btn-user btn-block" type="submit" value="Home"> 
          </span>
		</form>
      </li>


      <!-- Nav Item - Details -->
      <li class="nav-item">
      <form action="pharmacyDetailsPage" method="get">
          <span> 
          	<input class="btn btn-primary btn-user btn-block" type="submit" value="Details"> 
          </span>
		</form>
      </li>

	  <!-- Nav Item - Orders -->
      <li class="nav-item">
      <form action="pharmacyOrderDetailsPage" method="get">
          <span> 
          	<input class="btn btn-primary btn-user btn-block" type="submit" value="Orders"> 
          </span>
		</form>
      </li>
      
	 <!-- Nav Item - Products -->
     <li class="nav-item">
      <form action="pharmacyBrowseProducts" method="get">
          <span> 
          	<input class="btn btn-primary btn-user btn-block" type="submit" value="Products"> 
          </span>
		</form>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
        <h3>Welcome <%= session.getAttribute("userName") %></h3>

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

         

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

          
     

          

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            
              <!-- Dropdown - User Information -->
              <div style="justify-content: center; align-content: center">
                <form action="logout" method="get"> <input class="btn btn-primary btn-user btn-block" type="submit" value="Logout"></form>
                
              </div>
            

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
	       <div> <h1 class="h3 mb-4 text-gray-800" style="padding-left: 10px">Browse Products</h1></div>
	      
	          <!-- Page Heading -->
	          
	           
	      <div class="card shadow mb-4">
          	
           
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th>Cost</th>
                      <th>Quantity Per Pellet</th>
                      <th>Manufacturer Name</th>
                      <th>Purchase</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items = "${ilist}" var = "productandmanufacturer" >
                    <tr>
                      <td>
                      	${productandmanufacturer.prodName}
                      </td>
                      <td>
                      	${productandmanufacturer.prodCost}
                      </td>
                      <td>
                      	${productandmanufacturer.prodQuantity}
                      </td>
                      <td>
                      	${productandmanufacturer.manuName}
                      </td>
                      <td>
                      	<form action="pharmacyBuyProduct" method="post">
                      		<input type="hidden" name="prodId" value="${productandmanufacturer.prodId}">
                      		<input type="hidden" name="prodCost" value="${productandmanufacturer.prodCost}">
                      		<input type="hidden" name="prodQuantity" value="${productandmanufacturer.prodQuantity}">
                      		<input type="hidden" name="manuId" value="${productandmanufacturer.manuId}">
                      		<input class="btn btn-danger btn-user btn-block" type="submit" value="Buy Product">
                      	</form>
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
         </div>
        <!-- /.container-fluid -->
           
      
      <!-- End of Main Content -->
      
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; b2b Medical Supplies</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

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
            <span aria-hidden="true">�</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
  
  <!-- To solve the backtracking issue -->
  <script type="text/javascript">
  	function preventBack() { window.history.forward(); }
  	setTimeout("preventBack()", 0);
  	window.onunload = function() { null };
  </script>

  <!-- Bootstrap core JavaScript-->
  <script src="<c:url value="/resources/theme1/vendor/jquery/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/theme1//vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
  
  <!-- Core plugin JavaScript-->
  <script src="<c:url value="/resources/theme1/vendor/jquery-easing/jquery.easing.min.js" />"></script>
  
  <!-- Custom scripts for all pages-->
  <script src="<c:url value="/resources/theme1/js/sb-admin-2.min.js" />"></script>

</body>

</html>
