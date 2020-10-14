<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>合作商管理頁面</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/modern-business.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/marryMa.css">
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
<script src="${pageContext.request.contextPath}/js/partner.js"></script>
<style>
	.store{
 		/* margin-bottom: 50px; */
		 margin-top: 50px;
	}
</style>
</head>

<body>

	<!-- Navigation -->
	<!-- 引入共同的頁首 -->

	<jsp:include page="/fragment/topMVC.jsp" /> 
	<jsp:include page="./fragment/newlywedSidebar.jsp" />



	<!-- Page Content -->
<!-- 	<div class="container"> -->

<!-- 		<!-- Page Heading/Breadcrumbs -->
<!-- 		<h1 class="mt-4 mb-3"> -->
<!-- 			新人 <small>管理頁面</small> -->
<!-- 		</h1> -->

<!-- 		<ol class="breadcrumb"> -->
<!-- 			<li class="breadcrumb-item"><a -->
<%-- 				href="${pageContext.request.contextPath}/">首頁</a></li> --%>
<!-- 			<li class="breadcrumb-item active">新人資料</li> -->
<!-- 		</ol> -->

<!-- 		<!-- Content Row --> 
<!-- 		<div class="row"> -->
<!-- 			<!-- Sidebar Column -->
<!-- 			<div class="col-lg-3 mb-4"> -->
<!-- 				<div class="list-group"> -->
<!-- 					<div class="list-group-item href="#" > -->
<%-- 						<img src="${pageContext.request.contextPath}/images/duck.jpg" width="80" style="border-radius: 50%;" --%>
<!-- 							id="partner-icon"> -->
<!-- 						<div>會員-可達鴨</div> -->

<!-- 					</div> -->
<%-- 					<a href="<c:url value='/newlywed_h/newlywed' />" class="list-group-item"><img src="<c:url value='/data/icon/3253474-wedding/png/007-house.png' /> ">基本資料 </a> --%>
<%-- 					<a  class="list-group-item" href="<c:url value='/nrm/${LoginOK.m_No}'/>"><img src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/007-house.png" >帳號資料</a> --%>
						
<%-- 						<a href="<c:url value='/newlywed_h/wedding'/>" class="list-group-item" ><img --%>
<%-- 							src="<c:url value='/data/icon/3253474-wedding/png/015-picture.png' />">我的婚禮</a> <a --%>
<!-- 						class="list-group-item"><img -->
<%-- 							src="<c:url value='/data/icon/3253474-wedding/png/034-marriage certification.png' />">我要詢價 --%>

<!-- 					</a> <a class="list-group-item list-group-1"><img -->
<%-- 							src="<c:url value='/data/icon/3253474-wedding/png/001-clipboard.png' />">我的討論區 </a> <a --%>
<!-- 						class="list-group-item list-group-2"><img -->
<%-- 							src="<c:url value='/data/icon/3253474-wedding/png/027-wedding invitation.png' />">我的收藏 --%>
<!-- 							> </a> <a class="list-group-item" -->
<%-- 						href="${pageContext.request.contextPath}/"><img --%>
<%-- 							src="<c:url value='/data/icon/3253474-wedding/png/025-calendar.png' />">回首頁</a> --%>
<!-- 				</div> -->
<!-- 			</div> -->
			<!-- Content Column -->
			
			<div>
			<c:forEach var="pb" items="${pbli}">
				<div class="store mt-3">
			   <img src="${pb.p_coverPic}">
			   <a href="<c:url value='/showPartnerDetail/${pb.p_id}'/>">${pb.p_storeName}<br/></a>
				</div>
			</c:forEach>
			</div>
			</div>
	</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
<!-- 	<footer class="py-5 bg-pink"> -->
<!-- 		<div class="container"> -->
<!-- 			<p class="m-0 text-center text-dark">Copyright &copy; Your -->
<!-- 				Website 2020</p> -->
<!-- 		</div> -->
<!-- 		<!-- /.container --> 
<!-- 	</footer> -->
<jsp:include page="/fragment/footerMVC.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
