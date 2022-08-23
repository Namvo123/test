<%@ page import="vn.edu.hcmuaf.fit.webdt.beans.User" %>
<!--phải có dòng này thì jsp mới chạy đc-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--phải có dòng này thì jsp mới chạy đc-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--<c:set var="auth" value="${sessionScope.auth}"/><!--lay du lieu auth(user) duoc luu trong session-->--%>
<%
    //NEU XOA O DAY THI PHAI XOA LUON O DUOI NEU KHONG SE BI LOI
    User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Account</title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet'
          type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="site-branding-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-left">
                <div class="logo">
                    <h1><a href="/Webdt/HomePage"><img src="img/logo.png"></a></h1>
                </div>
            </div>

        </div>
    </div>
</div> <!-- End site branding area -->


<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/Webdt/AdminProduct">Product Manager</a></li>
                    <li><a href="/Webdt/Customer">User Manager</a></li>
                </ul>
            </div>
        </div>
    </div>
</div> <!-- End mainmenu area -->


<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Account Detail</h2>
                </div>
            </div>
        </div>
    </div>
</div><!--End big title -->

<!--Start do in here-->
<div class="total_myAccount">
    <form action="/Webdt/UpdateAdminUser" method="post">
        <div class="account">
            <input type="text" name="id" value="<%=user.getId()%>" style="display: none">
            <img src="img/istockphoto-1300845620-170667a.jpg" alt="Avatar" class="avatar">
            <p class="mainP">Name:</p>
            <input type="text" placeholder="Full Name" class="text" value="${user.userName}" name="userName">
            <p class="mainP">Email:</p>
            <input type="email" placeholder="Email" class="text" value="${user.email}" name="email">
            <p class="mainP">Phone Number:</p>
            <input type="tel" class="text" placeholder="123-45-678" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}"
                   required value="${user.phone_number}" name ="phone_number">
            <p class="mainP">Address:</p>
            <input type="text" placeholder="Address" class="text" value="${user.address}" name ="address">

        </div>
        <div class="AddressDelt">
            <div class="first">
                <div class="city">
                    <p class="subP">City:</p>
                    <input type="text" class="text_address" value="${user.city}" name ="city">
                </div>
                <div class="state">
                    <p class="subP">State:</p>
                    <input type="text" class="text_address" value="${user.state}" name ="state">
                </div>
            </div>
            <div class="second">
                <div class="zCode">
                    <p class="subP">Zip code:</p>
                    <input type="text" class="text_address" value="${user.zip_code}" name="zip_code">
                </div>
                <div class="country">
                    <p class="subP">Country:</p>
                    <input type="text" class="text_address" value="${user.country}" name ="country">
                </div>
            </div>
        </div>

        <div class="passwordChange">
            <P class="mainP">Change Password:</P>
            <input type="password" placeholder="Password" class="text" id="passwordID" value="" name="password">
            <div class="showPass">
                <input type="checkbox" onclick="seePassword()">Show Password
            </div>
        </div>

        <div class="lastButton">
            <button>Save</button>
        </div>
    </form>
</div>
/<!--STOP DO IN HERE-->

<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-about-us">
                    <h2>u<span>Stora</span></h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam
                        laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure
                        eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis
                        magni at?</p>
                    <div class="footer-social">
                        <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">User Navigation </h2>
                    <ul>
                        <li><a href="">My account</a></li>
                        <li><a href="">Order history</a></li>
                        <li><a href="">Wishlist</a></li>
                        <li><a href="">Vendor contact</a></li>
                        <li><a href="">Front page</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">Categories</h2>
                    <ul>
                        <li><a href="./Iphone.html">Iphone</a></li>
                        <li><a href="./SamSungGalaxy.html">SamSung Galaxy</a></li>
                        <li><a href="./Headphone.html">Headphone</a></li>
                        <li><a href="./backupCharger.html">Backup Charger</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-newsletter">
                    <h2 class="footer-wid-title">Newsletter</h2>
                    <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your
                        inbox!</p>
                    <div class="newsletter-form">
                        <input type="email" placeholder="Type your email">
                        <input type="submit" value="Subscribe">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="copyright">
                    <p>&copy; 2015 uCommerce. All Rights Reserved. <a href="http://www.freshdesignweb.com"
                                                                      target="_blank">freshDesignweb.com</a></p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="footer-card-icon">
                    <i class="fa fa-cc-discover"></i>
                    <i class="fa fa-cc-mastercard"></i>
                    <i class="fa fa-cc-paypal"></i>
                    <i class="fa fa-cc-visa"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Latest jQuery form server -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="js/main.js"></script>

<script>
    //neu type no la password thi chuyen type no thanh text, neu type no la text thi chuyen lai ve password
    function seePassword() {
        var x = document.getElementById("passwordID");
        if (x.type == "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>
</body>
</html>