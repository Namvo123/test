<%--
  Created by IntelliJ IDEA.
  User: Nam
  Date: 1/8/2022
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<!--phải có dòng này thì jsp mới chạy đc-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--phải có dòng này thì jstl mới chạy đc-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="auth" value="${sessionScope.auth}"/>
<c:if test="${auth == null}">
    <p>vui long dang nhap</p>
</c:if>
<c:if test="${auth !=null}">
    <c:if test="${auth.id_role == 1}">
        <p>Day la trang quan tri (admin)</p>
    </c:if>
    <p>xin chao ${auth.userName}</p>
</c:if>
</body>
</html>
