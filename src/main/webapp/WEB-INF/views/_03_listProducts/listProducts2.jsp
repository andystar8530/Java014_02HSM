<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品列表</title>
<style>
#content {
	width: 820px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body style="background: #EBFFEB;">
	<!-- 下列敘述設定變數funcName的值為SHO，topMVC.jsp 會用到此變數 -->
	<c:set var="funcName" value="SHO" scope="session" />
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />
	<!-- 判斷購物車內是否有商品 -->
	<c:choose>
		<c:when test="${ShoppingCart.itemNumber > 0}">
			<!-- 購物車內有一項以上的商品 -->
			<c:set var="cartContent" value="購物車內有${ShoppingCart.itemNumber}項商品" />
		</c:when>
		<c:otherwise>
			<!-- 購物車內沒有商品 -->
			<c:set var="cartContent" value="您尚未購買任何商品" />
		</c:otherwise>
	</c:choose>

	<%-- --%>
	<br>
	<div  style="text-align: center">
	<a class="btn btn-primary" href="<c:url value='/_03_listProducts/queryByCategory' />" >分類查詢</a>
	
	</div>
	<hr>
	<c:if test="${categoryList != null}">
		<div style="text-align: center">
			<h1>請依照類別來挑選產品：</h1>
			<c:forEach var='category' items='${categoryList}'>
				<a class="btn btn-outline-primary" href='products/${category}'>${category}</a>
				<br>
			</c:forEach>
		</div>
	<hr>
	</c:if>
	<!-- ---------------------------分隔線---------------------------------------			 -->

	<!-- cards -------------------------------------------------- -->
	<div class="container p-lg-6 p3 mb-4">
		<div class="row">
			<c:forEach varStatus="stVar" var="product" items="${products}">
				<div class="col-lg-3 col-sm-6 col-12 mb-4 ">
					<div class="card border-info mb-3 shadow-lg" style="max-width: 18rem;">
						<img
							src="${pageContext.servletContext.contextPath}/_00_init/getProductImage?id=${product.p_Id}"
							class="card-img-top" alt="..." />
						<div class="card-body text-center text-info">
							<h5 class="card-title" style="white-space: nowrap">${product.p_Name}</h5>
							<p class="card-text">
								NT$
								<fmt:formatNumber value="${product.p_Price}" pattern="####" />
								元
							</p>
							<a href="<spring:url value='/_03_listProducts/product?id=${product.p_Id}' />"
    							class="btn btn-primary">
    							<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
 							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- ---------------------------分隔線---------------------------------------			 -->



</body>
</html>
