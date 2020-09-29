<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>個人訂單明細</title>
<style type="text/css">
#main {
	position: absolute;
	top: 110px;
	left: 210px;
}

#borderA {
	border: 1px solid black;
}
</style>
</head>
<body style="background: #EBFFEB;">
	<jsp:include page="/fragment/topMVC.jsp" />
	<p />
	<TABLE style="margin-left: 10%; margin-right: 10%; background: #F0E4F4; border: 1px blue solid;">
		<tr id='borderA' height='50'>
			<th id='borderA' align="center" colspan="5"><h3>${LoginOK.m_Name}的訂單明細</h3></th>
		</tr>
		<tr id='borderA' height='36'>
			<td colspan="5">
				<table width="100%">
					<tr id='borderA'>
						<td align="Left" width="350px">
							<b>出貨地址：</b>${SaleOrderBean.s_M_Address}
						</td>
						<td align="center" width="300px">
							<b>訂購日期：</b><fmt:formatDate value='${SaleOrderBean.s_OrderDate}' type='date'/>
						</td>
						<td align="center" width="280px">
							<b>訂單編號：</b>${SaleOrderBean.s_OrderNo}
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr id='borderA' height='36'>
			<th id='borderA' width="100px" align="center">書籍編號</th>
			<th id='borderA' width="400px" align="center">書籍資訊</th>
			<th id='borderA' width="70px" align="center">單價</th>
			<th id='borderA' width="50px" align="center">數量</th>
			<th id='borderA' width="100px" align="center">總價</th>
<!-- 			<th id='borderA' width="80px" align="center">折扣</th> -->
<!-- 			<th id='borderA' width="100px" align="center">售價</th> -->
		</tr>
		<c:set var="subtotal" value="0" />
		<c:forEach var="aBean" varStatus="stat" items="${SaleOrderBean.items}">
			<c:choose>
				<c:when test="${ stat.count % 2 == 0 }">
					<c:set var="aColor" value="#E6FFA0" />
				</c:when>
				<c:otherwise>
					<c:set var="aColor" value="#EBFFEB" />
				</c:otherwise>
			</c:choose>
			<tr id='borderA' bgColor="${aColor}" height='30'>
				<td id='borderA' align="center">${aBean.soi_P_Id}</td>
				<td id='borderA' align="left">${aBean.soiDescription}</td>
				<td id='borderA' align="right">${aBean.soiPrice}&nbsp;</td>
				<td id='borderA' align="right">${aBean.soiQty}&nbsp;</td>
				<td id='borderA' align="right">${aBean.soiPrice*aBean.soiQty}&nbsp;</td>
<%-- 				<td id='borderA' align="center">${aBean.soiDiscount}&nbsp;</td> --%>
<%-- 				<td id='borderA' align="right"><fmt:formatNumber --%>
<%-- 						value="${aBean.soiPrice*aBean.soiDiscount*aBean.soiQty}" --%>
<%-- 						pattern="#,###,###" />元</td> --%>
				<c:set var="subtotal"
					value="${ subtotal + aBean.soiPrice * aBean.soiQty }" />
			</tr>
		</c:forEach>
		<tr height='30' >
			<TD id='borderA' align="center" rowspan="3" colspan="3">&nbsp;</TD>
			<TD id='borderA' width="60px" align="center"><b>合 計</b></TD>
			<TD id='borderA' width="100px" align="right">
			   <fmt:formatNumber value="${subtotal}" pattern="#,###,###" />元</TD>
		</tr>
		<tr height='30'>
			<TD id='borderA' width="60px" align="center"><b>營業稅</b></TD>
			<c:set var="VAT" value="${subtotal*0.05 + 0.0001}" />
			<TD id='borderA' width="100px" align="right">
			   <fmt:formatNumber value="${VAT}" pattern="#,###,###" />元</TD>
		</tr>
		<tr height='30'>
			<TD id='borderA' width="60px" align="center"><b>總金額</b></TD>
			<TD id='borderA' width="100px" align="right">
			    <fmt:formatNumber value="${SaleOrderBean.s_OrderSum}" pattern="#,###,###" />元</TD>
		</tr>
	</TABLE>
	<p />

	<div style="text-align: center">
		<a href="<c:url value='orderList' />">回上一頁</a>&nbsp;&nbsp;
		<a href="<c:url value='/' />">回首頁</a>
	</div>
</body>
</html>
