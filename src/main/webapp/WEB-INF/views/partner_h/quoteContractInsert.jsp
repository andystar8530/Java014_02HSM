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
     <tr>
          
<!-- 案號 -->
<!--  
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
 -->
          	
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
 
 
<!--  新人名字 -->
           	<td>
          	 <div class="form-group col-md-6">
              <label for="n_Name">新人名字</label>
              <div class="col">
                <form:input
                  type="text"
                  id="n_Name"
                  path="n_Name"
                  class="showQuote"
                />
                <form:errors path="n_Name" class="errors" />
              </div>
            </div>
 
 
           	 <div class="form-group col-md-6">
              <label for="m_Id">新人帳號(Mail)</label>
              <div class="col">
                <form:input
                  type="text"
                  id="m_Id"
                  path="m_Id"
                  class="showQuote"
                />
                <form:errors path="m_Id" class="errors" />
              </div>
            </div>
 
<!-- 狀態(未完)                  	 -->
          	<td>
          	 <div class="form-group col-md-5">
              <label for="qcStatus">狀態</label>
              <div class="col">             
             <form:select path="qcStatus">
						<form:option value="0" label="未報價" />
						<form:option value="1" label="未簽約" />
						<form:option value="2" label="未付訂金" />
						<form:option value="3" label="結案:服務完成" />
						<form:option value="4" label="結案:未完結案" />
					</form:select>
					<form:errors  path="qcStatus" class='errors'/>	
              </div>
            </div>
          	</td>        	
          </tr> 

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
                <form:errors path="qcExecutionDate" class="errors" />
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
		
<!-- 服務細項 -->
	<tr>
		<td>
<table>
<!-- 		標題列 -->
		<tr>
		<th>服務項目</th>
		<th>細項名</th>		
		<th>金額</th>
		</tr>

<!-- 服務明細列 -->
<tr>

	         <td width="40%">
         
    	<form:select path="serviceItem">
						<form:option value="0" label="豪華專案" />
						<form:option value="1" label="經濟專案" />
						<form:option value="2" label="包套專案" />
						<form:option value="3" label="其他專案" />
						<form:option value="4" label="誤餐費" />
						<form:option value="5" label="超時服務" />
					</form:select>
					<form:errors  path="serviceItem" class='errors'/>	  
		</td>

<!-- 細項品名		 -->
		<td width="50%">
                <form:input
                  type="text"
                  id="serviceName"
                  path="serviceName"
                  class="showQuote"
                />
                <form:errors path="serviceName" class="errors" />
		</td>
		
		<td width="10%">
                <form:input
                  type="text"
                  id="servicePrice"
                  path="servicePrice"
                  class="showQuote"
                  onkeyup="profit()"
                />
                <form:errors path="servicePrice" class="errors" />
		</td>
		</tr>		
	</table>
</td>
</tr>

<!-- 專案$$ -->
<tr>
<td>
            <div class="form-group">
              <label for="qcTotalAmount">專案總價</label>
              <div class="col">
                <form:input
                  type="text"
                  id="qcTotalAmount"
                  path="qcTotalAmount"
                  class="showQuote"
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
                  onkeyup="deposit()"
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
                />
                <form:errors path="qcDeposit" class="errors" />
              </div>
            </div>
</td>
</tr>
	
	


			<tr>
		<td>
           <div class="form-group">
              <label for="qcContent">合約內容</label>
              <div class="col">
                <form:textarea                  
                  id="qcContent"
                  path="qcContent"
                  class="showQuote col-mb-12 w-100" 
                />
                <form:errors path="qcContent" class="errors" />
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
