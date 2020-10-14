<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
<meta charset="UTF-8">
<c:if test="${LoginOK.m_Code == 2}">
<title>公告管理</title>
</c:if>
<c:if test="${LoginOK.m_Code != 2}">
<title>公告資料</title>
</c:if>
</head>
<body>
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/topMVC.jsp" />
				<c:if test="${LoginOK.m_Code == 2}">
					<jsp:include page="/WEB-INF/views/support/supFragment/bgNavbar2.jsp" />
	<div class="col-lg-9 mb-4">
				</c:if>
<c:if test="${LoginOK.m_Code != 2}">
	<div class="ml-5 mr-5">
				</c:if>
	<div>
		<h2>公告資料</h2>
		<c:if test="${LoginOK.m_Code == 2}">
		<a href="<c:url value='/support/bgArticle' />" class="btn btn-outline-primary">新增公告</a>
		</c:if>
		</div>
		<hr>
					<c:choose>
				<c:when test="${not empty plateannouncementBeanList}">
					<c:forEach var='plateann' items="${plateannouncementBeanList}">
		<table border='1' class="table">
			<tr class="thead-dark">
				<th width='60' scope="col">
				<c:if test="${LoginOK.m_Code == 2}">
				編輯
				</c:if>
				<c:if test="${LoginOK.m_Code != 2}">
				編號
				</c:if>
				</th>
				<th width='160' scope="col">公版文分類</th>
				<th width='200' scope="col">公版文名稱</th>
			</tr>

						<tr>
							<td scope="row">
							<c:if test="${LoginOK.m_Code == 2}">
							<a href='modifyPlateannouncement/${plateann.paId}'>${plateann.paId}</a>
							</c:if>
							<c:if test="${LoginOK.m_Code != 2}">
							<a>${plateann.paId}</a>
							</c:if>
							</td>
							<td>${plateann.paCode}</td>
							<td>${plateann.paName}</td>
						</tr>
						<tr class="thead-dark">
						<th colspan="3" scope="col" >公告內容</th>
						</tr>
						<tr>
						<td colspan="3">
						${plateann.paContent}
						</td>
						</tr>
		</table>
					</c:forEach>
				</c:when>
				<c:otherwise>
				查無Plateannouncement資料
			</c:otherwise>
			</c:choose>
		<br> 
		<c:if test="${LoginOK.m_Code != 2}">
		<a href="<c:url value='/' />">回首頁</a>
		</c:if>
<!-- 	</div> -->
<!-- 	</section> -->
<!-- 	</div> -->
</body>
</html>