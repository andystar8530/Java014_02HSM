<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增商品</title>
<!-- Bootstrap core CSS -->
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/css/support/bootstrap.min.css"> --%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css ">
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/support/bgMain.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/support/bgMall.css">
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/css/support/bgMallAdd.css"> --%>
</head>
<body>

	<!-- onLoad="setFocusToUserId()"不知道是什麼 -->
	<c:set var="funcName" value="REG" scope="session" />
	<jsp:include page="/fragment/topMVC.jsp" />
	<!-- container -->
	<div
		style='height:800px; width: 100%;
		background-position: center;
    	background-size: cover; 
   		 background-image:url("${pageContext.request.contextPath}/data/images/bigPic/8.jpg");'>
		<div class="bgMallAllDiv container ">
			<!-- 		<h1 class="mt-4 mb-3"> -->
			<div class="h1 border-bottom sub-title text-white"style="text-shadow: 5px 5px 10px rgb(88, 88, 80);padding-top:30px;">
				後台 <small class="h3">商城管理</small>
			</div>
			<!-- 		</h1> -->

			<!-- 引入共同的頁首 -->
			<div class="bgMainDiv "style="padding-top:30px;">
				<jsp:include page="/WEB-INF/views/support/supFragment/bgNavbar.jsp" />
				<div class="bgMainGalleryDiv MallMain">
					<!-- 		內容建立位置-------------- -->
					<!-- 新增商品開始 -->
					<form:form method="POST" modelAttribute="ProductBean"
						enctype='multipart/form-data'>
						<!-- 	最外框 -->
<!-- 						backdrop-filter: blur(5px); -->
						<div class="ml-5 col-8 container justify-content-center container  text-white"
							style="padding-top:20px; background:rgba(2,2,2,0.1);backdrop-filter: blur(1px);form-group; border-bottom; box-shadow: 5px 10px 8px #888888; text-shadow: 5px 5px 10px rgb(88, 88, 80);">
							<div class="col-12">
								<div
									class="row mx-0 justify-content-center  align-items-center w-100">
									<div class="border-bottom sub-title col-8 justify-content-center">
										<Font size='5'>增加商品</Font>
									</div>
								</div>
							</div>
							<!--	第一層 -->
							<div class="col-12  justify-content-center">
								<div
									class="row row mx-0 justify-content-center align-items-center w-100">
									<div class="col-4  justify-content-center">
										<div>
											<label class="fontSize">商品名稱</label>
										</div>
										<div>
											<form:input path='p_Name' class="form-control" style="" />
											<form:errors path="p_Name" cssClass="error" />
										</div>
									</div>
									<div class="col-4">
										<div>
											<label class="fontSize">種類名稱</label>
										</div>
										<div>
											<form:input path='p_Category' class="fieldWidth" style="" />

											<form:errors path="p_Category" cssClass="error" />
										</div>
									</div>
								</div>
								<!--	第二層 -->
								<div
									class="row mx-0 justify-content-center align-items-center w-100">
									<div class="col-4">
										<div>
											<label class="fontSize">進貨數量</label>
										</div>
										<div>
											<form:input path='p_Pdqty' class="form-control" style="" />

											<form:errors path="p_Pdqty" cssClass="error" />
										</div>
									</div>
									<div class="col-4">
										<div>
											<label class="fontSize">進貨金額</label>
										</div>
										<div>
											<form:input path='p_Pdsum' class="form-control" style="" />
											<form:errors path="p_Pdsum" cssClass="error" />
										</div>
									</div>
								</div>
								<!--	第三層 -->
								<div
									class="row mx-0 justify-content-center align-items-center w-100">
									<div class="col-4">
										<div>
											<label class="fontSize">售價</label>
										</div>
										<div>
											<form:input path='p_Price' class="form-control" style="" />

											<form:errors path="p_Price" cssClass="error" />
										</div>
									</div>
									<div class="col-4">
										<div></div>
										<div></div>
									</div>
								</div>
							</div>
							<!-- 	最外層第二層 -->
							<div class="col-12">
								<div
									class="row mx-0 justify-content-center align-items-center w-100">
									<div class="col-4">
										<div>
											<label for="exampleFormControlFile1">預覽圖</label><br> <small><Font
												color='red' size="-3">${MsgMap.errorPicture} </Font></small>
										</div>
										<div>
											<label for="image"> <input type="file"
												name="p_Cover1" id="p_Cover1" style="display: none" /> <img
												src="${pageContext.request.contextPath}/util/getPartnerCoverImage?m_No=${LoginOK.m_No}"
												id="p_Cover1_show_image" style="max-width: 300px"
												name="image_1" />
											</label>
										</div>
									</div>
									<div class="col-4">
										<div>
											<label for="exampleFormControlFile1">圖片</label><br> <small><Font
												color='red' size="-3">${MsgMap.errorPicture} </Font></small>
										</div>
										<div>
											<label for="image"> <input type="file"
												name="ProductImage1" id="ProductImage1"
												style="display: none" /> <img
												src="${pageContext.request.contextPath}/util/getPartnerCoverImage?m_No=${LoginOK.m_No}"
												id="ProductImage1_show_image" style="max-width: 300px"
												name="image_2" />
											</label>
										</div>
									</div>
								</div>

								<div
									class="row mx-0 justify-content-center align-items-center w-100">
									<div class="col-4">
										<div>
											<label for="exampleFormControlFile1">圖片</label><br> <small><Font
												color='red' size="-3">${MsgMap.errorPicture} </Font></small>
										</div>
										<div>
											<label for="image"> <input type="file"
												name="ProductImage2" id="ProductImage2"
												style="display: none" /> <img
												src="${pageContext.request.contextPath}/util/getPartnerCoverImage?m_No=${LoginOK.m_No}"
												id="ProductImage2_show_image" style="max-width: 300px"
												name="image_3" />
											</label>
										</div>
									</div>
									<div class="col-4">
										<div>
											<label for="exampleFormControlFile1">圖片</label><br> <small><Font
												color='red' size="-3">${MsgMap.errorPicture} </Font></small>
										</div>
										<div>
											<label for="image"><input type="file"
												name="ProductImage3" id="ProductImage3"
												style="display: none" /> <img
												src="${pageContext.request.contextPath}/util/getPartnerCoverImage?m_No=${LoginOK.m_No}"
												id="ProductImage3_show_image" style="max-width: 300px"
												name="image_4" /> </label>
										</div>
									</div>
								</div>
								<div
									class="row mx-0 justify-content-center align-items-center w-100">
									<div class="col-8">
										<div>
											<label class="fontSize">商品敘述</label>
										</div>
										<div>
											<form:textarea path='P_Note' class="w-100 p-3 form-control" />
											<form:errors path="P_Note" cssClass="error" />
										</div>
									</div>

								</div>
								<div>
									<div style="padding:20px 20px;" id="btnArea" align="center">
										<input class="btn btn-outline-primary" type="submit" name="submit" id="submit" value="儲存" />
										<!-- 							<input type="reset" name="cancel" id="cancel" value="重填"> -->
									</div>
								</div>
							</div>
						</div>

					</form:form>
					<!--  商品新增標籤開結束 -->
				</div>
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