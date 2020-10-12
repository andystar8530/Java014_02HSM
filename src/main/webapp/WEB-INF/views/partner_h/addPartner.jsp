<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.input-group {
    position: relative;
    width: 100%;

    background: transparent;
}
</style>
<title>加入合作商的行列!!!!!</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/marryMa.css">
	 <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/modern-business.css" rel="stylesheet">
<style>
body{
	/* background-image: url("${pageContext.request.contextPath}/images/bg2.jpg");
	background-repeat: no-repeat;
	background-size:cover;
	background-attachment: fixed; */
}
.titlename{
	color:#6d6875;
	padding:20px;
	
}
.form-group{
	color:#293241;
	font-weight: bold;
}

.bg-pink{
	opacity:0.9;
}
.errors{
	color:#fe5f55;
	font-weight: bold;
}
.form-box-body{
	background-color: rgba(240, 239, 235, 1);
}
.inputClass {
    width: 100%;

    background: none;
    padding: 0.6rem 1.2rem;
    color: #808aa0;

    font-weight: 500;
    font-size: 0.95rem;
    letter-spacing: 0.5px;
    border-radius: 25px;
    transition: 0.3s;
    height: 45px;

    box-sizing: border-box;
    font-size: 18px;
    outline: none;
    border: 2px solid rgb(209, 215, 223);
    border-radius: 7px;
}
</style>
</head>
<body>
<!-- include navbar -->
<jsp:include page="/fragment/topMVC.jsp" />
<section>
	<div class="container bg-danger d-flex justify-content-center">
			<div class="row justify-content-center" style="width:800px;" >
				<div class="col-12 bg-secondary text-center" style="height:100px;line-height:100px;">
					<h2 class=''>商家基本資料填寫</h2>
				</div>
				<form:form  method='POST' modelAttribute='partnerBean' enctype='multipart/form-data'
				class='d-flex'>
					<!-- 左div -->
					<div class="w-50 bg-light" style="height:600px">
						<div class='col-12 w-100 my-5 input-group'>
							<label for="storeName">店家名稱</label>
							<form:input type="text"  id="p_storeName" path='p_storeName'
							class='form:input-large inputClass' />
							<form:errors  path="p_storeName" class='errors' /> 
						</div> 			
						<div class='col-12 mb-5 justify-content-center input-group'>
							<span class='p-2'>主要服務項目</span><form:select path="p_service" class="inputClass">
								<form:option value="-1" label="請挑選" />
								<form:option value="婚禮攝影"  label="婚禮攝影" />
								<form:option value="婚禮佈置"  label="婚禮佈置" />
								<form:option value="新娘秘書"  label="新娘秘書" />
								<form:option value="婚禮主持"  label="婚禮主持" />	
							</form:select>	
							<form:errors  path="p_service" class='errors'/>			
						</div>
									
						<div class='col-12 mb-5 input-group'>
								<span class='p-2'>服務區域</span><form:select path="p_area" class="inputClass">
									<form:option value="-1" label="請挑選" />
									<form:option value="1" label="北部" />
									<form:option value="2" label="中部" />
									<form:option value="3" label="南部" />
									<form:option value="4" label="東部" />
									<form:option value="5" label="離島" />
								</form:select>
								<form:errors  path="p_area" class='errors'/>			
						</div>
						<label for="bankAcc ">銀行帳號</label>
						<div class='col-12 mb-3 justify-content-center input-group'>
							<form:input type="text"  id="p_bankAcc" path='p_bankAcc'
								class='form:input-large inputClass' />
							<form:errors  path="p_bankAcc" class='errors'/>	
							</div>
							<label for="lineId">LineID</label>
							<div class='col-12 mb-3 justify-content-center input-group'>
								<form:input type="text"  id="p_lineId" path='p_lineId'
								class='form:input-large inputClass' />
								<form:errors  path="p_lineId" class='errors'/>							
							</div>	
						
					</div>		
				
					<!-- 右div -->
					<div class="w-50 bg-info" style="height:600px">
						<div class="col-12 mb-5 input-group" style="height:100px">
							<label for="info">店家簡介</label>
							<form:textarea   id="p_info" path='p_info'
							class='form:input-large inputClass' rows="3" cols="30" />
							<form:errors  path="p_info" class='errors' />
						</div>
					
					
						<label for="coverPic">上傳封面圖</label>
						<div class='col-12 mb-3 input-group'>
							<form:input type="file"  id="covImage" path='covImage'
								class='form:input-large ' />
							<form:errors  path="covImage" class='errors'/>												
						</div>										
						<label for="stamp">上傳公司大小章</label>
						<div class='col-12 mb-3 input-group'>
							<form:input type="file"  id="staImage" path='staImage'
							class='form:input-large ' />
							<form:errors  path="staImage" class='errors'/>	
						</div>
						<label for="hRate">預估時薪</label>
						<div class='col-12 mb-3 input-group'>
							<form:input type="text"  id="p_hRate" path='p_hRate'
							class='form:input-large inputClass' />
							<form:errors  path="p_hRate" class='errors'/>
						</div>			
						<!-- 按鈕 -->								
						<div class='col-12 my-5'>
						<input type="submit"  id="submit" path='submit'
						class='form:input-large btn btn-outline-danger' value='送出' />
						</div>				
					</div>		

				</form:form>	
				
			</div>	
		</div>
	</div>
</section>

</body>
</html>