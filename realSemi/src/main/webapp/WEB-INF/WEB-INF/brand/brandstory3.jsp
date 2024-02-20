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
<title>COMM</title>

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
	href="<%=ctxPath%>/chy.css/brandstory/brandstory3.css" />

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

<style type="text/css">

.thumb {
    position: relative;
    width: 100%; /* 이미지 너비에 맞게 조절 */
    height: 0;
    padding-top: 56.25%; /* 16:9 비율을 유지하려면 높이를 너비의 56.25%로 설정 */
    overflow: hidden;
}

.thumb img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지를 캡처하여 적절한 크기로 조정하고 자르기 */
    cursor: pointer; /* 클릭 가능한 커서로 설정 */
  }
    
</style>


<script>

function playVideo(videoId, clickedImage) {
    var playerDivId = 'youtube-player';
    var playerUrl = 'https://www.youtube.com/embed/' + videoId + '?rel=0&amp;showinfo=0&amp;autoplay=1';
    
    // 기존에 플레이어에 무언가 내용이 있으면 지우고 새로운 동영상을 표시합니다
    $('#' + playerDivId).empty();
    
    // 클릭한 이미지에 테두리 스타일을 적용하고, 다른 이미지의 테두리 스타일을 제거합니다
    $('.thumb img').css('border', 'none'); // 모든 이미지의 테두리 스타일 제거
    $(clickedImage).css('border', '6px solid #e22219'); // 클릭한 이미지에 테두리 스타일 적용
    
    // YouTube 비디오를 플레이어에 표시합니다
    var iframe = $('<iframe width="100%" height="605" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
    iframe.attr('src', playerUrl);
    $('#' + playerDivId).append(iframe);
}



</script>


<jsp:include page="../header.jsp" />

</head>
<body onload="playVideo('RGCXBjVG8ug')">


<div class="contentsWrap eventWrap">
		<div class="locationWrap WEB">
			<div class="web_container">
				<div class="page_navi">
					<a href="#/home" class=""><span>HOME</span></a><span>브랜드스토리</span><span>BRAND</span>
				</div>
			</div>
		</div>
		
		<div class="contentsBox01 bg_w">
		<div class="web_container">
			<div class="subtitWrap">
				<h3 class="page_tit">브랜드 스토리</h3>
				<div class="tab01 bdBot">
					<ul>						
						<li><a href="<%=ctxPath%>/brand/brandstory1.bk">BRAND</a></li>
						<li><a href="<%=ctxPath%>/brand/brandstory2.bk">WHOPPER</a></li>
						<li class="on"><a>COMM.</a></li>		
					</ul>
				</div>
			</div>
		</div>
		
		
		<div class="tab_storyWrap">
				
			<ul class="nav nav-tabs nav-justified">
			  <li class="nav-item">
			    <a class="nav-link active" data-toggle="tab" href="#home">광고(TV/Digital)</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu1"><span>수상내역</span></a>
			  </li>
			   <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu2">신제품</a>
			  </li>
			   <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu3">ESG</a>
			  </li>
			  
			</ul>

				
				

				<!-- Tab panes -->
			<div class="tab-content py-3">
				 <div class="tab-pane container active" id="home">
						<div class="tab_cont container01">
							<div class="TV_movie">
								<strong class="tit">트러플 머쉬룸 와퍼</strong>
								
								<div id="youtube-player">
								<iframe										
										width="100%" height="605" frameborder="0"
										allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
										allowfullscreen="allowfullscreen"></iframe>
								</div>
							</div>
							<div class="movie_list">
								<div class="tab01">
									<ul>
										<li class="on"><button type="button">
												<span>ALL</span>
											</button></li>
										<li class=""><button type="button">
												<span>2023~2020</span>
											</button></li>
										<li class=""><button type="button">
												<span>2019~2015</span>
											</button></li>
										<li class=""><button type="button">
												<span>2014~</span>
											</button></li>
									</ul>
								</div>



								<ul class="list">
									<li>
										<div id="youtube-player" class="thumb">
													<img
														src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/1f6d6c7a-fc65-405e-91d6-b7e28d3979a2.png"
														onclick="playVideo('RGCXBjVG8ug', this)">
												</div>
										<div class="tit">트러플 머쉬룸 와퍼</div>
									</li>

									<div class="movie_list">
										<!-- 다른 동영상 목록과 관련된 코드 추가 가능 -->
									   <li>
										<div id="youtube-player" class="thumb">
											<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/b89eea28-72e5-44ce-8a9e-6383813a1171.png"
												 onclick="playVideo('Ty-f0eOiS38', this)">
										</div>
										<div class="tit">오리지널스 페퍼잭</div>
									   </li>
									   
									   <li>
										<div id="youtube-player" class="thumb">
											<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/6ddd73e0-12dc-4bc5-ad90-6481ef17eeea.png"
												 onclick="playVideo('YnLEPtFSmFM', this)">
										</div>
										<div class="tit">헬로 디아블로 와퍼</div>
									   </li>
									   
									   <li>
										<div id="youtube-player" class="thumb">
											<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/0c486328-7dcd-47f5-8772-ff6434489480.png"
												 onclick="playVideo('4CO98aFxRbA',this)">
										</div>
										<div class="tit">헬로 이나리우스 와퍼, 헬로 릴리트 와퍼</div>
									   </li>
									   
									   <li>
										<div id="youtube-player" class="thumb">
											<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/a8ed45c7-938e-4da2-829e-d5cc29d2afd7.png"
												 onclick="playVideo('YuGlUzb0x6A',this)">
										</div>
										<div class="tit">23년 5월 올데이킹</div>
									   </li>
									   
									   <li>
										<div id="youtube-player" class="thumb">
											<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/82eee3af-3cce-4b10-a13a-939f74d42652.png"
												 onclick="playVideo('85jrGITDPHc',this)">
										</div>
										<div class="tit">스모키 바비큐 와퍼</div>
									   </li>
									   
									    <li>
										<div id="youtube-player" class="thumb">
											<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/ccd3ae09-2e7c-470b-8f55-dfe0e8203cbd.png"
												 onclick="playVideo('Ugc6oiYNSE8',this)">
										</div>
										<div class="tit">치킨킹 - Life</div>
									   </li>
									   
									   <li>
										<div id="youtube-player" class="thumb">
											<img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/de433260-e78b-4e4d-a4a2-6a7aa04ab609.png"
												 onclick="playVideo('Ugc6oiYNSE8',this)">
										</div>
										<div class="tit">치킨킹 - Love</div>
									   </li>
									   
									</div>

									

									

									

									

									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/6ddd73e0-12dc-4bc5-ad90-6481ef17eeea.png" >
										</div>
										<div class="tit">헬로 디아블로 와퍼</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/0c486328-7dcd-47f5-8772-ff6434489480.png"onclick="playVideo('4CO98aFxRbA')">
										</div>
										<div class="tit">헬로 이나리우스 와퍼, 헬로 릴리트 와퍼</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/a8ed45c7-938e-4da2-829e-d5cc29d2afd7.png">
										</div>
										<div class="tit">23년 5월 올데이킹</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/82eee3af-3cce-4b10-a13a-939f74d42652.png">
										</div>
										<div class="tit">스모키 바비큐 와퍼</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/ccd3ae09-2e7c-470b-8f55-dfe0e8203cbd.png">
										</div>
										<div class="tit">치킨킹 - Life</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/de433260-e78b-4e4d-a4a2-6a7aa04ab609.png">
										</div>
										<div class="tit">치킨킹 - Love</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/71223293-1c33-471d-b5d6-ac047b6dc17d.png">
										</div>
										<div class="tit">블랙 어니언 와퍼</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/ee6a2d1e-79b8-4a0f-9b3f-2e6c4e7c7cc2.png">
										</div>
										<div class="tit">골든치즈렐라 와퍼</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/ff7bebee-67aa-42ad-a38a-7899f5bc1312.png">
										</div>
										<div class="tit">타바스코 버거</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/1d1c83b4-b09e-44f6-8449-80e4150f4222.png">
										</div>
										<div class="tit">잔망루피 슈림프 버거</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/41469dd0-9bc1-4338-845f-95c6b690fccb.png">
										</div>
										<div class="tit">텍사스칠리 와퍼</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/7b5e67b6-58d0-4339-814a-515204df4d99.png">
										</div>
										<div class="tit">피넛버터스태커</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/c03542be-cae4-4455-91d3-aaeac62d8e9b.png">
										</div>
										<div class="tit">앵그리트러플와퍼</div></li>
									<li><input type="radio" name="rdoBanner">
									<div class="thumb">
											<img
												src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/film/d0b9fb83-9ba7-46af-ba2c-b4f682aedd81.png">
										</div>
										<div class="tit">더블화이트갈릭와퍼</div></li>
								</ul>
							</div>
							<div class="c_btn">
								<button type="button" class="btn01 more" style="">
									<span>더보기</span>
								</button>
							</div>
						</div>
					</div>

					<div class="tab-pane container" id="menu1">
					  <!-- <h4 class="MOB m_subtit">수상내역</h4> -->
						<div class="WEB">
							<div class="awards_title">
								<img
									src="https://www.burgerking.co.kr/dist/img/awards_title.4c38483a.png"
									alt="awards">
							</div>
						</div>

						<div class="tab_awards awards">
							<div class="group y2022">
								<div class="year">2022</div>
								<ul class="list">
									<li><div class="title">DIGITAL FRANCHISEE OF THE
											YEAR</div>
										<div class="text">BURGER KING GLOBAL</div></li>
									<li><div class="title">FRANCHISEE OF THE YEAR</div>
										<div class="text">BURGER KING APAC</div></li>
									<li><div class="title">DIGITAL FRANCHISEE OF THE
											YEAR</div>
										<div class="text">BURGER KING APAC</div></li>
									<li><div class="title">2022 프리미엄브랜드지수(KS-PBI) 패스트푸드
											부문 1위</div>
										<div class="text">한국표준협회(KSA)</div></li>
									<li><div class="title">100대 프렌차이즈브랜드 선정</div>
										<div class="text">매일경제신문</div></li>
									<li><div class="title">고객신뢰도 1위 프리미엄브랜드 선정, 패스트푸드부문
											대상</div>
										<div class="text">중앙일보S</div></li>
									<li><div class="title">한국에서 가장 존경받는 기업 1위</div>
										<div class="text">한국능률협회컨설팅(KMAC)</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2021">
								<div class="year">2021</div>
								<ul class="list">
									<li><div class="title">2021 코리아 프랜차이즈 어워즈</div>
										<div class="text">포브스코리아</div></li>
									<li><div class="title">글로벌 지속가능기업 100</div>
										<div class="text">UN SDGs</div></li>
									<li><div class="title">프리미엄브랜드지수(KS-PBI) 패스트푸드 부문 1위</div>
										<div class="text">한국표준협회(KSA)</div></li>
									<li><div class="title">매경 100대 프랜차이즈 브랜드</div>
										<div class="text">매일경제신문사</div></li>
									<li><div class="title">한국에서 가장 존경받는 기업 1위</div>
										<div class="text">한국능률협회컨설팅(KMAC)</div></li>
									<li><div class="title">DEVELOPER OF THE YEAR 2021</div>
										<div class="text">BURGER KING GLOBAL</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2020">
								<div class="year">2020</div>
								<ul class="list">
									<li><div class="title">프리미엄브랜드지수(KS-PBI) 패스트푸드 부문 1위</div>
										<div class="text">한국표준협회(KSA)</div></li>
									<li><div class="title">2020 에피 어워드(Effie Award) 코리아
											식품 부문 은상</div>
										<div class="text">Effie</div></li>
									<li><div class="title">한국에서 가장 존경받는 기업 1위</div>
										<div class="text">한국능률협회컨설팅(KMAC)</div></li>
									<li><div class="title">2019년 서울영상광고제 TV 부문 동상 수상</div>
										<div class="text">서울영상광고제 집행위원회</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2019">
								<div class="year">2019</div>
								<ul class="list">
									<li><div class="title">서울 크리에이티브 페스티벌 동상</div>
										<div class="text">서울영상광고제 집행위원회</div></li>
									<li><div class="title">MARKETER OF THE YEAR 2019</div>
										<div class="text">BURGER KING GLOBAL</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2018">
								<div class="year">2018</div>
								<ul class="list">
									<li><div class="title">제26회 국민이 선택한 좋은 광고상 OOH부문 좋은
											광고상</div>
										<div class="text">한국광고주협회</div></li>
									<li><div class="title">웹어워드 코리아 프로모션 통합 대상</div>
										<div class="text">한국인터넷전문가협회(KIPFA)</div></li>
									<li><div class="title">MARKETER OF THE YEAR 2018</div>
										<div class="text">BURGER KING GLOBAL</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2017">
								<div class="year">2017</div>
								<ul class="list">
									<li><div class="title">2016년 서울영상광고제 TV 부문 동상 수상</div>
										<div class="text">서울영상광고제 집행위원회</div></li>
									<li><div class="title">2017 칸 국제광고제 미디어부문 은상</div>
										<div class="text"></div></li>
									<li><div class="title">DEVELOPER OF THE YEAR 2017</div>
										<div class="text">BURGER KING GLOBAL</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2016">
								<div class="year">2016</div>
								<ul class="list">
									<li><div class="title">제24회 국민이 선택한 좋은 광고상 문체부 장관상</div>
										<div class="text">한국광고주협회</div></li>
									<li><div class="title">MARKETER OF THE YEAR 2016</div>
										<div class="text">BURGER KING GLOBAL</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2015">
								<div class="year">2015</div>
								<ul class="list">
									<li><div class="title">한국 산업 서비스 품질지수 고객접점 부문 1위</div>
										<div class="text">한국능률협회컨설팅(KMAC)</div></li>
									<li><div class="title">DEVELOPER OF THE YEAR 2015</div>
										<div class="text">BURGER KING GLOBAL</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2014">
								<div class="year">2014</div>
								<ul class="list">
									<li><div class="title">FRANCHISEE OF THE YEAR 2014</div>
										<div class="text">BURGER KING GLOBAL</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2012">
								<div class="year">2012</div>
								<ul class="list">
									<li><div class="title">DEVELOPER OF THE YEAR 2012</div>
										<div class="text">BURGER KING GLOBAL</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2011">
								<div class="year">2011</div>
								<ul class="list">
									<li><div class="title">한국서비스품질지수 패스트푸드 부문 1위</div>
										<div class="text">한국능률협회컨설팅(KMAC)</div></li>
									<li><div class="title">DEVELOPER OF THE YEAR 2011</div>
										<div class="text">BURGER KING GLOBAL</div></li>
									<li><div class="title">FRANCHISEE OF THE YEAR 2011</div>
										<div class="text">BURGER KING GLOBAL</div></li>
								</ul>
								<div class="image"></div>
							</div>
							<div class="group y2010">
								<div class="year">2010</div>
								<ul class="list">
									<li><div class="title">FRANCHISEE OF THE YEAR 2010</div>
										<div class="text">BURGER KING GLOBAL</div></li>
								</ul>
								<div class="image"></div>
							</div>
						</div>

					</div>

					<div class="tab-pane container" id="menu2">

						<div class="new_product">
							<!-- <h4 class="MOB m_subtit">신제품 소개</h4> -->
							<ul class="prdmenu_list">
								<li><div class="prd_img WEB">
										<span><img
											src="https://d1cua0vf0mkpiy.cloudfront.net/images/news/96b1c072-eb08-4d99-915f-2b64bc82a8a5.png"></span>
									</div>
									<div class="prd_img MOB">
										<span><img
											src="https://d1cua0vf0mkpiy.cloudfront.net/images/news/7d0d56fe-5d2e-4421-8139-a74c31a6adcc.png"></span>
									</div>
									<div class="cont">
										<p class="tit">
											<strong>트러플 머쉬룸 와퍼</strong>
										</p>
										<p class="txt_intro">트러플소스 2배로 더욱 깊어진 풍미! 네 가지 머쉬룸이 선사하는
											깊고 풍부한 맛의 향연</p>
									</div></li>
								<li><div class="prd_img WEB">
										<span><img
											src="https://d1cua0vf0mkpiy.cloudfront.net/images/news/19ae70cd-a9c5-4913-b6e9-2f1850f8d501.png"></span>
									</div>
									<div class="prd_img MOB">
										<span><img
											src="https://d1cua0vf0mkpiy.cloudfront.net/images/news/594a80ed-83a1-4829-b9a6-16d1e1c6a995.png"></span>
									</div>
									<div class="cont">
										<p class="tit">
											<strong>더블 트러플 머쉬룸 와퍼</strong>
										</p>
										<p class="txt_intro">트러플소스 2배로 더욱 깊어진 풍미! 100% 순쇠고기 패티도
											2배!</p>
									</div></li>
								<li><div class="prd_img WEB">
										<span><img
											src="https://d1cua0vf0mkpiy.cloudfront.net/images/news/68b50256-d3d9-4777-9a3b-1beb5dc34250.png"></span>
									</div>
									<div class="prd_img MOB">
										<span><img
											src="https://d1cua0vf0mkpiy.cloudfront.net/images/news/a39fac4e-b955-4b7a-b8dd-47f4a3dac025.png"></span>
									</div>
									<div class="cont">
										<p class="tit">
											<strong>트러플 머쉬룸 와퍼주니어</strong>
										</p>
										<p class="txt_intro">트러플소스 2배로 더욱 깊어진 풍미! 네 가지 머쉬룸이 선사하는
											깊고 풍부한 맛의 향연을 와퍼주니어로!</p>
									</div></li>
							</ul>
						</div>

					</div>

					<div class="tab-pane container" id="menu3">
						<div class="web_container esg">
							<div class="text">버거킹은 친환경 캠페인에서부터 고용 창출, 농가 상생에 이르기까지 지속
								가능한 사회를 위해 노력합니다,</div>
							<div class="section">
								<div class="title">환경 보호</div>
								<div class="list">
									<div class="item">
										<div class="sub_title">플라스틱 빨대 사용 줄이기 캠페인</div>
										<div class="WEB">
											<div class="image">
												<img src="https://www.burgerking.co.kr/dist/img/@img_contribution3.265da262.png">
											</div>
										</div>
										<div class="MOB">
											<div class="image">
												<img src="https://www.burgerking.co.kr/dist/img/@img_contribution3.265da262.png">
											</div>
										</div>
										<div class="text">빨대 없이 마실 수 있는 드링킹 리드를 사용 중입니다.</div>
									</div>
									<div class="item">
										<div class="sub_title">RA(Rainforest Alliance) 인증 커피 원두
										</div>
										<div class="WEB">
											<div class="image ra">
												<img src="https://www.burgerking.co.kr/dist/img/ra_seal_web.27ceae10.png">
											</div>
										</div>
										<div class="MOB">
											<div class="image ra">
												<img src="http://localhost:9090/dist/img/ra_seal_web.27ceae10.png">
											</div>
										</div>
										<div class="text">환경 및 커피 노동자의 안전까지 고려하여 생산하는 커피 원두를
											사용하고 있습니다</div>
									</div>
								</div>
							</div>
							<div class="section">
								<div class="title">사회 공헌</div>
								<div class="sub_title">지역 농가 상생</div>
								<div class="text">농가 상생 도모를 위하여 양파, 양상추, 토마토 등의 주 재료를 국내
									농가에서 연간 각 1,000t 이상 수급 받아 사용하고 있습니다</div>
								<div class="sub_title">함께 사는 세상</div>
								<div class="text">동물과 사람이 함께 행복한 세상을 만들기 위하여 비글네트워크와 동행 등
									동물 복지를 위해 힘쓰는 단체에 반려견들을 위한 독퍼 기부를 진행했습니다</div>
							</div>
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