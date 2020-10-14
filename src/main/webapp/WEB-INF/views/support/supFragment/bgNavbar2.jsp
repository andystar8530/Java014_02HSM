<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商城</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css ">

<style>
list-group-item>img {
	width: 20px;
}

#content {
	width: 820px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
<!-- Page Content -->
  <div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">後台
      <small>管理頁面</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}">首頁</a>
      </li>
      <li class="breadcrumb-item active">後台管理</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group" >
          <div class="list-group-item href="#" >
              <img src="${pageContext.request.contextPath}/_00_init/getMemberImage?id=${LoginOK.m_Id}" width="80" style="border-radius: 50%;" id="partner-icon">
              <div>${partnerBean.p_storeName}</div>

          </div>
          <a  class="list-group-item" href="<c:url value='/support/bgMember'/>"><img src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/007-house.png" >方案/作品</a>
          <a  class="list-group-item" href="<c:url value='/support/bgMember'/>"><img src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/007-house.png" >會員/文章</a>

          <a  class="list-group-item" href="<c:url value='/support/bgMall'/>"><img src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/015-picture.png" >商城商品</a>

          <a  class="list-group-item" href="<c:url value='/support/bgMall'/>'/>"><img src="${pageContext.request.contextPath}/data/icon/3253474-wedding/png/034-marriage certification.png" >公告管理</a>
  
        </div>
      </div>
<!--       </div> -->
<!--       </div> -->
<!--    <script src='https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script> -->
<%--   <script src="${pageContext.request.contextPath}/data/js/partner.js"></script> --%>
   <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
</body>
</html>
