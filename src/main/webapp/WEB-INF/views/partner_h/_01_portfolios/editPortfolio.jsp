<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改作品集</title>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
<h2 class='text-center'>請修改下列資料</h2>
<input type='submit' class='btn btn-light justify-content-center' value='回上頁'>
<input type="hidden" name="id" id='id'><br>
<div class="row justify-content-center">
	<div class="col-auto">
	<form class="needs-validation" novalidate>
		<table border='1' class='mx-auto table table-bordered' width='500'>
			<tr height='60'>
				<td width='300'>
					　<input type="hidden" name = "id" value="${sessionScope.portfoliosBeab.pfmId}">
					<p  class='mx-auto'>&nbsp;作品集名稱: </p><input type="text" name="pfmName" id='pfmName'
						class='form-control' required='required' value="${portfolio.pfmName}">
						 <div class="valid-feedback">Looks good!</div>
     					 <div class="invalid-feedback">請提供作品集名稱</div>
					<div id ='result1ok' style='display:inline;'></div>
					<div id ='result1error' style='display:inline;'></div>
				</td>
				
			</tr>
			<tr>
				<td width='300'>
					<p  class="align-baseline">&nbsp;作品集資訊:</p> <textarea id='pfmInfo' name='pfmInfo' col='30' row='50'  
					class='form-control'  required='required'>${portfolio.pfmInfo}</textarea>
					<div class="valid-feedback">Looks good!</div>
     				<div class="invalid-feedback">請提供作品集資訊.</div>		
					<div id ='result2ok' style='display:inline;'></div>
					<div id ='result2error' style='display:inline;'></div>
				</td>
			</tr>
			<tr>
				<td width='200'>
					<p  class="align-baseline">&nbsp;作品集分類:</p>
					<select id="pfService" name="pfService" class='form-control' value="${portfolio.pfService}">
						<option value='婚禮攝影'>婚禮攝影</option>
						<option value='婚禮佈置'>婚禮佈置</option>
						<option value='婚禮主持'>婚禮主持</option>
						<option value='新娘秘書'>新娘秘書</option>
					</select>
				</td>
			</tr>
			<!-- 隱藏欄位 -->
			<tr>
				<td>
					<input id='pfmStatus' name='pfmStatus' type="hidden" value="${portfolio.pfmStatus}">
					<input id='pfCreateTime' name='pfCreateTime' type="hidden" value="${portfolio.pfCreateTime}">
					<input id='pfUpdateTime' name='pfUpdateTime' type="hidden" value="${portfolio.pfUpdateTime}">
					<input id='p_id' name='p_id' type="hidden" value="${portfolio.partnerBean.p_id}">
					<!-- <input id='partnerBean' name='partnerBean' type="hidden" value="${portfolio.partnerBean}"> -->
				</td>
			</tr>

			<tr>
				<td>
					 <button class="btn btn-primary" type="submit" id='submitBtn'>送出</button>
				</td>
			</tr>	

		</table>
	
		</form>
	</div>	
</div>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery.serializeJSON/1.0.2/jquery.serializeJSON.min.js"></script>
<script>
	var pfmId = ${pfmId};
	var p_id = document.getElementById('p_id').value;
	var pfmStatus = document.getElementById('pfmStatus').value;
	var pfCreateTime = document.getElementById('pfCreateTime').value;
	var pfUpdateTime = document.getElementById('pfUpdateTime').value;
	console.log("p_id:" + p_id);
	console.log("pfmStatus:" + pfmStatus);
	console.log("pfCreateTime:" + pfCreateTime);
	console.log("pfUpdateTime:" + pfUpdateTime);
	

// 	var partnerBean = document.getElementById('partnerBean');
// 	console.log("partnerBean="+partnerBean)
// 	console.log("JSONpartnerBean="+JSON.stringify(partnerBean))
	
	var pfmName = document.getElementById('pfmName');
	var pfmInfo = document.getElementById('pfmInfo');
	var pfService = document.getElementById('pfService');
	var pfmStatus = document.getElementById('pfmStatus');
	var pfCreateTime = document.getElementById('pfCreateTime');
	var pfUpdateTime = document.getElementById('pfUpdateTime');
	$(document).ready(function(){
	let partnerBeanValue ;

// 		$.ajax({
// 			url:"<c:url value='/portfolioUpdate?pfmId=" + pfmId + "'/>",
// 			// data:{pfmId:pfmId},
// 			data:{pfmId:pfmId},
// 			dataType:'json' ,
// 			type:'GET',
// 			success(data){
// 				console.log(JSON.stringify(data));
//  				alert(JSON.stringify(data));
// 				$('#pfmName').val(data.pfmName);
// 				$('#pfmInfo').val(data.pfmInfo);
// 				$('#pfService').val(data.pfService);
// 				$('#pfmStatus').val(data.pfmStatus);
// 				$('#pfCreateTime').val(data.pfCreateTime);
// 				$('#pfUpdateTime').val(data.pfUpdateTime);
// 				// $('#p_id').val(data.partnerBean.p_id);
// 				// $('#partnerBean').val(data.partnerBean);
// 				partnerBeanValue = data.partnerBean ;
// 				// console.log(partnerBeanValue);  object{...}
// 				// console.log(partnerBeanValue.p_id); //48
// 			}
		
// 		});	
	
		$('#submitBtn').click(function(){
			console.log("aaaaaaaaaaaa")
			//讀取使用者輸入的資料
			var pfmNameVal = $('#pfmName').val();
			var pfmInfoVal = $('#pfmInfo').val();
			var pfServiceVal = $('#pfService').val();
			var pfmStatusVal = $('#pfmStatus').val();
			var pfCreateTimeVal = $('#pfCreateTime').val();
			var pfUpdateTimeVal = $('#pfUpdateTime').val();
// 			partnerBeanValue = data.partnerBean ;
// 			partnerBeanJSON = JSON.stringify(partnerBeanValue);
			// var partnerBeanVal = $('#partnerBean').val();

			var jsonPortfolio ={
				"pfmName":pfmNameVal,
				"pfmInfo":pfmInfoVal,
				"pfService":pfServiceVal,
				"pfmId":pfmId,
				"pfmStatus":pfmStatusVal,
				"pfCreateTime":pfCreateTimeVal,
				"pfUpdateTime":pfUpdateTimeVal,
// 				"partnerBean":pb,
				"p_id":p_id
			}
			console.log("****p_id:" + p_id);
			 alert(JSON.stringify(jsonPortfolio));
			$.ajax({
				type:'PUT',
// 				url:"<c:url value='/portfolioUpdate?pfmId=" + pfmId + "'/>",
				url:"<c:url value='/portfolioUpdate'/>",
				contentType:"application/json",
				data : JSON.stringify(jsonPortfolio),
				dataType:'json' ,
				success : function (data) {
					JSON.stringify(data);
					console.log(JSON.stringify(data))
					}	


				})
		});
	
	})

</script>
<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>

</body>
</html>