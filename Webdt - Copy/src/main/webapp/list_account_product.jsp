<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--thêm cái này vào mới chạy jstl được--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--khong biet can xem lai , them cai nay vao thi moi c:set duoc(chac vay)--%>
<%--<jsp:useBean id="cart" scope="request" type = "vn.edu.hcmuaf.fit.webdt.beans.Cart"/>--%>
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
    <title>Product</title>

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
            <div class="col-sm-6">
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
                    <li class="active"><a href="/Webdt/AdminProduct">Product Manager</a></li>
                    <li><a href="/Webdt/Customer">User Manager</a></li>
<%--                    <li><a href="single-product.html">Single product</a></li>--%>
<%--                    <li class="active"><a href="cart.html">Cart</a></li>--%>
<%--                    <li><a href="checkout.html">Checkout</a></li>--%>
<%--                    <li><a href="./Category.html">Category</a></li>--%>
<%--                    <li><a href="./others.html">Others</a></li>--%>
<%--                    <li><a href="./Contact.html">Contact</a></li>--%>
<%--                    <li><a href="./SignUp.html">SignUp</a></li>--%>
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
                    <h2>Product Manager</h2>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End Page title area -->


<div class="single-product-area">
    <form method="post" action="#">
        <table id="cart" class="shop_table cart">
            <thead>
            <tr>
                <th class="product-remove">&nbsp;</th>
                <th class="product-thumbnail">&nbsp;</th>
                <th class="product-name">Product</th>
                <th class="product-price">Price</th>
                <th class="product-quantity">Quantity</th>
                <th class="product-subtotal">Detail</th>
            </tr>
            </thead>
            <tbody>
            <%--START HERE--%>
            <%--cart.productList la phuong thuc  getProductList() trong lop Cart o beans de lay ra danh sach san pham tron cart--%>
            <c:set var="products" value="${cart.productList}"/>
            <c:forEach items="${AdminProduct}" var="product">
                <tr class="cart_item">
                    <td class="product-remove">
                        <a title="Remove this item" class="remove" pid="${product.id}" href="/Webdt/AdminProduct">×</a>
                    </td>

                    <td class="product-thumbnail">
                        <a href="SingleProduct?id=${product.id}"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${product.img}"></a>
                    </td>

                    <td class="product-name">
                        <a href="SingleProduct?id=${product.id}">${product.name}</a>
                    </td>

                    <td class="product-price">
                        <span class="amount">${product.sale_price}</span>
                    </td>

                    <td class="product-quantity">
                        <div class="quantity buttons_added">

                            <input  class="changeQuantity" type="number" pid="${product.id}" value="${product.quantity}" >
<%--                            <a value="Checkout" class="checkout-button button alt wc-forward" href="/Webdt/AdminProduct">Update</a>--%>
                        </div>
                    </td>

                    <td class="product-subtotal">
<%--                        <span class="changeQuantity" pid="${product.id}" >${product.totalMoney}</span>--%>
                        <a value="Checkout" class="checkout-button button alt wc-forward" href="/Webdt/ShowAdminProduct?id=${product.id}">Update</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td class="actions" colspan="6">
                    <a value="Checkout" class="checkout-button button alt wc-forward" href="/Webdt/AdminProduct">Refest</a>
                    <a value="Checkout" class="checkout-button button alt wc-forward" href="upload.jsp">ADD</a>
                </td>
            </tr>

            </tbody>

        </table>
    </form>

</div>


<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-about-us">
                    <h2>u<span>Stora</span></h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero
                        quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi
                        iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi
                        veritatis magni at?</p>
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
                    <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to
                        your inbox!</p>
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

<script type="text/javascript" src="vendor/mdb4/js/jquery.min.js"></script>
<script type="text/javascript" src="vendor/mdb4/js/popper.min.js"></script>
<script type="text/javascript" src="vendor/mdb4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="vendor/mdb4/js/mdb.min.js"></script>

<!--dt(datatable) làm cái table trong cart thêm đẹp , tốt hơn-->
<script src="vendor/dt/datatables.min.js"></script>
<script>
    var product;
    // var dt;
    $(document).ready( function () {
        // dt =$('#cart').DataTable( {
        //     paging: false
        // } );

        // khong hieu(hinh nhu la load phan noi dung trong table)
        <% String data=session.getAttribute("AdminProduct") ==null?"{}":new Gson().toJson(session.getAttribute("AdminProduct")); %>
        product =JSON.parse('<%=data%>');


        loadCart(product)
        $('#cart tbody .remove').on('click', function (){
            <!--gui mot cai ajax len server de tien hanh xoa san pham-->
            //send ajax to remove product in cart
            var id =$(this).attr('pid');
            thisRow =$(this);
            $.ajax({
                url :'/Webdt/DeleteAdminProduct',
                type:'POST',
                data:{
                    id : id
                },
                success:function (data){
                    delete product.id;
                    // var dt =$('#cart').DataTable();
                    // dt.row(thisRow.parents('tr')).remove().draw();
                    loadCart(cart);
                    alert("Sản phẩm không còn");
                },
                error:function (data){
                    alert("Sản phẩm không còn");

                }
            });

        });
        $('#cart .changeQuantity').on('blur', function (){
            <!--gui mot cai ajax len server de tien hanh them quantity cho san pham-->
            //send ajax to remove product in cart
            var id =$(this).attr('pid');//lay so id
            var quantity =$(this).val();//lay so quantity
            // var totalMoney =$(this).val();
            thisRow =$(this);
            $.ajax({
                url :'/Webdt/cart-updateQuantity',
                type:'POST',
                data:{
                    id : id,
                    quantity: quantity,
                    // totalMoney :totalMoney
                },
                success:function (data){
                    JSQuantity= JSON.parse(data);
                    thisRow.val(JSQuantity.quantity);//lay value tu phia response gui ve
                    updateQuantity(cart, id,JSQuantity.quantity);
                    // thisRow.val(JSQuantity.totalMoney);
                    // updateTotalMoney(cart, id, JSQuantity.totalMoney);
                    loadCart(cart);

                },
                error:function (data){
                    alert("Sản phẩm không còn trong giỏ hàng");

                }
            });

        });
    } );
    function loadCart(cart){
        sum =0;
        result = 0;
        for (const x in cart.productList) {
            sum += cart.productList[x].sale_price *cart.productList[x].qualitySold;
        }
        result =(Math.round(sum*10)/10);//làm tròn số
        $(".total-cart").text(result);
        <%--thực hiện thêm html vào chỗ có lớp ".total-card" ở <div class="cart_totals "> để khi xóa sản phẩm nó
         sẽ tự trừ đi ,vì khi viết  ${cart.totalPrice} thì nó sẽ không tự trừ khi xóa sản phẩm--%>


    }

    function updateQuantity(cart ,id , quantity){
        cart.productList[id].qualitySold =quantity;
    }
    // function updateTotalMoney(cart, id,total){
    //     cart.productList[id].totalMoney = total;
    // }


</script>
</body>

</html>