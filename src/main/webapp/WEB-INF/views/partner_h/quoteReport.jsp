<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>經營報表</title>
</head>
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
	let a${vs.index} = ${qrList.qrRevenue}
	</script>
</tr>
</c:forEach>
</table>       
</div>

<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
window.onload = function () {
// var qrList=${qrList};

// //取qrList值
// for(let i=0;i<qrList.length;i++){
// 	console.log(qrList[i]);
// }

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
			{ y: 450},
			{ y: 414},
			{ y: 520, indexLabel: "\u2191 highest",markerColor: "red", markerType: "triangle" },
			{ y: 460 },
			{ y: 450 },
			{ y: 500 },
			{ y: 480 },
			{ y: 480 },
			{ y: 410 , indexLabel: "\u2193 lowest",markerColor: "DarkSlateGrey", markerType: "cross" },
			{ y: 500 },
		 	{ y: 480 },
            { y: 510 }
		 	//{label: "月份",  y: Revenue}
			let a = new Array[][];
			let y = 400;
		 	for(let x=0;x<10;x++) {
			 	a[x][0]={y};
			 	y+=20;
			 	}
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