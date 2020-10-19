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
    <title>意象詢價</title>
    
  </head>
  
  <body>
    <!-- 引用上與左側 -->
	<jsp:include page="/fragment/topMVC.jsp" /> 
	<jsp:include page="./fragment/newlywedSidebar.jsp" />
  
<div class="col-lg-9 mb-4 border rounded"> 
    <h2>詢價中</h2>
    <br>
    <hr>
   

<form:form  modelAttribute='quoteBean' method="post"  enctype="multipart/form-data" > 
<!-- 第一行 專案名稱，新人名，狀態  -->
<div class="form-row">
	<div class="form-group col-md-4">
        <label >專案名稱</label>
        <form:input
        type="text" id="qcName" path="qcName" class="form-control" />
      <form:errors path="qcName" class="errors" />
    </div>
    
	<div class="form-group col-md-4">
        <label >新人名稱</label>
        <form:input type="text" id="n_Name" path="n_Name" class="form-control" />
      <form:errors path="n_Name" class="errors" />
    </div>

	<div class="form-group col-md-4">
        <label >狀態</label>
        <fieldset disabled="disabled">
            <form:select path="qcStatus" class="form-control">
                <form:option value="5" label="客戶詢價" />
        </form:select>
        </fieldset>
    </div>
</div>
<!-- 第一行 結束 專案名稱，新人名，狀態  -->


<!-- 第二行 合作商代號與名稱  -->
<div class="form-row">
<div class="form-group col-md-4">
    <label >詢價商代號</label>
    <form:input
    type="text" id="p_Id" path="p_Id" class="form-control" />
   <form:errors path="p_Id" class="errors" />
</div>
<div class="form-group col-md-8">
    <label >詢價商店名</label>
    <form:input
         type="text" id="p_storeName" path="p_storeName"  class="form-control" />
        <form:errors path="p_storeName" class="errors" />
</div>
</div>
<!-- 第二行 結束 合作商代號與名稱  -->


<!-- 第三行  報價日期.服務日期.報價期限 -->
<div class="form-row">
    <div class="form-group col-md-4">
     <label >報價日期</label>
          <form:input
                  type="date"  id="qcDate"  path="qcDate"  class="form-control" /> <br>		
             <form:errors path="qcDate" class="errors" />
    </div>
    
    <div class="form-group col-md-4">
     <label >結婚日期</label>
          <form:input
         type="date" id="qcExecutionDate" path="qcExecutionDate" class="form-control" /> <br>	
    <form:errors path="qcExecutionDate" class="errors" />
    </div>
    <div class="form-group col-md-4">
     <label >報價期限</label>
     <form:input
         type="date" id="qcDateLine" path="qcDateLine" class="form-control" /> <br>
    <form:errors path="qcDateLine" class="errors" />
    </div>
    </div>
    <!-- 第三行結束  報價日期.服務日期.報價期限 -->	
    <div class="form-row">
        <div class="form-group col-md-4">
         <label >服務項目</label>
         <form:select path="serviceItem" class="form-control">
             <form:option value="0" label="豪華專案" />
             <form:option value="1" label="經濟專案" />
             <form:option value="2" label="包套專案" />
             <form:option value="3" label="其他專案" />
         </form:select>
         <form:errors  path="serviceItem" class='errors'/>	
        </div>
        <div class="form-group col-md-8">
         <label >服務品名</label>
         <form:input	type="text"	id="serviceName" path="serviceName"	class="form-control" />
        <form:errors path="serviceName" class="errors" />
        </div>    
        </div>
        
<!-- 送出 -->
<button type="submit" class="btn btn-primary mb-5">儲存</button>

</form:form>
</div>  
  
  
    

 
 <!--  新增按鈕 -->
<!--     <tr height="42" > -->
<!--       <td height="61" colspan="6" align="left">          -->
<!--          <input type="submit" name="Submit" value="詢價" /> -->
<!--       </td> -->
<!--     </tr> -->


 <!-- Bootstrap   -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>       
 



</div>
</div>
</div>
<jsp:include page="/fragment/footerMVC.jsp" />
    
</body>
</html>
