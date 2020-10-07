<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
.bg-secondary {
	height: 50rem;
}

.title {
	font-size: 75px;
	text-align: center;
}

#content {
	height: 200px;
}

.opa {
	opacity: 0.8;
}

.cen {
	margin-left: 95%;
}

.form-control {
	width: 100%
}
</style>
</head>
<body>
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/topMVC.jsp" />
	<div class="bg-secondary container rounded-lg">
		<div class="row">
			<p class="title col-12">發表文章</p>
			<form:form method='POST' modelAttribute="forumBean"
				class='form-horizontal' enctype="multipart/form-data">
				<div class="form-group text-light col-12">
					<div>
						<label for="exampleFormControlSelect1 " style="font-size: 55px;">發文類別</label>
					</div>
					<div class="form-control" id="exampleFormControlSelect1">
					<form:input style="display:none" path="fId"/>
						<form:select path="fCategory">
							<form:option value="-1" label="請挑選" />
							<form:options items="${categoryList}" />
						</form:select>
					</div>
						<form:errors path="fCategory" style="color:red" />

					<p style="font-size: 55px";>文章標題</p>
					<div>
						<form:input path="fTitle" type='text' class="form-control"
							placeholder="您的文章標題" />
						<form:errors path="fTitle" style="color:red" />
					</div>

					<p style="font-size: 55px";>文章內文</p>
					<div style="width: 1100px">
						<form:textarea path="fText" type='text' class="form-control"
							style="height:220px" />
						<form:errors path="fText" style="color:red" />
					</div>

					<div class="col-6">
						
						<div class=" ">
							<input class="btn btn-info cen" type="Submit" value="送出">
						</div>
					</div>

				</div>
			</form:form>
		</div>
	</div>






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