<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員</title>
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

	<jsp:include page="/fragment/topMVC.jsp" />
			<jsp:include page="/WEB-INF/views/support/supFragment/bgNavbar2.jsp" />
	
	<div class="col-lg-9 mb-4">
					<!-- 		內容建立位置-------------- -->
				<!--	修改商品開始 -->
				<c:set var="member" value="${MemberBean}" />
				<form:form method="POST" modelAttribute="MemberBean"
					enctype='multipart/form-data'>
					<c:if test='${MemberBean.m_No != null}'>
						<form:hidden path="m_No" />
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
								<label class="fontSize">編號:${member.m_No}</label><br>&nbsp;
							</div>
						</div>

						<div style="">
							<div>
								<input type="hidden" id="m_Status1" name="m_Status1"
									id="m_Status1" class="projectfile" value="${member.m_Status}" />
								<form action="" method="post">
									<fieldset>
										<dl>
											<dt>
												<label for="title">狀態</label>
											</dt>
											<dd>
												<select name="m_Status" id="m_Status">
													<option value="0">正常登入</option>
													<option value="1">禁止登入</option>
												</select>
											</dd>
										</dl>
									</fieldset>
								</form>
							</div>
						</div>

						<div style="">
							<!--	大頭照開始 -->
							<div class="form-group">
								<img height='100' width='80'
									src="<c:url value='/support/getBgMemberImage?id=${member.m_No}' />">
							</div>
							<!--	大頭照結束 -->
						</div>

						<div style="">
							<div>
								<label class="fontSize">身分別：${member.m_Code}</label><br>&nbsp;
							</div>
						</div>
						<div style="">
							<div>
								<label class="fontSize">帳號：${member.m_Id}</label><br>&nbsp;
							</div>
							<div>
								<label class="fontSize">姓名：${member.m_Name}</label><br>&nbsp;
							</div>
						</div>

						<div style="">
							<div>
								<label class="fontSize">手機：${member.m_Phone}</label><br>&nbsp;
							</div>
							<div>
								<label class="fontSize">身分證：${member.m_Socialnum}</label><br>&nbsp;
							</div>
						</div>
						<div style="">
							<div>
								<label class="fontSize">地址：${member.m_Add}</label><br>&nbsp;
							</div>
<!-- 							<div> -->
<%-- 								<label class="fontSize">身分證：${member.m_Socialnum}</label><br>&nbsp; --%>
<!-- 							</div> -->
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

<%-- 	<jsp:include page="/WEB-INF/views/support/supFragment/bgFooter.jsp" /> --%>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

	<script>
		//	根據改變而改變單選單按鈕值
		$("#m_Status").change(function() {
			state = $('#m_Status option:selected').val();
			$("#m_Status1").val(m_Status1)
		})

		var staval = $("#m_Status1").val(); //hidden 隱藏框的資料
		$("#m_Status option[value = '" + staval + "']").attr("selected", true);
	</script>
</body>
</html>