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
 	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			新人 <small>管理頁面</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/">首頁</a></li>
			<li class="breadcrumb-item active">新人資料</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<div class="list-group-item href="#" >
              <img src="${pageContext.request.contextPath}/_00_init/getMemberImage?id=${LoginOK.m_Id}" width="80" style="border-radius: 50%;" id="partner-icon">
              <div>${NewlywedBean.n_nickname}</div>

					</div>
					<a href="<c:url value='/newlywed_h/newlywed' />" class="list-group-item"><img src="<c:url value='/data/icon/3253474-wedding/png/007-house.png' /> ">基本資料 </a>
					<a  class="list-group-item" href="<c:url value='/nrm/${LoginOK.m_No}'/>"><img src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/007-house.png" >帳號資料</a>
						
						<a class="list-group-item"><img
							src="<c:url value='/data/icon/3253474-wedding/png/015-picture.png' />">我的婚禮</a> <a
						class="list-group-item"><img
							src="<c:url value='/data/icon/3253474-wedding/png/034-marriage certification.png' />">我要詢價

					</a> <a class="list-group-item list-group-1"><img
							src="<c:url value='/data/icon/3253474-wedding/png/001-clipboard.png' />">我的討論區 </a> <a
						class="list-group-item list-group-2"><img
							src="<c:url value='/data/icon/3253474-wedding/png/027-wedding invitation.png' />">我的收藏
							> </a> <a class="list-group-item"
						href="${pageContext.request.contextPath}/"><img
							src="<c:url value='/data/icon/3253474-wedding/png/025-calendar.png' />">回首頁</a>
				</div>
			</div>
		
<!-- 		</div> -->
		<!-- /.row -->

<!-- 	</div> -->
       

	
	
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
      <form:input path="m_Socialnum" type="text" class="form-control" oninput="if(value.length>10)value=value.slice(0,10)"/><br>
	  <form:errors path='m_Socialnum' cssClass="error"/>
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






   <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script>
      new WOW().init(); 
    </script> 

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	
</body>
</html>