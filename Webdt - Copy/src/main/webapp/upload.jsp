<%@ page import="vn.edu.hcmuaf.fit.webdt.beans.Product" %><%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 18/06/2022
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<!--phải có dòng này thì jsp mới chạy đc-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--phải có dòng này thì jstl mới chạy đc-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    //NEU XOA O DAY THI PHAI XOA LUON O DUOI NEU KHONG SE BI LOI
    String img = (String) request.getAttribute("img");

    Product product = (Product) request.getAttribute("product");
%>
<html>
<head>
    <title>Upload</title>
</head>
<body>

    <%if (product == null) { %>
        <form action="/Webdt/AddAdminProduct" method="post">
        <input type="text" placeholder="Name" class="text" name="productName"> <br>
        <input type="text" placeholder="Description" class="text" name="Description"><br>
        <input type="text" placeholder="price" class="text" name="price"><br>
        <input type="text" placeholder="sale price" class="text" name="salePrice"><br>
        <input type="text" placeholder="quantity" class="text" name="quantity"><br>
        <input type="text" placeholder="category ID" class="text" name="categoryID"><br>
        <% if (img != null) { %>
            <input type="text" placeholder="img" class="text" name="img" value="<%=img%>"><br>
            <button id="submit" type="submit" value="Upload">ADD</button>
        <% } else {%>
            <input type="text" placeholder="img" class="text" name="img"><br>
            <button id="submit" type="submit" value="Upload">ADD</button>
        <%} %>
    <%} else { %>
            <form action="/Webdt/UpdateAdminProduct" method="post">
                <input type="text" name="id" value="<%=product.getId()%>" style="display: none">
        <input type="text" placeholder="Name" class="text" name="productName" value="<%=product.getName()%>"> <br>
        <input type="text" placeholder="Description" class="text" name="Description" value="<%=product.getDescription()%>"><br>
        <input type="text" placeholder="price" class="text" name="price" value="<%=product.getPrice()%>"><br>
        <input type="text" placeholder="sale price" class="text" name="salePrice" value="<%=product.getSale_price()%>"><br>
        <input type="text" placeholder="quantity" class="text" name="quantity" value="<%=product.getQuantity()%>"><br>
        <input type="text" placeholder="category ID" class="text" name="categoryID" value="<%=product.getCategory_id()%>"><br>
        <input type="text" placeholder="img" class="text" name="img" value="<%=product.getImg()%>"><br>
        <button id="submit" type="submit" value="Upload">Update</button>
    <%} %>

</form>
<form action="/Webdt/UploadDownLoadFileServlet" method="post" enctype="multipart/form-data"
      style="border: solid 1px #000">

    Select File to Update:
    <input type="file" name="fileName"> <br>
    <input type="submit" value="Upload" onclick="clickImage()">
    <%--        <button type="submit" value="Upload" >Add</button>--%>
</form>

</body>
</html>
