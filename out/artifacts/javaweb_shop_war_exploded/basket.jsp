<%@ page import="java.util.ArrayList" %>

<%@ page import="shop.vo.CartItem" %>
<%@ page import="shop.dao.CartItemDAO" %>
<%@ page import="shop.dao.impl.CartItemDAOImpl" %>

<% CartItem item = new CartItem(); %>
<% CartItemDAO cartItemDAO = new CartItemDAOImpl(); %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<body>

<%String userID = (String) session.getAttribute("userID");%>
<%session.setAttribute("userID",userID);%>
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
    <!-- *** TOP BAR END ***-->


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
          <li class="nav-item"><a href="index.jsp" class="nav-link active">Home</a></li>
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
<div id="all">
  <div id="content">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <!-- breadcrumb-->
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
              <li aria-current="page" class="breadcrumb-item active">Shopping cart</li>
            </ol>
          </nav>
        </div>

        <div id="basket" class="col-lg-9">
          <div class="box">


            <form method="post" action="checkout1.jsp">
              <h1>Shopping cart</h1>
              <div class="table-responsive">
                <table class="table">
                  <thead>
                  <tr>
                    <th colspan="2">Product</th>
                    <th></th>
                    <th>Quantity</th>
                    <th></th>
                    <th>Unit price</th>
                    <th colspan="2">Total</th>
                  </tr>
                  </thead>
                  <tbody>

                  <% ArrayList<CartItem> cartItem = new ArrayList<>(); %>
                  <% cartItem = cartItemDAO.selectCartItemByCustomerID(username); %>
                  <% int totalPrice = 0; %>

                  <% for(int i = 0;i < cartItem.size();i++){ %>
                  <% item = cartItem.get(i); %>

                  <tr>
                    <% String img = item.getImg(); %>
                    <% String commodityname = item.getCommodityname(); %>
                    <% int commodityNum = item.getCommodityNum(); %>
                    <% int price = item.getPrice(); %>

                    <td><img src="img/<%= img %>" alt=" "></td>
                    <td><%= commodityname %></td>
                    

                    <td><a class="form-control sub">-</a></td>
                      <td align="center" class="num" id="<%=item.getCommodityid()%>"> <%= commodityNum %> </td>
                    <td><a  class="form-control add">+</a></td>

                    <td class="price1">$<%= price %></td>
                    <td class="price2">$<%= (price*commodityNum) %></td>
                    <% totalPrice += price*commodityNum; %>
                    <td><a href="./cartDelete?username=<%=username%>&commodityID=<%=item.getCommodityid() %>"><i class="fa fa-trash-o"></i></a></td>
                  </tr>

                  <%}%><!-- end for -->
                  <%session.setAttribute("cartItem",cartItem);%>


                  </tbody>
                  <tfoot>
                  <tr>
                    <th colspan="5">Total</th>
                    <th colspan="2">$<%= totalPrice %></th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.table-responsive-->
              <div class="box-footer d-flex justify-content-between flex-column flex-lg-row">
                <div class="left"><a href="electronic organ.jsp" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i> Continue shopping</a></div>
                <div class="right">
                  <a href="basket.jsp" class="btn btn-outline-secondary"><i class="fa fa-refresh"></i> Update cart </a>
                  <button type="submit" class="btn btn-primary">Proceed to checkout <i class="fa fa-chevron-right"></i></button>
                </div>
              </div>
            </form>
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
<script>
  $(function () {

      $(".sub").click(function () {
        var proNum = parseInt($(this).parent().siblings(".num").text());
        var price = parseInt($(this).parent().siblings(".price1").text().substring(1))
        if(proNum<=1){
          $(this).attr("disabled","disabled");
          return;
        }
        proNum--;
        $(this).parent().siblings(".price2").text("$"+proNum*price);
        $(this).parent().siblings(".num").text(proNum);
        var id = $(this).parent().siblings(".num").attr("id");
        var xml = new XMLHttpRequest();
        var url = "./changeCartPro?proID="+id+"&updown=-1";
        xml.open("get",url,true);
        xml.send();


      })
    $(".add").click(function () {
      var proNum = parseInt($(this).parent().siblings(".num").text());
      var price = parseInt($(this).parent().siblings(".price1").text().substring(1))
      if(proNum>=5) return;
      proNum++;
      var id = $(this).parent().siblings(".num").attr("id");
      var xml = new XMLHttpRequest();
      var url = "./changeCartPro?proID="+id+"&updown=1";
      $(this).parent().siblings(".price2").text("$"+proNum*price);
      $(this).parent().siblings(".num").text(proNum);
      xml.open("get",url,true);
      xml.send();
    })
  })

</script>
</body>
</html>