<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商城</title>
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
	<c:set var="funcName" value="REG" scope="session" />
	<jsp:include page="/fragment/topMVC.jsp" />
	<h1 class="mt-4 mb-3">
		後台 <small>商城管理</small>
	</h1>
	<!-- container -->
	<div class="bgMallAllDiv container ">
		<!-- 	asasaas -->
		<!-- 	選擇紐 -->
		<div class="bgMallNavDiv d-flex justify-content-end ">
			<div class=" bd-highlight ">
				<div class="bgMallSearchNavDiv nav ">
					<div class="SearchDiv1 nav-item text-center border border-primary">
						<a class="nav-link " href="#">Active</a>
					</div>
					<div
						class="SearchDiv2 nav-item text-center border border-primary border-left-0">
						<a class="nav-link " href="#">篩選</a>
					</div>
					<div
						class="SearchDiv3 nav-item text-center border border-primary border-left-0">
						<a class="nav-link " href="#">新增</a>
					</div>
					<div
						class="SearchDiv4 nav-item text-center border border-primary border-left-0">
						<a class="nav-link " href="<c:url value='/support/bgMallAdd' />">新增</a>
					</div>
				</div>
			</div>
			<div class="SearchDiv5 bd-highlight">
				<form class="form-inline my-2 my-lg-0 ">
					<input class="form-control mr-sm-2" type="search"
						placeholder="品名/種類/金額" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</div>
		<!-- 	選擇紐結束 -->
		<!-- 		<hr> -->
		<!-- 引入共同的頁首 -->
		<div class="bgMainDiv container ">
			<jsp:include page="/WEB-INF/views/support/supFragment/bgNavbar.jsp" />
			<div class="bgMainGalleryDiv row ">
				<!-- 		內容建立位置-------------- -->
				<!--	修改商品開始 -->
				<!-- 				把ProductBean用set傳過來,才可以顯示圖片 -->
				<c:set var="product" value="${ProductBean}" />
				<form:form method="POST" modelAttribute="ProductBean"
					enctype='multipart/form-data'>
					<input type="hidden" name="noname" id='putOrDelete' value="">
					<c:if test='${ProductBean.p_Id != null}'>
						<form:hidden path="p_Id" />
					</c:if>


					<Table
						style="width: 900px; background-color: #E7CDFF; cellspacing: 0; border: 2px solid black;">
						<tr height="36">

							<td colspan='4'
								style="text-align: center; vertical-align: middle;"><Font
								color="#006600" size='5' face="標楷體">修改商品</Font></td>
						</tr>
						<tr height="16">
							<td colspan='4'
								style="text-align: center; vertical-align: middle;">
								<div class="error">${errorSaveData}<br>
								</div>
							</td>
						</tr>

						<tr height="52">
							<td style="width: 90px;"><label class="fontSize">種類名稱：</label><br>&nbsp;</td>
							<td style="width: 290px;"><form:input path='p_Category'
									class="fieldWidth" style="width: 200px;" /><br>&nbsp; <form:errors
									path="p_Category" cssClass="error" /></td>
						</tr>

						<tr height="52">
							<td><label class="fontSize">商品名稱：</label><br>&nbsp;</td>
							<td style="width: 290px;"><form:input path='p_Name'
									class="fieldWidth" style="width: 200px;" /><br>&nbsp; <form:errors
									path="p_Name" cssClass="error" /></td>

						</tr>

						<tr height="52">
							<!--	預覽圖開始 -->
<!-- 							<td><label for="exampleFormControlFile1">封面圖：</label><br> -->
<%-- 								<small><Font color='red' size="-3">${MsgMap.errorPicture} --%>
<!-- 								</Font></small></td> -->

<!-- 							<td><label for="image"> <input type="file"  -->
<!-- 								name="p_Cover1" id="p_Cover1" style="display: none"  -->
<!-- 								accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" -->
<!-- 								value="<img src='<c:url value="/support/p_Cover?id=${product.p_Id}" />'"/> -->
<!-- 									<img height='100' width='80' -->
<%-- 									src='<c:url value='/support/p_Cover?id=${product.p_Id}' />' --%>
<!-- 									id="p_Cover1_show_image" style="max-width: 300px" -->
<!-- 									name="image_1" />  -->
<!-- 							</label></td> -->
<!-- 							----------------- -->
							<td><label for="exampleFormControlFile1">預覽圖片1：</label><br>
								<small><Font color='red' size="-3">${MsgMap.errorPicture}
								</Font></small></td>

							<td><label for="image"> <input type="file"
									name="p_Cover1" id="p_Cover1" style="display: none" />
									<img height='100' width='80'
									src='<c:url value='/support/p_Cover?id=${product.p_Id}' />'
									id="p_Cover1_show_image" style="max-width: 300px"
									name="image_1" />
							</label></td>
<!-- 							-------------------- -->
							<!--	預覽圖結束 -->
						</tr>

						<tr height="52">
							<td><label class="fontSize">進貨數量：</label><br>&nbsp;</td>
							<td><form:input path='p_Pdqty' class="fieldWidth"
									style="width: 200px;" /><br>&nbsp; <form:errors
									path="p_Pdqty" cssClass="error" /></td>

							<td><label class="fontSize">進貨金額：</label><br>&nbsp;</td>
							<td><form:input path='p_Pdsum' class="fieldWidth"
									style="width: 200px;" /><br>&nbsp; <form:errors
									path="p_Pdsum" cssClass="error" /></td>
						</tr>

						<tr height="52">
							<td><label class="fontSize">現有庫存：</label><br>&nbsp;</td>
							<td><form:input path='p_Stock' class="fieldWidth"
									style="width: 200px;" /><br>&nbsp; <form:errors
									path="p_Stock" cssClass="error" /></td>

							<td><label class="fontSize">銷售數量：</label><br>&nbsp;</td>
							<td><form:input path='p_Sdqty' class="fieldWidth"
									style="width: 200px;" /><br>&nbsp; <form:errors
									path="p_Sdqty" cssClass="error" /></td>
						</tr>

						<tr height="52">
							<td><label class="fontSize">出售單價：</label><br>&nbsp;</td>
							<td><form:input path='p_Price' class="fieldWidth"
									style="width: 200px;" /><br>&nbsp; <form:errors
									path="p_Price" cssClass="error" /></td>

						</tr>
						<tr height="52">

							<!--	圖片1開始 -->
							<td><label for="exampleFormControlFile1">圖片1：</label><br>
								<small><Font color='red' size="-3">${MsgMap.errorPicture}
								</Font></small></td>

							<td><label for="image"> <input type="file"
									name="ProductImage1" id="ProductImage1" style="display: none" />
									<img height='100' width='80'
									src='<c:url value='/support/p_FileName1?id=${product.p_Id}' />'
									id="ProductImage1_show_image" style="max-width: 300px"
									name="image_2" />
							</label></td>
							
						
							<!--	圖片1結束 -->

							<!-- <td><label class="fontSize">圖片1：</label><br>&nbsp;</td> -->
							<%-- <td><form:input path="ProductImage1" type='file' /><br>&nbsp; --%>
							<%-- <form:errors path="ProductImage1" cssClass="error" /></td> --%>

						</tr>

						<tr height="52">
							<!--	圖片2開始 -->
							<td><label for="exampleFormControlFile1">圖片2：</label><br>
								<small><Font color='red' size="-3">${MsgMap.errorPicture}
								</Font></small></td>

							<td><label for="image"> <input type="file"
									name="ProductImage2" id="ProductImage2" style="display: none" />
									<img height='100' width='80'
									src='<c:url value='/support/p_FileName2?id=${product.p_Id}' />'
									id="ProductImage2_show_image" style="max-width: 300px"
									name="image_3" />
							</label></td>
							<!--	圖片2結束 -->
						</tr>

						<!--<td><label class="fontSize">圖片2：</label><br>&nbsp;</td> -->
						<%--<td><form:input path="ProductImage2" type='file' /><br>&nbsp; --%>
						<%--<form:errors path="ProductImage2" cssClass="error" /></td> --%>

						<tr height="52">
							<!--	圖片3開始 -->
							<td><label for="exampleFormControlFile1">圖片3：</label><br>
								<small><Font color='red' size="-3">${MsgMap.errorPicture}
								</Font></small></td>

							<td><label for="image"> <input type="file"
									name="ProductImage3" id="ProductImage3" style="display: none" />
									<img height='100' width='80'
									src='<c:url value='/support/p_FileName3?id=${product.p_Id}' />'
									id="ProductImage3_show_image" style="max-width: 300px"
									name="image_4" /> 
							</label></td>
							<!--	圖片3結束 -->
						</tr>

						<!-- 							<td><label class="fontSize">圖片3：</label><br>&nbsp;</td> -->
						<%-- 							<td><form:input path="ProductImage3" type='file' /><br>&nbsp; --%>
						<%-- 								<form:errors path="ProductImage3" cssClass="error" /></td> --%>

						<tr height="42">
							<td colspan='4'>
								<div id="btnArea" align="center">
									<input type="submit" name="updateBtn" id="submit" value="修改" />
									<input type="reset" name="cancel" id="cancel" value="重填">
								</div>
							</td>
						</tr>
					</Table>
					<!-- 					</form> -->
				</form:form>
				<!--  商品新增標籤開結束 -->
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/support/supFragment/bgFooter.jsp" />
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

	<script>
		p_Cover1_show_image
		//	預覽圖開始
		$("#p_Cover1_show_image").click(function(e) {
			document.getElementById("p_Cover1").click();
		});
		$("#p_Cover1").on("change", function(event) {
			const file = event.target.files[0];
			let readFile = new FileReader();
			readFile.readAsDataURL(file);
			readFile.addEventListener("load", function(e) {
				let image = document.getElementById("p_Cover1_show_image");
				image.src = this.result;

				// image.width = 500 ;
				image.style.maxWidth = "200px"; //css屬性
				image.style.maxHeight = "200px";
			});
		});
		//	預覽圖結束
		//	圖1
		$("#ProductImage1_show_image").click(function(e) {
			document.getElementById("ProductImage1").click();
		});

		$("#ProductImage1").on(
				"change",
				function(event) {
					const file = event.target.files[0];
					let readFile = new FileReader();
					readFile.readAsDataURL(file);
					readFile.addEventListener("load", function(e) {
						let image = document
								.getElementById("ProductImage1_show_image");
						image.src = this.result;

						// image.width = 500 ;
						image.style.maxWidth = "200px"; //css屬性
						image.style.maxHeight = "200px";
					});
				});
		//	圖1結束
		$("#ProductImage2_show_image").click(function(e) {
			document.getElementById("ProductImage2").click();
		});

		$("#ProductImage2").on(
				"change",
				function(event) {
					const file = event.target.files[0];
					let readFile = new FileReader();
					readFile.readAsDataURL(file);
					readFile.addEventListener("load", function(e) {
						let image = document
								.getElementById("ProductImage2_show_image");
						image.src = this.result;

						// image.width = 500 ;
						image.style.maxWidth = "200px"; //css屬性
						image.style.maxHeight = "200px";
					});
				});
		//	圖2結束
		$("#ProductImage3_show_image").click(function(e) {
			document.getElementById("ProductImage3").click();
		});

		$("#ProductImage3").on(
				"change",
				function(event) {
					const file = event.target.files[0];
					let readFile = new FileReader();
					readFile.readAsDataURL(file);
					readFile.addEventListener("load", function(e) {
						let image = document
								.getElementById("ProductImage3_show_image");
						image.src = this.result;

						// image.width = 500 ;
						image.style.maxWidth = "200px"; //css屬性
						image.style.maxHeight = "200px";
					});
				});
		//	圖3結束
	</script>
</body>
</html>