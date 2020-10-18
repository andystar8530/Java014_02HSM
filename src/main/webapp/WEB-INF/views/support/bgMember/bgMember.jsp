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

	<!-- onLoad="setFocusToUserId()"不知道是什麼 -->
	<%-- 	<c:set var="funcName" value="REG" scope="session" /> --%>
	<jsp:include page="/fragment/topMVC.jsp" />
			<jsp:include page="/WEB-INF/views/support/supFragment/bgNavbar2.jsp" />
	<div class="col-lg-9 mb-4">
				<!--	內容建立位置-------------- -->
				<c:forEach var='member' items="${supMember_DPP}">
					<!--	外層div給予連結到商品編輯,裡面的style經過會有點擊符號 -->
					<div
						onclick="location.href='<c:url value="/support/bgMemberUpdate/${member.value.m_No}"/>';"
						class="bgMainGalleryDivIn container my-2 d-flex flex-row  justify-content-around "
						style="cursor: pointer;">
						
						<div
							class="bgMainGalleryDivIn1 border border-primary d-flex flex-column align-items-center align-self-center justify-content-center">
							<!--	編號 -->
							<div class="bgMainGalleryDivIn1-1">
								編號:${member.value.m_No} <input id='m_No' type="hidden"
									name='m_No' value="${supMember.value.m_No}">
							</div>
							<!--	身分別 -->
							<div class="bgMainGalleryDivIn1-2">身分別:${member.value.m_Code}</div>
						</div>
						<div
							class="bgMainGalleryDivIn2 border border-primary d-flex align-items-center row">
							<!--	會員頭貼 -->
							<img height='100' width='80'
								src="<c:url value='/support/getBgMemberImage?id=${member.value.m_No}' />">
						</div>
						<div
							class="bgMainGalleryDivIn3 border border-primary border-left-0 d-flex flex-column align-items-center row">
							<!--	帳號 -->
							<div>帳號:${member.value.m_Id}</div>
							<!--	名稱,電話,狀態 -->
							<div>名稱:${member.value.m_Name}</div>
							<div>電話:${member.value.m_Phone}</div>
							<div>狀態:${member.value.m_Status}</div>
						</div>
						<div
							class="bgMainGalleryDivIn4 border border-primary border-left-0  d-flex flex-column align-items-center row">
							<!--	創建日期 -->
							<div>建立時間：<fmt:formatDate value='${member.value.m_CreateTime}' type='date'/></div>
							<!--	最後修改日期 -->
							<div>上次修改時間：<fmt:formatDate value='${member.value.m_EditTime}' type='date'/></div>
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
						tabindex="-1" aria-disabled="true">第${MemberpageNo}頁</a></li>
					<c:if test="${MemberpageNo >= 1}">
						<c:forEach var="x" begin="1" end="${MembertotalPages}">
							<c:if
								test="${x>=MemberpageNo-2 && x<=5 || x<=MemberpageNo+2 && x>MembertotalPages-5}">
								<li class="page-item  page-item-weight"><a
									class="page-link"
									href="<c:url value='/support/bgMall?MemberpageNo=${x}' />">${x}</a></li>
							</c:if>
						</c:forEach>
					</c:if>
					<li class="page-item disabled"><a class="page-link"
						tabindex="-1" aria-disabled="true"> 共${MembertotalPages}頁</a></li>
				</ul>
			</nav>

		</div>
	</div>
	<!-- 	尾端選擇按鈕結束 -->
<%-- 	<jsp:include page="/WEB-INF/views/support/supFragment/bgFooter.jsp" /> --%>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/support/bgMall.js"></script>
	<script>
		$('.bgMainGalleryDivIn5').click(function(event) {
			// 	window.location.href='/Java014_02HSM/support/bgMallDelete/'+p_id;
			//	連結無法使用是因為id是動態增加的,但可以在這裡阻止冒泡事件
			event.stopPropagation();
		});
	</script>

</body>
</html>