<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編輯店家資訊</title>
<style>
.titlename{
	padding:50px;
	color:#778da9;
}
.form-group{
	font-size:16px;
	margin:10px;
}
.errors{
	color:#fe5f55;
	font-weight: bold;
}
</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<jsp:include page="./fragment/partnerSidebar.jsp" />
<div class="col-lg-9 mb-4"> 
<h2 class='titlename'>商家基本資料編輯</h2>
<div class='container'>

	<form:form method='POST' modelAttribute='partnerBean' enctype='multipart/form-data' >
		<fieldset>
			<div class='form-group'>
				<label for="storeName">店家名稱</label>
				<div class='col'>
			        <form:input type="text"  id="p_storeName" path='p_storeName'
			         class='form:input-large' />
			        <form:errors  path="p_storeName" class='errors' />
				</div>
			</div>
			<div class='form-group'>
				<label for="info">店家簡介</label>
				<div class='col'>
			        <form:textarea   id="p_info" path='p_info'
			         class='form:input-large' rows="5" cols="30" />
			        <form:errors  path="p_info" class='errors' />
				</div>
			</div>
<!-- 			<div class="form-group "> -->
<!-- 				<label class='col' for="service"> -->
<!-- 					主要服務項目 </label> -->
<!-- 				<div class='col'> -->
<%-- 					<form:select path="p_service"> --%>
<%-- 						<form:option value="-1" label="請挑選" /> --%>
<%-- 						<form:options items="${serviceList}" /> --%>
<%-- 					</form:select>	 --%>
<%-- 					<form:errors  path="p_service" class='errors'/>			 --%>
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="form-group">
				<label class='col' for="area">
					服務區域 </label>
				<div class='col'>
					<form:select path="p_area">
						<form:option value="-1" label="請挑選" />
						<form:option value="1" label="北部" />
						<form:option value="2" label="中部" />
						<form:option value="3" label="南部" />
						<form:option value="4" label="東部" />
						<form:option value="5" label="離島" />
					</form:select>
					<form:errors  path="p_area" class='errors'/>				
				</div>
			</div>
			<div class="form-group">
              	<label for="covImage">上傳封面圖</label><br>
 				<label for="image">
     			<form:input type="file" id="covImage" path='covImage' style="display: none " />
     			<img src="<c:url value='/getPartnerCoverImage/${partnerBean.p_id}'/>"
               id="show_image"  style="max-width:300px" name="image_1"/>
    			</label>    
    			<form:errors  path="covImage" class='errors'/>		  
            </div>
          
            <div class="form-group">
            <label for="staImage">上傳公司大小章</label><br>  
			<label for="image">
     		<form:input type="file" id="staImage" path='staImage' style="display: none " />
     		<img src="<c:url value='/getPartnerStampImage/${partnerBean.p_id}'/>" id="show_image_sta"
     		 style="max-width:300px" name="image_2"/>
     		<form:errors  path="staImage" class='errors'/>	
    		</label>
           
            </div>
			<div class='form-group'>
				<label for="bankAcc">銀行帳號</label>
				<div class='col'>
			        <form:input type="text"  id="p_bankAcc" path='p_bankAcc'
			         class='form:input-large ' />
			        <form:errors  path="p_bankAcc" class='errors'/>	
				</div>
			</div>
			<div class='form-group'>
				<label for="lineId">LineID</label>
				<div class='col'>
			        <form:input type="text"  id="p_lineId" path='p_lineId'
			         class='form:input-large' />
			        <form:errors  path="p_lineId" class='errors'/>
				</div>
			</div>
			<div class='form-group'>
				<label for="hRate">預估時薪</label>
				<div class='col'>
			        <form:input type="text"  id="p_hRate" path='p_hRate'
			         class='form:input-large' />
			        <form:errors  path="p_hRate" class='errors'/>
				</div>
			</div>
			
			<div class='form-group'>
				<div class='col'>
			        <input type="submit"  id="submit" path='submit'
			         class='form:input-large btn btn-outline-danger' value='送出' />
				</div>
			</div>
			
		</fieldset>
	</form:form>	
          <script>
      $("#show_image").click(function (e) {
        document.getElementById("covImage").click();
      });
      $("#show_image_sta").click(function (e) {
          document.getElementById("staImage").click();
        });

      $("#covImage").on("change", function (event) {
        const file = event.target.files[0];
        let readFile = new FileReader();
        readFile.readAsDataURL(file);
        readFile.addEventListener("load", function (e) {
          let image = document.getElementById("show_image");
          image.src = this.result;

          // image.width = 500 ;
          image.style.maxWidth = "200px"; //css屬性
          image.style.maxHeight = "200px";
        });
      });
        $("#staImage").on("change", function (event) {
            const file = event.target.files[0];
            let readFile = new FileReader();
            readFile.readAsDataURL(file);
            readFile.addEventListener("load", function (e) {
              let image = document.getElementById("show_image_sta");
              image.src = this.result;

              // image.width = 500 ;
              image.style.maxWidth = "200px"; //css屬性
              image.style.maxHeight = "200px";
            });
      });
      </script>

   <!-- 引入共同的頁尾 --> 
<%-- 	<jsp:include page="/fragment/footerMVC.jsp" /> --%>
</body>
</html>