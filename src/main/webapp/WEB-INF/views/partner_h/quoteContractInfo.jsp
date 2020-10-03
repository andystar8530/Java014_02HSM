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
        <h2>報價合約</h2>
           <a href="<c:url value='/editPartner?p_id=${partnerBean.p_id}'/>"><img src="${pageContext.request.contextPath}/data/icon/document.png" width="50" style="display: inline;" ></a>
        <br>
        <hr>
      
      <!-- 內容 -->
        <TABLE>
        <form:form
          method="POST"
          modelAttribute="quoteBean"
          enctype="multipart/form-data" >
		<input type='hidden' id='update' name='_method'>
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

<!-- 報價日期.服務日期.報價期限-->
	 <tr>
		<td>
		<div class="form-group col-md-6">
              <label for="qcDate">報價日期</label>
              <div class="col">
                <form:input
                 type="date"
                  id="qcDate"
                  path="qcDate"
                  class="showQuote"
                />
                <form:errors path="qcDate" class="errors" />
              </div>
            </div>
            </td>
		<td>
		 <div class="form-group col-md-6">
              <label for="qcExecutionDate">服務日期</label>
              <div class="col">
                <form:input
                  type="date"
                  id="qcExecutionDate"
                  path="qcExecutionDate"
                  class="showQuote"
                />
                <form:errors path="qcExecutionDate" class="qcContent" />
              </div>
            </div>
		</td>
		<td>
		  <div class="form-group col-md-6">
              <label for="qcDateLine">報價期限</label>
              <div class="col">
                <form:input
                  type="date"
                  id="qcDateLine"
                  path="qcDateLine"
                  class="showQuote"
                />
                <form:errors path="qcDateLine" class="errors" />
              </div>
            </div>
		</td>		
		</tr>
		
<!-- 合約內容	             -->
	<tr>
		<td>
           <div class="form-group">
              <label for="qcContent">合約內容</label>
              <div class="col-mb-12">
                <form:textarea                  
                  id="qcContent"
                  path="qcContent"
                  class="showQuote"
                  rows="5"
                  cols="30"
                />
                <form:errors path="qcContent" class="qcContent" />
              </div>
            </div>
</td>
</tr>
 
<!-- 新人姓名(未完).專案總價.訂金比例.訂金金額  -->
	<tr>
		<td>
            <!-- 新人id如何查詢到新人名字 -->
            <div class="form-group">
              <label for="qcContent">新人姓名</label>
              <div class="col">
                <form:input
                  type="text"
                  id="qcContent"
                  path="qcContent"
                  class="showQuote"
                  rows="5"
                  cols="30"
                />
                <form:errors path="qcContent" class="qcContent" />
              </div>
            </div>
</td>

<td>
            <div class="form-group">
              <label for="qcTotalAmount">專案總價</label>
              <div class="col">
                <form:input
                  type="text"
                  id="qcTotalAmount"
                  path="qcTotalAmount"
                  class="showQuote"
                  rows="5"
                  cols="30"
                />
                <form:errors path="qcTotalAmount" class="errors" />
              </div>
            </div>
</td>

<td>
            <div class="form-group">
              <label for="qcDepositRate">訂金比例</label>
              <div class="col">
                <form:input
                  type="text"
                  id="qcDepositRate"
                  path="qcDepositRate"
                  class="showQuote"
                  rows="5"
                  cols="30"
                />
                <form:errors path="qcDepositRate" class="errors" />
              </div>
            </div>
</td>

<td>
            <div class="form-group">
              <label for="qcDeposit">訂金金額</label>
              <div class="col">
                <form:input
                  type="text"
                  id="qcDeposit"
                  path="qcDepositRate"
                  class="showQuote"
                  rows="5"
                  cols="30"
                />
                <form:errors path="qcDeposit" class="errors" />
              </div>
            </div>
</td>
</tr>

<!-- 服務細項 -->
	<tr>
		<td>
<table border='1'>

<!-- 		標題列 -->
		<tr>
		<th>服務項目</th>
		<th>金額</th>
		<th>備註</th>		
		</tr>
		
<!-- 		明細列 -->
<c:set var="subtotal" value="0" />
		<c:forEach var="aBean" varStatus="stat" items="${QuoteBean.items}">
		<tr>
		<td>
		 <select id="service-list" onchange="changeService(this.selectedIndex)"></select>
<%-- 		${aBean.value.屬性} --%>
		</td>
		<td>
		456
<%-- 		${aBean.value.qcdAmount} --%>
		</td>
		<td>
		789
<%-- 		${aBean.value.qcdNotes} --%>
		</td>
		</tr>		
		</c:forEach>
	</table>
	</td>
</tr>

<!-- 送出 -->
	<tr>
		<td>
            <div class="form-group">
              <div class="col col-mb-1">
                <input
                  type="submit"
                  id="submit"
                  path="submit"
                  class="showQuote btn btn-outline-danger"
                  value="儲存"
                  onclick="UpdateQuote(${partnerBean.p_id},${aBean.qcId})"
                />
              </div>
            </div>
		</td>
		</tr>	
	        </form:form> 
     </TABLE>
      </div>
<!-- Bootstrap   -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- UpdateQuote修改儲存 -->
<script type="text/javascript">
function UpdateQuote(p_id,qcId){
 var hiddenField = document.getElementById("update");
 document.forms[0].method="POST";
 document.forms[0].submit();
}
</script>

<!-- 服務項目的select選單 -->
<script type="text/javascript">
        var service=['服務選擇','新娘秘書','攝影師','主持人','婚宴佈置']
        var serviceSelect = document.getElementById("service-list");
        var inner="";
        for(var i=0;i<service.length;i++){
           inner = inner+'<option value=i>' + service[i]+'</option>';
            }
        serviceSelect.innerHTML = inner;
        function changeService(index){
            }
        changeService(document.getElementById("service-list").selectedIndex);   
</script>
</body>
</html>
