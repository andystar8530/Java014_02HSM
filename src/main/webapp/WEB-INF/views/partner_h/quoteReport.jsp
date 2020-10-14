<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>經營報表</title>
</head>
<script>
window.month1 =0;
window.month2 =0;
window.month3 =0;
window.month4 =0;
window.month5 =0;
window.month6 =0;
window.month7 =0;
window.month8 =0;
window.month9 =0;
window.month10 =0;
window.month11 =0;
window.month12 =0;
	</script>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<jsp:include page="./fragment/partnerSidebar.jsp" />
      
<div class="title col-lg-9 mb-4">
<!-- title ------------------ -->
<%--         <h2>${partnerBean.p_storeName}的結案報表</h2> --%>
        <h2>經營狀況</h2>	                
         <br>
        <hr>

<!-- 測試內容 -->
    <div class="d-flex justify-content-center align-items-center">
        <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
            <thead class="bg-highlight">
<tr>
<th>月份</th>
<th>收入</th>
<th>成本</th>
<th>利潤</th>
<th>完案量</th>
</tr>
</thead>
<c:forEach  var="qrList" items="${qrList}" varStatus="vs">
<tr>
	<td>${qrList.month}</td>
	<td>${qrList.qrRevenue}</td>
	<td>${qrList.qrCost}</td>
	<td>${qrList.qrProfit}</td>
	<td>${qrList.quoteCount}</td>
	<script>
	window.month${qrList.month} = ${qrList.qrRevenue}
	</script>
</tr>
</c:forEach>
</table>       
</div>
<hr class="mt-5 mb-5">
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
    theme: "light2",//引用canvasjs的主題
    
	title:{
		text: "年度經營報表"
	},
	data: [{        
		type: "line",
      	indexLabelFontSize: 16,
		dataPoints: [
			{ label: "1月份",y: window.month1},
			{ label: "2月份",y: window.month2},
			{ label: "3月份",y: window.month3},
			{ label: "4月份",y: window.month4 },
			{ label: "5月份",y: window.month5 },
			{ label: "6月份",y: window.month6 },
			{ label: "7月份",y: window.month7 },
			{ label: "8月份",y: window.month8 },
			{ label: "9月份",y: window.month9 },
			{ label: "10月份",y: window.month10 },
		 	{ label: "11月份",y: window.month11 },
            { label: "12月份",y: window.month12 }
		 	//{label: "月份",  y: Revenue} 
			]
	}]
});
chart.render();

}
</script>

  
  
  
  
  
  
  
</div> 
</div>
</div>
<jsp:include page="/fragment/footerMVC.jsp" />  
</body>
</html>