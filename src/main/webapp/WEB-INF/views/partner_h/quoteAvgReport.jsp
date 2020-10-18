<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>月平均表</title>
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

window.profit1 =0;
window.profit2 =0;
window.profit3 =0;
window.profit4 =0;
window.profit5 =0;
window.profit6 =0;
window.profit7 =0;
window.profit8 =0;
window.profit9 =0;
window.profit10 =0;
window.profit11 =0;
window.profit12 =0;

window.cost1 =0;
window.cost2 =0;
window.cost3 =0;
window.cost4 =0;
window.cost5 =0;
window.cost6 =0;
window.cost7 =0;
window.cost8 =0;
window.cost9 =0;
window.cost10 =0;
window.cost11 =0;
window.cost12 =0;
	</script>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<jsp:include page="./fragment/partnerSidebar.jsp" />
      
<div class="title col-lg-9 mb-4">
<!-- title ------------------ -->
<%--         <h2>${partnerBean.p_storeName}的結案報表</h2> --%>
        <h2>月平均表</h2>	                
         <br>
        <hr>
        
<!-- 圖表 -->
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<!-- 圖表結束 -->

<hr class="mt-5 mb-5">

<!-- 表格 -->
    <div class="d-flex justify-content-center align-items-center">
        <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
            <thead class="bg-highlight">
<tr>
<th>月份</th>
<th>平均收入</th>
<th>平均成本</th>
<th>平均利潤</th>
<th>完案量</th>
</tr>
</thead>
<c:forEach  var="qrList" items="${qrList}" varStatus="vs">
<tr>
	<td>${qrList.month}</td>
	<td>${qrList.qrAvgRev}</td>
	<td>${qrList.qrAvgCost}</td>
	<td>${qrList.qrAvgPro}</td>
	<td>${qrList.quoteCount}</td>
	<script>
	window.month${qrList.month} = ${qrList.qrAvgRev}
	window.profit${qrList.month}=${qrList.qrAvgPro}
	window.cost${qrList.month}=${qrList.qrAvgCost}
	</script>
</tr>
</c:forEach>
</table>       
</div>
<!-- 表格結束 -->


<script>
window.onload = function () {
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
    theme: "light2",//引用canvasjs的主題
    
	title:{
		text: "月平均報表"
	},
	data: [{        
		type: "line",
		showInLegend: true,//秀出線條顏色與name
		name:"Revenue",
      	indexLabelFontSize: 16,
		color: "#F49097",
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
	}
	,
	{        
		type: "line",
		showInLegend: true,//秀出線條顏色與name
		name:"Profit",
      	indexLabelFontSize: 16,
		color: "#55D6C2",
		dataPoints: [
			{ label: "1月份",y: window.profit1},
			{ label: "2月份",y: window.profit2},
			{ label: "3月份",y: window.profit3},
			{ label: "4月份",y: window.profit4 },
			{ label: "5月份",y: window.profit5 },
			{ label: "6月份",y: window.profit6 },
			{ label: "7月份",y: window.profit7 },
			{ label: "8月份",y: window.profit8 },
			{ label: "9月份",y: window.profit9 },
			{ label: "10月份",y: window.profit10 },
		 	{ label: "11月份",y: window.profit11 },
            { label: "12月份",y: window.profit12 }
		 	//{label: "月份",  y: Revenue} 
			]
	},
	{        
		type: "line",
		showInLegend: true,//秀出線條顏色與name
		name:"Cost",
      	indexLabelFontSize: 16,
		color: "#EACEAA",
		dataPoints: [
			{ label: "1月份",y: window.cost1},
			{ label: "2月份",y: window.cost2},
			{ label: "3月份",y: window.cost3},
			{ label: "4月份",y: window.cost4 },
			{ label: "5月份",y: window.cost5 },
			{ label: "6月份",y: window.cost6 },
			{ label: "7月份",y: window.cost7 },
			{ label: "8月份",y: window.cost8 },
			{ label: "9月份",y: window.cost9 },
			{ label: "10月份",y: window.cost10 },
		 	{ label: "11月份",y: window.cost11 },
            { label: "12月份",y: window.cost12 }
		 	//{label: "月份",  y: Revenue} 
			]
	}




	]
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