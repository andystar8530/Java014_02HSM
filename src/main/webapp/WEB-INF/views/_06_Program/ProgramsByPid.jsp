<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有方案</title>
</head>
<style>
.btns{
	height:50px;
	width:800px;
}

</style>
<body>
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/topMVC.jsp" />
<jsp:include page="../partner_h/fragment/partnerSidebar.jsp" />
		<!-- cards -------------------------------------------------- -->
	<div class="container col-9">
		<div class="row">
		<div class='btns'>
			<a class="btn btn-primary" href="<c:url value='/_06_Program/addProgram'/>" role="button">新增方案&nbsp;</a>
			<a class="btn btn-light" href="<c:url value='/_06_Program/programManagement'/>" role="button">方案管理</a>
		</div>
			<c:forEach varStatus="stVar" var="program" items="${programList}">
				<div class="col-lg-4 col-md-6 col-12 mb-4 ">
					<div class="card border-info mb-3 shadow" style="max-width: 18rem;">
						
						<div class="card-body  text-info">
							<img src="<c:url value='/_06_Program/getProgramImage/${program.prm_Id}'/>" class='w-100' >
							<h5 class="card-title">${program.prm_Title}</h5>
							<p class="card-text">
								NT$
								${program.prm_Price}
<%-- 								<fmt:formatNumber value="${program.prm_Price}" pattern="####" /> --%>
								元
								<br>
								服務內容:<br>
								${program.prm_Content}<br>
								內容說明:<br>
								${program.prm_Detail}<br>
								${program.prm_Status}<br>
								${program.prm_Createdate}<br>
							</p>
							<a href="<spring:url value='/_03_listProducts/product?id=${program.prm_Id}' />"
    							class="btn btn-primary">
    							<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
 							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
</div>
</div>	
</body>
</html>