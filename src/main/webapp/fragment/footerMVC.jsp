<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
<!-- Footer -->
<footer class="py-5 footer-light mt-0 mb-0" style="background-color: #EDEFFD;color: #000;">
	<div class="container">
          <div class="row">
            <div class="col-md-3 item">
              <h3>網站導覽</h3>
              <ul>
                <li><a href="<c:url value ='/getALLByService/婚禮佈置' />">婚禮佈置</a></li>
                <li><a href="<c:url value ='/getALLByService/婚禮攝影' />">婚禮攝影</a></li>
                <li><a href="<c:url value ='/getALLByService/新娘秘書' />">新娘秘書</a></li>
                <li><a href="<c:url value ='/getALLByService/婚禮主持' />">婚禮主持</a></li>
                <li><a href="<c:url value='/_03_listProducts/DisplayPageProducts2' />">小物商城</a></li>
                <li><a href="<c:url value='/_04_forum/posts'/>">討論區</a></li>
              </ul>
            </div>
            <div class="col-md-3 item">
              <h3>平台說明</h3>
              <ul>
                <li><a href="#">隱私權說明</a></li>
                <li><a href="#">免責聲明</a></li>
              </ul>
            </div>
            <div class="col-md-3 item">
              <h3>關於我們</h3>
              <ul>
                <li><a href="#">關於姻緣聚繪</a></li>
                <li><a href="<c:url value='/support/Plateannouncements' />">最新公告</a></li>
                <li><a href="#">服務條款</a></li>
              </ul>
            </div>
            <div class="col-md-3 item text">
              <h3>聯絡我們</h3>
              <ul>
                <li>地址：106台北市大安區忠孝東路三段1號</li>
                <li>電話：02 2771 2171</li>
              </ul>
            </div>
            <div class="col item social mt-5 ">
              <a href="#"><i class="fa fa-facebook"></i></a
              ><a href="#"><i class="fa fa-twitter"></i></a
              ><a href="#"><i class="fa fa-youtube"></i></a
              ><a href="#"><i class="fa fa-instagram"></i></a
              ><a href="#"><i class="fa fa-google"></i></a>
            </div>
          </div>
          <p class="m-0 text-center ">Copyright &copy; 姻 緣 聚 繪 2020</p>
        </div>
	<!-- /.container -->
</footer>
    <!-- icon -->
    <script
      src="https://kit.fontawesome.com/8e822d04fb.js"
      crossorigin="anonymous"
    ></script>