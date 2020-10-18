<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>方案</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/support/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css ">
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/support/bgMain.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/support/bgMall.css">
</head>
<body>

	<!-- onLoad="setFocusToUserId()"不知道是什麼 -->
	<c:set var="funcName" value="REG" scope="session" />
	<jsp:include page="/fragment/topMVC.jsp" />
			<jsp:include page="/WEB-INF/views/support/supFragment/bgNavbar2.jsp" />
	<!-- container -->
	<div class="col-lg-9 mb-4">
				<!-- 		內容建立位置-------------- -->
				<!--	修改商品開始 -->
				<c:set var="program" value="${ProgramBean}" />
				<form:form method="POST" modelAttribute="ProgramBean"
					enctype='multipart/form-data'>
<!-- 					<input type="hidden" name="noname" id='putOrDelete' value=""> -->
					<c:if test='${ProgramBean.prm_Id != null}'>
						<form:hidden path="prm_Id" />
					</c:if>
					<fieldset>
						<div style="">
							<div style="text-align: center; vertical-align: middle;">
								<Font color="#006600" size='5' face="標楷體">修改會員權限</Font>
							</div>
						</div>
						<div style="">
							<div style="text-align: center; vertical-align: middle;">
								<div class="error">${errorSaveData}<br>
								</div>
							</div>
						</div>

						<div style="">
							<div style="width: 90px;">
								<label class="fontSize">方案ID:${program.prm_Id}</label><br>&nbsp;
							</div>
							<div style="width: 90px;">
								<label class="fontSize">合作商ID:${program.prm_Id}</label><br>&nbsp;
							</div>
						</div>

						<div style="">
							<div>
								<input type="hidden" id="prm_Status1" name="prm_Status1"
									id="prm_Status1" class="projectfile" value="${program.prm_Status}" />
								<form action="" method="post">
									<fieldset>
										<dl>
											<dt>
												<label for="title">合約狀態</label>
											</dt>
											<dd>
												<select name="prm_Status" id="prm_Status">
													<option value="未審核">未審核</option>
													<option value="同意">同意刊登</option>
													<option value="不同意">不同意刊登</option>
												</select>
											</dd>
										</dl>
									</fieldset>
								</form>
							</div>
						</div>

						<div style="">
								大頭照開始
							<div class="form-group">
								<img height='100' width='80'
									src="<c:url value='/support/bgProgramImage?id=${program.prm_Id}' />">
							</div>
								大頭照結束
						</div>

						<div style="">
							<div>
								<label class="fontSize">方案名稱：${program.prm_Title}</label><br>&nbsp;
							</div>
						</div>
						<div style="">
							<div>
								<label class="fontSize">方案類別：${program.prm_Category}</label><br>&nbsp;
							</div>
							<div>
								<label class="fontSize">方案價格：${program.prm_Price}</label><br>&nbsp;
							</div>
						</div>

						<div style="">
							<div>
								<label class="fontSize">方案內容：${program.prm_Content}</label><br>&nbsp;
							</div>
							<div>
								<label class="fontSize">方案說明：${program.prm_Detail}</label><br>&nbsp;
							</div>
						</div>
						<div style="">
							<div>
								<label class="fontSize">建立時間：${program.prm_Createdate}</label><br>&nbsp;
							</div>
							<div>
								<label class="fontSize">上次修改時間：${program.prm_Editdate}</label><br>&nbsp;
							</div>
						</div>
						<div style="">
							<div>
								<div id="btnArea" align="center">
									<input type="submit" name="updateBtn" id="submit" value="修改" />
								</div>
							</div>
						</div>
					</fieldset>
				</form:form>
				<!--  商品新增標籤開結束 -->
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

	<script>
		//	根據改變而改變單選單按鈕值
		$("#prm_Status").change(function() {
			state = $('#prm_Status option:selected').val();
			$("#prm_Status1").val(prm_Status1)
		})

		var staval = $("#prm_Status1").val(); //hidden 隱藏框的資料
		$("#prm_Status option[value = '" + staval + "']").attr("selected", true);
	</script>
</body>
</html>