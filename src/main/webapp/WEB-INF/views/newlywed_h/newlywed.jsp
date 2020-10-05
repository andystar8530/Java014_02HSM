<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <jsp:useBean id="memberService" --%>
<%-- 	class="ch01_h_register.service.MemberService" /> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
	<c:redirect url="/ch02_login/login.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>新人 管理頁面</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/modern-business.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="css/marryMa.css"> -->
<!-- <script -->
<!-- 	src='https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script> -->
<!-- <script src="js/partner.js"></script> -->
</head>

<body>

	<!-- Navigation -->
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />
	<jsp:include page="./fragment/newlywedSidebar.jsp" />
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h2>基本資料&nbsp;</h2>										
				<a href="<c:url value='/newlywed_h/newlywedInfo'/>" ><img src="<c:url value='/data/icon/document.png' />"
					width="30" class="editInfo"></a>
				<div class="newlyWed">
					會員暱稱 : <span>${NewlywedBean.n_nickname}</span>
				</div>
				<div class="newlyWed">
					Email(信箱) : <span>${LoginOK.m_Id}</span>
				</div>
				<div class="newlyWed">
					手機號碼 : <span>${NewlywedBean.n_phonenumber}</span>
				</div>
				<div class="newlyWed">
					聯絡時間 : <span>${NewlywedBean.n_connectiontime}</span>
				</div>
				<div class="newlyWed">
<%-- 					聯絡時間 : <span>${LoginOK.m_Availabletime}</span> --%>
				</div>

			</div>
		</div>
		<!-- /.row -->
</div>
	</div>
	<!-- /.container -->

	<!--共同頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

</body>

</html>
