<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String ctxPath = request.getContextPath();
//    /MyMVC
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BRAND</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css">

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/chy.css/brandstory/brandstory1.css" />

<%-- Optional JavaScript  --%>
<script type="text/javascript"
	src="<%=ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js"></script>

<%--jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript"
	src="<%=ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript"
	src="<%=ctxPath%>/js/template/template.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Flamenco&family=IBM+Plex+Mono:ital,wght@1,500&display=swap')
	;
	

</style>
<jsp:include page="../header.jsp" />

</head>
<body>
<div class="contentsWrap eventWrap" style="padding-top:90px;">
	<div class="locationWrap WEB">
		<div class="web_container">
			<div class="page_navi">
				
			</div>
		</div>
	</div>
	<div class="contentsBox01 bg_w">
		<div class="web_container">
			<div class="subtitWrap">
				<h3 class="page_tit">브랜드 스토리</h3>
				<div class="tab01 bdBot">
						<ul>
							<li class="on"><a>BRAND</a></li>
							<li><a href="<%=ctxPath%>/brand/brandstory2.bk">WHOPPER</a></li>
							<li><a href="<%=ctxPath%>/brand/brandstory3.bk">COMM.</a></li>
						</ul>
					</div>
			</div>
		</div>
		
		
		<div class="tab_storyWrap">
				
			<ul class="nav nav-tabs nav-justified">
			  <li class="nav-item">
			    <a class="nav-link active" data-toggle="tab" href="#home">BRAND philosophy</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu1">SMART QSR</a>
			  </li>
			  
			</ul>
			
			<!-- Tab panes -->
			<div class="tab-content py-3">
			  <div class="tab-pane container active" id="home">
				  <div class="about01">
				  	
				  	<img src="https://www.burgerking.co.kr/dist/img/img_story01.33f0084e.jpg"><br>
					<br>
					<p>세계 최대 QSR(Quick Service Restaurant) 브랜드 중 하나인 버거킹은 1954년 미국
					   마이애미에서 James W.McLamore와 David Edgerton에 의해 설립되었습니다. 버거킹은 현재 100개
					   이상의 국가에서 15,000개 이상의 매장을 운영하고 있습니다. 고기를 팬에 굽는 일반 QSR과는 달리, 버거킹은
					   고기를 직접 불에 구워 조리하는 직화 방식 (Flame-Broiling)으로 담백하고 풍부한 맛과 향, 그리고 정통
					   햄버거의 풍미를 선보이고 있습니다. 버거킹의 대표 제품인 와퍼(Whopper)는 100% 순 쇠고기 패티와 함께
					   양상추, 토마토, 양파, 피클 등 4가지 신선한 야채가 어우러진 풍부한 맛으로 전세계 고객에게 사랑 받고 있습니다.
					</p>
				  </div>
				  
				  <div class="about02">
						<img
							src="https://www.burgerking.co.kr/dist/img/img_story02.c260d83c.jpg"><br>
						
						<h3>버거킹 KOREA</h3>
	
						<p>버거킹은 지난 1984년 종로점을 오픈하며 한국에 진출한 이래, 차별화된 제품과 개성 있는 매장 인테리어로
							지난 39년간 한국 소비자의 사랑을 받아오고 있습니다. “가장 맛있는 햄버거를 제공하는 프리미엄 QSR 브랜드”로
							자리매김한 버거킹은 현재 전국 472개(2023년 7월 기준) 매장을 운영하고 있습니다. 좋은 품질의
							제품(Quality)과 친절한 서비스 (Service) 그리고 청결한 매장(Cleanliness)은 고객 여러분께 더
							큰 만족을 드리고자 노력하는 버거킹의 약속이자 가치입니다. 더욱 풍성하고 맛있는 제품과 정성을 다하는 고객 서비스로
							여러분께 더욱 가까이 다가가도록 하겠습니다.</p>
					</div>
			  </div>
			  <div class="tab-pane container" id="menu1">
			   <!-- <h3>버거킹 KOREA</h3> -->
				<div class="qsr web_container">
				<div class="text">프리미엄 QSR 브랜드 버거킹은 ‘가장 스마트한 QSR(Smartest QSR)
					브랜드’를 목표로 주문과 결제, 멤버십 프로그램 등 다양한 고객 혜택 제공을 위한 디지털 채널 경쟁력을 바탕으로 현재
					한국에서 가장 빠르게 성장하고 있습니다.</div>
				<h3 class="title">APP</h3>
							<h2></h2>
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item"
									src="https://www.youtube.com/embed/WGrYm1jb09k?si=m0F0GjWnql47lp6L"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>
							<br>
							<div class="text">편리한 배달 메뉴의 주문과 결제 서비스인 ‘딜리버리’, 매장 방문 전 주문이
					가능한 ‘킹오더’와 멤버십 프로그램을 통하여 최상의 고객 경험을 제공하고 있습니다. 누적 다운로드 수 약
					1000만(2023년 7월 기준)을 달성하였으며, 월간 앱 활성 이용자 수 190만명(2023년 7월 기준)을 기록하는
					등 동종QSR업계에서 압도적으로 높은 수준을 유지하고 있습니다.</div>
				<h3 class="title">Membership</h3>
				<div class="qsr_membership_slide image">
					<div class="container text-center my-5">
					    <h3 class="mb-3"></h3>
					    <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
					        <div class="carousel-inner w-100" role="listbox">
					            <div class="carousel-item row no-gutters active">
					                <div class=" float-left"><img class="img-fluid" src="https://www.burgerking.co.kr/dist/img/qsr_1.25ab3498.jpg"></div>
					                
					            </div>
					            <div class="carousel-item row no-gutters">
					                <div class="float-left"><img class="img-fluid" src="https://www.burgerking.co.kr/dist/img/qsr_2.a7d74fa9.jpg"></div>
					                
					            </div>
					            <div class="carousel-item row no-gutters">
					                <div class="float-left"><img class="img-fluid" src="https://www.burgerking.co.kr/dist/img/qsr_junior.b600c197.jpg"></div>
					                
					            </div>
					            <div class="carousel-item row no-gutters">
					                <div class="float-left"><img class="img-fluid" src="https://www.burgerking.co.kr/dist/img/qsr_king.11e77bd7.jpg"></div>
					                
					            </div>
					            
					        </div>
					        <a class="carousel-control-prev" href="#recipeCarousel" role="button" data-slide="prev">
					            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					            <span class="sr-only">Previous</span>
					        </a>
					        <a class="carousel-control-next" href="#recipeCarousel" role="button" data-slide="next">
					            <span class="carousel-control-next-icon" aria-hidden="true"></span>
					            <span class="sr-only">Next</span>
					        </a>
					    </div>
					   
					</div>
				</div>
				<div class="text">2021년 맞춤화된 고객 혜택 제공을 목표로 ‘버거킹 멤버십’을 런칭하였습니다.
					약 700만 명(2023년 7월 기준)의 버거킹 회원을 모두 만족시킬 수 있도록 고객 편의성과 혜택, 맞춤형 정보 제공
					서비스를 제공하고 있습니다.</div>
				<h3 class="title">KIOSK</h3>
				<div class="image">
					<img src="https://www.burgerking.co.kr/dist/img/qsr_kiosk.94a4663e.png">
				</div>
				<div class="text">2016년 처음 무인 단말 시스템인 키오스크를 도입 하였으며, 현재는 전국
					버거킹 매장의 95%가 키오스크를 보유하고 있습니다 이는 전세계 버거킹 진출국 중에서도 최상위 수준에 해당하는 수준으로
					길었던 매장 주문 대기 시간을 대폭 단축시켰습니다. 많은 고객들이 더욱 빠르고 편리하게 버거킹의 프리미엄 가치를 경험할
					수 있도록 키오스크는 지속적으로 업데이트 되고 있습니다.</div>
			</div>
			  </div>
			  
			</div>	
			
			<br><br>
			
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>