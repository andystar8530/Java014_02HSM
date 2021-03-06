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
			<jsp:include page="/WEB-INF/views/support/supFragment/bgNavbar2.jsp" />
	
	<!-- container -->
	<div class="col-lg-9 mb-4">
				<!-- 		內容建立位置-------------- -->
				<!--	修改商品開始 -->
				<c:set var="product" value="${ProductBean}" />
				<form:form method="POST" modelAttribute="ProductBean"
					enctype='multipart/form-data'>
					<!-- 					<input type="hidden" name="noname" id='putOrDelete' value=""> -->
					<c:if test='${ProductBean.p_Id != null}'>
						<form:hidden path="p_Id" />
					</c:if>
					<fieldset>

						<div style="">
							<div style="text-align: center; vertical-align: middle;">
								<Font color="#006600" size='5' face="標楷體">修改商品</Font>
							</div>
						</div>
							<hr>
						<div style="">
							<div style="text-align: center; vertical-align: middle;">
								<div class="error">${errorSaveData}<br>
								</div>
							</div>
						</div>

						<div style="">
							<div style="width: 90px;">
								<label class="fontSize">種類名稱：</label><br>&nbsp;
							</div>
							<div style="width: 290px;">
								<form:input path='p_Category' class="fieldWidth"
									style="width: 200px;" />
								<br>&nbsp;
								<form:errors path="p_Category" cssClass="error" />
							</div>
						</div>

						<div style="">
							<div>
								<label class="fontSize">商品名稱：</label><br>&nbsp;
							</div>
							<div style="width: 290px;">
								<form:input path='p_Name' class="fieldWidth"
									style="width: 200px;" />
								<br>&nbsp;
								<form:errors path="p_Name" cssClass="error" />
							</div>

						</div>

						<div style="">
							<!--	預覽圖開始 -->
							<div class="form-group">
								<label for="covImage">封面圖：</label><br> <label for="image">
									<form:input type="file" id="p_Cover1" path='p_Cover1'
										style="display: none " /> <img
									src="<c:url value='/support/p_Cover?id=${product.p_Id}'/>"
									id="p_Cover1_show_image" style="max-width: 300px"
									name="image_1" />
								</label>
								<%-- 								<form:errors path="covImage" class='errors' /> --%>
							</div>
							<!--	預覽圖結束 -->
						</div>

						<div style="">
							<div>
								<label class="fontSize">進貨數量：</label><br>&nbsp;
							</div>
							<div>
								<form:input path='p_Pdqty' class="fieldWidth"
									style="width: 200px;" />
								<br>&nbsp;
								<form:errors path="p_Pdqty" cssClass="error" />
							</div>

							<div>
								<label class="fontSize">進貨金額：</label><br>&nbsp;
							</div>
							<div>
								<form:input path='p_Pdsum' class="fieldWidth"
									style="width: 200px;" />
								<br>&nbsp;
								<form:errors path="p_Pdsum" cssClass="error" />
							</div>
						</div>

						<div style="">
							<div>
								<label class="fontSize">現有庫存：</label><br>&nbsp;
							</div>
							<div>
								<form:input path='p_Stock' class="fieldWidth"
									style="width: 200px;" />
								<br>&nbsp;
								<form:errors path="p_Stock" cssClass="error" />
							</div>

							<div>
								<label class="fontSize">銷售數量：</label><br>&nbsp;
							</div>
							<div>
								<form:input path='p_Sdqty' class="fieldWidth"
									style="width: 200px;" />
								<br>&nbsp;
								<form:errors path="p_Sdqty" cssClass="error" />
							</div>
						</div>

						<div style="">
							<div>
								<label class="fontSize">出售單價：</label><br>&nbsp;
							</div>
							<div>
								<form:input path='p_Price' class="fieldWidth"
									style="width: 200px;" />
								<br>&nbsp;
								<form:errors path="p_Price" cssClass="error" />
							</div>

						</div>
						<div style="">

							<!--	圖片1開始 -->

							<div class="form-group">
								<label for="covImage">圖片1：</label><br> <label for="image">
									<form:input type="file" id="productImage1" path='productImage1'
										style="display: none " /> <img
									src="<c:url value='/support/p_Pic1?id=${product.p_Id}'/>"
									id="productImage1_show_image" style="max-width: 300px"
									name="image_2" />
								</label>
								<%-- 								<form:errors path="covImage" class='errors' /> --%>
							</div>
							<!--	圖片1結束 -->
						</div>

						<div style="">
							<!--	圖片2開始 -->
							<div class="form-group">
								<label for="covImage">圖片2：</label><br> <label for="image">
									<form:input type="file" id="productImage2" path='productImage2'
										style="display: none " /> <img
									src="<c:url value='/support/productImage2?id=${product.p_Id}'/>"
									id="productImage2_show_image" style="max-width: 300px"
									name="image_3" />
								</label>
								<%-- 								<form:errors path="covImage" class='errors' /> --%>
							</div>
							<!--	圖片2結束 -->
						</div>

						<div style="">
							<!--	圖片3開始 -->
							<div class="form-group">
								<label for="covImage">圖片3：</label><br> <label for="image">
									<form:input type="file" id="productImage3" path='productImage3'
										style="display: none " /> <img
									src="<c:url value='/support/productImage3?id=${product.p_Id}'/>"
									id="productImage3_show_image" style="max-width: 300px"
									name="image_4" />
								</label>
								<%-- 								<form:errors path="covImage" class='errors' /> --%>
							</div>
						</div>
						<!--	圖片3結束 -->
						<div style="">
							<div>
								<label class="fontSize">商品敘述：</label><br>&nbsp;
							</div>
							<div>
								<form:textarea path='P_Note' class="fieldWidth" cols="100"
									rows="15" />
								<br>&nbsp;
								<form:errors path="P_Note" cssClass="error" />
							</div>
						</div>
						<div style="">
							<div>
								<div id="btnArea" align="center">
									<input type="submit" name="updateBtn" id="submit" value="修改" />
								</div>
							</div>
						</div>
					</fieldset>
				</form:form>
				<!--  商品新增標籤開結束 -->
			</div>
		</div>
	</div>

<%-- 	<jsp:include page="/WEB-INF/views/support/supFragment/bgFooter.jsp" /> --%>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

	<script>
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
		$("#productImage1_show_image").click(function(e) {
			document.getElementById("productImage1").click();
		});

		$("#productImage1").on(
				"change",
				function(event) {
					const file = event.target.files[0];
					let readFile = new FileReader();
					readFile.readAsDataURL(file);
					readFile.addEventListener("load", function(e) {
						let image = document
								.getElementById("productImage1_show_image");
						image.src = this.result;

						// image.width = 500 ;
						image.style.maxWidth = "200px"; //css屬性
						image.style.maxHeight = "200px";
					});
				});
		//	圖1結束
		$("#productImage2_show_image").click(function(e) {
			document.getElementById("productImage2").click();
		});

		$("#productImage2").on(
				"change",
				function(event) {
					const file = event.target.files[0];
					let readFile = new FileReader();
					readFile.readAsDataURL(file);
					readFile.addEventListener("load", function(e) {
						let image = document
								.getElementById("productImage2_show_image");
						image.src = this.result;

						// image.width = 500 ;
						image.style.maxWidth = "200px"; //css屬性
						image.style.maxHeight = "200px";
					});
				});
		//	圖2結束
		$("#productImage3_show_image").click(function(e) {
			document.getElementById("productImage3").click();
		});

		$("#productImage3").on(
				"change",
				function(event) {
					const file = event.target.files[0];
					let readFile = new FileReader();
					readFile.readAsDataURL(file);
					readFile.addEventListener("load", function(e) {
						let image = document
								.getElementById("productImage3_show_image");
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