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
<title>商城</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css ">

<style>
list-group-item>img {
	width: 20px;
}

#content {
	width: 820px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
	<div class="m-5">
		<!-- 引入共同的頁首 -->
		<jsp:include page="/fragment/topMVC.jsp" />


		<section>
			<div class="container-fluid" class="m-2">
				<div class="row ">
					<h1 class="mt-4 mb-3 ml-3">
						後台 <small>商城管理</small>
					</h1>
				</div>
				<ol class="breadcrumb g-0">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}">首頁</a></li>
					<li class="breadcrumb-item active">後台管理</li>
				</ol>

				<div class="row  d-flex" style="height: 700px">
					<div class="mx-3 my-3 col-2" style="height: 600px">
						<div class="">
							<div class="list-group">
								<div class="list-group-item href="#" >
									<img
										src="${pageContext.request.contextPath}/_00_init/getMemberImage?id=${LoginOK.m_Id}"
										width="80" style="border-radius: 50%;" id="partner-icon">
								</div>

								<a class="list-group-item"
									href="<c:url value='/support/bgMember'/>"><img
									src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/007-house.png"
									style='width: 20px;'>方案/作品</a> <a class="list-group-item"
									href="<c:url value='/support/bgMember'/>"> <img
									src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/015-picture.png"
									style='width: 20px;'>會員/文章
								</a> <a class="list-group-item"
									href="<c:url value='/support/bgMall'/>"><img
									src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/034-marriage certification.png"
									style='width: 20px;'>商城商品</a> <a class="list-group-item"
									href="<c:url value='/support/bgArticle/index2'/>"><img
									src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/025-calendar.png"
									style='width: 20px;'>公告管理</a>


							</div>
						</div>
					</div>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 				</section> -->
<!-- 			</div> -->
			<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
			<script
				src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
