<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<style>
.opa {
	opacity: 0.6;
}

.bgcolor {
	background-color: #EBFFEB;
}
</style>
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
<title>Offcanvas template for Bootstrap</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/offcanvas/">
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<link href="offcanvas.css" rel="stylesheet">
</head>

<body class="">
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />

	<div class="nav-scroller">

		<div class="container mt-5">
			<nav class="nav nav-underline">
				<a class="nav-link alert-warning rounded mr-2"
					href="<%=path%>/_04_forum/posts?type=1">婚禮布置</a> <a
					class="nav-link alert-warning rounded mr-2"
					href="<%=path%>/_04_forum/posts?type=2">婚禮攝影</a> <a
					class="nav-link alert-warning rounded mr-2"
					href="<%=path%>/_04_forum/posts?type=3">新娘秘書</a> <a
					class="nav-link alert-warning rounded mr-2"
					href="<%=path%>/_04_forum/posts?type=4">婚禮主持</a> <a
					class="nav-link alert-warning rounded mr-2"
					href="<%=path%>/_04_forum/posts?type=5">小物商城</a> <a
					href="<c:url value='/_04_forum/post/add'/>"
					class="nav-link alert-warning rounded mr-2"> <span
					class="glyphicon-info-sigh glyphicon">發文</span>
				</a>
				<form class="ml-auto">
					<input type="text" name="search" id="search" placeholder="關鍵字....." />
					<button onClick="window.location.href='<%=path%>/_04_forum/posts'">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</nav>
		</div>
	</div>
	<main role="main" class="container shadow">


		<c:forEach var="post" items="${posts}">
			<div class="media text-muted pt-3">
				<div class="d-block">
					<img
						data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1"
						alt="32x32" class="mr-2 rounded"
						src="${pageContext.request.contextPath}/_00_init/getMemberImage?id=${post.memberBean.m_Id}"
						data-holder-rendered="true" style="width: 50px; height: 50px;">
					<strong class="d-block text-gray-dark p-2">${post.memberBean.newlywedBean.n_nickname}</strong>
				</div>
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<a class="subtitle"
						href="<c:url value='/_04_forum/post?id='/>${post.fId}">
						${post.fTitle}</a>
				</p>
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<a class="subtitle" style="margin-right: 400px"> 觀看人數:
						${post.postView}</a>
				</p>
			</div>
		</c:forEach>
	</main>
	<div class="border d-flex text-center justify-content-center">
		<c:if test="${pageNo > 3}">
		<<a style="width: 30px; height: 30px; border: black solid 2px;"
				href="${pageContext.request.contextPath}/_04_forum/posts?pageNo=1">1</a>
			<li class="page-item mt-2"><a href=""><i
					class="fas fa-caret-left"></i><i class="fas fa-caret-left"></i><i
					class="fas fa-caret-left"></i><i class="fas fa-caret-left"></i><i
					class="fas fa-caret-left"></i></a></li>
		</c:if>
		<c:if test="${pageNo > 2}">
			<a style="width: 30px; height: 30px; border: black solid 2px;"
				href="${pageContext.request.contextPath}/_04_forum/posts?pageNo=${pageNo-2}&type=${type}">${pageNo-2}</a>
		</c:if>
		<c:if test="${pageNo > 1}">
			<a style="width: 30px; height: 30px; border: black solid 2px;"
				href="${pageContext.request.contextPath}/_04_forum/posts?pageNo=${pageNo-1}&type=${type}">${pageNo-1}</a>
		</c:if>
		<a
			style="width: 30px; height: 30px; border: black solid 2px; background-color: red"
			href="#">${pageNo}</a>
		<c:if test="${pageNo < lastPage}">
			<a style="width: 30px; height: 30px; border: black solid 2px;"
				href="${pageContext.request.contextPath}/_04_forum/posts?pageNo=${pageNo+1}&type=${type}">${pageNo+1}</a>
		</c:if>
		<c:if test="${pageNo+1 < lastPage}">
			<a style="width: 30px; height: 30px; border: black solid 2px;"
				href="${pageContext.request.contextPath}/_04_forum/posts?pageNo=${pageNo+2}&type=${type}">${pageNo+2}</a>
		</c:if>
		<c:if test="${pageNo+2 < lastPage}">
			<li class="page-item mt-2"><a href=""><i
					class="fas fa-caret-right"></i><i class="fas fa-caret-right"></i><i
					class="fas fa-caret-right"></i><i class="fas fa-caret-right"></i><i
					class="fas fa-caret-right"></i></a></li>
			<a style="width: 30px; height: 30px; border: black solid 2px;"
				href="${pageContext.request.contextPath}/_04_forum/posts?pageNo=${lastPage}&type=${type}">${lastPage}</a>
		</c:if>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="../../assets/js/vendor/popper.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/vendor/holder.min.js"></script>
	<script src="offcanvas.js"></script>


	<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
		viewBox="0 0 32 32" preserveAspectRatio="none"
		style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;">
		<defs>
		<style type="text/css"></style></defs>
		<text x="0" y="2"
			style="font-weight:bold;font-size:2pt;font-family:Arial, Helvetica, Open Sans, sans-serif">32x32</text></svg>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>

	<!-- 引入共同的頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>