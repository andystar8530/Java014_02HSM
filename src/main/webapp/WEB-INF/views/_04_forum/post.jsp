<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <style>
    .opa{opacity: 0.8;}
    .bgcolor{background-color:#EBFFEB;}
  </style>
  </head>
 <body class="">
    <!-- 引入共同的頁首 -->
<jsp:include page="/fragment/topMVC.jsp" />
        
        <div class="nav-scroller ">
                
            <div class="container mt-5">
            <nav class="nav nav-underline">
             <a class="nav-link alert-warning rounded mr-2" href="#">我要搜尋的主題</a>
            <a class="nav-link alert-warning rounded mr-2" href="#">婚禮布置</a>
            <a class="nav-link alert-warning rounded mr-2" href="#">婚禮攝影</a>
            <a class="nav-link alert-warning rounded mr-2" href="#">新娘秘書</a>
            <a class="nav-link alert-warning rounded mr-2" href="#">婚禮主持</a>
            <a class="nav-link alert-warning rounded mr-2" href="#">小物商城</a>
            
            
          </nav>
         
        </div>
        </div>
        <!-- </div> -->
    
        

        <main role="main" class="container shadow">
     
    
          <div class=" p-3 bg-white rounded box-shadow mt-2 opa">
            <!-- <h6 class="border-bottom border-gray pb-2 mb-0">Recent updates</h6> -->
            <div class="media text-muted pt-3  ">
            <div class="d-block">
              <img src="https://images.zi.org.tw/applealmond/2020/03/24204140/1585053699-2349f992d655d0172069dfde6ba04f9e.jpg" alt="64x64" class="mr-2 rounded " style="width: 70px; height: 70px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_17467e1f95b%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_17467e1f95b%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2211.828125%22%20y%3D%2216.965625%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" >
              <strong class="d-block text-gray-dark p-2  ">王狗但</strong>
            </div>
            <div class="container-fluid">
              <p class="media-body pb-3 mb-0  lh-125 border-bottom border-gray" " style="display: block;" >${post.fTitle}</p>
              <p class="media-body pb-3 mb-0  lh-125 border-bottom border-gray " >${post.fText}</p>
            </div>
           
              
              
              
            </div>
            </div>
            

<!--             <P class="ml-5">發文時間:</P> -->
<!--             <p class="ml-5">文章類別:婚禮攝影</p> -->
      
           <div class="my-3 p-3 bg-white rounded box-shadow">
            <h6 class="border-bottom border-gray pb-2 mb-0">留言板</h6>
            <c:forEach var="comment" items="${getComments}">
            <div class="media text-muted pt-3">
              <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_17467e1f963%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_17467e1f963%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2211.828125%22%20y%3D%2216.965625%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 32px; height: 32px;">
              <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <div class="d-flex justify-content-between align-items-center w-100">
                  <strong class="text-gray-dark">王酒蛋</strong>

                  <form  id="form1"  name="form1"  method="post"  action="" > 
                     <input  type="image"  name="submit_Btn"  id="submit_Btn"  img  src="https://www.crazy-tutorial.com/wp-content/uploads/2018/08/6052.png" style="width: 32px; height: 32px"; onClick="document.form1.submit()" >
                    </form>
               
                  </div>
                <span class="d-block">${comment.comText}</span>
              </div>
            </div>
           </c:forEach>
           
            <form:form method="Post" modelAttribute="formCb">
            <form:input style="display:none" path="postId" value="${post.fId}"/>
            <small class="d-block text-right mt-3">
              <div class="input-group mb-5 mt-5 col-10">
                <form:textarea path="comText" class="form-control" placeholder="說說你的看法"  aria-describedby="button-addon2"/>
                <div class="input-group-append">
                  <button class="btn btn-outline-danger" type="submit" id="button-addon2">留言</button>
                </div>
              </div>
            </small>
            </form:form>
          </div>
        </main>
    
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="../../assets/js/vendor/popper.min.js"></script>
        <script src="../../dist/js/bootstrap.min.js"></script>
        <script src="../../assets/js/vendor/holder.min.js"></script>
        <script src="offcanvas.js"></script>
      
    
    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs>
</svg>
  <!-- 引入共同的頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>