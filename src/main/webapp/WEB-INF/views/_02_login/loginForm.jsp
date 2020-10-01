<%--
	執行本網頁之前，會先執行_02_login.filter.FindUserPassword.java這個過濾器。執行過濾器目的
	在檢視請求物件是否含有帳號與密碼等資料。
	  
        本網頁 login.jsp 提供登入的畫面，讓使用者輸入帳號與密碼。輸入完畢後，按下Submit按鈕，瀏覽器
        會帳號與密碼給  <Form>標籤action屬性對應的程式: _02_login.controller.LoginServlet.java，
        由該Servlet來檢查帳號與密碼是否正確。
            
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>登入</title>
<style type="text/css">
.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}
</style>
<script type="text/javascript">
	//由<body>的onLoad事件處理函數觸發此函數
	function setFocusToUserId() {
		document.forms[0].userId.focus(); // 將游標放在userId欄位內
	}
</script>
</head>
<body onLoad="setFocusToUserId()">
	<!-- 下列敘述設定變數funcName的值為LOG，top.jsp 會用到此變數 -->
	<c:set var="funcName" value="LOG" scope="session" />
	<c:set var="msg" value="登入" />
	<c:if test="${ ! empty sessionScope.timeOut }">
		<!-- 表示使用逾時，重新登入 -->
		<c:set var="msg"
			value="<font color='red'>${sessionScope.timeOut}</font>" />
	</c:if>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topMVC.jsp" />
	<!-- 新的登入表 -->
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow border-0 rounded-lg mt-5 mb-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">${msg}</h3>
								</div>
									<div class="card-body">
								<form:form method="POST" modelAttribute="loginBean">
										<div class="form-group">
											<label for="exampleInputEmail1">Email 帳號</label>

											<form:input path="userId" size="10"
												placeholder="請輸入 Email 帳號" class="form-control" />
											<form:errors path="userId" cssClass="error" />
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">密碼</label>
											<form:input type="password" path="password"
												placeholder="請輸入密碼" class="form-control" />
											<form:errors path="password" cssClass="error" />
										</div>
										<div class="form-group form-check">
											<form:checkbox path="rememberMe" class="form-check-input" />
											<label class="form-check-label" for="exampleCheck1">記住密碼</label>
										</div>
<!-- 										<input type="submit" class="btn btn-primary" value="提交"> -->
										<button type="submit" class="btn btn-primary">登入</button>
									</div>

									<div class="card-footer text-center">
										<div class="small">
											<form:errors path="invalidCredentials" cssClass="error" />
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>


	<!-- 舊的登入表 -->
	<!-- 
<form:form method="POST" modelAttribute="loginBean">
  <div id='content'>
    <Table  style="border-width:2; background:#E0E0E0; width: 500px;
                        border-style:inset; border-color:#EF02A4;">
         <TR>
             <TH width="180">&nbsp;</TH>
             <TH width="180">&nbsp;</TH>
         </TR>
         <TR>
             <TD colspan='2' align="CENTER" style="font-size:0.6cm;font-weight: 300;"> 
                <Font color="#006600" face="標楷體">
                    ${AppName}
                </Font>
             </TD>
         </TR>
         <TR>
             <TD height='50' colspan='2' align="CENTER" style="font-size:0.5cm;font-weight: 300;"> 
                <Font color="#006600"  face="標楷體">
                    ${msg}<br>
                    
                </Font>
             </TD>
         </TR>
         <TR height='20'>
             <TD align="CENTER" colspan='2'>
             	<form:errors  path="invalidCredentials" cssClass="error" />
             </TD>
         </TR>
         <TR height='20'>
             <TD align="CENTER" colspan='2'>
             	&nbsp;
             </TD>
         </TR>
         <TR>
             <TD width="180" align="right">帳號：　</TD>
             <TD width="180" colspan='2' align="LEFT">
	             <form:input  path="userId" size="10" /><br>
    	         <form:errors  path="userId" cssClass="error" /><br>
             </TD>
         </TR>
         <TR>
             <TD width="180" align="right">密碼：　</TD>
             <TD width="180" colspan='2' align="LEFT" >
             	<form:input  type="password" path="password"  />
             	<form:errors  path="password" cssClass="error" /><br>
             </TD>
             
         </TR>  
         <tr>
         <TD width="180" align="right" >
             <form:checkbox path="rememberMe"   />
         </TD>
         <TD width="180"  colspan='2' align="left"><small>記住密碼</small></TD>
         </tr>
         <TR height='10'>
             <TD> &nbsp;</TD>
         </TR>
        <TR>
            <TD colspan="2" align="center"><input type="submit" value="提交"> </TD>
         </TR>
         <TR height='10'>
             <TD align="CENTER" colspan='2'>&nbsp;</TD>
         </TR>
    </Table>
  </div>
</form:form>
 -->
  <!-- 引入共同的頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>