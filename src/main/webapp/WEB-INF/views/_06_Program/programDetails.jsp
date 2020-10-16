<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>方案詳細內容</title>
<style>
.partnerIcon{
	border-radius: 50%;
}
</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
	
		
				<h3><img height='80px'
	src="<c:url value='/getPartnerCoverImage/${programBean.partnerBean2.p_id}'/>" width="80px" class='partnerIcon'>${programBean.partnerBean2.p_storeName}</h3>
				<h3>${portfolio.pfmName}</h3>
				<h3 class='col-12'>方案名稱:${programBean.prm_Title}</h3>
				<p>方案類別: ${programBean.prm_Category}</p>
				<p>方案內容: ${programBean.prm_Content}</p>
				<p>方案說明: ${programBean.prm_Detail}</p>
				<p>方案價格: ${programBean.prm_Price}</p>
				
	<div>
				<p>
					<a href="<spring:url value='/' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回上頁
					</a> 
								
					<a href="<c:url value='quote/askingQuote/${programBean.partnerBean2.p_id}'/>"
					class='btn btn-info btn-large'> 				
					    <span class='glyphicon-shopping-cart glyphicon'></span>我要詢價	    
					</a>
				</p>
			</div>	
</body>
</html>