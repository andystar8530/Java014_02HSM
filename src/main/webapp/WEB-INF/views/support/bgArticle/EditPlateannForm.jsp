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
	<div align="center">
		<form:form method='POST' modelAttribute="PlateannBean">
			<input type="hidden" name="noname" id='putOrDelete' value="">
			<c:if test='${plateannBean.PAId != null}'>
				<form:hidden path="PAId" />
				<br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>公版文資料</legend>
				<table> 
					<tr>
						<td align='right'>名稱<font size='-3' color='blue'>(yyyy-MM-dd)</font>：<br>&nbsp;
						</td>
						<td><form:input path="PAName" /><br>&nbsp; <form:errors
								path="PAName" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>發布日期<font size='-3' color='blue'>(yyyy-MM-dd)</font>：<br>&nbsp;
						</td>
						<td><form:input path="PADate" /><br>&nbsp; <form:errors
								path="PADate" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>修改日期<font size='-3' color='blue'>(yyyy-MM-dd
								HH:mm:ss SSS)</font>：<br>&nbsp;
						</td>
						<td><form:input path="PAEndate" /><br>&nbsp; <form:errors
								path="PAEndate" cssClass="error" /></td>
					</tr>

					<textarea>
 					
							<c:forEach var="aBean" items="${plateannService.allMembers}">
																		 
								${aBean.PAContent}
					
							</c:forEach>
						
					</textarea>

					<!-- 					<tr> -->
					<!-- 						<td align='right'>姓名：<br>&nbsp;</td> -->
					<%-- 						<td><form:input path="name" /><br>&nbsp; --%>
					<%-- 							<form:errors path="name" cssClass="error" /> --%>
					<!-- 						</td> -->
					<!-- 					</tr> -->
					<!-- 					<tr> -->
					<!-- 						<td align='right'>密碼：<br>&nbsp; -->
					<!-- 						</td> -->
					<%-- 						<td><form:input path="password" /><br>&nbsp; --%>
					<%-- 						    <form:errors path="password" cssClass="error" /> --%>
					<!-- 						</td> -->
					<!-- 					</tr> -->
					<!-- 					<tr> -->
					<!-- 						<td align='right'>確認密碼：<br>&nbsp; -->
					<!-- 						</td> -->
					<%-- 						<td><form:input path="password1" /><br>&nbsp; --%>
					<%-- 						    <form:errors path="password1" cssClass="error" /> --%>
					<!-- 						</td> -->
					<!-- 					</tr> -->
					<!-- 					<tr> -->
					<!-- 						<td align='right'>Email：<br>&nbsp; -->
					<!-- 						</td> -->
					<%-- 						<td><form:input path="email" /><br>&nbsp; --%>
					<%-- 						    <form:errors path="email" cssClass="error" /> --%>
					<!-- 						</td> -->
					<!-- 					</tr> -->
					<!-- 					<tr> -->
					<!-- 						<td align='right'>總付款金額：<br>&nbsp;</td> -->
					<%-- 						<td><form:input path="totalPayment" /><br>&nbsp; --%>
					<%-- 							<form:errors path="totalPayment" cssClass="error" /> --%>
					<!-- 						</td> -->
					<!-- 					</tr> -->
					<tr>
						<td colspan='2' align='center'><input type='submit'
							value='修改' name='updateBtn'
							onclick="return confirmUpdate('${plateannBean.PAId}');">&nbsp;
							<input type='submit' value='刪除' name='deleteBtn'
							onclick="return confirmDelete('${plateannBean.PAId}');">
						</td>
					</tr>

				</table>
			</fieldset>
		</form:form>
		<a href="<c:url value='/_01_Plateann/index' />">回首頁</a>
	</div>
</body>
</html>