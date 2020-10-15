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
    <title>檢視報價合約資訊</title>
  </head>
  
  <body>
    <!-- 引用上與左側 -->
	<jsp:include page="/fragment/topMVC.jsp" /> 
	<jsp:include page="./fragment/newlywedSidebar.jsp" />
<div class="col-lg-9 mb-4 border rounded"> 
        <h2>報價合約</h2>
        <br>
        <hr>
      	 
 <!-- 內容 -->
 <form:form method="POST" modelAttribute="quoteBean" enctype="multipart/form-data" >
	 
 <!-- 第一行 案號、專案名稱、狀態 -->
 <div class="form-row">
 <div class="form-group col-md-4">
	 <label>案號</label>
	 <fieldset disabled>
	   <form:input type="text" id="qcId" path="qcId" class="form-control"/>
	   </fieldset>
	 </div>

	 <div class="form-group col-md-4">
         <label>專案名稱</label>
         <fieldset disabled>
		   <form:input type="text" id="qcName" path="qcName" class="form-control"/><br>
           </fieldset>
		 </div>


	 <div class="form-group col-md-4">
     <label>狀態</label>
<!-- 	<fieldset disabled> -->
	 <form:select path="qcStatus"  class="form-control">
		 <form:option value="0" label="未報價" />
		 <form:option value="1" label="未簽約" />
		 <form:option value="2" label="已簽約" />
		 <form:option value="3" label="結案:服務完成" />
		 <form:option value="4" label="結案:未完結案" />
		 <form:option value="5" label="客戶詢價" />
     </form:select>
		</fieldset>
	 </div>
   </div>

<!-- 第一行結束 案號、專案名稱、狀態		 -->

<!-- 第二行 合作商姓名 與 合作商帳號  -->
<div class="form-row">
    <div class="form-group col-md-4">
        <label >合作商代號</label>
        <fieldset disabled="disabled">
            <form:input  type="text" id="p_Id"  path="p_Id" class="form-control"/>
        </fieldset>
    </div>
    <div class="form-group col-md-8">
        <label >合作商</label>
        <fieldset disabled="disabled">
            <form:input  type="text" id="p_storeName"  path="p_storeName" class="form-control"/>
        </fieldset>
    </div>
</div>
<!-- 第二行 結束 合作商姓名 與 合作商帳號  -->

<!-- 第三行  報價日期.服務日期.報價期限 -->
<div class="form-row">
<div class="form-group col-md-4">
 <label >報價日期</label>
 <fieldset disabled>
 	 <form:input
			  type="date"  id="qcDate"  path="qcDate"  class="form-control" /> <br>		
	</fieldset>
</div>

<div class="form-group col-md-4">
 <label >服務日期</label>
 <fieldset disabled>
 	 <form:input
	 type="date" id="qcExecutionDate" path="qcExecutionDate" class="form-control" /> <br>	
</fieldset>
</div>
<div class="form-group col-md-4">
 <label >報價期限</label>
 <fieldset disabled>
 <form:input
	 type="date" id="qcDateLine" path="qcDateLine" class="form-control" /> <br>
 </fieldset>
</div>
</div>
<!-- 第三行結束  報價日期.服務日期.報價期限 -->		

<!-- 第四行 服務項目、服務品名、服務金額 -->
<div class="form-row">
<div class="form-group col-md-4">
 <label >服務項目</label>
 <fieldset disabled>
 <form:select path="serviceItem" class="form-control">
	 <form:option value="0" label="豪華專案" />
	 <form:option value="1" label="經濟專案" />
	 <form:option value="2" label="包套專案" />
	 <form:option value="3" label="其他專案" />
	 <form:option value="4" label="誤餐費" />
	 <form:option value="5" label="超時服務" />
 </form:select>
 </fieldset>
</div>
<div class="form-group col-md-4">
 <label >服務品名</label>
 <fieldset disabled>
 <form:input	type="text"	id="serviceName" path="serviceName"	class="form-control" />
 </fieldset>
</div>
<div class="form-group col-md-4">
 <label>金額</label>
 <fieldset disabled>
 <form:input	type="text"	id="servicePrice" path="servicePrice" class="form-control"	onkeyup="profit()"  />
 </fieldset>
</div>
</div>
<!-- 第四行 結束 服務項目、服務品名、服務金額 -->

<!-- 第五行 專案總價.訂金比例.訂金金額  -->
<div class="form-row">
	<div class="form-group col-md-4">
        <label >專案總價</label>
        <fieldset disabled="disabled">
            <form:input
            type="text" id="qcTotalAmount" path="qcTotalAmount" class="form-control" /> 
        </fieldset>
	</div>
	<div class="form-group col-md-4">
        <label >訂金比例%</label>
        <fieldset disabled="disabled">
            <form:input type="text" id="qcDepositRate" path="qcDepositRate" class="form-control" /> 
           <form:errors path="qcDepositRate" class="errors" />
        </fieldset>
	</div>
	<div class="form-group col-md-4">
        <label >訂金金額</label>
        <fieldset disabled="disabled">
            <form:input type="text" id="qcDeposit" path="qcDeposit" class="form-control" /> 		
        </fieldset>
	</div>
</div>
<!-- 第五行 結束 專案總價.訂金比例.訂金金額  -->

<!-- 第六行 合約內容 -->
<div class="form-row">
<div class="form-group col-md-12">
 <label >合約內容</label>
 <fieldset disabled>
	<form:textarea   id="qcContent" path="qcContent" class="form-control"  rows="15"/>
 </fieldset>
</div>
	</div>
<!-- 第六行 結束 合約內容 -->

<!-- 送出 -->
<div class="form-row">
<div class="form-group col-md-6">
    <input  type="submit" id="submit" path="submit" class="form-control btn btn-outline-danger"
            value="合約簽名"    onclick="UpdateQuote(${LoginOK.m_Id},${quoteBean.qcId})"/>
   </div>

 <div class="form-group col-md-6">
 	<input type="submit"  id="submit" path="submit" class="form-control btn btn-outline-danger"
           value="意見回覆" onclick="UpdateQuote(${LoginOK.m_Id},${quoteBean.qcId})">
	</div>
	</div>   
<!-- form結束 -->
	        </form:form> 
      </div>
<!-- Bootstrap   -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!-- UpdateQuote修改儲存 -->
<script type="text/javascript">
function UpdateQuote(m_Id,qcId){
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
</div>
<jsp:include page="/fragment/footerMVC.jsp" />

</body>
</html>
