<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<div id='content' class='table table-sm '>
		<div class='mx-auto'>
			<!--                 分隔線         -->

			<section class="container">
				<div class="row">
					<c:forEach var='product' items='${products}'>
						<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
							<div class="thumbnail" style="width: 320px; height: 340px">
								<div class="caption">
									<p>
										<b style='font-size: 16px;'>${product.p_Name}</b>
									</p>
									<p>${product.p_Category}</p>
									<p>目前在庫數量: ${product.p_Stock}個</p>
									<p>${product.p_Price}</p>
									<p>
										<a href="<spring:url value='/product?id=${product.p_Id}' />"
											class="btn btn-primary"> <span
											class="glyphicon-info-sigh glyphicon"></span>詳細資料
										</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
		</div>
	</div>
</body>
</html>
