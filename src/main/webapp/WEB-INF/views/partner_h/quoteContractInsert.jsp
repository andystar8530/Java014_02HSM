<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
  <head>
  
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/marryMa.css">
    <meta charset="UTF-8" />
    <title>編輯報價合約資訊</title>
    <style>
      .titlename {
        padding: 50px;
        color: #778da9;
      }
      .form-group {
        font-size: 16px;
        margin: 10px;
      }
      .errors {
        color: #fe5f55;
        font-weight: bold;
      }
    </style>
 
  </head>
  
  <body>
    <!-- 引用上與左側 -->
    <jsp:include page="/fragment/topMVC.jsp" />
    <jsp:include page="./fragment/partnerSidebar.jsp" />
    
<div class="col-lg-9 mb-4"> 
        <h2>新增報價合約</h2>
<%--            <a href="<c:url value='/editPartner?p_id=${partnerBean.p_id}'/>"><img src="${pageContext.request.contextPath}/data/icon/document.png" width="50" style="display: inline;" ></a> --%>
        <br>
        <hr>
        
<form:form  id="form1" modelAttribute='quoteBean' method="post"  enctype="multipart/form-data" > 
<table>
<!-- 案號 -->
     <tr>
          	<td>
          	<div class="form-group col-md-6">
              <label for="qcId">案號</label>
              <div class="col">
                <form:input
                  type="text"
                  id="qcId"
                  path="qcId"
                  class="showQuote"
                />
                <form:errors path="qcId" class="errors" />
              </div>
            </div>
          	</td>
          	
<!--  專案名稱         	 -->
          	<td>
          	 <div class="form-group col-md-6">
              <label for="qcName">專案名稱</label>
              <div class="col">
                <form:input
                  type="text"
                  id="qcName"
                  path="qcName"
                  class="showQuote"
                />
                <form:errors path="qcName" class="errors" />
              </div>
            </div>
 
<!-- 狀態(未完)                  	 -->
          	<td>
          	  <div class="form-group col-md-6">
              <label for="qcStatus">狀態</label>
              <div class="col">
                <form:input
                  type="text"
                  id="qcStatus"
                  path="qcStatus"
                  class="showQuote"
                />              
                <form:errors path="qcStatus" class="errors" />
              </div>
            </div>
          	</td>        	
          </tr> 



    
<!--  新增按鈕 -->
    <tr height="42" >
      <td height="61" colspan="6" align="center">         
         <input type="submit" name="Submit" value="新增" />
      </td>
    </tr>
  </table>
</form:form> 
        
 <!-- Bootstrap   -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>       
        
</div>      
</body>
</html>
