<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showPartners</title>
</head>
<style>
	.my_btn{
		position: fixed;
		top:70px; /*距離上方 0 像素*/
 		z-index:55; /*重疊時會在其他元素之上*/
 		
	}
	.partnerDiv{
		background-image: url("${pageContext.request.contextPath}/images/bg7.jpg");
		background-repeat: no-repeat;
		background-size:cover;
		background-attachment: fixed;
	}
	.programDiv{
		background-image: url("${pageContext.request.contextPath}/images/bg5.jpg");
		background-repeat: no-repeat;
		background-size:cover;
		background-attachment: fixed;
	}
	.portfolioDiv{
		background-image: url("${pageContext.request.contextPath}/images/bg4.jpg");
		background-repeat: no-repeat;
		background-size:cover;
		background-attachment: fixed;
	}
	.topBtn{
		width:60px;
		position: fixed;
		bottom:30px;
		right:5%;
 		z-index:55; /*重疊時會在其他元素之上*/
	}
	.card img{
		width:100%;
		max-height:200px;
	}
</style>
<body>
<jsp:include page="/fragment/topMVC.jsp" />

<div class='my_btn'>
	<a type="button" class="btn btn-outline-danger" href="#aa">找店家</a>
	<a type="button" class="btn btn-outline-danger" href="#bb">找方案</a>
	<a type="button" class="btn btn-outline-danger" href="#cc">找作品</a>
</div>

<div class='partnerDiv'>
<h2 class='text-center p-3' id="aa" >店家一覽</h2>
	<div class='row ml-5 mr-5 col-9 mx-auto '>
	
		<c:forEach var='partnerBean' items="${pbList}" end='7'>
			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3 ' >
				<div class="card shadow border-info">
				  <img src="<c:url value='/getPartnerStampImage/${partnerBean.p_id}'/>" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">${partnerBean.p_storeName}</h5>
				    <p class="card-text">${partnerBean.p_service}</p>
				    <p class="card-text">${partnerBean.p_info}</p>
				    <a href="<c:url value='/showPartnerDetail/${partnerBean.p_id}'/>" class="btn btn-primary">查看店家</a>
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div class='programDiv'>	
<h2 class='text-center p-3' id="bb">方案一覽</h2>
	<div class='row ml-5 mr-5 col-9 mx-auto'>
	
		<c:forEach var='programBean' items="${programList}" end='7'>
			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3'>
				<div class="card shadow border-info">
				  <img src="<c:url value='/_06_Program/getProgramImage/${programBean.prm_Id}'/>"  class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title">${programBean.prm_Title}</h5>
				    <p class="card-text">${programBean.prm_Content}</p>
				    <p class="card-text">${programBean.prm_Price}</p>
				    <a href="<c:url value='/_06_Program/ProgramDetail/${programBean.prm_Id}'/>" class="btn btn-primary">詳細內容</a>
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>	
</div>	
<div class='portfolioDiv'>
<h2 class='text-center p-3' id="cc">作品集一覽</h2>
	<div class='row ml-5 mr-5 col-9 mx-auto'>
	
		<c:forEach var='portfoliosBean' items="${portfolioList}" end='7'>
			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3'>
				<div class="card shadow border-info">
				  <img src="<c:url value='/getPFCoverImage/${portfoliosBean.pfmId}'/>" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">${portfoliosBean.pfmName}</h5>
				    <p class="card-text">${portfoliosBean.pfmInfo}</p>
				    <p class="card-text">${portfoliosBean.partnerBean.p_storeName}</p>
				    <a href="<spring:url value='/portfolio?pfmId=${portfoliosBean.pfmId}' />" class="btn btn-primary">Go somewhere</a>
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>	
</div>	

	<img src="<c:url value='/data/icon/up-arrow.png'/> " class='topBtn' id="topBtn">
	<script>
		$(".my_btn > a").click(function(e){
			$(".my_btn > a").removeClass("selected");
			$(this).addClass("selected");

			var id = $(this).attr("href");
			var y = $(id).offset().top - 100;
		
			$("body").stop().animate({scrollTop:y},2000);
		})
		$("#topBtn").click(function(e){
			$("body").animate({scrollTop:70},2000);
		})
		
		
		$(function () {

		var $win = $(window);

		var $topBtn = $('.topBtn');

	// 當用戶滾動到離頂部100像素時，展示回到頂部按鈕

		$win.scroll(function () {

			if ($win.scrollTop() > 100) {

			$topBtn.show();

			} else {

			$topBtn.hide();

			}

			});

			// 當用戶點擊按鈕時，通過動畫效果返回頭部

			$topBtn.click(function () {

			$('html, body').animate({scrollTop: 0}, 1500);

				});

});

</script>	

	<!-- ---------------------------分隔線---------------------------------------			 -->

	<jsp:include page="/fragment/footerMVC.jsp" />
</body>

</html>