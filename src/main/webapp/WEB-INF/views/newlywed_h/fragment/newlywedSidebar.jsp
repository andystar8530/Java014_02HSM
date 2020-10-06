<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/modern-business.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/marryMa.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
 
</head>
<body>
<!-- Page Content -->
  <div class="container">
     	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			新人 <small>管理頁面</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/">首頁</a></li>
			<li class="breadcrumb-item active">新人資料</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<div class="list-group-item href="#" >
              <img src="${pageContext.request.contextPath}/_00_init/getMemberImage?id=${LoginOK.m_Id}" width="80" style="border-radius: 50%;" id="partner-icon">
              <div>${NewlywedBean.n_nickname}</div>

					</div>
					<a href="<c:url value='/newlywed_h/newlywed' />" class="list-group-item"><img src="<c:url value='/data/icon/3253474-wedding/png/007-house.png' /> ">基本資料 </a>
					<a  class="list-group-item" href="<c:url value='/nrm/${LoginOK.m_No}'/>"><img src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/007-house.png" >帳號資料</a>
						
						<a href="<c:url value='/newlywed_h/wedding' />" class="list-group-item"><img
							src="<c:url value='/data/icon/3253474-wedding/png/015-picture.png' />">我的婚禮</a> <a
						class="list-group-item"><img
							src="<c:url value='/data/icon/3253474-wedding/png/034-marriage certification.png' />">我要詢價

					</a> <a class="list-group-item list-group-1"><img
							src="<c:url value='/data/icon/3253474-wedding/png/001-clipboard.png' />">我的討論區 </a> <a
						class="list-group-item list-group-2"><img
							src="<c:url value='/data/icon/3253474-wedding/png/027-wedding invitation.png' />">我的收藏
							> </a> <a class="list-group-item"
						href="${pageContext.request.contextPath}/"><img
							src="<c:url value='/data/icon/3253474-wedding/png/025-calendar.png' />">回首頁</a>
				</div>
			</div>
		
<!-- 		</div> -->
		<!-- /.row -->

<!-- 	</div> -->
<!--    <script src='https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script> -->
<%--   <script src="${pageContext.request.contextPath}/data/js/partner.js"></script> --%>
   <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script>
      new WOW().init(); 
    </script> 
</body>
</html>