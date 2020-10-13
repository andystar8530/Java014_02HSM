<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showPartners</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/show/showPartners.css">


<style>
	.my_btn{
		position: fixed;
		top:60px; /*距離上方 0 像素*/
 		z-index:55; /*重疊時會在其他元素之上*/	
 	
	}
	.partnerDiv{
		background-image: url("${pageContext.request.contextPath}/images/bg7.jpg");
		background-repeat: no-repeat;
		background-size:cover;
		background-attachment: fixed;
	}
	.programDiv{
		background-image: url("${pageContext.request.contextPath}/images/bg5.jpg");
		background-repeat: no-repeat;
		background-size:cover;
		background-attachment: fixed;
	}
	.portfolioDiv{
		background-image: url("${pageContext.request.contextPath}/images/bg4.jpg");
		background-repeat: no-repeat;
		background-size:cover;
		background-attachment: fixed;
	}
	.topBtn{
		width:60px;
		position: fixed;
		bottom:30px;
		right:5%;
 		z-index:55; /*重疊時會在其他元素之上*/
 		cursor: pointer;
    	drop-shadow: 12px 12px 7px rgba(0, 0, 0, 0.7);
	}

	#myInput {
	background-position: 10px 12px;
	background-repeat: no-repeat;
	background-size: 30px 30px;
	width: 50%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #f07167;
	border-radius:10px;
	margin-bottom: 12px;
	opacity:0.7;
	display:inline;
	
	}

#myUL {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

#myUL li a {
  border: 1px solid #f07167;
  margin-top: -1px; /* Prevent double borders */
  background-color: #f6f6f6;
  padding: 12px;
  text-decoration: none;
  font-size: 18px;
  color: black;
  display: block
}

#myUL li a:hover:not(.header) {
  background-color: #eee;
}
</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />

<div class='my_btn'>
	<a type="button" class="btn btn-outline-danger" href="#aa">找店家</a>
	<a type="button" class="btn btn-outline-danger" href="#bb">找方案</a>
	<a type="button" class="btn btn-outline-danger" href="#cc">找作品</a>
<!-- 	<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name" -->
<%-- 		style='background-image: url("${pageContext.request.contextPath}/data/icon/search-user.png") ; '> --%>
</div>

<div class='partnerDiv'>
<h2 class='text-center p-3' id="aa" >店家一覽</h2>
	<div class='row ml-5 mr-5 col-9 mx-auto '>
		
	
		<c:forEach var='partnerBean' items="${pbList}" end='7'>
			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3 ' >
				<div class="card shadow border-info">
				  <img src="<c:url value='/getPartnerStampImage/${partnerBean.p_id}'/>" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title" id="${partnerBean.p_storeName}" >${partnerBean.p_storeName}</h5>
				    <p class="card-text">${partnerBean.p_service}</p>
				    <p class="card-text">${partnerBean.p_info}</p>
				    <a href="<c:url value='/showPartnerDetail/${partnerBean.p_id}'/>" class="btn btn-primary">查看店家</a>
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div class='programDiv'>	
<h2 class='text-center p-3' id="bb">方案一覽</h2>
	<div class='row ml-5 mr-5 col-10 mx-auto'>
	
		<c:forEach var='programBean' items="${programList}" end='7'>
		<div class="col-lg-3 col-md-4 col-12">
			<article class="my-card card--1 mb-5" style='background-image: url("${pageContext.request.contextPath}/_06_Program/getProgramImage/${programBean.prm_Id}")'>
        
				<div class="card__img" style='background-image: url("${pageContext.request.contextPath}/_06_Program/getProgramImage/${programBean.prm_Id}")'></div>
				<a href="<c:url value='/_06_Program/ProgramDetail/${programBean.prm_Id}'/>" class="card_link">
				   <div class="card__img--hover" style='background-image: url("${pageContext.request.contextPath}/_06_Program/getProgramImage/${programBean.prm_Id}")'></div>
				 </a>
				 
				<div class="card__info">
				  <span class="card__category">方案類別:${programBean.prm_Category}</span>
				  <h3 class="card__title">${programBean.prm_Title}</h3>
				  <span class="card__by"><a href="<c:url value='/_06_Program/ProgramDetail/${programBean.prm_Id}'/>" class="card__author" title="author">價錢:${programBean.prm_Price}</a></span>
				</div>
			  </article>
		</div>
			
			<!-- <div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3'>
				<div class="card shadow border-info">
				  <img src="<c:url value='/_06_Program/getProgramImage/${programBean.prm_Id}'/>"  class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title">${programBean.prm_Title}</h5>
				    <p class="card-text">${programBean.prm_Content}</p>
				    <p class="card-text">${programBean.prm_Price}</p>
				    <a href="<c:url value='/_06_Program/ProgramDetail/${programBean.prm_Id}'/>" class="btn btn-primary">詳細內容</a>
				  </div>
				</div>
			</div> -->
		</c:forEach>
	</div>	
</div>	
<div class='portfolioDiv'>
<!-- <h2 class='text-center p-3' id="cc">作品集一覽</h2>
	<div class='row ml-5 mr-5 col-9 mx-auto'>
	
		<c:forEach var='portfoliosBean' items="${portfolioList}" end='7'>
			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3'>
				<div class="card shadow border-info">
				  <img src="<c:url value='/getPFCoverImage/${portfoliosBean.pfmId}'/>" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">${portfoliosBean.pfmName}</h5>
				    <p class="card-text">${portfoliosBean.pfmInfo}</p>
				    <p class="card-text">${portfoliosBean.partnerBean.p_storeName}</p>
				    <a href="<spring:url value='/portfolio?pfmId=${portfoliosBean.pfmId}' />" class="btn btn-primary">Go somewhere</a>
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>	 -->
	        <!-- our Memories start -->
			<div class="our-memories-area section-padding2">
				<div class="container">
					<!-- section tittle -->
					<div class="row ">
						<div class="col-lg-12">
							<div class="section-tittle text-center">
								<img src="assets/img/memories/section_tittle_flowre.png" alt="">
								<h2>OUR MEMORIES</h2>
							</div>
						</div>
					</div>
					<div class="row no-gutters">
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="https://picsum.photos/400/500?random=10" alt="">
									<div class="menorie-icon" href="assets/img/memories/memories1.jpg">
										<i class="ti-plus"></i>
									</div>
								</div>
							</div>
						</div> 
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="https://picsum.photos/400/500?random=8" alt="">
									<div class="menorie-icon" href="assets/img/memories/memories2.jpg">
										<i class="ti-plus"></i>
									</div>
								</div>
							</div>
						</div> 
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="https://picsum.photos/400/500?random=7" alt="">
									<div class="menorie-icon" href="assets/img/memories/memories3.jpg">
										<i class="ti-plus"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="https://picsum.photos/400/500?random=1" alt="">
									<div class="menorie-icon" href="assets/img/memories/memories4.jpg">
										<i class="ti-plus"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="https://picsum.photos/400/500?random=2" alt="">
									<div class="menorie-icon" href="assets/img/memories/memories5.jpg">
										<i class="ti-plus"></i>
									</div>
								</div>
							</div>
						</div>   
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="https://picsum.photos/400/500?random=3" alt="">
									<div class="menorie-icon" href="assets/img/memories/memories2.jpg">
										<i class="ti-plus"></i>
									</div>
								</div>
							</div>
						</div> 
						
					</div>
				</div>
				<!-- Shape Img -->
				<div class="memories-shape d-none d-xl-block">
					<img src="assets/img/memories/left-img.png" class="memories-shape1" alt="">
					<img src="assets/img/memories/right-img.png" class="memories-shape2" alt="">
				</div>
			</div>
</div>	

	<img src="<c:url value='/data/icon/up-arrow.png'/> " class='topBtn' id="topBtn">
	<script>
		$(".my_btn > a").click(function(e){
			$(".my_btn > a").removeClass("selected");
			$(this).addClass("selected");

			var id = $(this).attr("href");
			var y = $(id).offset().top - 100;
		
			$("body").stop().animate({scrollTop:y},2000);
		})
		$("#topBtn").click(function(e){
			$("body").animate({scrollTop:70},2000);
		})
		
		
		$(function () {

		var $win = $(window);

		var $topBtn = $('.topBtn');

	// 當用戶滾動到離頂部100像素時，展示回到頂部按鈕

		$win.scroll(function () {

			if ($win.scrollTop() > 100) {

			$topBtn.show();

			} else {

			$topBtn.hide();

			}

			});

			// 當用戶點擊按鈕時，通過動畫效果返回頭部

			$topBtn.click(function () {

			$('html, body').animate({scrollTop: 0}, 1500);

				});

});

// $(document).ready(function () {
// 	var programImageSrc = "http://localhost:8080/Java014_02HSM/_06_Program/getProgramImage/${programBean.prm_Id} />" ;
// 	$('.card--1').css({'background-image': 'url(' + programImageSrc + ')'});
//  	$('.card--1').css("background-image","url(" + programImageSrc + ")");
//  	$('.card__img').css("background-image",url(' + programImageSrc + '));
//  	$('.card__img--hover').css("background-image",url(' + programImageSrc + '));
//  	$('.card--1--hover').css("background-image",url(' + programImageSrc + '));
// });

function myFunction() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}


(function ($)
		  { "use strict"
		  
		/* 1. Proloder */
		    $(window).on('load', function () {
		      $('#preloader-active').delay(450).fadeOut('slow');
		      $('body').delay(450).css({
		        'overflow': 'visible'
		      });
		    });


		/* 2. slick Nav */
		// mobile_menu
		    var menu = $('ul#navigation');
		    if(menu.length){
		      menu.slicknav({
		        prependTo: ".mobile_menu",
		        closedSymbol: '+',
		        openedSymbol:'-'
		      });
		    };


		/* 3. MainSlider-1 */
		    function mainSlider() {
		      var BasicSlider = $('.slider-active');
		      BasicSlider.on('init', function (e, slick) {
		        var $firstAnimatingElements = $('.single-slider:first-child').find('[data-animation]');
		        doAnimations($firstAnimatingElements);
		      });
		      BasicSlider.on('beforeChange', function (e, slick, currentSlide, nextSlide) {
		        var $animatingElements = $('.single-slider[data-slick-index="' + nextSlide + '"]').find('[data-animation]');
		        doAnimations($animatingElements);
		      });
		      BasicSlider.slick({
		        autoplay: false,
		        autoplaySpeed: 10000,
		        dots: false,
		        fade: true,
		        arrows: false,
		        prevArrow: '<button type="button" class="slick-prev"><i class="ti-shift-left"></i></button>',
		        nextArrow: '<button type="button" class="slick-next"><i class="ti-shift-right"></i></button>',
		        responsive: [{
		            breakpoint: 1024,
		            settings: {
		              slidesToShow: 1,
		              slidesToScroll: 1,
		              infinite: true,
		            }
		          },
		          {
		            breakpoint: 991,
		            settings: {
		              slidesToShow: 1,
		              slidesToScroll: 1,
		              arrows: false
		            }
		          },
		          {
		            breakpoint: 767,
		            settings: {
		              slidesToShow: 1,
		              slidesToScroll: 1,
		              arrows: false
		            }
		          }
		        ]
		      });

		      function doAnimations(elements) {
		        var animationEndEvents = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
		        elements.each(function () {
		          var $this = $(this);
		          var $animationDelay = $this.data('delay');
		          var $animationType = 'animated ' + $this.data('animation');
		          $this.css({
		            'animation-delay': $animationDelay,
		            '-webkit-animation-delay': $animationDelay
		          });
		          $this.addClass($animationType).one(animationEndEvents, function () {
		            $this.removeClass($animationType);
		          });
		        });
		      }
		    }
		    mainSlider();



		/* 4. Testimonial Active*/
		  var testimonial = $('.h1-testimonial-active');
		    if(testimonial.length){
		    testimonial.slick({
		        dots: false,
		        infinite: true,
		        speed: 1000,
		        autoplay:true,
		        loop:true,
		        arrows: false,
		        prevArrow: '<button type="button" class="slick-prev"><i class="ti-angle-left"></i></button>',
		        nextArrow: '<button type="button" class="slick-next"><i class="ti-angle-right"></i></button>',
		        slidesToShow: 1,
		        slidesToScroll: 1,
		        responsive: [
		          {
		            breakpoint: 1024,
		            settings: {
		              slidesToShow: 1,
		              slidesToScroll: 1,
		              infinite: true,
		              dots: false,
		              arrow:false
		            }
		          },
		          {
		            breakpoint: 600,
		            settings: {
		              slidesToShow: 1,
		              slidesToScroll: 1,
		              arrows:false
		            }
		          },
		          {
		            breakpoint: 480,
		            settings: {
		              slidesToShow: 1,
		              slidesToScroll: 1,
		              arrows:false,
		            }
		          }
		        ]
		      });
		    }


		/* 5. Gallery Active */
		    var client_list = $('.completed-active');
		    if(client_list.length){
		      client_list.owlCarousel({
		        slidesToShow: 2,
		        slidesToScroll: 1,
		        loop: true,
		        autoplay:true,
		        speed: 3000,
		        smartSpeed:2000,
		        nav: false,
		        dots: false,
		        margin: 15,

		        autoplayHoverPause: true,
		        responsive : {
		          0 : {
		            items: 1
		          },
		          768 : {
		            items: 2
		          },
		          992 : {
		            items: 2
		          },
		          1200:{
		            items: 3
		          }
		        }
		      });
		    }


		/* 6. Nice Selectorp  */
		  var nice_Select = $('select');
		    if(nice_Select.length){
		      nice_Select.niceSelect();
		    }

		/* 7.  Custom Sticky Menu  */
		    $(window).on('scroll', function () {
		      var scroll = $(window).scrollTop();
		      if (scroll < 245) {
		        $(".header-sticky").removeClass("sticky-bar");
		      } else {
		        $(".header-sticky").addClass("sticky-bar");
		      }
		    });

		    $(window).on('scroll', function () {
		      var scroll = $(window).scrollTop();
		      if (scroll < 245) {
		          $(".header-sticky").removeClass("sticky");
		      } else {
		          $(".header-sticky").addClass("sticky");
		      }
		    });



		/* 8. sildeBar scroll */
		    $.scrollUp({
		      scrollName: 'scrollUp', // Element ID
		      topDistance: '300', // Distance from top before showing element (px)
		      topSpeed: 300, // Speed back to top (ms)
		      animation: 'fade', // Fade, slide, none
		      animationInSpeed: 200, // Animation in speed (ms)
		      animationOutSpeed: 200, // Animation out speed (ms)
		      scrollText: '<i class="ti-arrow-up"></i>', // Text for element
		      activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
		    });


		/* 9. data-background */
		    $("[data-background]").each(function () {
		      $(this).css("background-image", "url(" + $(this).attr("data-background") + ")")
		      });


		/* 10. WOW active */
		    new WOW().init();

		/* 11. Datepicker */
		    
		// 11. ---- Mailchimp js --------//  
		    function mailChimp() {
		      $('#mc_embed_signup').find('form').ajaxChimp();
		    }
		    mailChimp();


		// 12 Pop Up Img
		    var popUp = $('.single_gallery_part, .img-pop-up');
		      if(popUp.length){
		        popUp.magnificPopup({
		          type: 'image',
		          gallery:{
		            enabled:true
		          }
		        });
		      }
		//Another popUp     
		      var popUp = $('.menorie-icon');
		      if(popUp.length){
		        popUp.magnificPopup({
		          type: 'image',
		          gallery:{
		            enabled:true
		          }
		        });
		      }
		// 

		//Brand Active
		  $('.brand-active').slick({
		    dots: false,
		    infinite: true,
		    speed: 300,
		    autoplay:true,
		    speed: 1000,
		    arrows: false,
		    slidesToShow: 5,
		    slidesToScroll: 1,
		    responsive: [
		      {
		        breakpoint: 1024,
		        settings: {
		          slidesToShow: 3,
		          slidesToScroll: 3,
		          infinite: true,
		          dots: false,
		        }
		      },
		      {
		        breakpoint: 600,
		        settings: {
		          slidesToShow: 2,
		          slidesToScroll: 2
		        }
		      },
		      {
		        breakpoint: 991,
		        settings: {
		          slidesToShow: 2,
		          slidesToScroll: 1
		        }
		      },
		      {
		        breakpoint: 480,
		        settings: {
		          slidesToShow: 1,
		          slidesToScroll: 1
		        }
		      }
		      // You can unslick at a given breakpoint now by adding:
		      // settings: "unslick"
		      // instead of a settings object
		    ]
		  });





		})(jQuery);

</script>	
</body>

</html>