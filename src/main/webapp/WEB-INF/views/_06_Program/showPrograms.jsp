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
<title>Insert title here</title>
</head>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
function showPrograms(){
	$.ajax({
		method:'GET',
		url :"<c:url value='/_06_Program/showPrograms' />",
		async:false,
		success:function(result){
			consloe.log(JSON.stringify(result));
		}
	});
}

$(document).ready(function() {
	$('#clickme').click(function() {
		console.log("clickme");
		$.ajax({
			method:'GET',
			url :"<c:url value='/_06_Program/showPrograms' />",
			async: false,
			success:function(result){
				console.log(JSON.stringify(result));
				
			}
		});
	});
})
</script>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />

<div id='somediv'>
</div>
<button id='clickme' >Click Me</button>
<hr>
<!-- cards -------------------------------------------------- -->
	<div class="container p-lg-6 p3 mb-4">
		<div class="row">
			<c:forEach varStatus="stVar" var="program" items="${programs_DPP}">
				<div class="col-lg-3 col-sm-6 col-12 mb-4 ">
					<div class="card border-info mb-3 shadow" style="max-width: 18rem;">
						
						<div class="card-body  text-info">
						<img src="<c:url value='/_06_Program/getProgramImage/${program.prm_Id}'/>" class='w-100' >
							<h5 class="card-title" style="white-space: nowrap">${program.prm_Title}</h5>
							<p class="card-text">
								NT$
								${program.prm_Price}
<%-- 								<fmt:formatNumber value="${program.prm_Price}" pattern="####" /> --%>
								元
								<br>
								服務內容:<br>
								${program.prm_Content}<br>
								內容說明:<br>
								${program.prm_Detail }<br>
								${program.prm_Status }<br>
								${program.prm_Createdate }<br>
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

</body>
</html>