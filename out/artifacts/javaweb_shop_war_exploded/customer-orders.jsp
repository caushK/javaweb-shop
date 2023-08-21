<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<%@page import="java.util.*"%>

<%@page import="shop.vo.User"%>
<%@page import="shop.dao.UserDAO"%>
<%@page import="shop.dao.impl.UserDAOImpl"%>

<%@page import="shop.vo.TotalOrder"%>
<%@page import="shop.dao.OrderDAO"%>
<%@page import="shop.dao.impl.OrderDAOImpl"%>

<% User user = new User(); %>
<% User nowUser = new User(); %>

<% TotalOrder order = new TotalOrder(); %>
<% TotalOrder nowOrder = new TotalOrder(); %>

<% UserDAO userDao = new UserDAOImpl(); %>
<% OrderDAO orderDao = new OrderDAOImpl(); %>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>jj's shop</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
    <!-- owl carousel-->
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  
  </head>
  <body>

  <%String username = (String) session.getAttribute("username");%>
    <!-- navbar-->
    <header class="header mb-5">
      <!--
      *** TOPBAR ***
      _________________________________________________________
      -->
      <div id="top">
        <div class="container">
          <div class="row">
            <div class="col-lg-6 offer mb-3 mb-lg-0"><a href="index.jsp" class="btn btn-success btn-sm">jj's shop</a>Welcome to jj's shop!</div>
            <div class="col-lg-6 text-center text-lg-right">
<!-- 判断用户是否登陆 -->            
            <%if(username==null){%>
              <ul class="menu list-inline mb-0">
                <li class="list-inline-item"><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
                <li class="list-inline-item"><a href="register.jsp">Register</a></li>
              </ul>
            <%}else{
            %>
			  <ul class="menu list-inline mb-0">
                <li class="list-inline-item"><a href="customer-account.jsp"> Welcome, <%= username %>!</a></li>
                <li class="list-inline-item"><a href="logout.jsp">Logout</a></li>
              </ul>
			<%}%>
            </div>
          </div>
        </div>
        <div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true" class="modal fade">
          <div class="modal-dialog modal-sm">
            <div class="modal-content">
              <div class="modal-header">
<!-- Login -->                
				<h5 class="modal-title">Customer login</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">—</span></button>
              </div>
              <div class="modal-body">
                <form method = "post" action = "./login">
                  <div class="form-group">
                    <input name = "username" type="text" placeholder="Username" class="form-control">
                  </div>
                  <div class="form-group">
                    <input name = "password" type="password" placeholder="password" class="form-control">
                  </div>
                  <p class="text-center">
                    <button type="submit" name="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                  </p>
                </form>
                <p class="text-center text-muted">Not registered yet?</p>
                <p class="text-center text-muted"><a href="register.jsp"><strong>Register now</strong></a>! It is easy and done in one minute and gives you access to special discounts and much more!</p>
              </div>
            </div>
          </div>
        </div>   
      </div>
      <nav class="navbar navbar-expand-lg">
        <div class="container"><a href="index.jsp" class="navbar-brand home"><img src="img/logo.png" alt="jj logo" class="d-none d-md-inline-block"><img src="img/logo-small.png" alt="jj logo" class="d-inline-block d-md-none"><span class="sr-only">jj - go to homepage</span></a>
          <div class="navbar-buttons">
            <button type="button" data-toggle="collapse" data-target="#navigation" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
<!-- Cart -->            
            <%if(session.getAttribute("username")==null){%>
            <button type="button" data-toggle="collapse" data-target="#search" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></button><a href="register.jsp" class="btn btn-outline-secondary navbar-toggler"><i class="fa fa-shopping-cart"></i></a>
          	<%}
              else{ %>
          	<button type="button" data-toggle="collapse" data-target="#search" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></button><a href="./basket.jsp?username=<%=username%>" class="btn btn-outline-secondary navbar-toggler"><i class="fa fa-shopping-cart"></i></a>
          	<%}%>
           </div>
          <div id="navigation" class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
<!-- 商品大类 -->
              <li class="nav-item dropdown menu-large"><a href="electronic organ.jsp?username=<%=username%>" class="nav-link">Category<b class="caret"></b></a>
              </li>
<!-- About us -->
              <li class="nav-item dropdown menu-large"><a href="aboutUs.jsp" class="nav-link">About us<b class="caret"></b></a>
              </li>
            </ul>
            <div class="navbar-buttons d-flex justify-content-end">
              <!-- /.nav-collapse-->
<!-- Sraech image -->
              <div id="search-not-mobile" class="navbar-collapse collapse"></div><a data-toggle="collapse" href="#search" class="btn navbar-btn btn-primary d-none d-lg-inline-block"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></a>
<!-- Cart image -->
			  <%if(session.getAttribute("username")==null){%>	
                <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block"><a href="register.jsp" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span></span></a></div>
              <%}
              else{ %>
                <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block"><a href="./basket.jsp?username=<%=username%>" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span></span></a></div>
              <%}%>
            </div>
          </div>
        </div>
      </nav>
  <!-- Sraech -->
  <div id="search" class="collapse">
    <div class="container">
      <form method="post" action="./search" role="search" class="ml-auto">
        <div class="input-group">
          <input type="text" name="commodityname" placeholder="Search" class="form-control">
          <div class="input-group-append">
            <button type="submit" name="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
          </div>
        </div>
      </form>
    </div>
  </div>
    </header>
<!-- *** TOP BAR END ***-->

    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">My orders</li>
                </ol>
              </nav>
            </div>
            <div class="col-lg-3">
              <!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu">
                <div class="card-header">
                  <h3 class="h4 card-title">Customer section</h3>
                </div>
                <div class="card-body">
                  <ul class="nav nav-pills flex-column">
                  <a href="customer-account.jsp" class="nav-link"><i class="fa fa-user"></i> My account</a>
                  <a href="customer-orders.jsp" class="nav-link active"><i class="fa fa-list"></i> My orders</a>
                  <a href="logout.jsp" class="nav-link"><i class="fa fa-sign-out"></i> Logout</a></ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div id="customer-orders" class="col-lg-9">
              <div class="box">
                <h1>My orders</h1>
                <p class="lead">Your orders on one place.</p>
                <p class="text-muted">If you have any questions, please feel free to contact us, our customer service center is working for you 24/7.</p>
                <hr>
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>Order</th>
                        <th>Date</th>
                        <th>Total</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                    <% user.setUsername(username); %>
                    <% nowUser = userDao.getUserInfo(user); %>
                    <% order.setCustomerId(nowUser.getId()); %>
                    <% ArrayList<TotalOrder> totalOrder = new ArrayList<TotalOrder>(); %>
                    <% totalOrder = orderDao.getTotalOrderInfo(order); %>
                    <% for(int i = 0;i < totalOrder.size();i++){ %>
                    <% nowOrder = totalOrder.get(i); %>
                      
                      <tr>
                        <% String totalOrderId = nowOrder.getTotalOrderId(); %>
                        <% String date = nowOrder.getDate(); %>
                        <% String totalCost = nowOrder.getTotalCost(); %>
                        <th># <%= totalOrderId %></th>
                        <td><%= date %></td>
                        <td>$ <%= totalCost %></td>
                        
          <!-- 查看订单的详细信息 -->
                        <td><a href="customer-order.jsp?totalOrderId=<%= totalOrderId %>" class="btn btn-primary btn-sm">View</a></td>
                      </tr>
                      
                      <%}%><!-- end for -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
<!--
    *** COPYRIGHT ***
    _________________________________________________________
    -->
<div id="copyright">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 mb-2 mb-lg-0">
       <p class="text-center text-lg-left">THIS APP BELONGS TO JJ.</p>
      </div>
      <div class="col-lg-6">
        <p class="text-center text-lg-right">Copyright &copy; 2021. jj's shop All rights reserved.</p>
      </div>
    </div>
  </div>
</div>
<!-- *** COPYRIGHT END ***-->
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>