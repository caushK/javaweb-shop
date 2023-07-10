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
              <li class="nav-item dropdown menu-large"><a href="aboutUs.jsp" class="nav-link active">About us<b class="caret"></b></a>
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
                  <li aria-current="page" class="breadcrumb-item active">About us</li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="row">
            <!--
            *** LEFT COLUMN ***
            _________________________________________________________
            -->
            <div id="blog-listing" class="col-lg-9">
              <div class="box">
                <h1><a id="MusicMakesLife">Music Makes Life</a></h1>
                <p><br>&nbsp;&nbsp;&nbsp;&nbsp;
                With continuous innovation and progress, the company is committed to the design 
                and production of various professional, teaching, multi-functional, toy electronic 
                piano and electric piano. It is the first to launch touch panel electronic organ, which 
                has become the industry patent product. 
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                The products have passed the European Union RoHS, 
                CE, EN71 and domestic 3C product certification, and are selling well all over the country 
                with its novel design, exquisite technology and good quality, and exported to dozens of 
                countries and regions such as Europe, Oceania, North America and East Asia.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                "To survive by quality, to promote development by quality, to grasp management to 
                create benefits" is our creed, "quality first, credit first, customer first" is our 
                tenet, we will continue to innovate, grasp quality, improve after-sales, create value 
                for customers, let music warm the world.
                </p>
              </div>
<!-- post 1-->
              <div class="post">
                <h2><a id="LearningthePiano">What Are the Requirements for Learning the Piano?</a></h2>
                <hr>
                <p class="date-comments"><i class="fa fa-calendar-o"></i> May 15, 2021 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--By jj</p>
                <div class="image"><img src="img/blog.jpg" alt="Example blog post alt" class="img-fluid"></div>
                <p class="intro">
                <br>&nbsp;&nbsp;&nbsp;&nbsp;
                There is no perfect person in the world, everyone has their own areas 
                of expertise and weaknesses. Just like under the guidance of the same 
                teacher, there must be students who are making fast progress and those 
                who are making slow progress. So for learning the piano, how to judge 
                whether it is suitable for learning the piano? What are the ideal conditions 
                for learning the piano? Today I will introduce it to you.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                I. Love piano music
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                Difficulties are inevitable in the long process of learning the piano. However, 
                if students have a strong interest in piano, they will definitely have extraordinary 
                learning motivation and passion, so that they will work harder towards a higher level.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                II. Acute hearing
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                It can detect the height, length, strength, brightness and emotional color of 
                different emotions. Have a good ability to distinguish different rhythms, and 
                feel the taste of different rhythms;
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                III. Memory of melody
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                For only once or twice to listen to the music, can accurately remember not to 
                forget, this is a good condition for learning the piano.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                IV. Hand conditions
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                Broad palm and long fingers, soft wrist joints, and with agile movement and 
                reaction, can be ready to meet the needs of difficult segments;
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                V. Younger age
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                The piano is a musical instrument that is easy to learn but difficult to master. 
                But some younger children, the fingers are too soft, too weak, or in front of 
                the piano can not sit, also not appropriate to learn the piano early, say more 
                specifically, the children under four years old had better not learn the piano, 
                but can start from interest cultivation and piano enlightenment education.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                The first three are not only the best conditions for learning the piano, but 
                also the superior conditions for learning other Musical Instruments, which is 
                the talent of my interest in music, while the last two can be said to be the 
                favorable conditions for learning the piano.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                Of course, there must also be some questions, is it necessary to have the 
                above conditions to learn the piano?
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                The answer, of course, is no. Anyone can learn to play the piano, whether 
                or not you have the above qualifications, if it is simply about cultivating 
                their culture and hobbies. On the contrary, if a person has the above five 
                conditions, but does not work hard to practice, naturally can not achieve; 
                If you only have 1-3 but do not have the latter 4 or 5, there is no need to worry. 
                You can make up for them through your efforts the day after tomorrow. Moreover, 
                if you have 4 or 5 but do not have 1-3, you will not have the ideal conditions 
                for learning piano.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                Therefore, in addition to the natural advantages, the most important thing is 
                to see their own interest in music, understanding and feeling, which is the 
                key to stimulate the learning passion.
                </p>
              </div>
<!-- post 2-->              
              <div class="post">
                <h2><a id="ChooseaPiano">How to Choose a Piano?</a></h2>
                <hr>
                <p class="date-comments"><i class="fa fa-calendar-o"></i> May 15, 2021 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--By jj</p>
                <div class="image"><img src="img/blog2.jpg" alt="Example blog post alt" class="img-fluid"></div>
                <p class="intro">
                <br>&nbsp;&nbsp;&nbsp;&nbsp;
                Pianos are expensive musical instruments, so you must be very careful when buying 
                them. The best way to choose a piano is to pay special attention to the six aspects 
                of timbre, touch, tuning stability, durability, appearance and tension.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                1. Tone
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                To choose rich, clear and long-lasting sounds, from extremely soft sections to very 
                loud sections, the dynamic range should be wide, and the tone characteristics must 
                be harmoniously balanced throughout the keystroke range. The best piano is that the 
                castanets can be designed as a permanent crown, and then protected with several ribs 
                along the entire length, so that the life of the instrument can be increased.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                2. Touch
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                The touch should be comfortable for beginners as well as handy for accomplished players. 
                The piano is inserted with fine lead blocks to maintain the balance of the key touch. 
                Another key issue to improve the tactile feel is to use an accurate and trouble-free 
                striking mechanism. If the tolerance of the piano parts can reach 5 one hundredths of 
                a millimeter, the result is that the volume can be averaged, the touch is even, and the 
                number of repairs can be reduced.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                3. Tuning stability
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                Every piano needs to be adjusted regularly, and one of the reasons for the piano's runaway 
                is the huge tension on the strings? (About 20 tons). Therefore, the back frame structure of 
                the piano should be carefully designed to improve the efficiency of strain resistance and 
                extend the interval of adjustment. The method of tuning needle and string tuning can also 
                improve the stability and accuracy of tuning.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                4. Durability
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                I am afraid that no property in the family is more durable than a piano. This is why 
                durability is important for pianos. Everyone hopes that the performance, sound and 
                appearance of the piano will remain unchanged for a long time. The durability of the 
                piano is good. It is through the careful selection of materials, the use of advanced 
                production equipment (including the latest scientific data and acoustic expertise) and 
                the entire Only the strictest quality management can be achieved during the manufacturing 
                process.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                5. Appearance
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                Because pianos are often the most noticeable “furniture” at home, most people attach 
                great importance to the appearance of the piano, so when choosing a piano, you must first 
                consider the room where the piano will be placed, and then select the most suitable Your 
                own piano style.
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                6. Tension
                <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
                The strings must be tightened by the tuning nails so that the hammer will hit the string 
                to make a sound. Tension refers to the degree to which the strings are tightened.
                </p>
              </div>
              <div class="pager d-flex justify-content-between">
                <div class="home"><a href="index.jsp" class="btn btn-outline-primary">Home</a></div>
              </div>
            </div>
            <!-- /.col-lg-9-->
            <!-- *** LEFT COLUMN END ***-->
            
            <div class="col-lg-3">
              <!--
              *** BLOG MENU ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu mb-4">
                <div class="card-header">
                  <h3 class="h4 panel-title">About us</h3>
                </div>
                <div class="card-body">
                  <ul class="nav flex-column nav-pills">
                    <li><a href="aboutUs.jsp#MusicMakesLife" class="nav-link">Music Makes Life</a></li>
                    <li><a href="aboutUs.jsp#LearningthePiano" class="nav-link">Learning the Piano</a></li>
                    <li><a href="aboutUs.jsp#ChooseaPiano" class="nav-link">Choose a Piano</a></li>
                    <li><a href="index.jsp" class="nav-link">Home</a></li>
                  </ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** BLOG MENU END ***-->
              <div class="banner"><img src="img/banner.jpg" alt="sales 2014" class="img-fluid"></div>
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