<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>Portfolios</title>
<style>
.thumbnail{
margin:40px auto;

}
.my-col{
height: 200px;

}


</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
 
<!-- Modal -->
<div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      	<div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">-- 新增作品集 --</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    		<span aria-hidden="true">&times;</span>
        </button>
     	</div>
    	<div class="modal-body">
<!--        modal body ******** -->
			<section class='container'>
				<form:form action='portfolios' method='POST' modelAttribute="portfoliosAll" class='form-horizontal'
				 enctype='multipart/form-data'>
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-12" for='pfmName'>
						作品集名稱:</label>
					<div class="col-lg-10">
						 <form:input id="pfmName" path="portfoliosBean.pfmName" type='text'
 							class='form:input-large' />
 						<form:errors  path="portfoliosBean.pfmName" class='errors' />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-12"  for='pfmInfo'>
						作品資訊: </label>
					<div class="col-lg-10">
						<form:textarea id="pfmInfo" path="portfoliosBean.pfmInfo" rows="5" cols="30"
   							class='form:input-large' /> 
   						<form:errors  path="portfoliosBean.pfmInfo" class='errors' /> 
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-12"  for='portfolioImage'>
						上傳多張圖片 </label>
					<div class="col-lg-10">
						<form:input path="portfoliosDetailsBean.portfoliosImages" id="pfdPic" type='file' multiple="multiple" 
 							class='form:input-large ' />
				
					</div>
				</div>
			
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button type="submit" class="btn btn-primary">確定新增</button>
      </div>
			</fieldset>
		</form:form>	
	</section>
      </div>
    </div>
  </div>
</div>         
<!--         ******** -->
			<jsp:include page="./fragment/partnerSidebar.jsp" />

    
		<div class='col-9'>
	        <div class="row">
	
            <div  class="col-md-12 col-lg-12" style="text-align: center" >
                <h1>作品集清單</h1>   
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCenter">
 			 	作品 +
				</button>
				<a type="button"  role="button" class="btn btn-secondary" href="<c:url value='/showPortfoliosManagement'/> ">作品管理</a>
<!-- 				<button id='target'>test</button> -->
				<a href="<c:url value='/' />">回前頁</a>
			</div>
				<c:forEach var='portfolios' items="${portfolios}">
				<div class="col-4">
						<div class="thumbnail" style="width: 300px;" >
								<img src="<c:url value='/getPFCoverImage/${portfolios.pfmId}'/>"  width="200px">
								<p>
									<b style='font-size: 16px;'>${portfolios.pfmName}</b>
								</p>
								<p>商家名稱:${portfolios.partnerBean.p_storeName}</p>
						
								<p><div class='m-2'>作品資訊: ${portfolios.pfmInfo}</div></p>
								<p class='text-center'>
									<a href="<spring:url value='/portfolio?pfmId=${portfolios.pfmId}' />" class="btn btn-outline-primary">
										<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
									</a>
								</p>                
						</div>
				</div>
					</c:forEach>
			</div>	
		</div>
    </div>
        
    </div>
    
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<c:if test="${not empty inputError}" >
	 <script>
			$('#ModalCenter').modal('show');
	 </script>
 </c:if>
 <script>

//如果字數太多，用...取代
$(document).ready(function(){

	$(function() {
		var len = 20;
		$(".JQellipsis").each(function(i) {
			if ($(this).text().length > len) {
				$(this).attr("title", $(this).text());
				var text = $(this).text().substring(0, len - 1) + "...";
				$(this).text(text);
			}
		});
	});
})

</script>

</script>
<script>
$('#target').click(function(){

	var xhr = new XMLHttpRequest();
	var url = "<c:url value = '/getPfListByPartnerId'/>"
	xhr.open("GET", url , true);
	

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var content = "<table border='1' style='margin:20px; colspan='5'>";
			content += "<tr>"
						+ "<th width='70'>編輯</th>"
						+ "<th width='100'>名稱</th>"
						+ "<th width='100'>資訊</th>"
						+ "<th width='100'>作品集分類</th>"
						+ "<th width='100'>審核狀態</th>"
						+"</tr>";
			var portfolios = JSON.parse(xhr.responseText);
			for(var i = 0 ; i < portfolios.length ; i++){

				content +=  "<tr><td width='70'><a href='portfolioEdit/" + portfolios[i].pfmId + "'>"
				      		+ "<img width='36' height='36' src='<c:url value='/data/icon/edit.png' />' ></a></td>"
				      		+ "<td align='center'>" + portfolios[i].pfmName + "</td>" 
				      		+ "<td align='center'>" + portfolios[i].pfmInfo + "</td>" 
				      		+ "<td align='center'>" + portfolios[i].pfService + "</td>" 
				      		+ "<td align='center'>" + portfolios[i].pfmStatus + "</td></tr>" 
				}
			content += "</table>";
			var portfoliosItem = document.getElementById('portfoliosItem');
			portfoliosItem.innerHTML = content ; 

			//alert(content);
			}
		}
			xhr.send();
})

</script>

 <div id='portfoliosItem'></div>
 </div>
 </div>
 <jsp:include page="/fragment/footerMVC.jsp" />

</body>

</html>
    