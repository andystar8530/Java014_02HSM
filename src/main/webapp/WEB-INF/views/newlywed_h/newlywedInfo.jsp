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


	
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h2>基本資料&nbsp;</h2>
				<form:form modelAttribute="NewlywedBean" method="POST" enctype='multipart/form-data'>
					<div class="form-group">
						<label for="formGroupExampleInput">平台暱稱</label> 
						<form:input
							path="N_nickname" class="form-control" id="formGroupExampleInput"
							type="text" placeholder="您的暱稱"  />
					</div>
<!-- 					<div class="form-group"> -->
<!-- 						<label for="formGroupExampleInput">結婚日期</label> <input type="text" -->
<!-- 							class="form-control" id="formGroupExampleInput" -->
<!-- 							placeholder="Your password" name="updatePswd"> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label for="formGroupExampleInput">婚禮預算</label> <input type="text" -->
<!-- 							class="form-control" id="formGroupExampleInput" -->
<!-- 							placeholder="Your IDnumber" name="updateId"> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label for="formGroupExampleInput2">婚禮地區</label> <input -->
<!-- 							type="text" class="form-control" id="formGroupExampleInput2" -->
<!-- 							placeholder="Telephone" name="updatePhone" -->
<%-- 							value="${param.updatePhone}"> --%>
<!-- 					</div> -->
					<div class="form-group">
						<label for="formGroupExampleInput2">電話號碼</label> <form:input 
						path="N_phonenumber"
							type="text" class="form-control" id="formGroupExampleInput2"
							placeholder="09xx-xxx-xxx"/>
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput">您的性別</label>
					</div>
					<div class="form-check form-check-inline">
                            <form:radiobutton path="N_gender" value="0" label="男生"
												class="form-check-input" />&nbsp;
											<br>
											<form:radiobutton path="N_gender" value="1" label="女生"
												class="form-check-input" />
<%-- 											<form:errors path="m_Code" cssClass="error" /> --%>


<!-- 						<input class="form-check-input" type="checkbox" -->
<!-- 							id="inlineCheckbox1" value="option1" /> <label -->
<!-- 							class="form-check-label" for="inlineCheckbox1">男</label> -->
<!--  					</div> --> 
<!--  					<div class="form-check form-check-inline"> --> 
<!-- 						<input class="form-check-input" type="checkbox" -->
<!-- 							id="inlineCheckbox1" value="option2" > <label -->
<!-- 							class="form-check-label" for="inlineCheckbox2">女</label> -->
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput2">聯絡時間</label> 
						<form:select path="N_connectiontime" class="form-control" name="avTime">
                                <form:options  items="${FreeTime}" />
<!-- 							<option value="早上9點到中午12點">早上9點到中午12點</option> -->
<!-- 							<option>下午1點到晚上6點</option> -->
<!-- 							<option>晚上六點到晚上10點</option> -->
						</form:select>
					</div>
					<div>
						<input class="btn btn-primary" type="submit" value="送出" />
					</div>
				</form:form>

			</div>
		</div>
		<!-- /.row -->
</div>
</div>
	<!-- /.container -->



	<!--共同頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
