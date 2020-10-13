<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>新人 管理頁面</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/modern-business.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/marryMa.css">
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
<script src="${pageContext.request.contextPath}/js/partner.js"></script>
</head>

<body>

	<!-- Navigation -->
	<!-- 引入共同的頁首 -->

	<jsp:include page="/fragment/topMVC.jsp" /> 
	<jsp:include page="./fragment/newlywedSidebar.jsp" />


<div class="col-lg-9 mb-4">
				<h2>婚禮籌備&nbsp;</h2>
				<form:form name="updateMemberFormA" modelAttribute="NewlywedBean" method="POST">
					<div class="form-group">
						<label for="formGroupExampleInput">結婚日期</label> <form:input
							path="N_date" type="date" class="form-control" id="formGroupExampleInput"
							placeholder="20xx/MM/DD" name="updateEmail" />
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput">婚禮預算(可複選)</label>
						<div class="form-group">
						<label for="formGroupExampleInput2"></label> <form:select
							path="N_budget" class="form-control" name="avTime">
							<form:options  items="${budget}" />
<!-- 							<option value="早上9點到中午12點">早上9點到中午12點</option> -->
<!-- 							<option>下午1點到晚上6點</option> -->
<!-- 							<option>晚上六點到晚上10點</option> -->
 						</form:select>
					</div>
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput">婚禮地區</label>
					</div>
                     <div class="form-check form-check-inline">
					 <form:radiobutton path="N_area" value="0" label="北部"
												class="form-check-input" />&nbsp;
											<br>
											<form:radiobutton path="N_area" value="1" label="中部"
												class="form-check-input" />
												<br>
											<form:radiobutton path="N_area" value="2" label="南部"
												class="form-check-input" />
												<br>
											<form:radiobutton path="N_area" value="3" label="東部"
												class="form-check-input" />
												<br>
											<form:radiobutton path="N_area" value="4" label="離島"
												class="form-check-input" />
                       </div>
					
					<div class="form-group">
						<label for="formGroupExampleInput2">準備清單</label>
						</div>
						<div>
						<form:checkboxes items="${weddingList}" path="N_checklist" /> 
					</div>
					
					<div>
						<input class="btn btn-primary" type="submit" value="送出" />
					</div>
				</form:form>

			</div>
		</div>
	

	</div>
	</div>
	</div>
			

			
		<!-- /.row -->

	<!-- /.container -->



	<!--共同頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
