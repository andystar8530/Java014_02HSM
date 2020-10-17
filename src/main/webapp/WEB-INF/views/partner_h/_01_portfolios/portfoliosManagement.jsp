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
  <!-- JS dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
<!--    bootstrap  -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  <!-- bootbox code -->  
	<script src='https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.4.0/bootbox.min.js'></script>
<script>
window.onload= function(){
	var xhr = new XMLHttpRequest();
	var url = "<c:url value = '/getPfListByPartnerId'/>"
	var pfmIdVal  = null;
	xhr.open("GET", url , true);

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var content = "<table border='1' colspan='8' class='mx-auto table table-hover m-2 table-bordered' >";
			content += " <thead><tr>"
						+ "<th width='40' scope='col'>編輯</th>"
						+ "<th width='40' scope='col'>圖片+/- </th>"
						+ "<th width='40  scope='col'>名稱</th>"
						+ "<th width='60' scope='col'>資訊</th>"
						+ "<th width='80' scope='col'>作品集分類</th>"
						+ "<th width='50' scope='col'>建立時間</th>"
						+ "<th width='50' scope='col'>最後修改時間</th>"
						+ "<th width='40' scope='col'>刪除</th>"
						+"</tr></thead><tbody>";
			var portfolios = JSON.parse(xhr.responseText);
			for(var i = 0 ; i < portfolios.length ; i++){
				
				var d1 = new Date(portfolios[i].pfUpdateTime);
				var d2 = new Date(portfolios[i].pfUpdateTime);
// 				var portfoliosItem = portfolios[i];
				content +=  "<tr><td width='40' scope='row'><a href='portfolioEdit/" + portfolios[i].pfmId + "'>"
				      		+ "<img width='36' height='36' src='<c:url value='/data/icon/pencil.png' />' ></a></td>"
				      		+"<td width='40' scope='row'><a href='portfolioPicEdit/" + portfolios[i].pfmId + "'>"
				      		+ "<img width='36' height='36' src='<c:url value='/data/icon/add-photo.png' />' ></a></td>"
				      		+ "<td align='center' scope='row'>" + portfolios[i].pfmName + "</td>" 
				      		+ "<td align='center'>" + portfolios[i].pfmInfo + "</td>" 
				      		+ "<td width='80' align='center'>" + portfolios[i].pfService + "</td>" 
				      		+ "<td align='center'>" + formatDate(d1) + "</td>" 
				      		+ "<td align='center'>" + formatDate(d2) + "</td>"
				      		+ "<td width='40' scope='row'><a class ='deleteData' >"
				      		+ "<img width='36' height='36'  id='"+ portfolios[i].pfmId+"' src='<c:url value='/data/icon/trash.png' />' ></a></td></tr>" 

							 
				}
			content += "</tbody></table>";
			// var portfoliosItem = document.getElementById('portfoliosItem');
			portfoliosItem.innerHTML = content ; 
			//pfmIdVal = portfolios[i].pfmId.val();

				$('.deleteData').click(function(e){
// 					alert(this.parentNode.parentNode); <tr>
					console.log(this.parentNode.parentNode.parentNode.lastChild); 
					console.log(this.parentNode.firstChild.value); 
					console.log(this.parentNode.firstChild); 
					bootbox.confirm({
    					title: "確認刪除",
    					message: "確定要刪除這個作品集嗎" ,
    					buttons: {
        					cancel: {
            					label: '<i class="fa fa-times"></i> 取消'
       							 },
       						 confirm: {
           						 label: '<i class="fa fa-check"></i> 確定'
       							 }
  							  },
  						callback: function (result) {
  	  						if(result){
  	  	  						console.log(e.target);
  	  	  						console.log(e.target.id);
  	  	  						var idVal = e.target.id;
  	  	  						$.ajax({
										type:'DELETE',
										url:"<c:url value='/portfolio/' />" + idVal,
										data: JSON.stringify(portfoliosItem), 
										dataType:'json',
										complete: function(data){
											alert('刪除成功');
											window.location.href="http://localhost:8080/Java014_02HSM/showPortfoliosManagement";
											}
										  })
  	  	  					}else{
       								;
  	  	  						}
    						}
						});
			})
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
<a href="<c:url value='/portfoliosByPartnerId'/>" class="text-center p-1" >回前頁</a>
	<!-- ---------------------------分隔線---------------------------------------			 -->

	<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>