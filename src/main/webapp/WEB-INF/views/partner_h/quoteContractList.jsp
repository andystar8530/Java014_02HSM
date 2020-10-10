<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合作商報價合約列表</title>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<jsp:include page="./fragment/partnerSidebar.jsp" />
      
<div class="title col-lg-9 mb-4">
<!-- title ------------------ -->
        <h2>${partnerBean.p_storeName}的報價合約清單&nbsp</h2>
<!--         新增鏈結 -->
           <a href="<c:url value='insertQuote'/>"><img src="${pageContext.request.contextPath}/data/icon/document.png" width="50" style="display: inline;" ></a>
      			                
         <br>
        <hr>
        
<!-- insert / delete / search ------------- -->

<%--  <form action="<c:url value='/displayPartnerInfo.do' />" method="post" name="partnerForm"  --%>
<!--       class="needs-validation"> -->
<%--       <c:set var='nullInfo' value="" /> --%>
<!--       <div class ="d-flex"> -->
<!--         <nav class="navbar navbar-light bg-light"> -->
<!--             <button type="button"><img src="/data/icon/add-pink.png"></button> -->
<!--             <button type="button"><img src="/data/icon/delete-pink.png"></button>       -->
<!--             <form class="form-inline"> -->
<!--               <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"> -->
<!--               <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
<!--             </form> -->
<!-- 	 	</nav> -->
<!--       </div> -->

<!-- Main Content -->
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
            <c:forEach var="aQuoteBean" varStatus="stat" items="${quoteList}">
               <tr>
					<!--單筆修改圖樣與單號 與訂單有連結 -->
                    <td>
                    <a href="<c:url value='quoteDetail?p_id=${partnerBean.p_id}&qcId=${aQuoteBean.qcId}'/>">${aQuoteBean.qcId}</a>
<%--                     <a href="<c:url value='quoteDetail?qc=${partnerBean.p_id}'/>">${aQuoteBean.qcId}</a> --%>
                    </td>
                    <td >
                    
                 
            <c:set var='status' scope="session"/>
            <c:choose>
   				 <c:when test="${aQuoteBean.qcStatus== 0}">
        				未報價
    				</c:when>
    			<c:when test="${aQuoteBean.qcStatus == 1}">
     					未簽約
  					 </c:when>
  				<c:when test="${aQuoteBean.qcStatus== 2}">
        				未付訂金
    				</c:when>
    			<c:when test="${aQuoteBean.qcStatus == 3}">
     					結案:服務完成
  					  </c:when>	   	
    			<c:otherwise>
       					結案:未完結案
    			</c:otherwise>
			</c:choose>

            </td>               
                    <td>${aQuoteBean.qcName}</td>
                    <td>${aQuoteBean.n_Name}</td>
                    <td>${aQuoteBean.qcExecutionDate}</td>
                    <td>${aQuoteBean.servicePrice}</td>
                    <td>${aQuoteBean.qcDate}</td>
                    <td>${aQuoteBean.qcDateLine}</td>
                    <td></td>
                </tr>   
            </c:forEach>                   
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
    
  </div>
</div>
<jsp:include page="/fragment/footerMVC.jsp" />  
</body>
</html>