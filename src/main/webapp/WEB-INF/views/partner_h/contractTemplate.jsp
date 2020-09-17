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
<jsp:include page="../fragment/topMVC.jsp" />
<jsp:include page="./fragment/partnerSidebar.jsp" />
<%-- <jsp:useBean id='partner' class='partnerInfoEdit.dao.Impl.PartnerDaoImpl_Jdbc' scope='session'/> --%>
<%-- <jsp:getProperty name='partner' property='partnerBean'/> --%>
<div class="col-lg-9 mb-4"> 
        <h2>合約範本&nbsp</h2>
        <a href="${pageContext.request.contextPath}/partner/contractTemplateEdit.jsp"><img src="${pageContext.request.contextPath}/data/icon/document.png" width="50" style="display: inline;" ></a>

        <br>
        <hr>    
        <form action="<c:url value='/displayPartnerInfo.do' />" method="GET" name="partnerForm" 
      class="needs-validation">
      <c:set var='nullInfo' value="" />
          <div class="form-group" >
            <label for="exampleInputPMId">會員編號</label>
            <input type="text" class="form-control " id="exampleInputPMId" 
            aria-describedby="PMIdHelp" 
            value="${contractTemplateBean.p_MId}"disabled > 
          </div>
          <div class="form-group mb-3" >
        	<label for="constract">合約模板:</label>
        	<p style="height:500px; background:#e9ecef; 
        	border:1px solid #ced4da; border-radius:0.25rem;">
        	${contractTemplateBean.ctContent}</p>
  		</div>
        </form>
  </div>
         
     
</body>
</html>