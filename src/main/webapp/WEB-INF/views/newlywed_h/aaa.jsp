<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增商品</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css ">
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/support/bgMain.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/support/bgMall.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ContractBuild.css">
</head>
<body>
	<!-- onLoad="setFocusToUserId()"不知道是什麼 -->
	<c:set var="funcName" value="REG" scope="session" />
	<jsp:include page="/fragment/topMVC.jsp" />
	<!-- container -->

	<!-- 引入共同的頁首 -->
	<div class="bgMainDiv " style="padding-top: 30px;">
		<jsp:include page="/WEB-INF/views/support/supFragment/bgNavbar.jsp" />
		<div class="bgMainGalleryDiv MallMain">
			<!-- 		內容建立位置-------------- -->
			<c:set var="quoteContract" value="${QuoteContractBean}" />


			<div style="">
				<div style="width: 90px;">
					<label class="fontSize">新人帳號:${quoteContract.m_Id}</label><br>&nbsp;
				</div>
				<div style="width: 90px;">
					<label class="fontSize">合作商ID:${quoteContract.p_Id}</label><br>&nbsp;
				</div>
			</div>
			<div id="canvasDiv" class="pg" style=""></div>

			<br>
			<hr>
			<br>
			<div id="canvasDiv">
				<div class="form-group">
					<img id="signature" />
				</div>

			</div>
			<div>
				<!--	signature簽名 -->
			</div>
			<br> <br>
			<div>
				<!--	放圖片合成位置 -->
				<canvas id="myCanvas" width="800" height="900"></canvas>
			</div>
			<button id="btn_submit">提交</button>
<!-- 			<button id="signatureButton">簽名</button> -->
<input type="file" id="file" name="myfile" />
<input type="button" onclick="testAjax()" value="上傳" />

			<!--	商品新增標籤開結束 -->
		</div>
	</div>

</body>
<script>
	var canvasDiv = document.getElementById('canvasDiv');
	var canvas = document.createElement('canvas');
	//screen.width可以取得使用者螢幕寬度,window.innerWidth可以傳回使用者網頁寬度
	// var screenwidth = 600;
	var canvasWidth = 600;
	var canvasHeight = 320;
	var nameaaa;//抓簽名路徑的位置
	var iiii;//抓老婆位置
	var point = {};
	var file;

	canvas.setAttribute('width', canvasWidth);
	canvas.setAttribute('height', canvasHeight);
	canvasDiv.appendChild(canvas);
	var context = canvas.getContext("2d");

	canvas.addEventListener("mousedown", function(e) {
		var mouseX = e.pageX - this.offsetLeft;
		var mouseY = e.pageY - this.offsetTop;
		paint = true;
		//e.pageX - this.offsetLeft, e.pageY - this.offsetTop
		addClick(e.pageX, e.pageY);
		redraw();
	});
	//移動
	canvas.addEventListener("mousemove", function(e) {
		if (paint) {
			addClick(e.pageX, e.pageY, true);
			redraw();
		}
	});
	//滑鼠up
	canvas.addEventListener("mouseup", function(e) {
		paint = false;
	});

	//清除
	// 		document.getElementById("btn_clear").addEventListener("click", function() {
	// 			canvas.width = canvas.width;
	// 		});

	//提交

	document.getElementById("btn_submit").addEventListener(
			"click",
			function() {
				// 		signature 改為n_Signature
				$("#signature").attr("src", canvas.toDataURL("image/png"));
				nameaaa = $("#signature").attr("src");
				//nameaaa為base64碼
				// 				alert(nameaaa);
				// // 				呼叫轉為blob檔
				// 				var blob = dataURLtoBlob(nameaaa);
				// 				alert(blob);
				// // 				抓取現在時間
				var today = new Date();
				// 				 	抓取現在秒數
				var todaym = today.getTime();
				// 				alert(todaym);
				// base64轉為file,todaym為檔名
				 file = dataURLtoFile(nameaaa, todaym);
// 				alert(file);
// 				let a = document.getElementById("n_Signature");
				// 				alert(a);
				// 				a=file;
				// 				a.value= file;
				// 				alert(a);
				////////////////////////////////
// 				let readFile = new FileReader();
// 				readFile.readAsDataURL(file);
// 				readFile.addEventListener("load", function(e) {
// 					let image = document.getElementById("n_Signature");
// 					// 				image.src = this.result;
// 					alert(document.getElementById("signature").src);
// 					alert(document.getElementById("n_Signature").src);
// 					alert(image.src);
// 					image.src = document.getElementById("signature").src;
// 					alert("1111");
// 					alert(image.src);
// 					// 				document.getElementById("n_Signature").value = "欄位值";
// 					alert(document.getElementById("n_Signature").src);
// 					// image.width = 500 ;
// 					image.style.maxWidth = "500px"; //css屬性
// 					image.style.maxHeight = "500px";
// 				});
				//////////////////////////////////

				// 				alert(a.value);
				//----	抓取文件位置
				window.scrollTo(0, 0);
				//----	解決跨源問題

				//-----------------------------------------
				// 				用html2canvas轉圖片放前端
// 				alert("aaa");
				html2canvas(document.getElementById("capture"), {
					useCORS : true,
					allowTaint : false
				}).then(
						function(canvas) {
							iiii = canvas.toDataURL("image/jpeg", 0.9).replace(
									"image/png", "image/octet-stream");
						});

// 				alert("bbb");
			});

	var clickX = new Array();
	var clickY = new Array();
	var clickDrag = new Array();
	var paint;//重置

	//dragging決定畫不畫,x,y也可決定畫的位置
	function addClick(x, y, dragging) {
		clickX.push(x);
		clickY.push(y);
		clickDrag.push(dragging);
	}

	//控制畫筆
	function redraw() {

		context.strokeStyle = "#df4b26";
		context.lineJoin = "round";
		//lineWudth筆粗細
		context.lineWidth = 2;
		while (clickX.length > 0) {
			point.bx = point.x;
			point.by = point.y;
			//控制畫點位置
			point.x = clickX.pop() - 20;
			point.y = clickY.pop() -200;
			//
			point.drag = clickDrag.pop();
			context.beginPath();
			if (point.drag && point.notFirst) {
				context.moveTo(point.bx, point.by);
			} else {
				point.notFirst = true;
				context.moveTo(point.x - 1, point.y);
			}
			context.lineTo(point.x, point.y);
			context.closePath();
			context.stroke();
		}
	}
	//base64轉file
	function dataURLtoFile(dataurl, filename) {//將base64轉換為文件
		var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1], bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(
				n);
		while (n--) {
			u8arr[n] = bstr.charCodeAt(n);
		}
		return new File([ u8arr ], filename, {
			type : mime
		});
	}

	//	圖片合成
	function loadImages(sources, callback) {
		var images = {};
		// images.crossOrigin = 'Anonymous';
		var loadedImages = 0;
		var numImages = 0;
		// get num of sources
		for ( var src in sources) {
			numImages++;
		}
		for ( var src in sources) {
			images[src] = new Image();
			images[src].onload = function() {
				if (++loadedImages >= numImages) {
					callback(images);
				}
			};
			images[src].src = sources[src];
			images[src].setAttribute("crossOrigin", 'Anonymous');
		}
	}


	///////////////////		嘗試向後端傳值開始
// function UpladFile() {
// // var fileObj = document.getElementByIdx_x_x("file").files[0]; // 獲取檔案物件
// // alert(fileObj);
// var FileController = "/quoteContractSignature/{id}";     // 接收上傳檔案的後臺地址 
// // FormData 物件
// var form = new FormData();
// form.append("author", "hooyes");      // 可以增加表單資料
// form.append("file", file);       // 檔案物件
// alert("展示一下file"+file);
// alert("展示一下form"+form);
// // XMLHttpRequest 物件
// var xhr = new XMLHttpRequest();
// xhr.open("post", FileController, true);
// xhr.onload = function () {
// alert("上傳完成!");
// };
// xhr.send(form);
// }


	////////////////////	嘗試向後端傳值結束
	
	 function testAjax() {
		 alert("aa"+file);
        $.ajax({
            type: "get", // 以get方式發起請求
            url: "/quotecontract/yourUrl?n_Signature=" + file, // 將你的請求參數以問號拼接到url中進行參數傳遞
            success(data) {
                // data為返回值
                // 成功後的回調方法
                alert("成功拉");
            }
        })
    }
	
	
	////
	
// 	document.getElementById("signatureButton").addEventListener("click",

// 	function(images) {
// 		var canvas = document.getElementById("myCanvas");
// 		var context = canvas.getContext("2d");

// 		var sources = {
// 			yoda1 : iiii,//子瑜我老婆(圖層1)
// 			yyy : nameaaa
// 		//	簽名路徑(圖層2)
// 		};
// 		loadImages(sources, function(images) {
// 			context.drawImage(images.yoda1, 0, 0);//顯示圖片位置長寬高    
// 			context.drawImage(images.yyy, 0, 0);
// 		});

// 	});
</script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/html2canvas.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/WEB-INF/views/support/supFragment/bgFooter.jsp" />
</html>
