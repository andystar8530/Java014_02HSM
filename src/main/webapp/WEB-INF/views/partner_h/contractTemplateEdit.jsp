<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合約範本</title>

</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<jsp:include page="./fragment/partnerSidebar.jsp" />

<form method="POST" action="<c:url value='/partner/ContractTemplateUpdate.do' />" 
enctype='multipart/form-data'>
<%-- <div class="col-lg-9 mb-4"  style="width:100%" method="POST" action="<c:url value='/partner/ContractTemplateUpdate.do' />">  --%>
<div style="width:150%" > 
        <h2>編輯合約&nbsp</h2>
<!--          <input type="button" name="update" value="儲存" onclick='updateTemplate()'/> -->
         <button type="submit" class="btn btn-primary">Save</button>
        <br>
        <hr>   
<input name="p_MId" type="hidden" value="${contractTemplateBean.p_MId}"></input> 
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<textarea name="ctContent" value="${contractTemplateBean.ctContent}">${contractTemplateBean.ctContent}</textarea>
<script>CKEDITOR.replace("ctContent");</script>
  
</div>  
</form>
</body>
</html>

