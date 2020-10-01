<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>加入合作商的行列!!!!!</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/marryMa.css">
	 <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/modern-business.css" rel="stylesheet">
<style>
body{
	background-image: url("${pageContext.request.contextPath}/images/bg2.jpg");
	background-repeat: no-repeat;
	background-size:cover;
	background-attachment: fixed;
}
.titlename{
	color:#6d6875;
	padding:20px;
	
}
.form-group{
	color:#6d6875;
}

.bg-pink{
	opacity:0.9;
}
.errors{
	color:#fe5f55;
	font-weight: bold;
}

</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />

			<h2 class='titlename col-12 d-flex justify-content-center'>商家基本資料填寫</h2>
<div class='container d-flex justify-content-center '>
	<div class='row m-10 p-10'>
	<form:form method='POST' modelAttribute='partnerBean' enctype='multipart/form-data' >
		<fieldset>
			<div class='form-group'>
				<label for="storeName">店家名稱</label>
				<div class='col-12'>
			        <form:input type="text"  id="p_storeName" path='p_storeName'
			         class='form:input-large' />
			        <form:errors  path="p_storeName" class='errors' />
				</div>
			</div>
				<div class='form-group'>
				<label for="info">店家簡介</label>
				<div class='col-12'>
			        <form:textarea   id="p_info" path='p_info'
			         class='form:input-large' rows="3" cols="30" />
			        <form:errors  path="p_info" class='errors' />
				</div>
			</div>
			<div class="form-group ">
				<label class='col' for="service">
					主要服務項目 </label>
				<div class='col-12'>
					<form:select path="p_service">
						<form:option value="-1" label="請挑選" />
						<form:option value="婚禮攝影"  label="婚禮攝影" />
						<form:option value="婚禮佈置"  label="婚禮佈置" />
						<form:option value="新娘秘書"  label="新娘秘書" />
						<form:option value="婚禮主持"  label="婚禮主持" />
						
					</form:select>	
					<form:errors  path="p_service" class='errors'/>			
				</div>
			</div>
			<div class="form-group">
				<label class='col-12' for="area">
					服務區域 </label>
				<div class='col-12'>
					<form:select path="p_area">
						<form:option value="-1" label="請挑選" />
						<form:option value="1" label="北部" />
						<form:option value="2" label="中部" />
						<form:option value="3" label="南部" />
						<form:option value="4" label="東部" />
						<form:option value="5" label="離島" />
					</form:select>
					<form:errors  path="p_area" class='errors'/>				
				</div>
			</div>
			<div class='form-group'>
				<label for="coverPic">上傳封面圖</label>
				<div class='col-12'>
			        <form:input type="file"  id="covImage" path='covImage'
			         class='form:input-large' />
			        <form:errors  path="covImage" class='errors'/>	
				</div>
			</div>
			<div class='form-group'>
				<label for="stamp">上傳公司大小章</label>
				<div class='col-12'>
			        <form:input type="file"  id="staImage" path='staImage'
			         class='form:input-large' />
			        <form:errors  path="staImage" class='errors'/>	
				</div>
			</div>
			<div class='form-group'>
				<label for="bankAcc">銀行帳號</label>
				<div class='col-12'>
			        <form:input type="text"  id="p_bankAcc" path='p_bankAcc'
			         class='form:input-large ' />
			        <form:errors  path="p_bankAcc" class='errors'/>	
				</div>
			</div>
			<div class='form-group'>
				<label for="lineId">LineID</label>
				<div class='col-12'>
			        <form:input type="text"  id="p_lineId" path='p_lineId'
			         class='form:input-large' />
			        <form:errors  path="p_lineId" class='errors'/>
				</div>
			</div>
			<div class='form-group'>
				<label for="hRate">預估時薪</label>
				<div class='col-12'>
			        <form:input type="text"  id="p_hRate" path='p_hRate'
			         class='form:input-large' />
			        <form:errors  path="p_hRate" class='errors'/>
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