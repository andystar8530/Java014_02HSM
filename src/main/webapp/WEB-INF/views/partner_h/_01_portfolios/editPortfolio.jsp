<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>	
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
<input type="hidden" name="id" id='id'><br>
<div class="row justify-content-center">
	<div class="col-auto">
	<form:form action='/Java014_02HSM/editPortfolioInfo' method='POST' modelAttribute='portfolioBean'
		enctype='multipart/form-data'>
		<table border='1' class='mx-auto table table-bordered' width='500'>
			<tr height='60'>
				<td width='300'>		
					<p  class='mx-auto'>&nbsp;作品集名稱: </p>
					<form:input type="text" id='pfmName' path='pfmName'
						class='form-control form-input-large' required='required'  />
						 <div class="valid-feedback">可以!</div>
     					 <div class="invalid-feedback">請提供作品集名稱</div>
					<form:errors path='pfmName' class='errors' />
				</td>
				
			</tr>
			<tr>
				<td width='300'>
					<p  class="align-baseline">&nbsp;作品集資訊:</p> 
				<form:textarea id='pfmInfo' path='pfmInfo' col='30' row='50'  
					class='form-control  form-input-large'  required='required'></form:textarea>
					<div class="valid-feedback">可以!</div>
     				<div class="invalid-feedback">請提供作品集資訊</div>		
			
				</td>
			</tr>			
			<tr>
				<td>
					 <button class="btn btn-primary" type="submit" id='submitBtn'>送出</button>
					<a href="<c:url value='/showPortfoliosManagement'/>" class="text-center p-1" >回前頁</a>
				</td>
			</tr>	
		</table>	
		</form:form>
	</div>	
</div>


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
	<!-- ---------------------------分隔線---------------------------------------			 -->

	<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>