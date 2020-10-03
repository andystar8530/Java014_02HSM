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



	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			新人 <small>管理頁面</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/">首頁</a></li>
			<li class="breadcrumb-item active">新人資料</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<div class="list-group-item href="#" >
              <img src="${pageContext.request.contextPath}/_00_init/getMemberImage?id=${LoginOK.m_Id}" width="80" style="border-radius: 50%;" id="partner-icon">
              <div>${NewlywedBean2.n_nickname}</div>

					</div>
					<a href="<c:url value='/newlywed_h/newlywed' />" class="list-group-item"><img src="<c:url value='/data/icon/3253474-wedding/png/007-house.png' /> ">基本資料 </a>
					<a  class="list-group-item" href="<c:url value='/nrm/${LoginOK.m_No}'/>"><img src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/007-house.png" >帳號資料</a>
						
						<a class="list-group-item"><img
							src="<c:url value='/data/icon/3253474-wedding/png/015-picture.png' />">我的婚禮</a> <a
						class="list-group-item"><img
							src="<c:url value='/data/icon/3253474-wedding/png/034-marriage certification.png' />">我要詢價

					</a> <a class="list-group-item list-group-1"><img
							src="<c:url value='/data/icon/3253474-wedding/png/001-clipboard.png' />">我的討論區 </a> <a
						class="list-group-item list-group-2"><img
							src="<c:url value='/data/icon/3253474-wedding/png/027-wedding invitation.png' />">我的收藏
							> </a> <a class="list-group-item"
						href="${pageContext.request.contextPath}/"><img
							src="<c:url value='/data/icon/3253474-wedding/png/025-calendar.png' />">回首頁</a>
				</div>
			</div>
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
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-pink">
		<div class="container">
			<p class="m-0 text-center text-dark">Copyright &copy; Your
				Website 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
