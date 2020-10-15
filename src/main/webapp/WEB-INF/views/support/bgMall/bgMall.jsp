<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商城</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css ">

<style>
list-group-item>img {
	width: 20px;
}

#content {
	width: 820px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />
	<jsp:include page="/WEB-INF/views/support/supFragment/bgNavbar2.jsp" />
		
		<div class="col-lg-9 mb-4">
<!-- 			<a class="btn btn-outline-primary" href="#" role="button">Active</a> -->
<!-- 			<a class="btn btn-outline-secondary" href="#" role="button">篩選</a> -->
<!-- 			 <a class="btn btn-outline-warning" href="#" role="button">新增</a> -->
			  <a class="btn btn-outline-info"
				href="<c:url value='/support/bgMallAdd' />" role="button">新增</a>

			<form class="form-inline my-2 my-lg-0" style='float: right;'>
				<input class="form-control mr-sm-2" type="search"
					placeholder="品名/種類/金額" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<table border='1' colspan='8'
				class="table table-hover mx-auto m-2 table-bordered">
				<thead>
					<tr>
						<th scope="col" width='30' class='text-center'>編號</th>
						<th scope="col" width='40' class='text-center'>銷量</th>
						<th scope="col" width='30' class='text-center'>圖片</th>
						<th scope="col" width='50' class='text-center'>品名</th>
						<th scope="col" width='120' class='text-center'>內容</th>
						<th scope="col" width='30' class='text-center'>創建日期</th>
						<th scope="col" width='30' class='text-center'>最後修改</th>
						<th scope="col" width='30' class='text-center'>刪除</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var='product' items="${supProducts_DPP}">
						<tr>
							<td width='30' class="text-center">
								<div
									onclick="location.href='<c:url value="/support/bgMallUpdate/${product.value.p_Id}"/>';"
									style="cursor: pointer;">${product.value.p_Id}
									<input id='p_id' type="hidden" name='p_id'
										value="${product.value.p_Id}"> <br> <a
										href="<c:url value='/support/bgMallUpdate/${product.value.p_Id}'/>"><img
										src="<c:url value='/data/icon/document.png' />" width="50"
										style="display: inline;">
								</div>
							</td>
							<td width='30'>售出:${product.value.p_Sdqty}</td>
							<td width='30'>
								<div class='d-flex justify-content-center'>
									<img height='100' width='80'
										src="<c:url value='/_00_init/getProductImage?id=${product.value.p_Id}' />">
								</div>
							</td>

							<td width='50'>
								<div class='text-center'>${product.value.p_Name}</div>

							</td>
							<td width='120'><div class='JQellipsis'>${product.value.p_Note}</div>
								<button type="button" class="btn btn-light" data-toggle="modal"
									data-target="#exampleModal${product.value.p_Id}">詳細資料
								</button></td>
							<td width='30'>
								<div class='text-center'>
									<fmt:formatDate value="${product.value.p_CreateTime}"
										type="date" />
								</div>
							</td>
							<td width='30'>
								<div class='text-center'>
									<fmt:formatDate value="${product.value.p_UpdataTime}"
										type="date" />
								</div>
							</td>

							<td width='30'>
								<div class='d-flex justify-content-center align-items-center'>
									<a><img src="<c:url value='/data/icon/trash.png'/> "
										width='40px;' id="${product.value.p_Id}" class='deleteIcon'></a>
								</div>

							</td>

							<!-- 							modal	 -->
							<div class="modal fade" id="exampleModal${product.value.p_Id}"
								tabindex="-1"
								aria-labelledby="exampleModalLabel${product.value.p_Id}"
								aria-hidden="true">
								<div class="modal-dialog modal-xl">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title"
												id="exampleModalLabel${product.value.p_Id}">商品資料</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="row">
												<div class="col-md-6">
													<h3>${product.value.p_Name}</h3>
													<p>分類: ${product.value.p_Category}</p>
													<p>單價: ${product.value.p_Price}</p>
													<p>敘述: ${product.value.p_Note}</p>
													<p>
														<strong>商品編號: </strong> <span class='label label-warning'>
															${product.value.p_Id} </span>
													</p>

													</FORM>
													</p>

												</div>
												<div class="col-md-6">
													<img
														src="${pageContext.servletContext.contextPath}/_00_init/getProductImage?id=${product.value.p_Id}"
														class="card-img-top" alt="..." />
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="row  ml-auto mr-auto">
												<div class="col-4">
													<img
														src="<c:url value='/support/p_Pic1?id=${product.value.p_Id}'/>"
														style="max-width: 300px" />
												</div>
												<div class="col-4">
													<img
														src="<c:url value='/support/productImage2?id=${product.value.p_Id}'/>"
														style="max-width: 300px" />
												</div>
												<div class="col-4">
													<img
														src="<c:url value='/support/productImage3?id=${product.value.p_Id}'/>"
														style="max-width: 300px" />
												</div>
											</div>
											<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
											<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
										</div>
									</div>
								</div>
							</div>
					</c:forEach>

				</tbody>
			</table>
					<!-- 	尾端選擇按鈕 -->
		<div class="bgEndNav mt-auto p-2 bd-highlight">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center mb-0">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">第${MallpageNo}頁</a></li>
					<c:if test="${MallpageNo >= 1}">
						<c:forEach var="x" begin="1" end="${MalltotalPages}">
							<c:if
								test="${x>=MallpageNo-2 && x<=5 || x<=MallpageNo+2 && x>MalltotalPages-5}">
								<li class="page-item  page-item-weight"><a
									class="page-link"
									href="<c:url value='/support/bgMall?MallpageNo=${x}' />">${x}</a></li>
							</c:if>
						</c:forEach>
					</c:if>
					<li class="page-item disabled"><a class="page-link"
						tabindex="-1" aria-disabled="true"> 共${MalltotalPages}頁</a></li>
				</ul>
			</nav>

		</div>
	</div>
	<!-- 	尾端選擇按鈕結束 -->
	</div>
	
	</div>
	</div>

<!-- 			</div> -->

	<!-- 	</section> -->

	<!-- </div> -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script>
		$(function() {
			var len = 30;
			$(".JQellipsis").each(function(i) {
				if ($(this).text().length > len) {
					$(this).attr("title", $(this).text());
					var text = $(this).text().substring(0, len - 1) + "...";
					$(this).text(text);
				}
			});
		});
	</script>
	<script>
		$('.deleteIcon').click(
				function(e) {
					var p_id = e.target.id;
					console.log(p_id);
					console.log(e.target);
					if (confirm("是否要刪除?")) {
						$('.deleteIcon').parent().attr(
								'href',
								'<c:url value="/support/bgMallDelete/" />'
										+ p_id);
					}
				});
	</script>
</body>
</html>
