<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>檢視店家資訊 </title>
<style>
.partnerIcon{
	border-radius: 50%;
}
.back{
	width:100%;
	height:500px;
	background-image: url("${pageContext.request.contextPath}/images/bg12-min.jpg");
		background-repeat: no-repeat;
		background-size:cover;
		background-attachment: fixed;

}

</style>
</head>

<body>
 <jsp:include page="/fragment/topMVC.jsp" />
 		<div class='back'>
 			
 		</div>
	<section>
		
	</section>
			<div>
			<div class= 'mx-auto text-center my-3'>
				<h3><img height='80px'
	            src="<c:url value='/getPartnerCoverImage/${partnerBean.p_id}'/> " width="80px" class='partnerIcon p-2'>${partnerBean.p_storeName}</h3>
				<h4 class='m-5'>${partnerBean.p_info}</h4>
				<p>服務分類: ${partnerBean.p_service}</p>
				<p>聯絡資訊LineID: ${partnerBean.p_lineId}</p>
				<p>評價: ${partnerBean.p_review}顆星</p>
				
				<!-- <img id='img'> -->
			</div>
<h2 class='text-center p-3' id="bb"><img src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/015-picture.png" width="35">作品集</h2>				
	<div class="container">
		<div class="row-cols-lg-4 row-cols-md-3 row-cols-2 row mx-auto">
			<c:if test="${empty pfBeanList}">			
				<h4 class='mx-auto pl-5'>目前尚未有作品集</h4>
			</c:if>
				<c:forEach var='pfBean' items="${pfBeanList}" end='7'>
					<div class="col mb-4">
    					<div class="card h-100">										
							<img src="<c:url value='/getPFCoverImage/${pfBean.pfmId}'/>" class='pfDetailImage card-img-top'
							style='max-width:250px;max-height:250px;'>
<%-- 						<p> 照片名稱:   ${pfBean.pfdName}</p> --%>
				
				 			 <div class="card-body">
								<h5 class="card-title">${pfBean.pfmName}</h5>
        						<p class="card-text">${pfBean.pfmInfo}</p>
     			 			</div>
							<p class='text-center'>
									<a href="<spring:url value='/portfolio?pfmId=${pfBean.pfmId}' />" class="btn btn-outline-primary">
										<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
									</a>
							</p>  
						</div>
					</div>					
				</c:forEach>
			</div>
		</div>
		
		<div class='programDiv'>	
<h2 class='text-center p-3' id="bb"><img src="${pageContext.request.contextPath}/data/icon/wishlist.png"  width="35">方案</h2>
	<div class='row ml-5 mr-5 col-9 mx-auto'>
		<c:if test="${empty programList}">
				<h4 class='mx-auto'>目前尚未有合作方案</h4>
			</c:if>
		<c:forEach var='programBean' items="${programList}" end='7'>
			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3'>
				<div class="card shadow border-info">
				  <img src="<c:url value='/_06_Program/getProgramImage/${programBean.prm_Id}'/>"  class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title">${programBean.prm_Title}</h5>
				    <p class="card-text">${programBean.prm_Content}</p>
				    <p class="card-text">${programBean.prm_Price}</p>
<%-- 				    <a href="<c:url value='/_06_Program/ProgramDetail/${programBean.prm_Id}'/>" class="btn btn-primary">詳細內容</a> --%>
				  	<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal">
  					詳細內容
					</button>

				  </div>
				</div>
			</div>
			
			
			<!-- Button trigger modal -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">詳細內容</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       		
		
				<h4><img height='80px'
	src="<c:url value='/getPartnerCoverImage/${programBean.partnerBean2.p_id}'/>" width="80px" class='partnerIcon'>${programBean.partnerBean2.p_storeName}</h4>
				<h3>${portfolio.pfmName}</h3>
				<h3 class='col-12'>方案名稱:${programBean.prm_Title}</h3>
				<p>方案類別: ${programBean.prm_Category}</p>
				<p>方案內容: ${programBean.prm_Content}</p>
				<p>方案說明: ${programBean.prm_Detail}</p>
				<p>方案價格: ${programBean.prm_Price}</p>
				
	<div>
				<p>								
					<a href="<c:url value='quote/askingQuote/${programBean.partnerBean2.p_id}'/>"
					class='btn btn-info btn-large'> 				
					    <span class='glyphicon-shopping-cart glyphicon'></span>我要詢價	    
					</a>
				</p>
			</div>
		      </div>
		      <div class="modal-footer">
		       
		      </div>
		    </div>
		  </div>
		</div>
			
		</c:forEach>
	</div>	
</div>
			
			<div class='text-center'>
				<p>
					<a href="<spring:url value='/' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回上頁
					</a> 
					<c:if test="${LoginOK.m_Code == 0}">
					<a href="${pageContext.request.contextPath}/getFavorites?p_id=${p_id}" class='btn btn-info btn-large'> 
					    <span class='glyphicon-shopping-cart glyphicon'></span>我有興趣
					</a>
					</c:if>
					<a href="<c:url value='/quote/askingQuote?p_id=${p_id}'/>"
					class='btn btn-info btn-large'> 				
					    <span class='glyphicon-shopping-cart glyphicon'></span>我要詢價
					    </a>
				</p>
			</div>
			</div>
		</div>
	</div>
	</div>
	
	<div class='container-fluid'>
		<div class='row justify-content-center '>
			 <iframe src="https://maps.google.com?output=embed&q=${partnerBean.memberBean.m_Add}"width="1500"
		                height="350"
		                frameborder="0">
		     </iframe>
	   </div>  
	</div>
	           
		<!-- ---------------------------分隔線---------------------------------------			 -->

	<jsp:include page="/fragment/footerMVC.jsp" />
	
	
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCQYmuo5h9pGY0c83EpRPJKTSUoLsk64FA&callback=initMap"
		async defer></script>
	<script type="text/javascript">
    var map, geocoder;
    function initMap() {
        geocoder = new google.maps.Geocoder();
        map = new google.maps.Map(document
                .getElementById('map'), {
            zoom : 17
        });
        var address = '台北科技大學'')
        geocoder.geocode({
            'address' : address
        },
        function(results, status) {
            if (status == 'OK') {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map : map,
                    position : results[0].geometry.location
                });
            } else {
                console.log(status);
            }
        });
    }
    
</script>

</body>
</html>