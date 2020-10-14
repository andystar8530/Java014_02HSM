<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
	function confirmDelete(id) {
		var result = confirm("確定刪除此筆記錄(帳號:" + id.trim() + ")?");
		if (result) {
			document.forms[0].putOrDelete.name = "_method";
			document.forms[0].putOrDelete.value = "DELETE";
			return true;
		}
		return false;
	}
	function confirmUpdate(id) {
		var result = confirm("確定送出此筆記錄(帳號:" + id.trim() + ")?");
		if (result) {
			// 		  document.forms[0].putOrDelete.name = "_method";
			// 		  document.forms[0].putOrDelete.value = "PUT";
			return true;
		}
		return false;
	}
</script>

</head>
<body>
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/topMVC.jsp" />
	<div align="center">
		<form:form method='POST' modelAttribute="plateannouncementBean">
			<input type="hidden" name="noname" id='putOrDelete' value="">
			<c:if test='${plateannouncementBean.paId != null}'>
				<form:hidden path="paId" />
				<br>&nbsp;
			</c:if>
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
						<td align='right'>發布日期<font size='-3' color='blue'>(yyyy-MM-dd)</font>：<br>&nbsp;
						</td>
						<td><form:input path="paDate" /><br>&nbsp; <form:errors
								path="paDate" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>修改日期<font size='-3' color='blue'>(yyyy-MM-dd)</font>：<br>&nbsp;
						</td>
						<td><form:input path="paEnDate" /><br>&nbsp; <form:errors
								path="paEnDate" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>內容：<br>&nbsp;
						</td>
						<td><form:textarea path="paContent"
								style="width: 500px; height:500px;" /> <form:errors
								path="paContent" cssClass="error" /></td>
					</tr>
<!-- 					<textarea> -->
<%-- 							<c:forEach var="aBean" items="${plateannService.allMembers}">								  --%>
<%-- 								${aBean.PAContent} --%>
<%-- 							</c:forEach> --%>
<!-- 					</textarea> -->
					<tr>
						<td colspan='2' align='center'><input type='submit'
							value='修改' name='updateBtn'
							onclick="return confirmUpdate('${plateannouncementBean.paId}');">&nbsp;
							<input type='submit' value='刪除' name='deleteBtn'
							onclick="return confirmDelete('${plateannouncementBean.paId}');">
						</td>
					</tr>

				</table>
			</fieldset>
		</form:form>
		<a href="<c:url value='/support/bgArticle/index2' />">回首頁</a>
	</div>
</body>
</html>