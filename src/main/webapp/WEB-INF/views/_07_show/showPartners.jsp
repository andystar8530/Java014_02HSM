<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showPartners</title>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />


<button type="button" class="btn btn-outline-danger">找店家</button>
<button type="button" class="btn btn-outline-danger">找方案</button>
<button type="button" class="btn btn-outline-danger">找作品</button>

<h2 class='text-center p-3'>店家一覽</h2>
	<div class='row ml-5 mr-5 col-9 mx-auto'>
	
		<c:forEach var='partnerBean' items="${pbList}" end='7'>
			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3' >
				<div class="card shadow border-info">
				  <img src="<c:url value='/getPartnerStampImage/${partnerBean.p_id}'/>" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">${partnerBean.p_storeName}</h5>
				    <p class="card-text">${partnerBean.p_service}</p>
				    <p class="card-text">${partnerBean.p_info}</p>
				    <a href="#" class="btn btn-primary">Go somewhere</a>
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>
	
<h2 class='text-center p-3'>方案一覽</h2>
	<div class='row ml-5 mr-5 col-9 mx-auto'>
	
		<c:forEach var='programBean' items="${programList}" end='7'>
			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3'>
				<div class="card shadow border-info">
				  <img src="<c:url value='/_06_Program/getProgramImage/${programBean.prm_Id}'/>"  class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title">${programBean.prm_Title}</h5>
				    <p class="card-text">${programBean.prm_Content}</p>
				    <p class="card-text">${programBean.prm_Price}</p>
				    <a href="#" class="btn btn-primary">Go somewhere</a>
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>	
	
	
<h2 class='text-center p-3'>作品集一覽</h2>
	<div class='row ml-5 mr-5 col-9 mx-auto'>
	
		<c:forEach var='portfoliosBean' items="${portfolioList}" end='7'>
			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3'>
				<div class="card shadow border-info">
				  <img src="<c:url value='/getPFCoverImage/${portfoliosBean.pfmId}'/>" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">${portfoliosBean.pfmName}</h5>
				    <p class="card-text">${portfoliosBean.pfmInfo}</p>
				    <p class="card-text">${portfoliosBean.partnerBean.p_storeName}</p>
				    <a href="#" class="btn btn-primary">Go somewhere</a>
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>	
</body>
</html>