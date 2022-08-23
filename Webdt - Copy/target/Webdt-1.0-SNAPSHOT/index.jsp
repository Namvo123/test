<%--
  Created by IntelliJ IDEA.
  User: Nam
  Date: 12/30/2021
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.google.gson.Gson" %>
<!--phải có dòng này thì jsp mới chạy đc-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--thêm cái này vào mới chạy jstl được--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="cart" value="${sessionScope.cart}"/>
<c:set var="user" value="${sessionScope.auth}"/>
<c:set var="lastProduct" value="${sessionScope.lastestProduct}"/>
<!DOCTYPE html>
<!--
ustora by freshdesignweb.com
Twitter: https://twitter.com/freshdesignweb
URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

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

<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu">
                    <ul>
                        <li><a href="/Webdt/MyAccount"><i class="fa fa-user"></i> My Account</a></li>
                        <li><a href="Wishlist.html"><i class="fa fa-heart"></i> Wishlist</a></li>
                        <li><a href="/Webdt/cart"><i class="fa fa-user"></i> My Cart</a></li>
                        <li><a href="/Webdt/Checkout"><i class="fa fa-user"></i> Checkout</a></li>
                        <li><a href="login.jsp"><i class="fa fa-user"></i> Login</a></li>

                        <c:if test="${user.id == 1}">
                            <li><a href="/Webdt/AdminProduct"><i class="fa fa-user"></i>Admin</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->

<div class="site-branding-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-left">
                <div class="logo">
                    <h1><a href="/Webdt/HomePage"><img src="img/logo.png"></a></h1>
                </div>
            </div>

            <div class="col-sm-6 col-right">
                <div class="search">
                    <form action="/Webdt/SearchController" method="post">
                        <!--them trang o day de khi bam submit ta se vao trang duoc them vao o day-->
                        <input type="text" placeholder="Search products..." style="width:300px" name="searchName">
                        <input type="submit" value="Search">
                    </form>
                </div>

                <div class="shopping-item">
                    <a href="/Webdt/cart">Cart - $<span class="cart-amunt">${cart.totalPrice}</span> <i
                            class="fa fa-shopping-cart"></i> <span
                            class="product-count">${cart.productList.size()}</span></a>
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
                    <li class="active"><a href="/Webdt/HomePage">Home</a></li>
                    <li><a href="Category.jsp">Category</a></li>
                    <li><a href="/Webdt/cart">Cart</a></li>
                    <li><a href="/Webdt/Checkout">Checkout</a></li>
                    <li><a href="/Webdt/Others?page=1&id=5">Others</a></li>
                    <li><a href="Contact.jsp">Contact</a></li>
                </ul>
            </div>
        </div>
    </div>
</div> <!-- End mainmenu area -->

<div class="slider-area">
    <!-- Slider -->
    <div class="block-slider block-slider4">
        <ul class="" id="bxslider-home4">
            <li>
                <img src="img/h4-slide.png" alt="Slide">
                <div class="caption-group">
                    <h2 class="caption title">
                        iPhone <span class="primary">6 <strong>Plus</strong></span>
                    </h2>
                    <h4 class="caption subtitle">Dual SIM</h4>
                    <a class="caption button-radius" href="./Iphone.html"><span class="icon"></span>Shop now</a>
                </div>
            </li>
            <li><img src="img/h4-slide2.png" alt="Slide">
                <div class="caption-group">
                    <h2 class="caption title">
                        SamSung <span class="primary">Galaxy <strong>Store</strong></span>
                    </h2>
                    <h4 class="caption subtitle"></h4>
                    <a class="caption button-radius" href="./SamSungGalaxy.html"><span class="icon"></span>Shop now</a>
                </div>
            </li>
            <li><img src="img/h4-slide4.png" alt="Slide">
                <div class="caption-group">
                    <h2 class="caption title">
                        <span class="primary">Store <strong>Headphone</strong></span>
                    </h2>
                    <h4 class="caption subtitle">Select Item</h4>
                    <a class="caption button-radius" href="./Headphone.html"><span class="icon"></span>Shop now</a>
                </div>
            </li>
            <li><img src="img/h4-slide3.png" alt="Slide">
                <div class="caption-group">
                    <h2 class="caption title">
                        Back <span class="primary">Up <strong>Charger</strong></span>
                    </h2>
                    <h4 class="caption subtitle">& Phone</h4>
                    <a class="caption button-radius" href="./backupCharger.html"><span class="icon"></span>Shop now</a>
                </div>
            </li>
        </ul>
    </div>
    <!-- ./Slider -->
</div> <!-- End slider area -->

<div class="promo-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="single-promo promo1">
                    <i class="fa fa-refresh"></i>
                    <p>30 Days return</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo promo2">
                    <i class="fa fa-truck"></i>
                    <p>Free shipping</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo promo3">
                    <i class="fa fa-lock"></i>
                    <p>Secure payments</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo promo4">
                    <i class="fa fa-gift"></i>
                    <p>New products</p>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End promo area -->

<div class="maincontent-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-14">
                <div class="latest-product">
                    <h2 class="section-title">Latest Products</h2>
                    <div class="product-carousel">

                        <!--LASTEST PRODUCT-->

                        <%--                        <div class="single-product">--%>
                        <%--                            <div class="product-f-image">--%>
                        <%--                                <img src="img/iphoneX.jpg" alt="">--%>
                        <%--                                <div class="product-hover">--%>
                        <%--                                    <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>--%>
                        <%--                                    <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> See details</a>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>

                        <%--                            <h2><a href="single-product.html">Iphone X</a></h2>--%>

                        <%--                            <div class="product-carousel-price">--%>
                        <%--                                <ins>6.590.000 VND</ins> <del>8.900.000 VND</del>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <c:forEach begin="0" end="7" items="${lastestProduct}" var="lp">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="${lp.img}" alt="">
                                    <div class="product-hover">
                                        <a onclick="document.location.reload(true)" class="add-to-cart-link" pid="${lp.id}"><i
                                                class="fa fa-shopping-cart"></i> Add to cart</a>
                                        <a href="SingleProduct?id=${lp.id}" class="view-details-link"><i
                                                class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href="SingleProduct?id=${lp.id}">${lp.name}</a></h2>

                                <div class="product-carousel-price">
                                    <ins>${lp.sale_price}</ins>
                                    <del>${lp.price}</del>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End main content area -->

<div class="brands-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="brand-wrapper">
                    <div class="brand-list">
                        <img src="img/brand1.png" alt="">
                        <img src="img/brand2.png" alt="">
                        <img src="img/brand3.png" alt="">
                        <img src="img/brand4.png" alt="">
                        <img src="img/brand5.png" alt="">
                        <img src="img/brand6.png" alt="">
                        <img src="img/brand1.png" alt="">
                        <img src="img/brand2.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End brands area -->

<div class="product-widget-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="single-product-widget">
                    <h2 class="product-wid-title">Top Sellers</h2>

                    <!--TOP SELLER-->
                    <c:forEach items="${topSeller}" var="ts">
                        <div class="col-md-3 col-sm-6">
                            <div class="single-shop-product">
                                <div class="product-upper">
                                    <img src="${ts.img}" alt="">
                                </div>
                                <h2><a href="SingleProduct?id=${ts.id}">${ts.name}</a></h2>
                                <div class="product-carousel-price">
                                    <ins>${ts.sale_price}</ins>
                                    <del>${ts.price}</del>
                                </div>
                                <div class="product-wid-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-option-shop">
                                    <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70"
                                       rel="nofollow" pid="${ts.id}" onclick="document.location.reload(true)">Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End product widget area -->

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
                        <li><a href="#">My account</a></li>
                        <li><a href="#">Order history</a></li>
                        <li><a href="#">Wishlist</a></li>
                        <li><a href="#">Vendor contact</a></li>
                        <li><a href="#">Front page</a></li>
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
                        <form action="#">
                            <input type="email" placeholder="Type your email">
                            <input type="submit" value="Subscribe">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End footer top area -->

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
</div> <!-- End footer bottom area -->

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

<!-- Slider -->
<script type="text/javascript" src="js/bxslider.min.js"></script>
<script type="text/javascript" src="js/script.slider.js"></script>

<script>
    $('.add_to_cart_button, .add-to-cart-link').on('click', function (){
        <!--gui mot cai ajax len server de tien hanh xoa san pham-->
        //send ajax to remove product in cart
        var id =$(this).attr('pid');
        thisRow =$(this);
        $.ajax({
            url :'/Webdt/Cart-add',
            type:'POST',
            data:{
                id : id
            },
            success:function (data){
                // delete user.id;
                // var dt =$('#cart').DataTable();
                // dt.row(thisRow.parents('tr')).remove().draw();
                // loadCart(cart);
                alert("Đã thêm vào giỏ hàng");
            },
            error:function (data){
                alert("Đã thêm vào giỏ hàng");

            }
        });

    });
</script>
</body>
</html>
