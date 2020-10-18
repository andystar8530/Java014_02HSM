<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台</title>
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
	<%-- 	<c:set var="funcName" value="REG" scope="session" /> --%>
	<jsp:include page="/fragment/topMVC.jsp" />
			<jsp:include page="/WEB-INF/views/support/supFragment/bgNavbar2.jsp" />
	
	<div class="col-lg-9 mb-4">
				<!-- 		方案內容建立位置-------------- -->
				<c:forEach var='supProgram' items="${supProgram_DPP}">
					<!--	外層div給予連結到商品編輯,裡面的style經過會有點擊符號 -->
					<div
						onclick="location.href='<c:url value="/support/bgMainUpdate/${supProgram.value.prm_Id}"/>';"
						class="bgMainGalleryDivIn container my-2 d-flex flex-row  justify-content-around "
						style="cursor: pointer;">

						<div
							class="bgMainGalleryDivIn1 border border-primary d-flex flex-column align-items-center align-self-center justify-content-center">
								編號
							<div class="bgMainGalleryDivIn1-1">
								方案ID:${supProgram.value.prm_Id} <input id='prm_Id' type="hidden"
									name='prm_Id' value="${supProgram.value.prm_Id}">
							</div>
<!-- 								身分別 -->
							<div class="bgMainGalleryDivIn1-2">合作商ID:${supProgram.value.prm_Pid}</div>
						</div>
						<div
							class="bgMainGalleryDivIn2 border border-primary d-flex align-items-center row">
<!-- 								會員頭貼 -->
							<img height='100' width='80'
								src="<c:url value='/support/bgProgramImage?id=${supProgram.value.prm_Id}' />">
						</div>
						<div
							class="bgMainGalleryDivIn3 border border-primary border-left-0 d-flex flex-column align-items-center row">
<!-- 								帳號 -->
							<div>名稱:${supProgram.value.prm_Title}</div>
<!-- 								名稱,電話,狀態 -->
							<div>類別:${supProgram.value.prm_Category}</div>
							<div>價格:${supProgram.value.prm_Price}</div>
							<div>內容:${supProgram.value.prm_Content}</div>
						</div>
						<div
							class="bgMainGalleryDivIn4 border border-primary border-left-0  d-flex flex-column align-items-center row">
							<div>狀態:${supProgram.value.prm_Status}</div>
						</div>
						<div
							class="bgMainGalleryDivIn5 border border-primary border-left-0  d-flex flex-column align-items-center row">
<!-- 								創建日期 -->
							<div><fmt:formatDate value='${supProgram.value.prm_Createdate}' type='date'/></div>
<!-- 								最後修改日期 -->
							<div><fmt:formatDate value='${supProgram.value.prm_Editdate}' type='date'/></div>
						</div>
					</div>
				</c:forEach>
				<!-- 		內容結束---------------- -->
			</div>
		</div>
		<!-- 	尾端選擇按鈕 -->
		<div class="bgEndNav mt-auto p-2 bd-highlight">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center mb-0">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">第${ProgrampageNo}頁</a></li>
					<c:if test="${ProgrampageNo >= 1}">
						<c:forEach var="x" begin="1" end="${ProgramtotalPages}">
							<c:if
								test="${x>=ProgrampageNo-2 && x<=5 || x<=ProgrampageNo+2 && x>ProgramtotalPages-5}">
								<li class="page-item  page-item-weight"><a
									class="page-link"
									href="<c:url value='/support/bgMall?ProgrampageNo=${x}' />">${x}</a></li>
							</c:if>
						</c:forEach>
					</c:if>
					<li class="page-item disabled"><a class="page-link"
						tabindex="-1" aria-disabled="true"> 共${ProgramtotalPages}頁</a></li>
				</ul>
			</nav>

		</div>
	</div>

<%-- 	<jsp:include page="/WEB-INF/views/support/supFragment/bgFooter.jsp" /> --%>
	<script src="${pageContext.request.contextPath}/data/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/data/js/bootstrap.bundle.min.js"></script>
</body>
</html>