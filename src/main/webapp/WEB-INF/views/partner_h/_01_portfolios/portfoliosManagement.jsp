<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>作品集管理</title>
<style>

.table-hover>tbody>tr:hover {
    background-color: #e9ecef!important;
}

</style>
</head>
<script>
window.onload= function(){
	var xhr = new XMLHttpRequest();
	var url = "<c:url value = '/getPfListByPartnerId'/>"
	xhr.open("GET", url , true);

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var content = "<table border='1' colspan='6' class='mx-auto table table-hover m-2 table-bordered' >";
			content += " <thead><tr>"
						+ "<th width='40' scope='col'>編輯</th>"
						+ "<th width='40  scope='col'>名稱</th>"
						+ "<th width='60' scope='col'>資訊</th>"
						+ "<th width='30' scope='col'>作品集分類</th>"
						+ "<th width='50' scope='col'>建立時間</th>"
						+ "<th width='50' scope='col'>最後修改時間</th>"
						+"</tr></thead><tbody>";
			var portfolios = JSON.parse(xhr.responseText);
			for(var i = 0 ; i < portfolios.length ; i++){

			var d1 = new Date(portfolios[i].pfUpdateTime);
// 			console.log(formatDate(d1));
			var d2 = new Date(portfolios[i].pfUpdateTime);
// 			console.log(formatDate(d2));
			
				content +=  "<tr><td width='40' scope='row'><a href='portfolioEdit/" + portfolios[i].pfmId + "'>"
				      		+ "<img width='36' height='36' src='<c:url value='/data/icon/edit.png' />' ></a></td>"
				      		+ "<td align='center' scope='row'>" + portfolios[i].pfmName + "</td>" 
				      		+ "<td align='center'>" + portfolios[i].pfmInfo + "</td>" 
				      		+ "<td align='center'>" + portfolios[i].pfService + "</td>" 
				      		+ "<td align='center'>" + formatDate(d1) + "</td>" 
				      		+ "<td align='center'>" + formatDate(d2) + "</td></tr>" 
				}
			content += "</tbody></table>";
			var portfoliosItem = document.getElementById('portfoliosItem');
			portfoliosItem.innerHTML = content ; 

			}
		}
			xhr.send();
		

}


function formatDate(now) {
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var date = now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
}


</script>

<body>
<jsp:include page="/fragment/topMVC.jsp" />
<div class="text-center p-1"  >
	<h2 class="text-center">作品集資料</h2>
	<hr>
	<div class='center'  id='portfoliosItem'></div>
</div>
<a href="<c:url value='/displayPartner'/>" class="text-center p-1" >回前頁</a>

</body>
</html>