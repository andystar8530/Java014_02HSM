<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" -->
<!-- 	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<title>Product</title>
</head>
<body>
	<!-- 下列敘述設定變數funcName的值為SHO，topMVC.jsp 會用到此變數 -->
	<c:set var="funcName" value="SHO" scope="session" />
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />
	<div class="container p-lg-5 p3 mt-0">
		<section>
			<div>
				<div class="container" style="text-align: center">
					<h1>產品資料</h1>
				</div>
			</div>
		</section>
		<section class="container">
			<div class="row">
				<div class="col-md-6">
					<h3>${product.p_Name}</h3>
					<p>分類: ${product.p_Category}</p>
					<p>單價: ${product.p_Price}</p>
					<p>敘述: ${product.p_Note}</p>
					<p>
						<strong>商品編號: </strong> <span class='label label-warning'>
							${product.p_Id} </span>
					</p>
					<p>
						<a href="<spring:url value='/_03_listProducts/DisplayPageProducts2' />"
							class="btn btn-default"> <span
							class="glyphicon-hand-left glyphicon"></span>返回
						</a> <a href='#' class='btn btn-warning btn-large'> <span
							class='glyphicon-shopping-cart glyphicon'></span>加入購物車
						</a>
					</p>
				</div>
				<div class="col-md-6">
					<img
						src="${pageContext.servletContext.contextPath}/_00_init/getProductImage?id=${product.p_Id}"
						class="card-img-top" alt="..." />
				</div>
			</div>
		</section>
	</div>
	 <!-- 引入共同的頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>
