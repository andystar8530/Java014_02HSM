<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增方案</title>

<style>
/* body{ */
/* 	background-image: url("${pageContext.request.contextPath}/images/bg2.jpg"); */
/* 	background-repeat: no-repeat; */
/* 	background-size:cover; */
/* 	background-attachment: fixed; */
/* } */
.titleName{
	color:#6d6875;
	padding:20px;
	
}

</style>
</head>

<body>
<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />	
	
	<h2 class='titleName col-12 d-flex justify-content-center'>方案資料填寫</h2>
	<div class='container col-12'>
		<div class='row m-10 p-10 justify-content-center'>
	<form:form method="POST" modelAttribute="programBean" enctype='multipart/form-data'>
		<fieldset>
			<div class='form-group'>
				<label for="prm_Title">方案名稱</label>
				<div class='col-12'>
			        <form:input type="text"  id="prm_Title" path='prm_Title'
			         class='form:input-large' />
			        <form:errors  path="prm_Title" class='errors' />
				</div>
			</div>
			<div class='form-group'>
				<label for="prm_Content">方案內容</label>
				<div class='col-12'>
			        <form:textarea   id="prm_Content" path='prm_Content'
			         class='form:input-large' rows="3" cols="30" />
			        <form:errors  path="prm_Content" class='errors' />
				</div>
			</div>
			
			<div class='form-group'>
				<label for="prm_Detail">方案說明</label>
				<div class='col-12'>
			        <form:textarea   id="prm_Detail" path='prm_Detail'
			         class='form:input-large' rows="3" cols="30" />
			        <form:errors  path="prm_Detail" class='errors' />
				</div>
			</div>
			<div class='form-group'>
				<label for="prm_Price">方案價格</label>
				<div class='col-12'>
			        <form:input type="number"  id="prm_Price" path='prm_Price'
			         class='form:input-large' />
			        <form:errors  path="prm_Price" class='errors' />
				</div>
			</div>
			
			<div class='form-group'>
				<label for="coverPic">上傳方案封面圖</label>
				<div class='col-12'>
			        <form:input type="file"  id="prm_MultipartImage" path='prm_MultipartImage'
			         class='form:input-large' />
			        <form:errors  path="prm_MultipartImage" class='errors'/>	
				</div>
			</div>						
			<div class='form-group'>
				<div class='col-12'>
			        <input type="submit"  id="submit" path='submit'
			         class='form:input-large btn btn-outline-danger' value='送出' />
				</div>
			</div>
			
		</fieldset>
	</form:form>
	</div>
	</div>
	
</body>
</html>