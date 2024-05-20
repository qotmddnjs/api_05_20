<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<meta charset="UTF-8">
<title>${pageTitle }</title>
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Slick Carousel Example</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />
<body class="mainbody">


	<!-- 검색 창 -->
	<div class="navbar1">
		<!-- 검색 창 -->
		<div class="search-container" style="margin-right: 450px;">
			<form action="/search">
				<input type="text" placeholder="검색..." name="search" style="width: 300px;">
				<button type="submit">검색</button>
			</form>
		</div>
		<c:if test="${not rq.isLogined() }">
			<div class="login-signup-links">
				<!-- 로그인 링크 -->
				<a class="hover:underline" href="../member/login" style="margin-right: 50px;">로그인</a>

				<!-- 회원가입 링크 -->
				<a class="hover:underline" href="../member/join" style="margin-right: 50px;">회원가입</a>
			</div>
		</c:if>



	</div>
	<hr style="border-top: 3px solid white;" />
	<div class="mainback">
		<div class="container">

			<div class="slider">

				<div class="slides">

					<!--  The last slide goes before the first one,
        because the slideshow shows the second slide on load by default. -->
					<div class="slides__img" id="slide1">
						<div class="slides__img__filter"></div>
					</div>

					<div class="slides__img" id="slide2">
						<div class="slides__img__filter"></div>
					</div>

					<div class="slides__img" id="slide3">
						<div class="slides__img__filter"></div>
					</div>

					<div class="slides__img" id="slide4">
						<div class="slides__img__filter"></div>
					</div>

					<div class="slides__img" id="slide5">
						<div class="slides__img__filter"></div>
					</div>

				</div>

			</div>

		</div>
	</div>

	<!-- #Controls -->
	<a class="control fas fa-chevron-left" id="prev"></a>
	<a class="control fas fa-chevron-right" id="next"></a>

	<!-- #Position dots -->
	<div class="dots">
		<span class="dots__single" id="dot1"></span> <span class="dots__single" id="dot2"></span> <span class="dots__single"
			id="dot3"></span> <span class="dots__single" id="dot4"></span> <span class="dots__single" id="dot5"></span>
	</div>

	<script>
		// 크롤링한 이미지 URL 배열
		var imageUrls = [ "https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88012/88012_320.jpg", "https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88050/88050_320.jpg", "https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88030/88030_320.jpg", "https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88054/88054_320.jpg", "https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88052/88052_320.jpg" ];

		// 슬라이드 요소를 가져와서 이미지 URL을 설정
		var slideElements = document.querySelectorAll(".slides__img");
		for (var i = 0; i < slideElements.length; i++) {
			if (i < imageUrls.length) {
				slideElements[i].style.backgroundImage = "url('" + imageUrls[i]
						+ "')";
			} else {
				console.error("이미지 URL이 부족합니다.");
			}
		}
	</script>








	<script>
		/**
		 * @Author: Andrea Alba
		 * @Date:   2018-03-14T21:25:14+01:00
		 * @Email:  subjuliodesign [at] gmail.com
		 * @Project: Responsive Slideshow with jQuery
		 * @Filename: slideshow_final.js
		 * @Last modified by:   Andrea Alba
		 * @Last modified time: 2018-03-23T13:07:33+01:00
		 * @Copyright: subjuliodesign
		 */

		$(document)
				.ready(
						function() {
							//==================================
							// #Slideshow with jQuery
							//==================================

							// id generator
							function idGenerator() {
								$(".slides__img").each(function(index, el) {
									$(this).attr("id", "slide_" + index);
								});
								$(".dots__single").each(function(index, el) {
									$(this).attr("id", "dot_" + index);
								});
							}

							// id extractor
							// at the end it focuses the current dot
							function dotsFocus() {
								$("[id^='dot_']").removeClass("dots__current");
								var id = $(".slides__img:eq(1)").attr("id");
								var n = Number(id.substr(-1));
								if (n === 0) {
									n = $(".slides__img").length;
								}
								$("#dot_" + (n - 1)).addClass("dots__current");
							}

							// slide up caption
							function captionSlideUp(d, e) {
								var $cap1 = $(".slide__caption:eq(1)");
								$cap1.animate({
									bottom : "20%",
									opacity : 1
								}, {
									duration : d,
									easing : e,
									complete : dotsFocus()
								});
							}

							// slide down caption
							function captionSlideDown(d, e) {
								$(".slide__caption").animate({
									bottom : "5%",
									opacity : 0
								}, {
									duration : d,
									easing : e
								});
							}

							// slide movement
							function slideMove(t) {
								if (t === "prev") {
									return $(".slides__img").first().before(
											$(".slides__img").last());
								}
								if (t === "next") {
									return $(".slides__img").last().after(
											$(".slides__img").first());
								}
							}

							// slide images
							function slideIt(l, d, e, t) {
								var $slides = $(".slides");
								captionSlideDown(150, "linear");
								$slides.animate({
									left : l
								}, {
									duration : d,
									easing : e,
									complete : function() {
										$slides.css("left", "-100%");
										slideMove(t);
										captionSlideUp(1700, "swing");
									}
								});
							}

							// slide with dots
							function dotsControl(d, e) {
								$(".dots__single")
										.click(
												function() {
													var currentId = parseInt($(
															".dots__current")
															.attr("id").substr(
																	-1));
													var clickId = parseInt($(
															this).attr("id")
															.substr(-1));
													var max = $(".dots__single").length - 1;
													var half = Math
															.floor($(".dots__single").length / 2);
													var diff;
													if (currentId > clickId) {
														diff = currentId
																- clickId;
														if (diff === max) {
															diff = 1;
															l = "-200%";
															t = "next";
														} else if (diff <= half) {
															l = "0%";
															t = "prev";
														} else {
															diff--;
															l = "-200%";
															t = "next";
														}
													}
													if (currentId < clickId) {
														diff = clickId
																- currentId;
														if (diff === max) {
															diff = 1;
															l = "0%";
															t = "prev";
														} else if (diff <= half) {
															l = "-200%";
															t = "next";
														} else {
															diff--;
															l = "0%";
															t = "prev";
														}
													}
													for (var i = 0; i < diff; i++) {
														slideIt(l, d, e, t);
													}
												});
							}

							// slideshow
							function slideShow(d, e) {
								$("#prev").click(function() {
									var t = $(this).attr("id");
									slideIt("0%", d, e, t);
								});
								$("#next").click(function() {
									var t = $(this).attr("id");
									slideIt("-200%", d, e, t);
								});
								dotsControl(d, e);
							}

							idGenerator();
							captionSlideUp(1700, "swing");
							slideShow(800, "swing");
						});
	</script>
<%@ page import="java.util.List" %> <!-- List 클래스 import -->
<%@ page import="com.example.demo.util.CgvDAO" %>
<%@ page import="com.example.demo.vo.CgvVO" %>
<%@ page import="com.example.demo.util.CgvService" %>

<html>
<head>
    <title>Movie List</title>
</head>
<body class="mainbody2">
    <div class="wrapper">
        <h2>Slick Carousel Example</h2>
        <h3>추천영화</h3>
        <div class="carousel">
            <div class="card">
                <div class="card-header">
                    <img src="">
                </div>
                <div class="card-body">
                    <div class="card-content"></div>
                </div>
            </div> <div class="card">
                <div class="card-header">
                    <img src="">
                </div>
                <div class="card-body">
                    <div class="card-content"></div>
                </div>
            </div> <div class="card">
                <div class="card-header">
                    <img src="">
                </div>
                <div class="card-body">
                    <div class="card-content"></div>
                </div>
            </div> <div class="card">
                <div class="card-header">
                    <img src="">
                </div>
                <div class="card-body">
                    <div class="card-content"></div>
                </div>
            </div> <div class="card">
                <div class="card-header">
                    <img src="">
                </div>
                <div class="card-body">
                    <div class="card-content"></div>
                </div>
            </div>
             <div class="card">
                <div class="card-header">
                    <img src="">
                </div>
                <div class="card-body">
                    <div class="card-content"></div>
                </div>
            </div>
            
            <!-- 여러 개의 카드 중간 생략 -->
        </div>
    </div>

    <script>
        // 영화 목록을 가져와서 JavaScript 배열로 변환
        var movieList = [
            <% List<CgvVO> movies = new CgvDAO().getMovies(); %>
            <% for (int i = 0; i < movies.size(); i++) { %>
                <% CgvVO movie = movies.get(i); %>
                {
                    title: "<%= movie.getTitle() %>",
                    image: "<%= movie.getImage() %>",
                    genre: "<%= movie.getGenre() %>"
                }
                <% if (i < movies.size() - 1) { %>,<% } %>
            <% } %>
        ];

        // 이미지 URL 배열 초기화
        var imageUrls = [];

        // 영화 목록의 이미지 URL을 imageUrls 배열에 추가
        for (var i = 0; i < movieList.length; i++) {
            imageUrls.push(movieList[i].image);
        }

        // 카드 요소 가져오기
        var cardElements = document.querySelectorAll(".card");

        // 이미지 URL을 카드에 설정하고 클릭 이벤트 리스너 추가
        for (var i = 0; i < cardElements.length; i++) {
            if (i < imageUrls.length) {
                var imgElement = cardElements[i].querySelector("img");
                imgElement.src = imageUrls[i];
                cardElements[i].addEventListener("click", handleCardClick); // 클릭 이벤트 리스너 추가
                cardElements[i].setAttribute("data-index", i); // 각 카드에 인덱스 속성 추가
            } else {
                console.error("이미지 URL이 부족합니다.");
            }
        }

        // 카드 클릭 이벤트 핸들러
       function handleCardClick(event) {
    var index = event.currentTarget.getAttribute("data-index"); // 클릭한 카드의 인덱스 가져오기
    // "detail.jsp" 페이지로 이동
            window.location.href = "../article/detail?index=" + index;
        }
    </script>
</body>
</html>


</body>




	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.carousel').slick({
				speed : 300,
				slidesToShow : 4,
				slidesToScroll : 1,
				autoplay : true,
				autoplaySpeed : 1000,
				dots : true,
				centerMode : true,
				responsive : [ {
					breakpoint : 1024,
					settings : {
						slidesToShow : 3,
						slidesToScroll : 1,
					}
				}, {
					breakpoint : 800,
					settings : {
						slidesToShow : 2,
						slidesToScroll : 2,
					}
				}, {
					breakpoint : 480,
					settings : {
						slidesToShow : 1,
						slidesToScroll : 1,
					}
				} ]
			});
		});
	</script>
</body>




</body>
<div class="board-container">
	<div class="board">
		<h2>인기 영화</h2>
		<ul class="post-list">
			<li class="post">게시글 1</li>
			<li class="post">게시글 2</li>
			<li class="post">게시글 3</li>
		</ul>
	</div>

	<div class="board">
		<h2>인기 글</h2>
		<ul class="post-list">
			<li class="post">게시글 1</li>
			<li class="post">게시글 2</li>
			<li class="post">게시글 3</li>
		</ul>
	</div>
</div>

<div class = "crawl">
<div id="wrap" class="mvie5_4">
	










<script type="text/javascript">
	function mainTopMenuTopView(divName) {
		var frm = document.getElementById(divName);
		if(frm.style.display != "block") frm.style.display = "block";
		else frm.style.display = "none";
	}
	
	function fn_changeSearch() {
		SetCookie("sel_s_type", $("#sel_s_type").val());
		var pForm = document.searchMainTopMovie;
		
		if($("#sel_s_type").val() == "M") {
			pForm.action="/kobis/business/mast/mvie/searchMovieList.do";
			$("#inp_solrSearch").attr("name", "sMovName");
		} else {
			pForm.action="/kobis/business/comm/search/search.do";
			$("#inp_solrSearch").attr("name", "queryString");
		}
	}
	
	function fn_mainTopMovieSearch(){
		var pForm = document.searchMainTopMovie;
		pForm.submit();
	}
	
	$(document).ready(function() { 
	    if(GetCookie("sel_s_type") == "T") {
	    	$("#sel_s_type").val("T");
	    	
	    	var pForm = document.searchMainTopMovie;
	    	pForm.action="/kobis/business/comm/search/search.do";
	    	
	    	$("#inp_solrSearch").attr("name", "queryString"); 
	    }
	    $("ul.list_nav > li > a").click(function(){
	    
	    		
	    	if($(this).parent().find(".bg_sub ul.nav_sub > li:eq(0)  li.depth3:eq(0)").length >0){
	    		$(this).parent().find(".bg_sub ul.nav_sub > li:eq(0)  li.depth3:eq(0) a").click();
	    		goDirectPage($(this).parent().find(".bg_sub ul.nav_sub > li:eq(0)  li.depth3:eq(0) a").attr("href"));
	    	}else{
	    		$(this).parent().find(".bg_sub ul.nav_sub > li:eq(0) a").click();
	    		goDirectPage($(this).parent().find(".bg_sub ul.nav_sub > li:eq(0) a").attr("href"));
	    	}
	    	
	    	
	    	if($(this).parent().hasClass("nav5")){
	    		/* $(this).attr("href","/kobis/business/stat/online/onlinefindDailyBoxOfficeList.do"); */
	    		/* location.href="/kobis/business/stat/online/onlineMain.do"; */
	    		location.href="/kobis/business/stat/online/onlineintro.do";
	    		
	    	}
	    });
	}); 
	function goDirectPage(page){
		location.href=page;
	}
</script>


<script>
        $(document).ready(function() {
            // 여러분의 OpenWeatherMap API 키
            var apiKey = 'b342d193e9fb91052ba05619ca90dc8b';
            // 현재 날씨 데이터를 가져오기 위한 API 엔드포인트
            var apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
            var cityNameKorean = '대전'; // 도시 이름 한국어 표시용
            var cityNameEnglish = 'daejeon'; // 도시 이름 영어 API 요청용
            var params = {
                q: cityNameEnglish,
                appid: apiKey,
                units: 'metric'
            };
            // 날씨 데이터를 가져오기 위한 AJAX 요청
            $.ajax({
                url: apiUrl,
                data: params,
                dataType: 'json',
                success: function(data) {
                    // 날씨 아이콘 처리
                    var weatherIcon = data.weather[0].icon;
                    var iconUrl = 'http://openweathermap.org/img/wn/' + weatherIcon + '.png';
                    $('.weather-icon').html('<img src="' + iconUrl + '">');
                    // 온도 처리
                    var temperature = Math.round(data.main.temp);
                    $('.temperature').text(temperature + '°C');
                    
                    // 습도 처리
                    var humidity = data.main.humidity;
                    $('.humidity').text('습도: ' + humidity + '%');
                    // 풍속 처리
                    var windSpeed = data.wind.speed;
                    $('.wind-speed').text('풍속: ' + windSpeed + 'm/s');
                    // 도시 이름 처리
                    $('.city').text(cityNameKorean);
                },
                error: function(xhr, status, error) {
                    // 오류 처리
                    console.error('날씨 데이터 가져오기 오류:', error);
                }
            });
        });
    </script>
     <div class="weater-container-box" style="margin-left: 5%; margin-top: 7%;">
        <div class="city" style="font-size: 30px; font-weight: 700;"></div>
        <div class="weather-icon"></div>
        <div class="temperature" style="font-size: 30px; color: red; margin-top: 40px;"></div>
        <div class="humidity" style="font-size: 18px; margin-top: 10px;"></div>
       <div class="wind-speed" style="font-size: 18px; margin-top: 10px;"></div>
</div>
</script>
<!-- AceCounter Log Gathering Script End -->
	
              
              
                
       
          
    



<%@ include file="../common/foot.jspf"%>