<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="<c:url value='/images/removebg1.ico' />" type="image/x-icon" />
<c:set var="AppName" value="${SYSTEM.systemName}" scope="application"/>
<%-- <title>${AppName}</title> --%>
</head>
<body style="background: #EBFFEB;">
<!-- 設定變數funcName的值為"IND", top.jsp會使用此變數-->
<c:set var="funcName" value="IND" scope="session"/>
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/topMVC.jsp" />

<%
// 觀察登出後HttpSession物件內容
// java.util.Enumeration<String> e = session.getAttributeNames();
// while (e.hasMoreElements()){
// 	String name = e.nextElement();
// 	out.println("In login.jsp, " + name + "=>" + session.getAttribute(name));
// 	out.println("<hr>");
// }

%>

 <!-- slider -------------------------------------------------- -->
    <div
      id="carouselExampleCaptions"
      class="carousel slide "
      data-ride="carousel"
    >
      <ol class="carousel-indicators ">
        <li
          data-target="#carouselExampleCaptions"
          data-slide-to="0"
          class="active"
        ></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner ">
        <div class="carousel-item active ">
          <img
            src="<c:url value='/images/slider/carousel.jpg' />"
            class="d-block w-100 "
            alt="..."
          />
          <div class="carousel-caption d-none d-md-block">
            <h5>First slide label</h5>
            <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img
            src="<c:url value='/images/slider/carousel2.jpg' />"
            class="d-block w-100 "
            alt="..."
          />
          <div class="carousel-caption d-none d-md-block">
            <h5>Second slide label</h5>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img
            src="<c:url value='/images/slider/carousel4.jpg' />"
            class="d-block w-100"
            alt="..."
          />
          <div class="carousel-caption d-none d-md-block">
            <h5>Third slide label</h5>
            <p>
              Praesent commodo cursus magna, vel scelerisque nisl consectetur.
            </p>
          </div>
        </div>
      </div>
      <a
        class="carousel-control-prev"
        href="#carouselExampleCaptions"
        role="button"
        data-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a
        class="carousel-control-next"
        href="#carouselExampleCaptions"
        role="button"
        data-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    
    <div align='center'>
 <h1>
 <c:choose>
 	<c:when test="${not empty initDataResult}">
       ${initDataResult}
 	</c:when>
 	<c:when test="${not empty FlashMSG_farewell}">
 	   ${FlashMSG_farewell}
 	</c:when>
 	<c:otherwise>
 	</c:otherwise>
 </c:choose>
 </h1>
 </div>
    <!-- jobs -------------------------------------------------- -->
    <div class="jobs">
      <!-- cards -------------------------------------------------- -->
      <div class="container p-lg-5 p3">
        <div class="row">
          <div class="col-lg-3 col-sm-6 col-12 mb-4">
            <div class="card">
              <img
                src="<c:url value='/images/jobs/allef-vinicius-178362.jpg' />"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">
                  With supporting text below as a natural lead-in to additional
                  content.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6 col-12 mb-4">
            <div class="card">
              <img
                src="<c:url value='/images/jobs/climate-kic-350836.jpg' />"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">
                  With supporting text below as a natural lead-in to additional
                  content.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6 col-12 mb-4">
            <div class="card">
              <img
                src="<c:url value='/images/jobs/emile-perron-190221.jpg' />"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">
                  With supporting text below as a natural lead-in to additional
                  content.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6 col-12 mb-4">
            <div class="card">
              <img
                src="<c:url value='/images/jobs/guilherme-cunha-222318.jpg' />"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">
                  With supporting text below as a natural lead-in to additional
                  content.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6 col-12 mb-4">
            <div class="card">
              <img
                src="<c:url value='/images/jobs/allef-vinicius-178362.jpg' />"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">
                  With supporting text below as a natural lead-in to additional
                  content.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6 col-12 mb-4">
            <div class="card">
              <img
                src="<c:url value='/images/jobs/climate-kic-350836.jpg' />"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">
                  With supporting text below as a natural lead-in to additional
                  content.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6 col-12 mb-4">
            <div class="card">
              <img
                src="<c:url value='/images/jobs/emile-perron-190221.jpg' />"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">
                  With supporting text below as a natural lead-in to additional
                  content.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6 col-12 mb-4">
            <div class="card">
              <img
                src="<c:url value='/images/jobs/guilherme-cunha-222318.jpg' />"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">
                  With supporting text below as a natural lead-in to additional
                  content.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
 
    <!-- Call to Action Section -->
    <div class="mb-0 bg-pink">
      <div class="row ml-5 mr-5">
        <div class="col-md-8">
          <p>姻緣聚繪: 搜尋方式最多元、快速回覆零時差、優質店家把關</p>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block" href="<c:url value='/_01_register/register' />">我要註冊</a>
        </div>
      </div>
     </div>
    <!-- /.container -->
 
<%--  <br><font color='RED'>${AppName}</font><br> --%>
<!--   天天有優惠，天天有好康<br> -->
<!--  今天舉辦<font color='BLUE'>滿仟送佰</font>的促銷活動<br> -->
<!--   </h1>  -->
<!--  <br> -->
<!--   <h2> -->
<!--  本店絕不販賣盜版書、山寨書與過期書 -->
<!--  </h2> -->
<!--    <hr> -->
   
<!--    <p style='font-family: "Verdana"; color: red'> -->
<!--   本範例需要建立初始資料的步驟：<br> -->
<!--   1. 進入SQLYog，清除JSPDB內的所有表格(Empty DataBase)<br> -->
<!--   2. 重新啟動伺服器<br> -->
<%--   3. 按<a href="<c:url value='/initData/' />">這裡</a>來建立初始資料<br>  --%>
<!--  </p> -->
<%--   ${logoutMessage}${MsgOK.InsertOK}<br> --%>
<!--  <br>   -->
<%--  <% // 顯示MsgOK.InsertOK後，就要立刻移除，以免每次回到首 頁都會顯示新增成功的訊息 --%>
<!--      session.removeAttribute("MsgOK");   -->
<%--  %> --%>

  <!-- 引入共同的頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script>
      new WOW().init(); 
    </script> 
</body>
</html>