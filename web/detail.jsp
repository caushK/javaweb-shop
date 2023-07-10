<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="shop.dao.impl.CommodityDaoImpl" %>
<%@ page import="shop.vo.Commodity" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
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
            <li class="nav-item"><a href="electronic organ.jsp" class="nav-link">Electronic piano</a></li>
            <li class="nav-item"><a href="category.jsp" class="nav-link">Piano</a></li>
            <li class="nav-item"><a href="accordition.jsp" class="nav-link">Accordion</a></li>
            <li class="nav-item dropdown menu-large"><a href="aboutUs.jsp" class="nav-link">About us<b class="caret"></b></a>
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
           </div>
            
        <%
          CommodityDaoImpl commodityDao=new CommodityDaoImpl();
          Commodity commodity = commodityDao.findCommodityById(Integer.parseInt(request.getParameter("id")));
          if(commodity!=null){
        %>
            
            <div class="col-lg-9 order-1 order-lg-2">
              <div id="productMain" class="row">
                <div class="col-md-6">
                  <div data-slider-id="1" class="owl-carousel shop-detail-carousel">
                    <div class="item"> <img src="img/<%=commodity.getImg() %>" alt="" class="img-fluid"></div>
                  </div>
                  <div class="ribbon sale">
                    <div class="theribbon">SALE</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                  <div class="ribbon new">
                    <div class="theribbon">NEW</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                </div>
                <div class="col-md-6">
                  <div class="box">
                    <h1 class="text-center"><%=commodity.getCommodityname() %></h1>
                    <p class="goToDescription"><a href="#details" class="scroll-to">Scroll to product details</a></p>
                    <p class="price">$<%=commodity.getPrice()%></p>  
<!-- Cart -->
			  <%if(session.getAttribute("username")==null){%>	
                <p class="text-center buttons"><a href="register.jsp" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</a></p>
              <%}
              else{ %>
                <p class="text-center buttons"><a href="AddCartServlet?username=<%=username%>&commodityID=<%=commodity.getCommodityid() %>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</a></p>
              <%}%>

                  </div>
                </div>
              </div>
              <div id="details" class="box">
                <p></p>
                <h4>Product details</h4>
                <p><%=commodity.getExplain() %></p>
                <hr>
              </div>
            </div>
          <%
            }
          %>
            <!-- /.col-md-9-->
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