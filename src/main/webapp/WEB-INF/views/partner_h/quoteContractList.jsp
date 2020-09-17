<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合作商頁面</title>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<jsp:include page="./fragment/partnerSidebar.jsp" />
<%-- <jsp:useBean id='partner' class='partnerInfoEdit.dao.Impl.PartnerDaoImpl_Jdbc' scope='session'/> --%>
<%-- <jsp:getProperty name='partner' property='partnerBean'/> --%>
<!-- <div class="col-lg-9 mb-4">  -->
      
<div class="title col-lg-9 mb-4">
<!-- title ------------------ -->
        <h2>報價合約&nbsp</h2>
           <a href="${pageContext.request.contextPath}/partner/partnerInfoEdit.jsp"><img src="${pageContext.request.contextPath}/data/icon/document.png" width="50" style="display: inline;" ></a>
         <br>
        <hr>
        
<!-- insert / delete / search ------------- -->

 <form action="<c:url value='/displayPartnerInfo.do' />" method="GET" name="partnerForm" 
      class="needs-validation">
      <c:set var='nullInfo' value="" />
      <div class ="d-flex">
        <nav class="navbar navbar-light bg-light">
            <button type="button"><img src="./Image/add-pink.png"></button>
            <button type="button"><img src="./Image/delete-pink.png"></button>      
 
            <form class="form-inline">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
      </div>

    <div class="list">
    <div class="d-flex justify-content-center align-items-center">
        <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
            <thead class="bg-highlight">
                <tr>
                    <th>單號</th>
                    <th><button type="button" class="btn btn-status btn-white dropdown-toggle font-weight-bold " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                        狀態
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">未發送</a>
                            <a class="dropdown-item" href="#">報價中</a>
                            <a class="dropdown-item" href="#">已簽約</a>
                          </div>
                      </button></th>
                    <th>名稱</th>
                    <th>新人姓名</th>
                    <th>服務日期</th>                
                    <th>報價金額</th>
                    <th>報價日期</th>
                    <th>有效日期</th>
                    <th>備註</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><button type="button"><img class="editor" src="./Image/editor-pen.png"></button>1
                        </td>
                    <td>報價中</td>
                    <td>陳賴婚宴</td>
                    <td>陳芒果</td>
                    <td>2020/12/31</td>
                    <td>$30,000</td>
                    <td>2020/8/1</td>
                    <td>2020/8/31</td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <button type="button"><img class="editor" src="./Image/editor-pen.png"></button>
                        2</td>
                    <td>報價中</td>
                    <td>南林婚宴</td>
                    <td>南林楠</td>
                    <td>2020/12/1</td>
                    <td>$20,000</td>
                    <td>2020/8/7</td>
                    <td>2020/8/31</td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <button type="button"><img class="editor" src="./Image/editor-pen.png"></button>
                        3</td>
                    <td>報價中</td>
                    <td>陳陳婚宴</td>
                    <td>陳陳陳</td>
                    <td>2020/11/1</td>
                    <td>$25,000</td>
                    <td>2020/8/10</td>
                    <td>2020/8/31</td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <button type="button"><img class="editor" src="./Image/editor-pen.png"></button>
                        4</td>
                    <td>報價中</td>
                    <td>陳陳婚宴</td>
                    <td>陳陳陳</td>
                    <td>2020/11/1</td>
                    <td>$25,000</td>
                    <td>2020/8/10</td>
                    <td>2020/8/31</td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <button type="button"><img class="editor" src="./Image/editor-pen.png"></button>
                        5</td>
                    <td>報價中</td>
                    <td>陳陳婚宴</td>
                    <td>陳陳陳</td>
                    <td>2020/11/1</td>
                    <td>$25,000</td>
                    <td>2020/8/10</td>
                    <td>2020/8/31</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
        <!-- page ------------------------ -->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
      </div>  
      </form>
    </div>  
</body>
</html>