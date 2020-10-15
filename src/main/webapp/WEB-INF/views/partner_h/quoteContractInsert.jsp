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
    <title>新增報價合約資訊</title>

 
  </head>
  
  <body>
    <!-- 引用上與左側 -->
<jsp:include page="/fragment/topMVC.jsp" />
<jsp:include page="./fragment/partnerSidebar.jsp" />

    
    <div class="col-lg-9 mb-4"> 
        <h2>新增報價合約</h2>
        <br>
        <hr>
 
 <!-- 內容 -->        
<form:form  modelAttribute='quoteBean' method="post"  enctype="multipart/form-data" > 


<!-- 第一行 專案名稱 新人姓名 新人帳號 狀態  -->
<div class="form-row">
    <div class="form-group col-md-3">
        <label>專案名稱</label>
          <form:input type="text" id="qcName" path="qcName" class="form-control"/><br>
          <form:errors path="qcName" class="errors" />
        </div>
    

        <div class="form-group col-md-3">
         <label >新人姓名</label>
         <form:input  type="text"  id="n_Name"  path="n_Name"  class="form-control"/>
         <form:errors path="n_Name" class="errors" />
        </div>
        
        <div class="form-group col-md-3">
         <label >新人帳號(mail)</label>
         <form:input type="text" id="m_Id" path="m_Id" class="form-control"/>
        <form:errors path="m_Id" class="errors" />
        </div>
    
        <div class="form-group col-md-3">
            <label>狀態</label>
            <form:select path="qcStatus"  class="form-control">
                <form:option value="0" label="未報價" />
                <form:option value="1" label="未簽約" />
                <form:option value="2" label="未付訂金" />
                <form:option value="3" label="結案:服務完成" />
                <form:option value="4" label="結案:未完結案" />
                <form:option value="5" label="客戶詢價" />
            </form:select>
            </div>
</div>
    <!-- 第一行 結束 專案名稱 新人姓名 新人帳號 狀態 -->


<!-- 第二行  報價日期.服務日期.報價期限 -->
<div class="form-row">
    <div class="form-group col-md-4">
     <label >報價日期</label>
         <form:input
            type="date"  id="qcDate"  path="qcDate"  class="form-control" /> <br>			
         <form:errors path="qcDate" class="errors" />
    </div>
    
    <div class="form-group col-md-4">
     <label >服務日期</label>
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
    <!-- 第二行結束  報價日期.服務日期.報價期限 -->		

<!-- 第三行 服務項目、服務品名、服務金額 -->
<div class="form-row">
    <div class="form-group col-md-4">
     <label >服務項目</label>
     <form:select path="serviceItem" class="form-control">
         <form:option value="0" label="豪華專案" />
         <form:option value="1" label="經濟專案" />
         <form:option value="2" label="包套專案" />
         <form:option value="3" label="其他專案" />
         <form:option value="4" label="誤餐費" />
         <form:option value="5" label="超時服務" />
     </form:select>
     <form:errors  path="serviceItem" class='errors'/>	
    </div>
    
    <div class="form-group col-md-4">
     <label >服務品名</label>
     <form:input	type="text"	id="serviceName" path="serviceName"	class="form-control" />
    <form:errors path="serviceName" class="errors" />
    </div>
    <div class="form-group col-md-4">
     <label>金額</label>
     <form:input	type="text"	id="servicePrice" path="servicePrice" class="form-control"	onkeyup="profit()"  />
    <form:errors path="servicePrice" class="errors" />
    </div>
    </div>
    <!-- 第三行 結束 服務項目、服務品名、服務金額 -->
    
    
    <!-- 第四行 專案總價.訂金比例.訂金金額  -->
    <div class="form-row">
        <div class="form-group col-md-4">
            <label >專案總價</label>
            <form:input
            type="text" id="qcTotalAmount" path="qcTotalAmount" class="form-control" /> 
            <form:errors path="qcTotalAmount" class="errors" />
        </div>
        <div class="form-group col-md-4">
            <label >訂金比例%</label>
            <form:input type="text" id="qcTotalAmount" path="qcTotalAmount" class="form-control" /> 
           <form:errors path="qcTotalAmount" class="errors" />
        </div>
    
        <div class="form-group col-md-4">
            <label >訂金金額</label>
            <form:input type="text" id="qcDeposit" path="qcDeposit" class="form-control" /> 		
        </div>
    </div>
    <!-- 第四行 結束 專案總價.訂金比例.訂金金額  -->


<!-- 第五行 合約內容 -->
<div class="form-row">
    <div class="form-group col-md-12">
     <label >合約內容</label>
        <form:textarea   id="qcContent" path="qcContent" class="form-control"  rows="15" />
        <form:errors path="qcContent" class="qcContent" />
    </div>
        </div>
    <!-- 第五行 結束 合約內容 -->
    
    <!-- 送出 -->
        <button type="submit" class="btn btn-primary mb-5">儲存</button>


</form:form> 
<!-- 結束 -->
</div>
    



<!-- 服務項目的option選單 -->
<script type="text/javascript"> 
function serviceItemChange(){
	var x = document.getElemetById("service-list").value;

}

//專案的總價計算
var servicePrice
function profit(){
//servicePrice服務項目的專案金額
servicePrice = parseInt(document.getElementById("servicePrice").value);
//qcTotalAmount專案總價
document.getElementById("qcTotalAmount").value = servicePrice;
}

//訂金計算
function deposit(){
	//qcDepositRate訂金比例
    var qcDepositRate = parseInt(document.getElementById("qcDepositRate").value);    
    document.getElementById("qcDeposit").value = (servicePrice*qcDepositRate/100);
}


</script>
</div>
</div>
<jsp:include page="/fragment/footerMVC.jsp" />
    
</body>
</html>
