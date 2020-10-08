<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align='center'>
		<h3>公版文資料</h3>
		<hr>
		<table border='1'>
			<tr>
				<th width='60'>編輯</th>
				<th width='160'>公版文分類</th>
				<th width='200'>公版文名稱</th>
			</tr>
			<c:choose>
				<c:when test="${not empty plateannouncementBeanList}">
					<c:forEach var='plateann' items="${plateannouncementBeanList}">
						<tr>
							<td align='center'><a
								href='modifyPlateannouncement/${plateann.paId}'>${plateann.paId}</a></td>
							<td>${plateann.paCode}</td>
							<td>${plateann.paName}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				查無Plateannouncement資料
			</c:otherwise>
			</c:choose>
		</table>
		<br> <a href="<c:url value='/support/bgMall' />">回首頁</a>
	</div>
</body>
</html>