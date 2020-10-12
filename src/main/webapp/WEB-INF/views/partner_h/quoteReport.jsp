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
        <h2>年度結案報表</h2>	                
         <br>
        <hr>        


<!-- 測試內容 -->
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script>
window.onload = function () {

 // 劃格線
//  context.beginPath();
    
//     for(let i=0; i<100; i++){
//         let position = i * 50;
//         context.moveTo(0, position);
//         context.lineTo(canvas.width, position);
//         context.fillText(position, 0, position);
        
//         context.moveTo(position, 0);
//         context.lineTo(position, canvas.height);
//         context.fillText(position, position, 10);
//     }
//     context.strokeStyle = 'rgba(0,0,0,0.2)';   
//     context.lineWidth = 1;
//     context.stroke();
    // 格線結束




// var chart = new CanvasJS.Chart("chartContainer", {
// 	animationEnabled: true,
//     theme: "light2",//引用canvasjs的主題
    
// 	title:{
// 		text: "Simple Line Chart"
// 	},
// 	data: [{        
// 		type: "line",
//       	indexLabelFontSize: 16,
// 		dataPoints: [
// 			{ y: 450},
// 			{ y: 414},
// 			{ y: 520, indexLabel: "\u2191 highest",markerColor: "red", markerType: "triangle" },
// 			{ y: 460 },
// 			{ y: 450 },
// 			{ y: 500 },
// 			{ y: 480 },
// 			{ y: 480 },
// 			{ y: 410 , indexLabel: "\u2193 lowest",markerColor: "DarkSlateGrey", markerType: "cross" },
// 			{ y: 500 },
// 			{ y: 480 },
//             { y: 510 }
//             //{label: "apple",  y: 10} label表示x軸的顯示名字
// 		]
// 	}]
// });
// chart.render();

// }
</script>



</div>     
</div>
</div>
<jsp:include page="/fragment/footerMVC.jsp" />  
</body>
</html>