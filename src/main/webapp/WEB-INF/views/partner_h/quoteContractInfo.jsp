<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
 
<!-- 狀態 -->
          	<td>
          	  <div class="form-group col-md-6">
              <label for="qcStatus">狀態</label>
              <div class="col">             
             <form:select path="qcStatus">
						<form:option value="0" label="未報價" />
						<form:option value="1" label="未簽約" />
						<form:option value="2" label="未付訂金" />
						<form:option value="3" label="結案:服務完成" />
						<form:option value="4" label="結案:未完結案" />
						<form:option value="5" label="客戶詢價" />
					</form:select>
					<form:errors  path="qcStatus" class='errors'/>	
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
		

 


<!-- 服務細項 -->
	<tr>
		<td>
		<table border='1' width="150%">
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
		

<%-- 		服務價格 --%>
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


<!-- 合約內容(未完)	             -->
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
                <form:errors path="qcContent" class="qcContent" />
              </div>
            </div>
</td>
</tr>



<!-- 新人姓名(未完).專案總價.訂金比例.訂金金額  -->
	<tr>
            <!-- 新人id如何查詢到新人名字 -->
		<td>
            <div class="form-group">
              <label for="n_Name">新人姓名</label>
              <div class="col">
                <form:input
                  type="text"
                  id="n_Name"
                  path="n_Name"
                  class="showQuote"
                />
                <form:errors path="n_Name" class="errors" />
              </div>
              <label for="m_Id">新人帳號(mail)</label>
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
                 /> 
                <form:errors path="qcTotalAmount" class="errors" />
<%--             <c:set var="subtotal" --%>
<%--             	   value="${quoteBean.servicePrice}"/> --%>
<%--             	   ${quoteBean.servicePrice} --%>
			 </div>
            </div>
</td>

<td>
            <div class="form-group">
              <label for="qcDepositRate">訂金比例(%)</label>
              <div class="col">
                <form:input
                  type="text"
                  id="qcDepositRate"
                  path="qcDepositRate"
                  class="showQuote"
                  onkeyup="profit()"/>
          
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
                  path="qcDeposit" 
                  class="showQuote" 
                /> 
<%--                 <form:errors path="qcDeposit" class="errors" /> --%>
<%--                <c:set var="deposit" --%>
<%--             	   value="${quoteBean.servicePrice*(quoteBean.qcDepositRate/100)}"/> --%>
<%--             	   ${quoteBean.servicePrice*(quoteBean.qcDepositRate/100)}  --%>
            
              </div>
            </div>
</td>
</tr>


<!-- 成本區 -->
<tr>
<td>
            <div class="form-group">
              <label for="costHour">專案工時</label>
              <div class="col">
                <form:input
                  type="text"
                  id="costHour"
                  path="costHour"
                  class="showQuote"
                  onkeyup="costCal()"/>
                <form:errors path="costHour" class="errors" />
              </div>
            </div>
            
              <div class="form-group">
              <label for="costPerHour">時薪</label>
              <div class="col">
                <form:input
                  type="text"
                  id="costPerHour"
                  path="costPerHour"
                  class="showQuote"
                  onkeyup="costCal()"/>
                <form:errors path="costPerHour" class="errors" />
              </div>
            </div>
            
		<div class="form-group">
              <label for="costMen">人工成本</label>
              <div class="col">
                <form:input
                  type="text"
                  id="costMen"
                  path="costMen"
                  class="showQuote"
                  />
                <form:errors path="costMen" class="errors" />
              </div>
            </div>
            
          <div class="form-group">
              <label for="costOther">其他費用</label>
              <div class="col">
                <form:input
                  type="text"
                  id="costOther"
                  path="costOther"
                  class="showQuote"
                  onkeyup="costCal()"/>
                <form:errors path="costOther" class="errors" />
              </div>
            </div>
            
            
          <div class="form-group">
              <label for="costTotal">總成本</label>
              <div class="col">
                <form:input
                  type="text"
                  id="costTotal"
                  path="costTotal"
                  class="showQuote"/>
                <form:errors path="costTotal" class="errors" />
              </div>
            </div>
            
            
             <div class="form-group">
              <label for="qcProfit">總潤利</label>
              <div class="col">
                <form:input
                  type="text"
                  id="qcProfit"
                  path="qcProfit"
                  class="showQuote"/>
                <form:errors path="qcProfit" class="errors" />
              </div>
            </div>
            
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
                  onclick="UpdateQuote(${partnerBean.p_id},${quoteBean.qcId})"
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

<!-- 合約狀態選取  暫時沒用到-->
<script type="text/javascript">
$(".status").val();//獲取下拉是選單的Value值
</script>




<!-- 服務項目的select選單 -->
<script type="text/javascript"> 
var service=['豪華專案','經濟專案','包套專案','其他專案','誤餐費','超時服務']
var serviceSelect = document.getElementById("service-list");
var inner="";
for(var i=0;i<service.length;i++){
   inner = inner+'<option value=i>'+ service[i]+'</option>';
    }
serviceSelect.innerHTML = inner;

var sectors = new Array();
sectors[0]=['請選擇主要業務'];
sectors[1]=['豪華專案','經濟專案','包套專案','其他專案','新娘梳化','新郎梳化','家人梳化','誤餐費','超時服務'];
sectors[2]=['豪華專案','經濟專案','包套專案','其他專案','婚紗攝影','婚宴攝影','婚宴拍照','儀式攝影','儀式拍照','誤餐費','超時服務'];
sectors[3]=['豪華專案','經濟專案','包套專案','其他專案','婚禮主持','儀式主持','誤餐費','超時服務'];
sectors[4]=['豪華專案','經濟專案','包套專案','其他專案','婚禮布置','捧花、花藝','誤餐費','超時服務'];



var qcTotalAmount;
function profit(){
//servicePrice服務項目的專案金額
var servicePrice = parseInt(document.getElementById("servicePrice").value);
var qcDepositRate = parseInt(document.getElementById("qcDepositRate").value);    
qcTotalAmount=servicePrice;
//qcTotalAmount專案總價
document.getElementById("qcTotalAmount").value = qcTotalAmount;
document.getElementById("qcDeposit").value = (servicePrice*(qcDepositRate/100));
}


function costCal(){
	
    var costHour = parseInt(document.getElementById("costHour").value);
    if(costHour == null){
    	costHour = 1;
        }
    var costPerHour = parseInt(document.getElementById("costPerHour").value);
    if(costPerHour == null){
    	coscostPerHourtHour = 1000;
        }
    var costMen =(costHour*costPerHour);
    var costOther = parseInt(document.getElementById("costOther").value);
    if(costOther == null){
    	costOther = 0;
        }
    var costTotal = (costOther+costMen);
    qcTotalAmount = document.getElementById("qcTotalAmount").value;
    var qcProfit = qcTotalAmount-costMen;
    document.getElementById("costMen").value = costMen;
    document.getElementById("costTotal").value =costTotal ;
    document.getElementById("qcProfit").value =qcProfit ;
    
}



function changeService(index){
// 	index=document.getElementById("service-list").selectedIndex);
	console.log(index);
    var Sinner="";
    for(var i=0;i<sectors[index].length;i++){
    	Sinner = Sinner+'<option value=i>'+sectors[index][i]+'</option>';
        }
    var sectorSelect = document.getElementById("sector-list");
    sectorSelect.innerHTML=Sinner;
    }
// changeService(document.getElementById("service-list").selectedIndex);   
changeService(1);   

	

</script>

</div>
</div>
<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>
