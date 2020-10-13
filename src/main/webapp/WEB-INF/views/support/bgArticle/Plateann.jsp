<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

.fieldset-auto-width {
	display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />

	<div align="center">						 
		<form:form method='POST' modelAttribute="PlateannouncementBean">
			<c:set var="PlateannouncementBean" />
			<fieldset class="fieldset-auto-width">
				<legend>公版文資料</legend>
				<table>
					<tr>
						<td align='right'>分類：<br>&nbsp;
						</td>
						<td><form:input path="paCode" /><br>&nbsp; <form:errors
								path="paCode" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>名稱：<br>&nbsp;
						</td>
						<td><form:input path="paName" /><br>&nbsp; <form:errors
								path="paName" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>內容：<br>&nbsp;
						</td>
						<td><form:textarea path="paContent"
								style="width: 500px; height:500px;" /> <form:errors
								path="paContent" cssClass="error" /></td>
					</tr>

					<tr>
						<td colspan='2' align='center'><input type='submit'
							value='提交'></td>
					</tr>
				</table>
			</fieldset>
		</form:form>
		<br> <a href="<c:url value='/support/bgMall' />">回首頁</a>
	</div>
</body>
</html>