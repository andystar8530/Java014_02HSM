<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Portfolios</title>
</head>
<body>
    <section>
        <div>
            <div class="container" style="text-align: center" >
                <h1>作品集清單</h1>    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
    方案 +
  </button>
            </div>
        </div>
    </section>
    
    
    <hr style="height:1px;border:none;color:#333;background-color:#333;">
	<div align="center">
	<a href="<c:url value='/' />">回前頁</a>
	</div>
    <hr>
    <section class="container">
        <div class="row">
        <c:forEach var='portfolio' items="${allPortfolios}">
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                    <div class="caption">
                        <p>
                            <b style='font-size: 16px;'>${portfolio.pfmName}</b>
                        </p>
                        <p>${portfolio.partnerBean.p_storeName}</p>
                   
                        <p>作品資訊: ${portfolio.pfmInfo}</p>
                        <p>
                        	<a href="<spring:url value='/portfolio?pfmId=${portfolio.pfmId}' />" class="btn btn-primary">
                        		<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
                        	</a>
                        </p>
                        
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
    </section>
</body>
</html>
    