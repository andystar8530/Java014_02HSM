<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
	background-color: #FFE4E1;
}
</style>
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
<title>Offcanvas template for Bootstrap</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/offcanvas/">
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<link href="offcanvas.css" rel="stylesheet">
</head>

<body class=" bgcolor">
	<jsp:include page="/fragment/topMVC.jsp" />

	<div class="nav-scroller  box-shadow bgcolor">

		<div class="container mt-5">
			<nav class="nav nav-underline">
				<a class="nav-link alert-warning rounded mr-2" href="#">我要搜尋的主題</a>
				<a class="nav-link alert-warning rounded mr-2" href="#">婚禮布置</a> 
				<a class="nav-link alert-warning rounded mr-2" href="#">婚禮攝影</a> 
				<a class="nav-link alert-warning rounded mr-2" href="#">新娘秘書</a> 
				<a class="nav-link alert-warning rounded mr-2" href="#">婚禮主持</a> 
				<a class="nav-link alert-warning rounded mr-2" href="#">小物商城</a> 
				<a  href="<c:url value='/_04_forum/post/add'/>"
					class="nav-link alert-warning rounded mr-2"> <span
					class="glyphicon-info-sigh glyphicon">發文</span>
				</a>
			</nav>
		</div>
	</div>
	<main role="main" class="container">


		<c:forEach var="post" items="${posts}">
			<div class="media text-muted pt-3">
				<div class="d-block">
					<img
						data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1"
						alt="32x32" class="mr-2 rounded"
						src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_17467e1f95f%20text%20%7B%20fill%3A%23e83e8c%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_17467e1f95f%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23e83e8c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2211.828125%22%20y%3D%2216.965625%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
						data-holder-rendered="true" style="width: 50px; height: 50px;">
					<strong class="d-block text-gray-dark p-2">可達壓</strong>
				</div>
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<a class="subtitle" href="#"> ${post.fTitle}</a>
				</p>
			</div>
		</c:forEach>
	</main>

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
</body>
</html>





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
</body>
</html>