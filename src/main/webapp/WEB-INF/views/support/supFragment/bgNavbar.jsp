<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <c:if test="${empty LoginOK}"> --%>
<%-- 	<c:set var="target" value="${pageContext.request.servletPath}" --%>
<%-- 		scope="session" /> --%>
<%-- 	<c:redirect url="/ch02_login/login.jsp" /> --%>
<%-- </c:if> --%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>後台管理頁面</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/modern-business.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/support/bgNavbar.css"
	rel="stylesheet">
</head>

<body>
	<!-- Content Row -->
	<!-- 	mb-4 list-group -->
	<div class="bgbar row col-md-auto list-group ">
		<a class="list-group-item "
			href="${pageContext.request.contextPath}/WEB-INF/views/support/bgController.jsp">
			<img src="./Image/duck.jpg" width="80" style="border-radius: 50%;"
			id="partner-icon">
			後台-可達鴨 尼好

		</a> <a class="list-group-item"
			href="${pageContext.request.contextPath}/support/bgMain.jsp"> <img
			src="icon/3253474-wedding/png/007-house.png">方案/作品
		</a> <a class="list-group-item"
			href="<c:url value='/support/bgMember'/>"> <img
			src="icon/3253474-wedding/png/015-picture.png">會員/文章
		</a> <a class="list-group-item"
			href="<c:url value='/support/bgMall'/>">
			<img src="icon/3253474-wedding/png/034-marriage certification.png">商城商品

		</a> <a class="list-group-item"
			href="<c:url value='/support/bgArticle'/>">
			<img src="icon/3253474-wedding/png/001-clipboard.png">公版文管理
		</a>
	</div>


	<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>

</html>
