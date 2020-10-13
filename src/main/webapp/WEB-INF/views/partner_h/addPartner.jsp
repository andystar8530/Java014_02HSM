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
	color:#293241;
	font-weight: bold;
}

.bg-pink{
	opacity:0.9;
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
    border: 2px solid rgb(223, 218, 209);
	border-radius: 7px;
	position: relative;
}

textarea.input {
    padding: 0.8rem 1.2rem;
    border-radius: 22px;
    resize: none;
    overflow-y: auto;
}
.input-group label {
    position: absolute;
    top: 50%;
    left: 15px;
    transform: translateY(-50%);
    padding: 0 0.4rem;
    color: #808aa0;
    font-size: 0.9rem;
    font-weight: 400;
    pointer-events: none;
    z-index: 1000;
    transition: 0.5s;
}
.input-group.textarea label {
    top: 0.9rem;
    transform: translateY(0);
}
.input-group span {
    position: absolute;
    top: 0;
    left: 13px;
    transform: translateY(-50%);
    font-size: 0.9rem;
    padding: 0 0.4rem;
    color: transparent;
    pointer-events: none;
    z-index: 500;
    font-family: "cwTeXYen", sans-serif;
}

.input-group span:before,
.input-group span:after:not(.errors){
    content: "";
    position: absolute;
    width: 10%;
    opacity: 0;
    transition: 0.3s;
	height: 5px;
	background: none;
    /* background-color: #f7f9ff; */
    top: 50%;
    transform: translateY(-50%);
}

.input-group span:before {
    left: 50%;
}

.input-group span:after {
	right: 50%;
}

.input-group.focus label {
    top: 0;
    transform: translateY(-50%);
    left: 13px;
    font-size: 0.9rem;
    color: #808aa0;
    font-family: "cwTeXYen", sans-serif;
}

.input-group.focus span:before,
.input-group.focus span:after {
    width: 50%;
    opacity: 1;
}

.input-group:hover {
    border-radius: 7px;
    border: none;
}
.mywrap{
	background-color: rgba(242,171,150,0.2);
	box-shadow: 12px 12px 7px rgba(0, 0, 8, 0.5);
	
}
.errors{
	color:#fe5f55 !important;
	font-weight: bold;
	position: absolute;
	
}
h2 {
	font-size: larger;
}
</style>
</head>
<body>
<!-- include navbar -->
<jsp:include page="/fragment/topMVC.jsp" />
<section>
	<div class="container d-flex justify-content-center">
			<div class="row justify-content-center my-5 mywrap" >
				<div class="col-12 text-center p-2">
					<h2 style="color: #49505e;">商家基本資料填寫</h2>
				</div>
				<form:form  method='POST' modelAttribute='partnerBean' enctype='multipart/form-data'
				class='d-flex'>
				
					<!-- 左div -->
					<div class="w-50 mr-2">
						<div class='col-12 mt-3 input-group'>
							<form:input type="text"  id="p_storeName" path='p_storeName'
							class='inputClass' />
							<form:errors  path="p_storeName" class='errors' /> 
							<label for="storeName" class=''>店家名稱</label>
							<span>店家名稱</span>
						</div> 			
						<div class='col-12 my-5  input-group'>
							<form:select path="p_service" class="inputClass">
								<form:option value="-1" label="" />
								<form:option value="婚禮攝影"  label="婚禮攝影" />
								<form:option value="婚禮佈置"  label="婚禮佈置" />
								<form:option value="新娘秘書"  label="新娘秘書" />
								<form:option value="婚禮主持"  label="婚禮主持" />	
							</form:select>	
							<form:errors  path="p_service" class='errors'/>			
							<label for="storeName">主要服務項目</label>
							<span class='p-2'>主要服務項目</span>
						</div>
									
						<div class='col-12 my-5  input-group'>
							<form:select path="p_area" class="inputClass">
								<form:option value="-1" label="" />
								<form:option value="1" label="北部" />
								<form:option value="2" label="中部" />
								<form:option value="3" label="南部" />
								<form:option value="4" label="東部" />
								<form:option value="5" label="離島" />
							</form:select>
							<form:errors  path="p_area" class='errors'/>
							<label for="p_area">服務區域</label>	
							<span class='p-2'>服務區域</span>
						</div>
						
						<div class='col-12 mb-5  input-group'>
							<form:input type="text"  id="p_bankAcc" path='p_bankAcc'
								class='form:input-large inputClass' />
							<form:errors  path="p_bankAcc" class='errors'/>	
							<label for="bankAcc">銀行帳號</label>	
							<span class='p-2'>銀行帳號</span>
						</div>
						
							<div class='col-12 mb-5  input-group'>
								<form:input type="text"  id="p_lineId" path='p_lineId'
								class='form:input-large inputClass' />
								<form:errors  path="p_lineId" class='errors'/>
								<label for="lineId">LineID</label>							
								<span class='p-2'>LineID</span>
							</div>	
						
					</div>		
				
					<!-- 右div -->
					<div class="w-50">
						<div class="col-12  my-3 input-group">
							<form:textarea   id="p_info" path='p_info'
							class='form:input-large inputClass' rows="5" cols="30" />
							<form:errors  path="p_info" class='errors' />
							<label for="p_info">店家簡介</label>
							<span class='p-2'>店家簡介</span>
						</div>
					
					
						<label for="coverPic" style="color: #555c6b;">上傳封面圖</label>
						<div class='col-12 my-3 input-group'>
							<form:input type="file"  id="covImage" path='covImage'
								class='form:input-large ' />
							<form:errors  path="covImage" class='errors'/>												
						</div>										
						<label for="stamp" style="color: #555c6b;">上傳公司大小章</label>
						<div class='col-12 my-3 input-group'>
							<form:input type="file"  id="staImage" path='staImage'
							class='form:input-large ' />
							<form:errors  path="staImage" class='errors'/>	
						</div>
						<div class='col-12 my-5 input-group'>
							<form:input type="text"  id="p_hRate" path='p_hRate'
							class='form:input-large inputClass' />
							<form:errors  path="p_hRate" class='errors'/>
							<label for="hRate">預估時薪</label>
							<span class='p-2'>預估時薪</span>
						</div>			
						<!-- 按鈕 -->								
						<div class='col-12 my-5 d-flex justify-content-end'>
						<input type="submit"  id="submit" path='submit'
						class='form:input-large btn btn-outline-danger justify-content-end' value='送出' />
						</div>				
					</div>		

				</form:form>	
				
			</div>	
		</div>
	</div>
</section>
<script>
	/*-- 文字浮動 Start --------------------------->*/
const inputs = document.querySelectorAll(".inputClass");

function focusFunc() {
  let parent = this.parentNode;
  parent.classList.add("focus");
}

function blurFunc() {
  let parent = this.parentNode;
  if (this.value == "") {
    parent.classList.remove("focus");
  }
}

inputs.forEach((input) => {
  input.addEventListener("focus", focusFunc);
  input.addEventListener("blur", blurFunc);
});

/*-- 文字浮動 End------------------------------>*/
</script>
	<!-- ---------------------------分隔線---------------------------------------			 -->

	<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>