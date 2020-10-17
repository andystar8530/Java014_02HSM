<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>方案管理頁面</title>
</head>
<style>
.deleteIcon,.editicon{
	width:35px;
	margin:0px auto;
}
.editImage{
	width:50px;
}
td{vertical-align: middle !important;}
</style>
 <!-- JS dependencies -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
 <!--    bootstrap  -->
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
   <!-- bootbox code -->  
   <script src='https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.4.0/bootbox.min.js'></script>

<body>
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/topMVC.jsp" />
<h2 class='text-center'>方案管理<a class="btn btn-outline-dark  btn-sm" href="<c:url value='/_06_Program/showProgramsByPid/${partnerBean.p_id}'/>" role="button">回前頁</a></h2>
<div class="col-11">
    <table border='1' colspan='10' class="table table-hover ml-5  table-bordered">
        <thead>
              <tr>
                <th scope="col">編輯</th>
                <th scope="col">封面圖</th>      
                <th scope="col">名稱</th>
                <th scope="col">內容</th>
                <th scope="col">類別</th>
                <th scope="col">價格</th>
                <th scope="col">審核狀態</th>
                <th scope="col">最後修改時間</th>
                <th scope="col">建立時間</th>
                <th scope="col">刪除</th>
              </tr>
        </thead>
        <tbody>
          <c:forEach var='program' items="${programList}">
              <tr>
                <td>
                  <a href="<c:url value='/_06_Program/editProgram/${program.prm_Id}'/>" ><img src="<c:url value='/data/icon/edit-pen.png'/>" 
                  class='editicon'></a>
                </td>
                <td><img src="<c:url value='/_06_Program/getProgramImage/${program.prm_Id}'/>" 
                  class='editImage'></td>
                <td>${program.prm_Title}</td> 
                <td>${program.prm_Category}</td>
                <td>${program.prm_Price}</td> 
                <td>${program.prm_Createdate}</td>
                <td>${program.prm_Editdate}</td>
                <td>
                  <a><img src="<c:url value='/data/icon/trash.png'/>" id="${program.prm_Id}"
                  class='deleteIcon'></a>
                </td>
          </c:forEach>

      </tbody>
    </table>
</div>	

<script>
$('.deleteIcon').click(function(e){
//		alert(this.parentNode.parentNode); <tr>
	console.log(this.parentNode.parentNode.parentNode.lastChild); 
	console.log(this.parentNode.firstChild.value); 
	console.log(this.parentNode.firstChild); 
  var idVal = e.target.id;
	bootbox.confirm({
		title: "確認刪除",
		message: "確定要刪除這個方案嗎" ,
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
          var idVal = e.target.id;
          $.ajax({
										type:'DELETE',
										url:"<c:url value='/_06_Program/deleteProgram/' />" + idVal,
										dataType:'json',
										complete: function(data){
											alert('刪除成功');
											window.location.href="http://localhost:8080/Java014_02HSM/_06_Program/programManagement";
											}
										  })
					}else{
						;
						}
			}
		});
})

</script>	
</body>
</html>