<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon"
	href='<c:url value="/images/removebg.ico"/>'
	type="image/x-icon" />
 <style>
@media all and (min-width: 992px) {
   .navbar .nav-item .dropdown-menu{  display:block; opacity: 0;  visibility: hidden; transition:.5s; margin-top:0;  }
   .navbar .nav-item:hover .nav-link{ color: #fff;  }
   .navbar .dropdown-menu.fade-down{ top:80%; transform: rotateX(-75deg); transform-origin: 0% 0%; }
   .navbar .dropdown-menu.fade-up{ top:180%;  }
   .navbar .nav-item:hover .dropdown-menu{ transition: .3s; opacity:1; visibility:visible; top:100%; transform: rotateX(0deg); }
  }
 </style>
<title>姻緣聚繪</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css ">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/css/modern-business.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/marryMa.css">
<!-- 	wow.js -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">

</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-light bg-pink fixed-top">
		<div class="container">
			<img src="${pageContext.request.contextPath}/images/removebg.png"
				width="50" style="display: inline;"> <a class="navbar-brand"
				href="/Java014_02HSM/">姻緣聚繪</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link  wow fadeInLeft"
						href="#">婚禮佈置</a></li>
					<li class="nav-item"><a class="nav-link  wow fadeInLeft"
						href="#">婚禮攝影</a></li>
					<li class="nav-item"><a class="nav-link  wow fadeInLeft"
						href="#">新娘秘書</a></li>
					<li class="nav-item"><a class="nav-link  wow fadeInLeft"
						href="#">婚禮主持</a></li>
					<li class="nav-item dropdown">
    			    		<a class="nav-link dropdown-toggle wow fadeInLeft" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
  			        			小物商城
  				      		</a>
 					       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
 				 		      <a class="dropdown-item" href="<c:url value='/_03_listProducts/DisplayPageProducts' />">購物</a>
   				 		      <a class="dropdown-item" href="<c:url value='/_04_ShoppingCart/ShowCartContent' />">購物車</a>
   				  		    <div class="dropdown-divider"></div>
   				 		      <a class="dropdown-item" href="<c:url value='/_05_orderProcess/orderList' />">訂單</a>
   				     		</div>
    			  	</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle wow fadeInLeft" href="#"
						id="navbarDropdownBlog" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 社群分享 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="<c:url value='/_04_forum/posts'/>">分享討論區</a>  <a
								class="dropdown-item" href="#">商家評價</a>
						</div></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle wow fadeInLeft" href="#"
						id="navbarDropdownPages" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 平台說明 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPages">
							<a class="dropdown-item" href="#">關於本站</a> <a
								class="dropdown-item" href="#">最新公告</a> <a class="dropdown-item"
								href="#">服務條款</a> <a class="dropdown-item" href="#">隱私權說明</a> <a
								class="dropdown-item" href="#">免責聲明</a> <a class="dropdown-item"
								href="#">問題回報</a>
						</div></li>
					<c:if test="${empty LoginOK}">
						<li class="nav-item wow fadeInLeft">
							<!--                 如果沒登入才會顯示會員登入按鈕 --> <%-- 							<a class="nav-link" href="<c:url value='/ch02_login/login.jsp' />">會員登入</a> --%>
							<a class="nav-link" href="<c:url value='/_02_login/login' />">會員登入</a>
							
						</li>
						<li class="nav-item wow fadeInLeft">
							<!--        如果沒登入才會顯示註冊按鈕 --> <%-- 							<a class="nav-link" href="<c:url value='/ch01_register/quickReg.jsp' />">註冊</a> --%>
							<a class="nav-link" href="<c:url value='/_01_register/register' />">註冊</a>
							
						</li>
					</c:if>
					<c:if test="${!empty LoginOK}">
						<c:if test="${LoginOK.m_Code == 0}">
							<li class="nav-item "><a class="nav-link wow fadeInLeft"
								href="<c:url value='/newlywed_h/newlywed' />">新人頁面</a>
							</li>     
						</c:if>
						<c:if test="${LoginOK.m_Code == 1}">
							<c:if test="${!empty partnerBean}">
								<li class="nav-item"><a class="nav-link wow fadeInLeft"
								href="<c:url value='/displayPartner'/>">
									商家頁面</a>
								</li>
							</c:if>
							<c:if test="${empty partnerBean}">
								<li class="nav-item"><a class="nav-link wow fadeInLeft"
								href="<c:url value='/addPartner'/>">
									填寫商家資料</a>
								</li>
							</c:if>
						</c:if>
						<c:if test="${LoginOK.m_Code == 2}">
							<li class="nav-item"><a class="nav-link wow fadeInLeft"
								href="<c:url value='/support/bgMain' />">管理頁面</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link wow fadeInLeft"
							href="<c:url value='/_02_login/logout' />"> 登出 </a></li>

						<li class="nav-item"><img height='40px' width='40px'
							src="<c:url value='/_00_init/getMemberImage?id=${LoginOK.m_Id}' /> ">

<!-- 下面這個圖也可以用 -->
<!-- 							<img height='40px' width='40px' -->
<%-- 							src=' --%>
<%-- 							${pageContext.servletContext.contextPath}/_00_init/getMemberImage?id=${LoginOK.m_Id}'> --%>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>


	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/marry.js"></script>
	<script src="${pageContext.request.contextPath}/js/partner.js"></script>
<!-- 	<script -->
<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script> -->
</body>
</html>