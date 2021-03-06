<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
winidow.onload()
function cancelOrder() {
	if (confirm("確定取消此份訂單 ? ") ) {
		// 接收此資料的Servlet會使用 finalDecision 參數的值
		document.forms[0].finalDecision.value = "CANCEL";
		document.forms[0].action="<c:url value='cancelOrder' />";
		document.forms[0].method="GET";
		document.forms[0].submit();
		return;
	} else {
		return;
	}
}
function reconfirmOrder() {
	var sa = document.getElementById('ShippingAddress').value;
	if  (sa === "") {
		window.alert ('出貨地址不能是空白');
		return ; 
	}
	if (confirm("確定送出此份訂單 ? ") ) {
		// 接收此資料的Servlet會使用 finalDecision 參數的值
		document.forms[0].finalDecision.value = "ORDER";
		document.forms[0].action="<c:url value='ProcessOrder' />";
		document.forms[0].method="POST";
		document.forms[0].submit();
		return;
	} else {
		return;
	}
}
</script>

    <!-- Inport CSS End--------------------------------------------------------------------->

    <link
      rel="stylesheet"
      href="<c:url value='/css/shoppingList_2.css' />"
    />

<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean   id="today"  class="java.util.Date" scope="session"/> 
<title>訂單明細資訊確認</title>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<c:set var="funcName" value="CHE" scope="session"/>
<div style="text-align:center">
<!-- 新頁面_開始 -->
<!-- Banner ---------------------------------------------------------------------------->

    <div
      class="container-fliid bannerImg d-flex justify-content-center align-items-center"
      id="imageStellar"
      data-stellar-background-ratio="0.5"
    >
      <div class="row ">
        <div class="col-lg-12 text-center">
          <h1 class="mt-3 bannerTitle animate__animated animate__fadeInDown">
            確認訂單
          </h1>
          <div
            class="align-items-center banner-text animate__animated animate__fadeInUp"
          >
            <h5 class="text-center">
              超多特惠商品，週週下殺便宜精選。
            </h5>
          </div>
        </div>
      </div>
    </div>

    <!-- Banner End------------------------------------------------------------------------->



<!-- Product Detail Start -------------------------------------------------------------->
<c:set var="VAT" value="${ShoppingCart.subtotal*0.05 + 0.0001}"/>
<FORM action="<c:url value='preProcessOrder' />" method="POST" >
    <div class="accordion container mt-5 mb-4">
      <div class="contentBx active">
        <!-- 訂單明細標題 -->
        <div class="row label">
          <div
            class="col-lg-12 d-flex justify-content-between align-items-center py-3"
          >
            <div class="ml-5 productListNameHead">訂單明細</div>
            <div class="productListNameHead">
              總計 <span class="pr-3 listTotalPrice"><fmt:formatNumber value="${ShoppingCart.subtotal + VAT }" pattern="#,###,###" />元</span>
            </div>
          </div>
        </div>
        <!-- 訂單明細標題 End-->
        <!-- 欄位名稱 -->
        <div class="content row mb-0">
          <div
            class="col-lg-8 col-8 d-flex justify-content-center align-items-center shoppingListNameText"
          >
            商品
          </div>

          <div
            class="col-lg-2 col-2 d-flex justify-content-center align-items-center shoppingListNameText"
          >
            數量
          </div>
          <div
            class="col-lg-2 col-2 d-flex justify-content-center align-items-center shoppingListNameText"
          >
            價格
          </div>
        </div>
        <!-- 欄位名稱 End-->
        <!-- 商品細項1 -->
        <c:forEach varStatus="vs" var="entry" items="${ShoppingCart.content}">
        <div class="content row">
          <div
            class="col-lg-8 col-8 d-flex justify-content-center align-items-center productListNameText"
          >
            ${entry.value.soiTitle}
          </div>

          <div
            class="col-lg-2 col-2 d-flex justify-content-center align-items-center productListNameText"
          >
            ${entry.value.soiQty}
          </div>
          <div
            class="col-lg-2 col-2 d-flex justify-content-center align-items-center productListNameText"
          >
            $<fmt:formatNumber 
          	value="${entry.value.soiPrice * entry.value.soiQty}" pattern="#,###,###" />元
          </div>
        </div>
        </c:forEach>
        <!-- 商品細項1 -->
        
        <!-- 金額細項 -->
        <div class="content row">
          <div class="col-lg-12 col-12 text-right priceDetail pb-2 pr-5">
            總計：<fmt:formatNumber value="${ShoppingCart.subtotal}" pattern="#,###,###" />+<c:set var="VAT" value="${ShoppingCart.subtotal*0.05 + 0.0001}"/>
            <fmt:formatNumber value="${VAT}" pattern="#,###,###" />(營業稅0.05%) = 
            $<fmt:formatNumber value="${ShoppingCart.subtotal + VAT }" pattern="#,###,###" />元
          </div>
        </div>
        <!-- 金額細項 End-->
      </div>
    </div>
    <!-- Product Detail End ---------------------------------------------------------------->






    <!-- Customer Info Start---------------------------------------------------------------->
    
    
      <div class="container custInfo mb-4">
        <div class="row p-3">
          <!-- 左邊資料 Start-->
          <div class="col-md-6 px-3 custInfoLeft">
            <div
              class="row d-flex justify-content-center align-items-center  mb-4"
            > <h5 class="pb-4 pt-2 custInfoText "><i class="far fa-user custIcon"></i> 購買人資料</h5>
             <div class="col-12 pr-4">
                <div class="input-group mb-4">
                  <label for="">姓名</label>
                  <input
                    type="text"
                    name="name"
                    class="inputClass"
                    id="inputStyle"
                    value="${LoginOK.m_Name}"
                    disabled
                  />
                </div>
                <div class="input-group mb-4">
                  <label for="">手機號碼</label>
                  <input
                    type="tel"
                    name="name"
                    class="inputClass"
                    id="inputStyle"
                    value="${LoginOK.m_Phone}"
                    disabled
                  />
                </div>
                <div class="input-group mb-4">
                  <label for="">地址</label>
                  <input
                    type="email"
                    name="name"
                    class="inputClass"
                    id="inputStyle"
                    value="${LoginOK.m_Add}"
                    disabled
                  />
                </div>
                
              </div>
            </div>
          </div>
          <!-- 左邊資料 End -->
         <!-- 右邊資料 Start-->
         <div class="col-md-6 px-3 ">
          <div
            class="row d-flex justify-content-center align-items-center  mb-4"
          > <h5 class="pb-4 pt-2 custInfoText custInfoRightText"><i class="fas fa-user-check custIcon"></i> 收件地址(可修改)</h5>
           <div class="col-12 ml-md-2 ml-0 ">
              <div class="input-group mb-4 ">
                <label for="">發票抬頭</label>
                <Input class="inputClass" size="50" type="text" name="InvoiceTitle" value="" >
            
              </div>
              <div class="input-group mb-4">
                <label for="">統一編號</label>
				<Input class="inputClass" size="10" type="text" name="BNO" value="">
               
              </div>
              <div class="input-group mb-4">
                <label for="">地址</label>
			  <Input class="inputClass" size="60" type="text" id='ShippingAddress' 
                   name="ShippingAddress" value="${LoginOK.m_Add}">
                   <font color='red'>${errorMsg.ShippingAddress}</font>
              
              </div>
              
            </div>
          </div>
        </div>
        <!-- 右邊資料 End -->
        </div>
         <div class="row justify-content-center align-items-center">
        <div class="shoppingBtn col-lg-2 col-md-3 col-sm-6 col-xs-6 mt-3">
<!--           <a -->
<!--             href="#" -->
<!--             class="btn btnEffect02 effect02 mb-4 d-flex align-items-center justify-content-center" -->
<!--             ><div class="btnText1">提交訂單</div> -->
<!--             </a> -->
           <input type="hidden" name="finalDecision"  value="">   
            <input type="button" id="buy" value="確定結帳" class="btn btnEffect02 effect02 mb-4 d-flex align-items-center justify-content-center btnText1">
<!--    			<input type="button" name="OrderBtn"  value="確定送出" onclick="reconfirmOrder()" class="btn btnEffect02 effect02 mb-4 d-flex align-items-center justify-content-center btnText1"> -->
   			<input type="button" name="CancelBtn" value="取消訂單" onclick="cancelOrder()" class="btn btnEffect02 effect02 mb-4 d-flex align-items-center justify-content-center btnText1">
        </div>
      </div>
      </div>
     </FORM>
    <!-- Customer Info End ----------------------------------------------------------------->

<!-- 新頁面_結束 -->
<!-- <h3>請確認下列訊息：</h3> -->
<%-- <FORM style="margin: 0 auto; width:750px;" action="<c:url value='preProcessOrder' />" method="POST" > --%>
<!--    <TABLE border='1' style="background:#F5EBFF; border-color:rgb( 100, 100, 255); border-style: outset; width:810;"> -->
<!--       <TR > -->
<!--          <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<%--          	會員編號：${LoginOK.m_No} --%>
<!--          </TD> -->
<!--          <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<%--          	客戶姓名：${LoginOK.m_Name} --%>
<!--          </TD> -->
<!--          <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<%--          	訂單日期：<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/> --%>
<!--          </TD> -->
<!--       </TR> -->
<!--       <TR> -->
<!--          <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<%--          	會員地址：${LoginOK.m_Add} --%>
<!--          </TD> -->
<!--       </TR> -->
<!--       <TR> -->
<!--          <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<!--                              出貨地址：<Input style="background:#ECFFCD;" size="60" type="text" id='ShippingAddress'  -->
<%--                    name="ShippingAddress" value="${LoginOK.m_Add}"> --%>
<%--                    <font color='red'>${errorMsg.ShippingAddress}</font> --%>
<!--          </TD> -->
<!--       </TR> -->
<!--       <TR> -->
<!--          <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<!--                                    統一編號：<Input style="background:#ECFFCD;" size="10" type="text"  -->
<!--                       name="BNO" value=""> -->
<!--          </TD> -->
<!--       </TR> -->
<!--       <TR> -->
<!--          <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<!--                                    發票抬頭：<Input style="background:#ECFFCD;" size="50" type="text"  -->
<%--                       name="InvoiceTitle" value="${LoginOK.m_Name}" > --%>
<!--          </TD> -->
<!--       </TR> -->
    
<!--       <TR> -->
<!--          <TD colspan='3'> -->
         
<!--    <TABLE border='1' style="background:#FFE7CD; border-color:rgb( 100, 100, 255); " > -->
      
<!--      <TR><TH style="text-align:center;font-size: 12pt;" >商品名稱</TH> -->
<!--          <TH style="text-align:center;font-size: 12pt;" >商品類別</TH> -->
<!--          <TH style="text-align:center;font-size: 12pt;" >簡述</TH> -->
<!--          <TH style="text-align:center;font-size: 12pt;" >單價</TH> -->
<!--          <TH style="text-align:center;font-size: 12pt;" >數量</TH> -->
<!--          <TH style="text-align:center;font-size: 12pt;" >小計</TH></TR> -->
     
<%--      <c:forEach varStatus="vs" var="entry" items="${ShoppingCart.content}"> --%>
                                                    
<!--         <TR height='16'> -->
<%--           <TD style="text-align:left  ;font-size: 11pt;">${entry.value.soiTitle}</TD> --%>
<!--           <TD style="text-align:center;font-size: 11pt;"> -->
<%--           	${entry.value.soiCategory} --%>
<!--           </TD> -->
<!--           <TD style="text-align:center;font-size: 11pt;"> -->
<%--           	${fn:substring(entry.value.soiDescription, 0, 20)} --%>
<!--           </TD> -->
<!--           <TD style="text-align:right ;font-size: 11pt;"> -->
<%--           	<fmt:formatNumber value="${entry.value.soiPrice }" pattern="#,###" />元 --%>
<!--           </TD> -->
<!--           <TD style="text-align:right ;font-size: 11pt;">  -->
<%--           	${entry.value.soiQty} --%>
<!--           </TD> -->
<!--           <TD style="text-align:right ;font-size: 11pt;"> -->
<%--           	<fmt:formatNumber  --%>
<%--           	value="${entry.value.soiPrice * entry.value.soiQty}" pattern="#,###,###" />元 --%>
<!--           </TD> -->
<!--         </TR> -->
<%--      </c:forEach> --%>
     
<!--         <TR height='16'> -->
<!--           <TD style="text-align:right;font-size: 11pt;" colspan='5' >合計金額：</TD> -->
<!--           <TD style="text-align:right;font-size: 11pt;" > -->
<%--           <fmt:formatNumber value="${ShoppingCart.subtotal}" pattern="#,###,###" />元</TD> --%>
                  
<!--         </TR> -->
<!--         <TR> -->
<!--           <TD colspan='5' style="text-align:right;font-size: 11pt;" >營業稅：</TD> -->
<%--           <c:set var="VAT" value="${ShoppingCart.subtotal*0.05 + 0.0001}"/> --%>
<!--           <TD style="text-align:right;font-size: 11pt;" >  -->
<%--           <fmt:formatNumber value="${VAT}" pattern="#,###,###" />元</TD> --%>
<!--         </TR> -->
<!--         <TR> -->
<!--           <TD colspan='5' style="text-align:right;font-size: 11pt;" >總計金額：</TD> -->
<!--           <TD style="text-align:right;font-size: 11pt;color:#AA0200;" > -->
<%--           <fmt:formatNumber value="${ShoppingCart.subtotal + VAT }" pattern="#,###,###" />元</TD> --%>
<!--         </TR> -->
<!--    </TABLE> -->
<!--           </TD> -->
<!--       </TR> -->
 
<!--    </TABLE><P/> -->
<!--    <input type="hidden" name="finalDecision"  value="">    -->
<!--    <input type="button" name="OrderBtn"  value="確定送出" onclick="reconfirmOrder()"> -->
<!--    <input type="button" name="CancelBtn" value="取消訂單" onclick="cancelOrder()"> -->
<!-- </FORM> -->
</div>
    <!-- 引入共同的頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />
	    <!-- JavaScript Plug-in End------------------------------------------------------------->
    <script src="<c:url value='/js/shoppingList_2.js' />"></script>
    
        <!-- icon -->
    <script
      src="https://kit.fontawesome.com/8e822d04fb.js"
      crossorigin="anonymous"
    ></script>
<!--     摸擬刷卡結帳開始 -->
<script src="https://storage.googleapis.com/prshim/v1/payment-shim.js"></script>

    <style type="text/css">
   #notice {
      margin: 10px 0px;
      background: rgba(0, 200, 0, 0.2);
      padding: 10px;
    }
    #res {
      background: rgba(0, 0, 0, 0.1);
      color: #333;
      padding: 10px;
    }
    #buy {
      margin-bottom: 10px;
    }
  </style>
  </head>
<!--   <body> -->
    <a href='https://github.com/aszx87410/payment-request-demo/blob/master/index.html' target='_blank'>source code</a>
    <div id="notice"></div>
<!--     <button id="buy">購買</button> -->
    <div>返回結果：</div>
    <pre id="res"></pre>
<!--   </body> -->
  <script>     
    var $res = document.querySelector('#res');
    var $notice = document.querySelector('#notice');
    var $buyBtn = document.querySelector('#buy');

    init();

    function init () {
      if (!window.PaymentRequest) {
        $notice.innerHTML = '不支援 PaymentRequest，請使用 Chrome 61（含）以上版本';
        $notice.style.background = 'rgba(200, 0, 0, 0.2)';
        return;
      }
      $notice.innerHTML = '支援 PaymentRequest，請按購買按鈕繼續（此網頁僅供測試使用，不會儲存或是傳送任何相關資訊，也不會真的結帳扣款，但還是建議不要輸入真實資訊）';
      $buyBtn.addEventListener('click', onClick);
    }

    function onClick () {
    	var sa = document.getElementById('ShippingAddress').value;
    	if  (sa === "") {
    		window.alert ('出貨地址不能是空白');
    		return ; 
    	}
        
      var request = createPaymentRequest();
      request.show().then(function(PaymentResponse) {
        handleResponse(PaymentResponse);
      }).catch(function(err) {
        console.log(err);
      });
    }

    function showResponse (response) {
      $res.innerHTML = JSON.stringify(response, undefined, 2);
    }

    function handleResponse (paymentResponse) {
      // 可以在這裡把結果回傳 server
      	document.forms[0].finalDecision.value = "ORDER";
		document.forms[0].action="<c:url value='ProcessOrder' />";
		document.forms[0].method="POST";
		document.forms[0].submit();
      
//       showResponse(paymentResponse);
      // 模擬 API 的延遲
      setTimeout(function () {
        paymentResponse.complete("success");
      }, 2000);
    }

    function createPaymentRequest () {
      var methodData = [{
        supportedMethods: ['basic-card'],
        data: {
          supportedNetworks: ['jcb', 'mastercard', 'visa'], 
          supportedTypes: ['debit', 'credit', 'prepaid']
        },
      }];
      var details = {
        displayItems: [
        	<c:forEach varStatus="vs" var="entry" items="${ShoppingCart.content}">
            {
                label: "${entry.value.soiTitle}共 ${entry.value.soiQty}個",
                amount: { currency: "TWD", value : "<fmt:formatNumber 
                  	value="${entry.value.soiPrice * entry.value.soiQty}" pattern="#######" />" }
              },
        	</c:forEach>

          {
            label: "營業稅0.05%",
            amount: { currency: "TWD", value : "<fmt:formatNumber value="${VAT}" pattern="#######" />" },
            pending: true
          }
        ],
        total:  {
          label: "總額",
          amount: { currency: "TWD", value : "<fmt:formatNumber value="${ShoppingCart.subtotal + VAT }" pattern="#######" />" }
        }
      };

      return new PaymentRequest(methodData, details);
    }
  </script>
    
<!--     摸擬刷卡結帳開始 -->
</body>
</html>