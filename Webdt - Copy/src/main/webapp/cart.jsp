<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--thêm cái này vào mới chạy jstl được--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--khong biet can xem lai , them cai nay vao thi moi c:set duoc(chac vay)--%>
<jsp:useBean id="cart" scope="request" type = "vn.edu.hcmuaf.fit.webdt.beans.Cart"/>

<c:set var="lastProduct" value="${sessionScope.lastestProduct}"/>
<html>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cart</title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
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

    <!--vendor css-->
    <link rel="stylesheet" href="vendor/dt/datatables.min.css">
    <%--    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">--%>
    <%--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">--%>
    <%--    <link rel="stylesheet" href="vendor/mdb4/css/bootstrap.min.css">--%>
    <%--    <link rel="stylesheet" href="vendor/mdb4/css/mdb.min.css">--%>
    <%--    <link rel="stylesheet" href="vendor/mdb4/css/style.css">--%>

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
                    <form action="/Webdt/SearchController" method="post"><!--them trang o day de khi bam submit ta se vao trang duoc them vao o day-->
                        <input type="text" placeholder="Search products..." style="width:300px" name="searchName">
                        <input type="submit" value="Search" >
                    </form>
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
                    <li class="active"><a href="/Webdt/cart">Cart</a></li>
                    <li><a href="/Webdt/Checkout">Checkout</a></li>
                    <li><a href="/Webdt/Others?page=1&id=5">Others</a></li>
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
                    <h2>Shopping Cart</h2>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End Page title area -->


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <!-- <div class="single-sidebar">
                    <h2 class="sidebar-title">Search Products</h2>
                    <form action="#">
                        <input type="text" placeholder="Search products...">
                        <input type="submit" value="Search">
                    </form>
                </div> -->

                <div class="single-sidebar">
                    <h2 class="sidebar-title">Products</h2>
                    <c:forEach begin="0" end="3" items="${lastestProduct}" var="lp">
                    <div class="thubmnail-recent">
                        <img src="${lp.img}" class="recent-thumb" alt="">
                        <h2><a href="SingleProduct?id=${lp.id}">${lp.name}</a></h2>
                        <div class="product-sidebar-price">
                            <ins>${lp.sale_price}</ins> <del>${lp.price}</del>
                        </div>
                    </div>
                    </c:forEach>
                </div>

                <div class="single-sidebar">
                    <h2 class="sidebar-title">Recent Posts</h2>
                    <ul>
                        <li><a href="#">Iphone 6</a></li>
                        <li><a href="#">Iphone 13 </a></li>
                        <li><a href="#">Tai nghe Bluetooth Headset</a></li>
                        <li><a href="#">Ava+ JP199 </a></li>
                        <li><a href="#">Hydrus Pj JP196</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <form method="post" action="#">
                            <table id="cart" class="shop_table cart">
                                <thead>
                                <tr>
                                    <th class="product-remove">&nbsp;</th>
                                    <th class="product-thumbnail">&nbsp;</th>
                                    <th class="product-name">Product</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--START HERE--%>
                                <%--cart.productList la phuong thuc  getProductList() trong lop Cart o beans de lay ra danh sach san pham tron cart--%>
                                <c:set var="products" value="${cart.productList}"/>
                                <c:forEach items="${products}" var="product">
                                    <tr class="cart_item">
                                        <td class="product-remove">
                                            <a title="Remove this item" class="remove" pid="${product.id}" href="/Webdt/cart">×</a>
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

                                                <input  class="changeQuantity" type="number" pid="${product.id}" value="${product.qualitySold}" >

                                            </div>
                                        </td>

                                        <td class="product-subtotal">
                                            <span class="changeQuantity" pid="${product.id}" >${product.totalMoney}</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td class="actions" colspan="6">
                                        <div class="coupon">
                                            <label for="coupon_code">Coupon:</label>
                                            <input type="text" placeholder="Coupon code" value="" id="coupon_code" class="input-text" name="coupon_code">
                                            <input type="submit" value="Apply Coupon" name="apply_coupon" class="button">
                                        </div>
                                        <a value="Checkout" class="checkout-button button alt wc-forward" href="/Webdt/cart">Refest</a>
                                        <a value="Checkout" class="checkout-button button alt wc-forward" href="/Webdt/Checkout">Checkout</a>
                                    </td>
                                </tr>

                                </tbody>

                            </table>
                        </form>

                        <div class="cart-collaterals">


                            <div class="cross-sells">
                                <h2>You may be interested in...</h2>
                                <ul class="products">
                                    <c:forEach begin="0" end="1" items="${lastestProduct}" var="lp">
                                    <li class="product">
                                        <a href="SingleProduct?id=${lp.id}">
                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="${lp.img}">
                                            <h3>${lp.name}</h3>
                                            <span class="price"><span class="amount">${lp.price}</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="SingleProduct?id=${lp.id}">Select options</a>
                                    </li>
                                    </c:forEach>
<%--                                    <li class="product">--%>
<%--                                        <a href="single-product.html">--%>
<%--                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="img/tainghebluetoothkanenk9.jpg">--%>
<%--                                            <h3>Tai nghe Bluetooth Kanen K9</h3>--%>
<%--                                            <span class="price"><span class="amount">6.990.000 VND</span></span>--%>
<%--                                        </a>--%>

<%--                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.html">Select options</a>--%>
<%--                                    </li>--%>
                                </ul>
                            </div>


                            <div class="cart_totals ">
                                <h2>Cart Totals</h2>

                                <table cellspacing="0">
                                    <tbody>
                                    <tr class="cart-subtotal">
                                        <th>Cart Subtotal</th>
                                        <%--                                        total-card class--%>
                                        <td><span class="total-cart"></span></td>

                                    </tr>

                                    <tr class="shipping">
                                        <th>Shipping and Handling</th>
                                        <td>Free Shipping</td>
                                    </tr>

                                    <tr class="order-total">
                                        <th>Order Total</th>
                                        <%--                                        total-card class--%>
                                        <td><strong><span class="total-cart"></span></strong> </td>

                                    </tr>
                                    </tbody>
                                </table>
                            </div>


                            <form method="post" action="#" class="shipping_calculator">
                                <h2><a class="shipping-calculator-button" data-toggle="collapse" href="#calcalute-shipping-wrap" aria-expanded="false" aria-controls="calcalute-shipping-wrap">Calculate Shipping</a></h2>

                                <section id="calcalute-shipping-wrap" class="shipping-calculator-form collapse">

                                    <p class="form-row form-row-wide">
                                        <select rel="calc_shipping_state" class="country_to_state" id="calc_shipping_country" name="calc_shipping_country">
                                            <option value="">Select a country…</option>
                                            <option value="AX">Åland Islands</option>
                                            <option value="AF">Afghanistan</option>
                                            <option value="AL">Albania</option>
                                            <option value="DZ">Algeria</option>
                                            <option value="AD">Andorra</option>
                                            <option value="AO">Angola</option>
                                            <option value="AI">Anguilla</option>
                                            <option value="AQ">Antarctica</option>
                                            <option value="AG">Antigua and Barbuda</option>
                                            <option value="AR">Argentina</option>
                                            <option value="AM">Armenia</option>
                                            <option value="AW">Aruba</option>
                                            <option value="AU">Australia</option>
                                            <option value="AT">Austria</option>
                                            <option value="AZ">Azerbaijan</option>
                                            <option value="BS">Bahamas</option>
                                            <option value="BH">Bahrain</option>
                                            <option value="BD">Bangladesh</option>
                                            <option value="BB">Barbados</option>
                                            <option value="BY">Belarus</option>
                                            <option value="PW">Belau</option>
                                            <option value="BE">Belgium</option>
                                            <option value="BZ">Belize</option>
                                            <option value="BJ">Benin</option>
                                            <option value="BM">Bermuda</option>
                                            <option value="BT">Bhutan</option>
                                            <option value="BO">Bolivia</option>
                                            <option value="BQ">Bonaire, Saint Eustatius and Saba</option>
                                            <option value="BA">Bosnia and Herzegovina</option>
                                            <option value="BW">Botswana</option>
                                            <option value="BV">Bouvet Island</option>
                                            <option value="BR">Brazil</option>
                                            <option value="IO">British Indian Ocean Territory</option>
                                            <option value="VG">British Virgin Islands</option>
                                            <option value="BN">Brunei</option>
                                            <option value="BG">Bulgaria</option>
                                            <option value="BF">Burkina Faso</option>
                                            <option value="BI">Burundi</option>
                                            <option value="KH">Cambodia</option>
                                            <option value="CM">Cameroon</option>
                                            <option value="CA">Canada</option>
                                            <option value="CV">Cape Verde</option>
                                            <option value="KY">Cayman Islands</option>
                                            <option value="CF">Central African Republic</option>
                                            <option value="TD">Chad</option>
                                            <option value="CL">Chile</option>
                                            <option value="CN">China</option>
                                            <option value="CX">Christmas Island</option>
                                            <option value="CC">Cocos (Keeling) Islands</option>
                                            <option value="CO">Colombia</option>
                                            <option value="KM">Comoros</option>
                                            <option value="CG">Congo (Brazzaville)</option>
                                            <option value="CD">Congo (Kinshasa)</option>
                                            <option value="CK">Cook Islands</option>
                                            <option value="CR">Costa Rica</option>
                                            <option value="HR">Croatia</option>
                                            <option value="CU">Cuba</option>
                                            <option value="CW">CuraÇao</option>
                                            <option value="CY">Cyprus</option>
                                            <option value="CZ">Czech Republic</option>
                                            <option value="DK">Denmark</option>
                                            <option value="DJ">Djibouti</option>
                                            <option value="DM">Dominica</option>
                                            <option value="DO">Dominican Republic</option>
                                            <option value="EC">Ecuador</option>
                                            <option value="EG">Egypt</option>
                                            <option value="SV">El Salvador</option>
                                            <option value="GQ">Equatorial Guinea</option>
                                            <option value="ER">Eritrea</option>
                                            <option value="EE">Estonia</option>
                                            <option value="ET">Ethiopia</option>
                                            <option value="FK">Falkland Islands</option>
                                            <option value="FO">Faroe Islands</option>
                                            <option value="FJ">Fiji</option>
                                            <option value="FI">Finland</option>
                                            <option value="FR">France</option>
                                            <option value="GF">French Guiana</option>
                                            <option value="PF">French Polynesia</option>
                                            <option value="TF">French Southern Territories</option>
                                            <option value="GA">Gabon</option>
                                            <option value="GM">Gambia</option>
                                            <option value="GE">Georgia</option>
                                            <option value="DE">Germany</option>
                                            <option value="GH">Ghana</option>
                                            <option value="GI">Gibraltar</option>
                                            <option value="GR">Greece</option>
                                            <option value="GL">Greenland</option>
                                            <option value="GD">Grenada</option>
                                            <option value="GP">Guadeloupe</option>
                                            <option value="GT">Guatemala</option>
                                            <option value="GG">Guernsey</option>
                                            <option value="GN">Guinea</option>
                                            <option value="GW">Guinea-Bissau</option>
                                            <option value="GY">Guyana</option>
                                            <option value="HT">Haiti</option>
                                            <option value="HM">Heard Island and McDonald Islands</option>
                                            <option value="HN">Honduras</option>
                                            <option value="HK">Hong Kong</option>
                                            <option value="HU">Hungary</option>
                                            <option value="IS">Iceland</option>
                                            <option value="IN">India</option>
                                            <option value="ID">Indonesia</option>
                                            <option value="IR">Iran</option>
                                            <option value="IQ">Iraq</option>
                                            <option value="IM">Isle of Man</option>
                                            <option value="IL">Israel</option>
                                            <option value="IT">Italy</option>
                                            <option value="CI">Ivory Coast</option>
                                            <option value="JM">Jamaica</option>
                                            <option value="JP">Japan</option>
                                            <option value="JE">Jersey</option>
                                            <option value="JO">Jordan</option>
                                            <option value="KZ">Kazakhstan</option>
                                            <option value="KE">Kenya</option>
                                            <option value="KI">Kiribati</option>
                                            <option value="KW">Kuwait</option>
                                            <option value="KG">Kyrgyzstan</option>
                                            <option value="LA">Laos</option>
                                            <option value="LV">Latvia</option>
                                            <option value="LB">Lebanon</option>
                                            <option value="LS">Lesotho</option>
                                            <option value="LR">Liberia</option>
                                            <option value="LY">Libya</option>
                                            <option value="LI">Liechtenstein</option>
                                            <option value="LT">Lithuania</option>
                                            <option value="LU">Luxembourg</option>
                                            <option value="MO">Macao S.A.R., China</option>
                                            <option value="MK">Macedonia</option>
                                            <option value="MG">Madagascar</option>
                                            <option value="MW">Malawi</option>
                                            <option value="MY">Malaysia</option>
                                            <option value="MV">Maldives</option>
                                            <option value="ML">Mali</option>
                                            <option value="MT">Malta</option>
                                            <option value="MH">Marshall Islands</option>
                                            <option value="MQ">Martinique</option>
                                            <option value="MR">Mauritania</option>
                                            <option value="MU">Mauritius</option>
                                            <option value="YT">Mayotte</option>
                                            <option value="MX">Mexico</option>
                                            <option value="FM">Micronesia</option>
                                            <option value="MD">Moldova</option>
                                            <option value="MC">Monaco</option>
                                            <option value="MN">Mongolia</option>
                                            <option value="ME">Montenegro</option>
                                            <option value="MS">Montserrat</option>
                                            <option value="MA">Morocco</option>
                                            <option value="MZ">Mozambique</option>
                                            <option value="MM">Myanmar</option>
                                            <option value="NA">Namibia</option>
                                            <option value="NR">Nauru</option>
                                            <option value="NP">Nepal</option>
                                            <option value="NL">Netherlands</option>
                                            <option value="AN">Netherlands Antilles</option>
                                            <option value="NC">New Caledonia</option>
                                            <option value="NZ">New Zealand</option>
                                            <option value="NI">Nicaragua</option>
                                            <option value="NE">Niger</option>
                                            <option value="NG">Nigeria</option>
                                            <option value="NU">Niue</option>
                                            <option value="NF">Norfolk Island</option>
                                            <option value="KP">North Korea</option>
                                            <option value="NO">Norway</option>
                                            <option value="OM">Oman</option>
                                            <option value="PK">Pakistan</option>
                                            <option value="PS">Palestinian Territory</option>
                                            <option value="PA">Panama</option>
                                            <option value="PG">Papua New Guinea</option>
                                            <option value="PY">Paraguay</option>
                                            <option value="PE">Peru</option>
                                            <option value="PH">Philippines</option>
                                            <option value="PN">Pitcairn</option>
                                            <option value="PL">Poland</option>
                                            <option value="PT">Portugal</option>
                                            <option value="QA">Qatar</option>
                                            <option value="IE">Republic of Ireland</option>
                                            <option value="RE">Reunion</option>
                                            <option value="RO">Romania</option>
                                            <option value="RU">Russia</option>
                                            <option value="RW">Rwanda</option>
                                            <option value="ST">São Tomé and Príncipe</option>
                                            <option value="BL">Saint Barthélemy</option>
                                            <option value="SH">Saint Helena</option>
                                            <option value="KN">Saint Kitts and Nevis</option>
                                            <option value="LC">Saint Lucia</option>
                                            <option value="SX">Saint Martin (Dutch part)</option>
                                            <option value="MF">Saint Martin (French part)</option>
                                            <option value="PM">Saint Pierre and Miquelon</option>
                                            <option value="VC">Saint Vincent and the Grenadines</option>
                                            <option value="SM">San Marino</option>
                                            <option value="SA">Saudi Arabia</option>
                                            <option value="SN">Senegal</option>
                                            <option value="RS">Serbia</option>
                                            <option value="SC">Seychelles</option>
                                            <option value="SL">Sierra Leone</option>
                                            <option value="SG">Singapore</option>
                                            <option value="SK">Slovakia</option>
                                            <option value="SI">Slovenia</option>
                                            <option value="SB">Solomon Islands</option>
                                            <option value="SO">Somalia</option>
                                            <option value="ZA">South Africa</option>
                                            <option value="GS">South Georgia/Sandwich Islands</option>
                                            <option value="KR">South Korea</option>
                                            <option value="SS">South Sudan</option>
                                            <option value="ES">Spain</option>
                                            <option value="LK">Sri Lanka</option>
                                            <option value="SD">Sudan</option>
                                            <option value="SR">Suriname</option>
                                            <option value="SJ">Svalbard and Jan Mayen</option>
                                            <option value="SZ">Swaziland</option>
                                            <option value="SE">Sweden</option>
                                            <option value="CH">Switzerland</option>
                                            <option value="SY">Syria</option>
                                            <option value="TW">Taiwan</option>
                                            <option value="TJ">Tajikistan</option>
                                            <option value="TZ">Tanzania</option>
                                            <option value="TH">Thailand</option>
                                            <option value="TL">Timor-Leste</option>
                                            <option value="TG">Togo</option>
                                            <option value="TK">Tokelau</option>
                                            <option value="TO">Tonga</option>
                                            <option value="TT">Trinidad and Tobago</option>
                                            <option value="TN">Tunisia</option>
                                            <option value="TR">Turkey</option>
                                            <option value="TM">Turkmenistan</option>
                                            <option value="TC">Turks and Caicos Islands</option>
                                            <option value="TV">Tuvalu</option>
                                            <option value="UG">Uganda</option>
                                            <option value="UA">Ukraine</option>
                                            <option value="AE">United Arab Emirates</option>
                                            <option selected="selected" value="GB">United Kingdom (UK)</option>
                                            <option value="US">United States (US)</option>
                                            <option value="UY">Uruguay</option>
                                            <option value="UZ">Uzbekistan</option>
                                            <option value="VU">Vanuatu</option>
                                            <option value="VA">Vatican</option>
                                            <option value="VE">Venezuela</option>
                                            <option value="VN">Vietnam</option>
                                            <option value="WF">Wallis and Futuna</option>
                                            <option value="EH">Western Sahara</option>
                                            <option value="WS">Western Samoa</option>
                                            <option value="YE">Yemen</option>
                                            <option value="ZM">Zambia</option>
                                            <option value="ZW">Zimbabwe</option>
                                        </select>
                                    </p>

                                    <p class="form-row form-row-wide"><input type="text" id="calc_shipping_state" name="calc_shipping_state" placeholder="State / county" value="" class="input-text"> </p>

                                    <p class="form-row form-row-wide"><input type="text" id="calc_shipping_postcode" name="calc_shipping_postcode" placeholder="Postcode / Zip" value="" class="input-text"></p>


                                    <p><button class="button" value="1" name="calc_shipping" type="submit">Update Totals</button></p>

                                </section>
                            </form>


                        </div>
                    </div>
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
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
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
                    <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
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
                    <p>&copy; 2015 uCommerce. All Rights Reserved. <a href="http://www.freshdesignweb.com" target="_blank">freshDesignweb.com</a></p>
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
<%--<script src="https://code.jquery.com/jquery.min.js"></script>--%>

<!-- Bootstrap JS form CDN -->
<%--<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>--%>

<!-- jQuery sticky menu -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="js/main.js"></script>

<!-- vendor Script(them js o day)-->
<!--mdb4-->
<script type="text/javascript" src="vendor/mdb4/js/jquery.min.js"></script>
<script type="text/javascript" src="vendor/mdb4/js/popper.min.js"></script>
<script type="text/javascript" src="vendor/mdb4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="vendor/mdb4/js/mdb.min.js"></script>

<!--dt(datatable) làm cái table trong cart thêm đẹp , tốt hơn-->
<script src="vendor/dt/datatables.min.js"></script>
<script>
    var cart;
    // var dt;
    $(document).ready( function () {
        // dt =$('#cart').DataTable( {
        //     paging: false
        // } );

        // khong hieu(hinh nhu la load phan noi dung trong table)
        <% String data=session.getAttribute("cart") ==null?"{}":new Gson().toJson(session.getAttribute("cart")); %>
        cart =JSON.parse('<%=data%>');


        loadCart(cart)
        $('#cart tbody .remove').on('click', function (){
            <!--gui mot cai ajax len server de tien hanh xoa san pham-->
            //send ajax to remove product in cart
            var id =$(this).attr('pid');
            thisRow =$(this);
            $.ajax({
                url :'/Webdt/cart-remove',
                type:'POST',
                data:{
                    id : id
                },
                success:function (data){
                    delete cart.productList[id];
                    // var dt =$('#cart').DataTable();
                    // dt.row(thisRow.parents('tr')).remove().draw();
                    loadCart(cart);
                    // alert("Sản phẩm không còn trong giỏ hàng vui lòng bấm refest để reset giỏ hàng");
                },
                error:function (data){
                    alert("Sản phẩm không còn trong giỏ hàng");

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
