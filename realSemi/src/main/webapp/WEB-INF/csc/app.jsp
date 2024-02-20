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
<title>버거킹앱 이용안내</title>

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
	href="<%=ctxPath%>/chy.css/csc/app.css" />

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

	<div class="contentsWrap">
		<div class="locationWrap WEB">
			<div class="web_container">
				<div class="page_navi">
					<a href="#/home" class=""><span>HOME >&nbsp;</span></a><span>고객센터>&nbsp;</span><span>버거킹앱
						이용안내</span>
				</div>
			</div>
		</div>
		<div class="contentsBox01 bg_w">
			<div class="web_container">
				<div class="subtitWrap">
					<h3 class="page_tit">고객센터</h3>
					<div class="tab01 m_shadow">
						<ul>
							<li><a href="#">공지사항</a></li>
							<li class="on"><a>버거킹앱 이용안내</a></li>
							<li><a href="#">FAQ</a></li>
							<li><a href="<%= ctxPath%>/csc/inquire.bk">문의</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="tab_cont guideWrap">
			<!-- <h4 class="hide">버거킹앱 이용안내</h4> -->
			<div class="contentsBox01 bg_w appdown_guide">
				<div class="web_container">
					<h4 class="subtit">
						<span>버거킹 APP(앱) 다운로드</span>
					</h4>
					<p class="txt">
						<span>아래 방법 중 편리한 방법으로 <strong>버거킹앱을</strong></span><span><strong>다운로드</strong>하세요.</span>
					</p>
					<div class="WEB guide_img">
						<img src="https://www.burgerking.co.kr/dist/img/img_guide_appdown.412eb94b.jpg" alt="앱 화면 이미지">
					</div>
					<div class="MOB guide_img">
						<img src="https://www.burgerking.co.kr/dist/img/img_guide_appdown_m.e9220f45.jpg"
							alt="앱 화면 이미지">
					</div>
					<div class="appdown">
						<dl class="store_down">
							<dt>스토어 다운로드</dt>
							<dd>
								<p>
									애플 앱스토어와 구글 플레이스토어에서 <strong>버거킹 앱</strong>을 다운로드 해보세요.
								</p>
								<div class="btn_area">
									<a
										href="https://play.google.com/store/apps/details?id=kr.co.burgerkinghybrid"
										target="_blank" class="btn_googleplay"><span>Google
											Play</span></a><a
										href="https://itunes.apple.com/kr/app/apple-store/id1017567032"
										target="_blank" class="btn_appstore"><span>App
											Store</span></a>
								</div>
							</dd>
						</dl>
						<dl class="WEB">
							<dt>QR코드 다운로드</dt>
							<dd>
								<p>
									QR코드를 스캔하여 <br>
									<strong>버거킹 앱</strong>을 다운로드 해보세요.
								</p>
								<div class="QRcode">
									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOcAAADnAQMAAADfOtNjAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAUFJREFUWIXtmDGWgzAMRMePIiVH4CgcDY6Wo3CELSl41kpjh2d22WrTTJ6nCfi7USSNZYCurq53aLTQPtoT2d+2me+bMo2HYffltdD1tahLZ8vDDjDQL8xrRP8B1BMZy/gcium5ZDz++je0KKImg6YSL35XrBatvhFdxma7dRUl2mxis91KikaEyQ1jMsNA30jHo/F2PRoWmA5gYrylGL3ZpCmW/AqUe3GVHI0MgjW5WqRuLhYvTCNCejupl6bbh11qUo3SMLwKy2llcXb98HY5utXhCAvKMitUmEbqElNn4KgULnLGq0j9khGjxMj2OqVMz00edhn32ppUpOeMBDRhS9N44MG7lJ9rvJL09PbaZbmZKIRpfIVIN6eVMOXnh7gPVqdXpuB90E8rO7jSXjkkafUNFiO46cZVlGhXV9f/9A1q0NQxitEizAAAAABJRU5ErkJggg=="
										alt="QR">
								</div>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<div class="contentsBox01 app_guide">
				<div class="web_container container01">
					<h4 class="subtit">
						<span>앱 이용방법</span>
					</h4>
					<p class="txt">버거킹 앱으로 편리하게 주문할 수 있는 방법과 고객님이 누릴 수 있는 혜택들을
						소개해드립니다.</p>
					<ul class="guide_list">
						<li><a class="membership"><strong>멤버십<br>이용안내
							</strong></a></li>
						<li><a class="delivery"><strong>딜리버리 <br>이용안내
							</strong></a></li>
						<li><a class="king"><strong>킹오더 <br>이용안내
							</strong></a></li>
						<li><a class="search"><strong>매장찾기<br> 이용안내
							</strong></a></li>
						<li><a class="coupon"><strong>쿠폰 <br>이용안내
							</strong></a></li>
					</ul>
					<div class="WEB order_caution">
						<h4 class="tit03">유의사항</h4>
						<h5 class="tit05">이용 가능 단말기 안내</h5>
						<ul class="txtlist01 ">
							<li>Android 4.4 이상, IOS 9.0 이상</li>
							<li>이 버전 이하의 단말기에서는 구글 플레이스토어 또는 애플 앱스토어에 버거킹앱이 표시되지 않습니다.</li>
							<li>단말기 OS 업그레이드 후 버거킹앱을 다운로드하거나 모바일 홈페이지를 이용하시길 바랍니다.</li>
							<li>단말기의 보안 유지를 위해 운영체제와 사용하는 백신프로그램을 최신 버전으로 업데이트하시길 권장합니다.<br>또한,
								백신프로그램을 이용하여 수시로 바이러스 검사하시길 바랍니다.
							</li>
							<li>버거킹 홈페이지, 버거킹앱을 통한 주문 또는 개인정보를 입력해야 하는 서비스 이용할 경우 출처가
								불분명하거나 보안 설정이 없는 무선 랜(Wi-Fi)을 이용하기보다는 무선 인터넷(4G, LTE)을 이용하시기
								바랍니다.</li>
						</ul>
						<h5 class="tit05">이용 가능 회원</h5>
						<ul class="txtlist01">
							<li>정상적으로 이용 가능한 온라인회원, SNS로그인 회원 또는 본인인증을 완료한 회원은 이용할 수
								있습니다.</li>
							<li>온라인회원가입은 버거킹 홈페이지, 버거킹앱에서 가능합니다.</li>
						</ul>
						<h5 class="tit05">참고사항</h5>
						<ul class="txtlist01">
							<li>무선 인터넷(4G, LTE)을 이용할 경우, 회원님이 가입한 이동통신사의 요금제에 따라 데이터
								이용요금이 부과될 수 있습니다.<br>단, 무선 랜(Wi-Fi) 이용 시, 데이터 요금이 발생하지
								않습니다.
							</li>
						</ul>
					</div>
					<div class="MOB order_caution">
						<div class="acc_tit">
							<h2 class="tit">유의사항</h2>
							<button type="button" class="btn_acc">
								<span>contents show/hide</span>
							</button>
						</div>
						<div class="acc_cont">
							<h5 class="tit05">이용 가능 단말기 안내</h5>
							<ul class="txtlist01 ">
								<li>Android 4.4 이상, IOS 9.0 이상</li>
								<li>이 버전 이하의 단말기에서는 구글 플레이스토어 또는 애플 앱스토어에 버거킹앱이 표시되지 않습니다.</li>
								<li>단말기 OS 업그레이드 후 버거킹앱을 다운로드하거나 모바일 홈페이지를 이용하시길 바랍니다.</li>
								<li>단말기의 보안 유지를 위해 운영체제와 사용하는 백신프로그램을 최신 버전으로 업데이트하시길
									권장합니다.<br>또한, 백신프로그램을 이용하여 수시로 바이러스 검사하시길 바랍니다.
								</li>
								<li>버거킹 홈페이지, 버거킹앱을 통한 주문 또는 개인정보를 입력해야 하는 서비스 이용할 경우 출처가
									불분명하거나 보안 설정이 없는 무선 랜(Wi-Fi)을 이용하기보다는 무선 인터넷(4G, LTE)을 이용하시기
									바랍니다.</li>
							</ul>
							<h5 class="tit05">이용 가능 회원</h5>
							<ul class="txtlist01">
								<li>정상적으로 이용 가능한 온라인회원, SNS로그인 회원 또는 본인인증을 완료한 회원은 이용할 수
									있습니다.</li>
								<li>온라인회원가입은 버거킹 홈페이지, 버거킹앱에서 가능합니다.</li>
							</ul>
							<h5 class="tit05">참고사항</h5>
							<ul class="txtlist01">
								<li>무선 인터넷(4G, LTE)을 이용할 경우, 회원님이 가입한 이동통신사의 요금제에 따라 데이터
									이용요금이 부과될 수 있습니다.<br>단, 무선 랜(Wi-Fi) 이용 시, 데이터 요금이 발생하지
									않습니다.
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!---->
	</div>
<jsp:include page="../footer.jsp" />
</body>
</html>