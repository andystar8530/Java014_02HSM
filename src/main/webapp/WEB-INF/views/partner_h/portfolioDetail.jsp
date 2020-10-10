<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" -->
<!-- 	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<title>作品集資訊</title>
<style>
.pfDetailImage{
/* 	max-height: 200px; */
/* 	max-width: 200px; */

}

.imgBox{
/* 	display: inline; */
	
}

.partnerIcon{
	
	border-radius: 50%;
/*  	object-fit:cover;  */
}

</style>
</head>
<body> 
<jsp:include page="/fragment/topMVC.jsp" />
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>作品集資訊</h2>
			</div>
		</div>
	</section>
			<div>
			<div class= 'mx-auto text-center'>
				<h3><img height='80px'
	src="<c:url value='/getPartnerCoverImage/${portfolio.partnerBean.p_id}'/> " width="80px" class='partnerIcon'>${portfolio.partnerBean.p_storeName}</h3>
				<h3>${portfolio.pfmName}</h3>
				<p>作品資訊: ${portfolio.pfmInfo}</p>
				<p>作品集分類: ${portfolio.pfService}</p>
				
				<!-- <img id='img'> -->
			</div>
				
	<div class="container col-10">
		<div class="row row-cols-2 row-cols-md-3 row-cols-xl-4">
				<c:forEach var='pfBean' items="${pfdBeanList}">
					<div class="col mb-4">
    					<div class="card h-100">										
							<img src="<c:url value='/getPFDetailImage/ ${pfBean.pfdId}'/>" class='pfDetailImage card-img-top'>
<%-- 						<p> 照片名稱:   ${pfBean.pfdName}</p> --%>
				
				 			 <div class="card-body">
								<h5 class="card-title">${pfBean.pfdName}</h5>
<!--         						<p class="card-text">This content is a little bit longer.</p> -->
     			 			</div>
				
						</div>
					</div>					
				</c:forEach>
			</div>
		</div>	
			<div class='text-center'>
				<p>
					<a href="<spring:url value='/' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回上頁
					</a> 
					<a href='#' class='btn btn-info btn-large'> 
					    <span class='glyphicon-shopping-cart glyphicon'></span>我有興趣
					</a>
				</p>
			</div>
			</div>
		</div>
	</div>
	</div>
<script>
// 	var text = ${portfolioDetailsBean.pfdId};
// 	console.log("text:" + text );
// 	alert(text);


</script>
</body>
</html>
