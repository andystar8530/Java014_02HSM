<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編輯作品集圖片</title>
<style>
h2,h3{
	text-align: center;
}

.chooseIcon{
	width:25px;
	height:25px;
	 position: absolute;
         right: 0px; 
/*         top: 0px; */
	z-index:10;
	display: none;
}
.pfDetailImage{
	position:relative;
	z-index:0;
}
</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
    <h2 class='p-3'>作品集名稱: ${portfoliosBean.pfmName}</h2>
    <h3 class='p-1 pb-2'>作品集資訊: ${portfoliosBean.pfmInfo}</h3>
        <div class="container">
            <div class="row col-12 justify-content-center">
                <div class='imageDiv'>                      
                    <div class="d-flex">
                      
                       <form:form method='POST' modelAttribute='portfolioDetailsBean' enctype='multipart/form-data'>
                            <div class="form-group w-50">
                                    <label for="uploadImage">
                                        <img src='<c:url value="/data/icon/photo+.png"/>' width='50px' style="display:inline;"  class='uploadImage' >
                                        <form:input type='file' path="portfoliosImages" id="pfdPic"  multiple="multiple" class='form:input-large' style="display:none" />
                                    </label>
                                    <button class="btn btn-light" type="submit" style="display:none" id="submitBtn">確定新增</button>
                            </div>
                        </form:form>
                       
                        <div class='w-50'>
                            <img src='<c:url value="/data/icon/photo-.png"/>' width='50px'  id='removeImage'>
                            <button class="btn btn-light" type="submit" style="display:none" id="deleteBtn">確定刪除</button>
                            <button class="btn btn-light" type="reset" style="display:none" id="cancelBtn">取消</button>
                        </div>
                        
                    </div>
                    
                </div>
            </div>
        </div>
       
    
    
    <div class="container mt-5">
		<div class="row row-cols-2 row-cols-md-3 row-cols-xl-4">
				<c:forEach var='pfBean' items="${pfdBeanList}">
					<div class="col mb-4">
    					<div class="card h-100">					
<%--     						<img src='<c:url value="/data/icon/uncheck.png"/>' class='chooseIcon'> 					 --%>
 <div class="card-body">
 <div class="custom-control custom-checkbox">
  <input type="checkbox" class="custom-control-input" name="subCheck" id='subCheck-"${pfBean.pfdId}"' value='"${pfBean.pfdId}"'>
  <label class="custom-control-label" for='subCheck-"${pfBean.pfdId}"'>選擇</label>
</div>
<%--                             <input type="checkbox" name="subCheck" id='subCheck-"${pfBean.pfdId}"' value='"${pfBean.pfdId}"'> --%>
						</div>
							<img src="<c:url value='/getPFDetailImage/ ${pfBean.pfdId}'/>" class='pfDetailImage card-img-top' id='"${pfBean.pfdId}"'>
<%-- 						<p> 照片名稱:   ${pfBean.pfdName}</p> --%>
				
				 			 <div class="card-body">
<%-- 								<h5 class="card-title">${pfBean.pfdName}</h5> --%>
<!--         						<p class="card-text">This content is a little bit longer.</p> -->
     			 			</div>
				
						</div>
					</div>					
				</c:forEach>
			</div>
        </div>	
        <div class='text-center'>
        	<a class="btn btn-outline-dark" href="<c:url value='/showPortfoliosManagement'/>" role="button">回作品集管理</a>
        </div>
<script>

     $(".uploadImage").click(function (e) {
        document.getElementById("pfdPic").click();
      });
    $('#pfdPic').change(function(){
        $("#pfdPic").css('display','inline' );
        $("#submitBtn").css('display','inline' );
        $('#removeImage').css('pointer-events','none');
       
    })
    $('#removeImage').click(function(){
			$('#pfdPic').val("");
    	  $("#deleteBtn").toggle();
          $('#cancelBtn').toggle();
        $('.uploadImage').css('pointer-events','none');
//        $('.chooseIcon').toggle();
    $('#deleteBtn').click(function(){
        var checkedNum = $("input[name='subCheck']:checked").length;
        if(checkedNum == 0){
            alert('請至少選擇一項');
            return false;
        }
        if(confirm("確定刪除所選項目?")){
            var checkedList = new Array();
            $("input[name='subCheck']:checked").each(function(){
                checkedList.push($(this).val());
                console.log(checkedList.toString());
            })
            
            $.ajax({
                type:'DELETE',
                url:'<c:url value="/portfolioImage" />',
                data:{"deleteItems":checkedList.toString()},
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType:'json',
                success:function(data){
//                     alert('刪除成功');
                    $("[name='subCheck']:checkbox").attr("checked",false);
                    location.reload();//页面刷新
                },
                complete:function(data){
                    alert('刪除成功');
                    location.reload();//页面刷新
                }
            })
        }
    })
    $('#cancelBtn').click(function(){
        $("input[name='subCheck']:checked").each(function(){
            $(this).prop("checked",false);
        })
        $("#deleteBtn").hide();
        $('#cancelBtn').hide();
    })

           
    })
    
//        $('.pfDetailImage').click(function(){
// 			$('.chooseIcon').attr('src','<c:url value="/data/icon/checked.png"/>')

//            })
    //   $("#pfdPic").on("change", function (event) {
    //     const file = event.target.files[0];
    //     let readFile = new FileReader();
    //     readFile.readAsDataURL(file);
    //     readFile.addEventListener("load", function (e) {
    //       let image = document.getElementById("show_image");
    //       image.src = this.result;

    //       // image.width = 500 ;
    //       image.style.maxWidth = "200px"; //css屬性
    //       image.style.maxHeight = "200px";
    //     });
    //   });

</script>  

	<!-- ---------------------------分隔線---------------------------------------			 -->

	<jsp:include page="/fragment/footerMVC.jsp" />      
</body>
</html>