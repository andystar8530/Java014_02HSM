<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改帳號資料</title>
<style type="text/css">
.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}
</style>
</head>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />
 <jsp:include page="./fragment/partnerSidebar.jsp" />

	
	
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<div class="col-lg-9 mb-4 border rounded">
	<h2>更新帳號資料</h2>
	<hr>
	<form:form method="POST" modelAttribute="memberBean" enctype='multipart/form-data'>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label>帳號</label>
      <fieldset disabled>
      <form:input path='m_Id' type="email" class="form-control"/>
	   </fieldset>
    </div>
    <div class="form-group col-md-6">
      <label>Email</label>
      <form:input path="m_Email" type="email" class="form-control"/><br>	
      <form:errors path='m_Email' cssClass="error"/>
    </div>
    </div>
     <div class="form-row">
    <div class="form-group col-md-4">
      <label>姓名</label>
	  <form:input path='m_Name' type="text" class="form-control"/><br>	
      <form:errors path='m_Name' cssClass="error"/>
    </div>
    <div class="form-group col-md-4">
      <label>手機號碼</label>
      <form:input path="m_Phone" type="text" class="form-control" oninput="if(value.length>10)value=value.slice(0,10)"/><br>
	  <form:errors path='m_Phone' cssClass="error"/>
    </div>
    <div class="form-group col-md-4">
      <label>身份證字號</label>
      <c:if test="${memberBean.m_Socialnum == null || memberBean.m_Socialnum == '' }">
      <label Class="error">請注意輸入後不能修改</label>
      <form:input path="m_Socialnum" type="text" class="form-control" oninput="if(value.length>10)value=value.slice(0,10)"/><br>
	  </c:if>
	  <form:errors path='m_Socialnum' cssClass="error"/>
	  
	  <c:if test="${memberBean.m_Socialnum != null && memberBean.m_Socialnum != '' }">
	  <fieldset disabled>
      <form:input path='m_Socialnum' type="text" class="form-control"/>
	  </fieldset>
	  </c:if>
    </div>
  </div>
  <div class="form-group">
    <label>地址</label>
    <form:input path="m_Add" type="text" class="form-control"/><br>
	<form:errors path='m_Add' cssClass="error"/>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label>大頭照片</label>
      <img src="<c:url value='/_00_init/getMemberImage?id=${LoginOK.m_Id}'/>"
               id="show_image"  style="max-width:300px" name="image_1"/>
      <form:input path="memberMultipartFile" type='file' id="memberImage" style="display: none "/><br>
	  <form:errors path="memberMultipartFile"  cssClass="error" />
    </div>
  </div>
  <div class="form-group">
 
    </div>
  <button type="submit" class="btn btn-primary mb-5">送出</button>
</form:form>
  </div>
          <script>
      $("#show_image").click(function (e) {
        document.getElementById("memberImage").click();
      });

      $("#memberImage").on("change", function (event) {
        const file = event.target.files[0];
        let readFile = new FileReader();
        readFile.readAsDataURL(file);
        readFile.addEventListener("load", function (e) {
          let image = document.getElementById("show_image");
          image.src = this.result;

          // image.width = 500 ;
          image.style.maxWidth = "300px"; //css屬性
          image.style.maxHeight = "300px";
        });
      });




      
      </script>
	
	
	
	
	
	
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////// -->
</div>
</div>
 </div>
</div>
	<!--共同頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />

</body>
</html>