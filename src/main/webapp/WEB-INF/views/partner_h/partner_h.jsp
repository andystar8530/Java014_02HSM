<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合作商頁面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/marryMa.css">
</head>
<body>
  
<jsp:include page="/fragment/topMVC.jsp" />
<jsp:include page="./fragment/partnerSidebar.jsp" />

<div class="col-lg-9 mb-4"> 
        <h2>基本資料&nbsp</h2>
           <a href="<c:url value='/editPartner?p_id=${partnerBean.p_id}'/>"><img src="${pageContext.request.contextPath}/data/icon/document.png" width="50" style="display: inline;" ></a>
        <br>
        <hr>
       
        <form:form  method="GET" modelAttribute="partnerBean" 
      class="form-horizontal">
          <div class="form-group" >
            <label for="storeName">店家名稱</label>
            <input type="text" class="form-control " id="p_storeName" path="p_storeName" aria-describedby="NameHelp"
             value="${partnerBean.p_storeName}" readonly="readonly" > 
          </div>
          <div class="form-group" >
            <label for="p_mId">會員編號</label>
            <input type="text" class="form-control " id="p_mId" path="p_mId" 
            value="${partnerBean.memberBean.m_No}" readonly="readonly" > 
          </div>
          <div class="form-group" >
            <div><label for="exampleInputInfo">簡介:</label></div>
           	<div>${partnerBean.p_info}</div>
			<div></div>
          </div>
          
            <div class="form-group">
              <label for="exampleFormControlFile1">封面圖</label>
          <img height='150px' width='200px'
	src="<c:url value='/getPartnerCoverImage/${partnerBean.p_id}'/> ">
              
            </div>
          
         
            <div class="form-group">
              <label for="exampleFormControlFile1">公司大小章</label>
                  <img height='150px' width='200px'
	src="<c:url value='/getPartnerStampImage/${partnerBean.p_id}'/> ">
            </div>

            <div class="form-group">主要服務項目:&nbsp&nbsp&nbsp
             ${partnerBean.p_service}
              </div>
        
           
            <div class="form-group">服務區域:&nbsp&nbsp&nbsp
            <c:set var='areaName' scope="session"/>
            <c:choose>
   				 <c:when test="${partnerBean.p_area == 1}">
        				北部
    				</c:when>
    			<c:when test="${partnerBean.p_area == 2}">
     					中部
  					 </c:when>
  				<c:when test="${partnerBean.p_area == 3}">
        				南部
    				</c:when>
    			<c:when test="${partnerBean.p_area == 4}">
     					東部
  					  </c:when>	   	
    			<c:otherwise>
       					離島
    			</c:otherwise>
			</c:choose>
            </div>
            
<%--             <c:if test="${partnerBean.p_area == 1}"> --%>
<!--             	<span>北部</span> -->
<%--             </c:if> --%>
<%--               ${partnerBean.p_area} --%>
<!--               </div> -->
              
              <div class="form-group"> <label for="exampleInputReview">評價:</label>
              ${partnerBean.p_review}
              </div>

              <div class="form-group">
                <label for="exampleInputAccount">銀行帳號:</label>
               ${partnerBean.p_bankAcc}
            </div>
            <div class="form-group">
              <label for="exampleInputLine">Line ID:</label>
        	  ${partnerBean.p_lineId}
           </div>
         <div class="form-group">
            <label for="exampleInputSalary">預估時薪:</label>
            ${partnerBean.p_hRate}
         </div>
 		<div class="form-group">
            <label for="exampleInputCreateTime">建立時間:</label>
           ${partnerBean.p_createTime}
           
         </div>
         <div class="form-group">
            <label for="exampleInputEditTime">最後修改時間</label>
           ${partnerBean.p_editTime}
         </div>
        </form:form>
      
      </div>
      </div>
      </div>
      	<!--共同頁尾 -->
	<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>