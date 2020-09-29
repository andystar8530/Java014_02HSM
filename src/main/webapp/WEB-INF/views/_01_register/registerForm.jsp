<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>加入會員</title>
<style type="text/css">
.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}
</style>
<script type="text/javascript">
	//由<body>的onLoad事件處理函數觸發此函數
	function setFocusToUserId() {
		document.forms[0].mid.focus(); // 將游標放在mid欄位內
	}
</script>
</head>
<body onLoad="setFocusToUserId()" style="background: #EBFFEB;">
	<c:set var="funcName" value="REG" scope="session" />
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />

	<!-- 新表格 -->

	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">會員註冊</h3>
								</div>
								<div class="card-body">
									<form:form method="POST" modelAttribute="memberBean"
										enctype='multipart/form-data'>
										<div class="form-group">
											<label for="inputEmailAddress">Email 帳號</label>
											<form:input path='m_Id' class="form-control py-4"
												placeholder="Enter email address" />
											<form:errors path="m_Id" cssClass="error" />
										</div>
										<div class="form-group">
											<label for="inputPassword">密碼</label>
											<form:input path='m_Password' type="password"
												class="form-control py-4" placeholder="請輸入密碼" />
											<form:errors path="m_Password" cssClass="error" />
										</div>
										<div class="form-group">
											<label for="inputPassword">確認密碼</label>
											<form:input path='m_Password1' type="password"
												class="form-control py-4" placeholder="請輸入密碼" />
											<form:errors path="m_Password1" cssClass="error" />
										</div>
										<div class="form-check">
											<form:radiobutton path="m_Code" value="0" label="新人"
												class="form-check-input" />
											<br>
											<form:radiobutton path="m_Code" value="1" label="合作商"
												class="form-check-input" />
											<form:errors path="m_Code" cssClass="error" />
										</div>

										<div
											class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
											<input class="btn btn-primary" type="submit" value="送出" />
										</div>
									</form:form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<span><font color='red' size="-1">${ErrorMsgKey.MustCheckIden}</font></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>