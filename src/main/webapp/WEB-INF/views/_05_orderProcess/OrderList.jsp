<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單列表</title>
<style type="text/css">
#borderA {
	border: 1px solid black;
}
</style>
</head>
<body>
	<c:set var="funcName" value="ORD" scope="session" />

	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />
	<p />
	<div class="m-5">
		<div class="m-5">

			<!-- 	<table style="margin-left:auto; margin-right:auto; width:810; background:#F5EBFF; border:2px solid blue; border-style: outset; "> -->
			<table class="table table-striped">

				<tr id='borderA' height='50'>
					<th id='borderA' colspan="5" align="center">${LoginOK.m_Name}的訂購紀錄</th>
				</tr>
				<tr id='borderA' height='36' scope="row">
					<th id='borderA'>訂單編號</th>
					<th id='borderA'>訂購日期</th>
					<th id='borderA'>總金額</th>
					<th id='borderA'>送貨地址</th>
					<th id='borderA'>訂單狀態</th>
				</tr>
				<c:forEach var="anOrderBean" varStatus="stat"
					items="${memberOrders}">
					<TR id='borderA' height='30' scope="row">
						<TD id='borderA' width="86" align="center"><a
							href='<c:url value='orderDetail?m_No=${LoginOK.m_No}&orderNo=${anOrderBean.s_OrderNo}' />'>
								${anOrderBean.s_OrderNo} </a></TD>
						<%-- 			<TD id='borderA' width="100" align="center">${anOrderBean.s_OrderDate}</TD> --%>
						<TD id='borderA' width="100" align="center"><fmt:formatDate
								value='${anOrderBean.s_OrderDate}' type='date' /></TD>
						<%-- 			<TD id='borderA' width="80" align="right">${anOrderBean.s_OrderSum}</TD> --%>
						<TD id='borderA' width="80" align="right"><fmt:formatNumber
								value="${anOrderBean.s_OrderSum}" pattern="#,###,###" />元</TD>
						<TD id='borderA' width="380" align="left">&nbsp;${anOrderBean.s_M_Address}</TD>
						<TD id='borderA' width="80" align="left">&nbsp; <c:if
								test="${anOrderBean.s_Status ==0}">收到訂單</c:if> <c:if
								test="${anOrderBean.s_Status ==1}">撿貨</c:if> <c:if
								test="${anOrderBean.s_Status ==2}">理貨</c:if> <c:if
								test="${anOrderBean.s_Status ==3}">出貨</c:if> <c:if
								test="${anOrderBean.s_Status ==4}">已送達</c:if>
						</TD>

					</TR>
				</c:forEach>
				<tr height='36' id='borderA'>
					<td id='borderA' align="center" colspan="5"><a
						href="<c:url value='/' />">回首頁</a></td>
				</tr>
			</TABLE>
		</div>
	</div>
	
		<!-- ---------------------------分隔線---------------------------------------			 -->
	<jsp:include page="/fragment/footerMVC.jsp" />

</body>
</html>