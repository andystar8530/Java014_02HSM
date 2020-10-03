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
</head>
<body>
    <section>
        <div>
            <div class="container" style="text-align: center" >
                <h1>作品集清單</h1>    <!-- Button trigger modal -->
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCenter">
  作品 +
</button>
<a type="button"  role="button" class="btn btn-secondary" href="<c:url value='/showPortfoliosManagement'/> ">作品管理</a>
<button id='target'>test</button>


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
					<label class="control-label col-lg-2 col-lg-2 " for='pfmName'>
						作品集名稱:</label>
					<div class="col-lg-10">
						 <form:input id="pfmName" path="portfoliosBean.pfmName" type='text'
 							class='form:input-large' />
 						<form:errors  path="portfoliosBean.pfmName" class='errors' />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2 "  for='pfmInfo'>
						作品資訊: </label>
					<div class="col-lg-10">
						<form:textarea id="pfmInfo" path="portfoliosBean.pfmInfo" rows="5" cols="30"
   							class='form:input-large' /> 
   						<form:errors  path="portfoliosBean.pfmInfo" class='errors' /> 
					</div>
				</div>
				<!-- <div class="form-group">
					<label class="control-label col-lg-2 col-lg-2 "  for='pfService'>
						作品集分類: </label>
					<div class="col-lg-10">
					<form:select path="portfoliosBean.pfService">
						<form:option value="-1" label="請挑選" />
						<form:option value="婚禮佈置" label="婚禮佈置" />
						<form:option value="婚禮攝影" label="婚禮攝影" />
						<form:option value="新娘秘書" label="新娘秘書" />
						<form:option value="婚禮主持" label="婚禮主持" />
					</form:select>
					<form:errors  path="portfoliosBean.pfService" class='errors' /> 
					</div>
				</div> -->
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2 "  for='portfolioImage'>
						上傳多張圖片 </label>
					<div class="col-lg-10">
						<form:input path="portfoliosDetailsBean.portfoliosImages" id="pfdPic" type='file' multiple="multiple" 
 							class='form:input-large ' />
				
					</div>
				</div>
			
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
			</fieldset>
		</form:form>	
	</section>
<!--         ******** -->
      </div>
    </div>
  </div>
</div>
            </div>
        </div>
    </section>
    
    
    <hr style="height:1px;border:none;color:#333;background-color:#333;">
	<div align="center">
	<a href="<c:url value='/' />">回前頁</a>
	</div>
    <hr>
    <section class="container">
        <div class="row">
        <c:forEach var='portfolios' items="${portfolios}">
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                    <div class="caption">
                        <p>
                            <b style='font-size: 16px;'>${portfolios.pfmName}</b>
                        </p>
                        <p>${portfolios.partnerBean.p_storeName}</p>
                   
                        <p>作品資訊: ${portfolios.pfmInfo}</p>
                        <p>
                        	<a href="<spring:url value='/portfolio?pfmId=${portfolios.pfmId}' />" class="btn btn-primary">
                        		<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
                        	</a>
                        </p>
                        
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
    </section>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<c:if test="${not empty inputError}" >
	 <script>
			$('#ModalCenter').modal('show');
	 </script>
 </c:if>
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

 <div id='portfoliosItem'>

 </div>
</body>

</html>
    