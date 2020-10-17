<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有方案</title>
</head>
<style>
.btns{
	height:50px;
	width:800px;
}

</style>
<body>
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/topMVC.jsp" />
<jsp:include page="../partner_h/fragment/partnerSidebar.jsp" />
		<!-- cards -------------------------------------------------- -->
	<div class="container col-9">
		<div class="row">
		<div class='btns'>
			<a class="btn btn-primary" href="<c:url value='/_06_Program/addProgram'/>" role="button">新增方案&nbsp;</a>
			<a class="btn btn-light" href="<c:url value='/_06_Program/programManagement'/>" role="button">方案管理</a>
		</div>
			<c:forEach varStatus="stVar" var="program" items="${programList}">
				<div class="col-lg-4 col-md-6 col-12 mb-4 ">
					<div class="card border-info mb-3 shadow" style="max-width: 18rem;">
						
						<div class="card-body  text-info">
							<img src="<c:url value='/_06_Program/getProgramImage/${program.prm_Id}'/>" class='w-100' >
							<h5 class="card-title">${program.prm_Title}</h5>
							<p class="card-text">
								NT$
								${program.prm_Price}
<%-- 								<fmt:formatNumber value="${program.prm_Price}" pattern="####" /> --%>
								元
								<br>
								服務內容:<br>
								${program.prm_Content}<br>
								內容說明:<br>
								${program.prm_Detail}<br>
								${program.prm_Status}<br>
								${program.prm_Createdate}<br>
							</p>
<%-- 							<a href="<c:url value='/_06_Program/ProgramDetail/${program.prm_Id}' />" --%>
<!--     							class="btn btn-outline-danger"> -->
<!--     							<span class="glyphicon-info-sigh glyphicon"></span>詳細資料 -->
<!--  							</a> -->
 							<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#exampleModal">
  							詳細內容
							</button>
						</div>
					</div>
				</div>
							<!-- Button trigger modal -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">詳細內容</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       		
		
				<h4><img height='80px'
	src="<c:url value='/getPartnerCoverImage/${program.partnerBean2.p_id}'/>" width="80px" class='partnerIcon'>${program.partnerBean2.p_storeName}</h4>
				<h3>${portfolio.pfmName}</h3>
				<h3 class='col-12'>方案名稱:${program.prm_Title}</h3>
				<p>方案類別: ${program.prm_Category}</p>
				<p>方案內容: ${program.prm_Content}</p>
				<p>方案說明: ${program.prm_Detail}</p>
				<p>方案價格: ${program.prm_Price}</p>
				
	<div>
				
			</div>
		      </div>
		      <div class="modal-footer">
		       
		      </div>
		    </div>
		  </div>
		</div>
				
			</c:forEach>
		</div>
	</div>
	
</div>
</div>	
</body>
</html>