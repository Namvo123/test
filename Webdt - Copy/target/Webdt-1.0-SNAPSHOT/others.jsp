<!--phải có dòng này thì jsp mới chạy đc-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--phải có dòng này thì jstl mới chạy đc-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.gson.Gson" %>
<%
//    String categoryName = (String) request.getAttribute("categoryName");//lay ten category duoc gui den

    int pageNow = (int) request.getAttribute("pageIsSelected");
    int endPage = (int) request.getAttribute("endPage");
    int pageNext,pagePrevious;
    if(pageNow != endPage && pageNow != 1) {
        pageNext = pageNow + 1;
        pagePrevious = pageNow - 1;
    }else{
        pageNext = endPage;
        pagePrevious = 1;
    }
%>
<c:set var="cart" value="${sessionScope.cart}"/>
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
    <title>Others</title>

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
                    <li><a href="/Webdt/HomePage">Home</a></li>
                    <li><a href="Category.jsp">Category</a></li>
                    <li><a href="/Webdt/cart">Cart</a></li>
                    <li><a href="/Webdt/Checkout">Checkout</a></li>
                    <li class="active"><a href="/Webdt/Others?page=1&id=5">Others</a></li>
                    <li><a href="Contact.jsp">Contact</a></li>
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
                    <h2>Others</h2>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <!--START SINGLE PRODUCT-->
            <c:forEach items="${productList}" var="p">
                <div class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                        <div class="product-upper">
                            <img src="${p.img}" alt="">
                        </div>
                        <h2><a href="SingleProduct?id=${p.id}">${p.name}</a></h2>
                        <div class="product-carousel-price">
                            <ins>${p.sale_price}</ins>
                            <del>${p.price}</del>
                        </div>

                        <div class="product-option-shop">
                            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70"
                               rel="nofollow" pid="${p.id}" onclick="document.location.reload(true)">Add to cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!--STOP SINGLE PRODUCT-->
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="product-pagination text-center">
                    <nav>
                        <ul class="pagination">
                            <li><a href="Others?page=<%=pagePrevious%>&id=${id}">Previous</a></li>
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <c:choose>
                                    <c:when test="${pageIsSelected == i}">
                                        <li>
                                            <a href="Others?page=${i}&id=${id}"
                                               class="selected">${i}</a>
                                                <%--                                            <% pageNow = ${i} %>--%>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="Others?page=${i}&id=${id}">${i}</a>
                                        </li>
                                    </c:otherwise>

                                </c:choose>
                            </c:forEach>
                            <li><a href="Others?page=<%=pageNext%>&id=${id}">Next</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>


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
    $('.add_to_cart_button').on('click', function (){
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