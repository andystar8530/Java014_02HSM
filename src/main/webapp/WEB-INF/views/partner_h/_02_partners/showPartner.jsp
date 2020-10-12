<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>檢視店家資訊 </title>
<style>
.partnerIcon{
	border-radius: 50%;
}
.back{
	width:100%;
	height:500px;
	background-image: url("${pageContext.request.contextPath}/images/bg12.jpg");
		background-repeat: no-repeat;
		background-size:cover;
		background-attachment: fixed;

}

</style>
</head>

<body>
 <jsp:include page="/fragment/topMVC.jsp" />
 		<div class='back'>
 			
 		</div>
	<section>
		
	</section>
			<div>
			<div class= 'mx-auto text-center'>
				<h3><img height='80px'
	            src="<c:url value='/getPartnerCoverImage/${partnerBean.p_id}'/> " width="80px" class='partnerIcon'>${partnerBean.p_storeName}</h3>
				<h3>${partnerBean.p_info}</h3>
				<p>服務分類: ${partnerBean.p_service}</p>
				<p>聯絡資訊LineID: ${partnerBean.p_lineId}</p>
				<p>評價: ${partnerBean.p_review}顆星</p>
				
				<!-- <img id='img'> -->
			</div>
<h2 class='text-center p-3' id="bb">作品集</h2>				
	<div class="container col-10">
		<div class="row row-cols-2 row-cols-md-3 row-cols-xl-4">
				<c:forEach var='pfBean' items="${pfBeanList}" end='7'>
					<div class="col mb-4">
    					<div class="card h-100">										
							<img src="<c:url value='/getPFCoverImage/${pfBean.pfmId}'/>" class='pfDetailImage card-img-top'>
<%-- 						<p> 照片名稱:   ${pfBean.pfdName}</p> --%>
				
				 			 <div class="card-body">
								<h5 class="card-title">${pfBean.pfmName}</h5>
        						<p class="card-text">${pfBean.pfmInfo}</p>
     			 			</div>
				
						</div>
					</div>					
				</c:forEach>
			</div>
		</div>
		
		<div class='programDiv'>	
<h2 class='text-center p-3' id="bb">方案</h2>
	<div class='row ml-5 mr-5 col-9 mx-auto'>
	
		<c:forEach var='programBean' items="${programList}" end='7'>
			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3'>
				<div class="card shadow border-info">
				  <img src="<c:url value='/_06_Program/getProgramImage/${programBean.prm_Id}'/>"  class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title">${programBean.prm_Title}</h5>
				    <p class="card-text">${programBean.prm_Content}</p>
				    <p class="card-text">${programBean.prm_Price}</p>
				    <a href="<c:url value='/_06_Program/ProgramDetail/${programBean.prm_Id}'/>" class="btn btn-primary">詳細內容</a>
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
					<a href="${pageContext.request.contextPath}/getFavorites?p_id=${p_id}" class='btn btn-info btn-large'> 
					    <span class='glyphicon-shopping-cart glyphicon'></span>我有興趣
					</a>
				</p>
			</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>