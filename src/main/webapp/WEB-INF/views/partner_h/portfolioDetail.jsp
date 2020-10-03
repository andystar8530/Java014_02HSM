<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>作品集資訊</title>
<style>
.pfDeailImage{




}




</style>
</head>
<body> 
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>作品集資訊</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<div class="col-md-5">
				<h3>${portfolio.pfmName}</h3>
				<p>作品資訊: ${portfolio.pfmInfo}</p>
				<p>作品集分類: ${portfolio.pfService}</p>
				<div>
				<!-- <img id='img'> -->
<%-- 					<img src="<c:url value='/getPFDetailImage/85' />"> --%>
<%-- 					<img src="<c:url value='/getPFDetailImage/${portfolioDetailsBean.pfdId}'/>"> --%>
				
				<c:forEach var='pfBean' items="${pfBeanList}">
				<img src="<c:url value='/getPFDetailImage/ ${pfBean.pfdId}'/>" class='pfDeailImage'>
					<p> 照片名稱:   ${pfBean.pfdName}</p>
				
				
				
				
				</c:forEach>
				</div>
			
				<p>
					<a href="<spring:url value='/portfolios' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
					<a href='#' class='btn btn-warning btn-large'> 
					    <span class='glyphicon-shopping-cart glyphicon'></span>加入購物車
					</a>
				</p>

	</section>
<script>
	var text = ${portfolioDetailsBean.pfdId};
	console.log("text:" + text );
	alert(text);


</script>
</body>
</html>
