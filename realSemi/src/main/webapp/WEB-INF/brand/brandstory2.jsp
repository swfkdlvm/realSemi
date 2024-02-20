<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WHOPPER</title>

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
	href="<%=ctxPath%>/chy.css/brandstory/brandstory2.css" />

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
						<li class="on"><a>WHOPPER</a></li>
						<li><a href="<%=ctxPath%>/brand/brandstory3.bk">COMM.</a></li>	
					</ul>
					
				</div>
			</div>
		</div>
		
		
		<div class="tab_storyWrap">
				
			<ul class="nav nav-tabs nav-justified">
			  <li class="nav-item">
			    <a class="nav-link active" data-toggle="tab" href="#home">Real Whopper</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu1"><span>FLAME GRILLED</span></a>
			  </li>
			   <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu2">신선한 재료</a>
			  </li>
			   <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu3">Trust in Taste</a>
			  </li>
			  
			</ul>
			
			<!-- Tab panes -->
			<div class="tab-content py-3">
			  <div class="tab-pane container active" id="home">
						<div class="tab_cont bg_w real">
							<div class="web_container">
								<h4 class="MOB m_subtit"></h4>
								<div class="realwhopper_title">
									<img src="https://www.burgerking.co.kr/dist/img/realwhopper_title.dd5a9b02.png">
								</div>
								<div class="realwhopper_list">
									<img src="https://www.burgerking.co.kr/dist/img/realwhopper_list.9c71b494.png">
								</div>
								<div class="realwhopper_text">
									<p>
										버거킹은 지난 5년간 끊임없이 <br> 더 건강하고 믿을 수 있는 와퍼를 만들기 위해 노력했습니다!
									</p>
									<p>
										와퍼의 모든 재료에 대해 지난 5년간 <br> 향료, 색소, 보존제, 첨가제 등의 제품 성분 개선
										활동을 통해 <br> 더욱 믿을 수 있고, 더욱 맛있는 리얼 와퍼가 탄생하였습니다!
									</p>
									<p>
										직화로 구운 불맛 100% 순쇠고기 패티에 <br> 보다 신선한 채소와 <br> 믿을 수 있는
										재료, 성분들로 완성된 <br> 버거킹의 대표 메뉴 와퍼의 변신!
									</p>
									<p>지금 버거킹에서 리얼와퍼를 만나보세요!</p>
								</div>
							</div>
						</div>					
			   </div>
			   
					<div class="tab-pane container" id="menu1">
					
						<div class="tab_cont bg_w flame_grilled" style="">
							<div class="whopper_intro">
								<div class="web_container">
									<h4 class="MOB m_subtit">What's WHOPPER?</h4>
									<div class="txt_whopper">
										<img src="https://www.burgerking.co.kr/dist/img/txt_whopper.06ce336d.gif">
									</div>
									<p>전 세계적으로 사랑 받는 WHOPPER는 불에 직접 구운 100% 순쇠고기 패티 위에 신선한 토마토,
										양상추, 양파, 마요네즈, 케첩, 상큼한 피클을 올린 버거킹의 대표 제품입니다.</p>
								</div>
							</div>
							<div class="grilled_intro">
								<div class="web_container">
									<h4 class="MOB m_subtit">Flame-Grilled 소개</h4>
									<div class="txt_img">
										<img src="https://www.burgerking.co.kr/dist/img/txt_flame_grilled.92305426.png">
									</div>
									<p class="txt">버거킹은 1954년 이후로 고기를 팬에 굽는 일반 QSR과는 달리 고기를 직접
										불에 구워 조리하는 직화 방식(Flame-Grilled) 으로 담백하고 풍부한 맛과 향, 그리고 정통 햄버거의
										풍미를 선보이고 있습니다. 이 과정에서 불필요한 기름기는 제거되고 고기의 육즙은 그대로 보존되어, 고기의 독특한
										맛과 향을 느낄 수 있습니다. 불에 직접 구워 담백하고 풍부한 맛! 버거킹의 햄버거만이 드릴 수 있는 특별한
										맛입니다.</p>
								</div>
							</div>
						</div>
					</div>

					<div class="tab-pane container" id="menu2">

						<div class="tab_cont bg_w" style="">
							<div class="material_intro01">
								<div class="web_container">
									
									<dl class="beef">
									    
										<dt> 
										    <img src="https://www.burgerking.co.kr/dist/img/img_material_beef.366804a6.gif">																		  
											<img											   
												src="data:image/gif;base64,R0lGODlh6gAkALMPAJBoRdbIvPXx7uHWzHtMJHE/E6SDZ8Ktmuvk3YVaNZp2Vq6ReMy6q7ifiWcxAv///yH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNy4xLWMwMDAgNzkuZGFiYWNiYiwgMjAyMS8wNC8xNC0wMDozOTo0NCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphNTkyY2M0OS00MTVmLTcyNGMtOGMzMy1mOTg4NjZmYzg3ZjYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MUY2QzFGQUE0MkI1MTFFQzkyRDBCMUNEMUU0MTNGQTciIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MUY2QzFGQTk0MkI1MTFFQzkyRDBCMUNEMUU0MTNGQTciIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ZWYzNmE0NmUtNDQ3ZC01NzQ1LTk0NGQtMDliYWE4MTA0MmEyIiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6ZWVmMDE5OWEtYzM2NC03NzQxLTk3ZTctZGZiYzhkNTExYTM4Ii8+IDwvcmRmOkRlc2Ny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"
												alt="100% BEEF">
										</dt>
										<dd>버거킹의 소고기 패티는 100% 순쇠고기로 만들어졌으며, 어떠한 방부제나 첨가물이 들어가지
											않습니다.</dd>
									</dl>
									<dl class="vegetable">
										<dt class="WEB">
										    <img src="https://www.burgerking.co.kr/dist/img/img_material_vegetable.ae40700e.gif">
											<img
												src="data:image/gif;base64,R0lGODlhIAFMALMPANbIvOHWzPXx7sKtmpBoRXE/E3tMJKSDZ+vk3YVaNZp2Vsy6q66ReLifiWcxAv///yH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNy4xLWMwMDAgNzkuZGFiYWNiYiwgMjAyMS8wNC8xNC0wMDozOTo0NCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpjYmVhZjhmNy1lZWQxLTU1NDMtOTU4Zi1jMTc0NDA3ZGE3YTUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MTAxOTVFMTg0MkI3MTFFQ0IyNEJGREU0MzdERjI5N0EiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MTAxOTVFMTc0MkI3MTFFQ0IyNEJGREU0MzdERjI5N0EiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ZWUyZGY5NDMtOWQxYS1mZTQwLTg4MTItYjE1MWIxMTkwZmNlIiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6Y2M2MWJhZTktYjI5Ni1hMjQ0LTg1ZjEtZjZhODY3NTMwMzZlIi8+IDwvcmRmOkRlc2Ny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"
												alt="FRESH VEGETABLES">
										</dt>
										
										<dd>버거킹의 모든 햄버거에는 엄격한 검수 과정을 통해 입고된 신선한 야채가 사용됩니다. 항상
											신선함을 추구하는 가치로, 매일 매장에서 토마토를 직접 준비합니다.</dd>
									</dl>
									<dl class="pickle">
										<dt>
										    <img src="https://www.burgerking.co.kr/dist/img/img_material_pickle.c8bce1a2.gif">
											<img src="https://www.burgerking.co.kr/dist/img/txt_material_pickle.5eb4bb41.gif"
												alt="PICKLES &amp;  MAYONNAISE">
										</dt>
										<dd>풍부하고 신선한 야채와 어우러진 고소한 마요네즈와 새콤달콤한 케첩은 정통 햄버거 특유의 풍미를
											제공합니다.</dd>
									</dl>
								</div>
							</div>
							<div class="material_intro02">
								<div class="web_container">
									<h4 class="tit">
										<span>신선한 </span><span>재료와 </span><span>철저한 </span><span>위생관리</span>
									</h4>
									<dl class="quality">
										<img
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABQCAYAAADm4nCVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6N0YzOUMxRUMxN0Q3MTFFOUIxNERGRkM2QjM4RTYxNTEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6N0YzOUMxRUQxN0Q3MTFFOUIxNERGRkM2QjM4RTYxNTEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3RjM5QzFFQTE3RDcxMUU5QjE0REZGQzZCMzhFNjE1MSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo3RjM5QzFFQjE3RDcxMUU5QjE0REZGQzZCMzhFNjE1MSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PiZUkAQAAAYZSURBVHja7JxrbBRV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"
											>
										<dt>QUALITY</dt>
										<dd>버거킹은 자체적으로 엄격한 품질 관리 시스템을 운영하고 있습니다. 지속적인 관리를 통해 버거킹
											원재료는 최상의 품질을 유지합니다. 올바른 품질 관리가 이루어지고 있는 업체만을 선정하여 원재료를 공급받고,
											자재가 매장에 입고될 땐 자체적으로 유통기한 및 제품 온도를 검사하여 기준에 미치지 못하는 제품은 반송합니다.
											또한 입고 후에도 보관 제품의 신선도 유지와 변질 방지에 한치의 소홀함도 용납하지 않음으로써, 버거킹을
											방문하시는 고객들에게 최상의 맛과 품질을 가진 제품만을 제공합니다.</dd>
									</dl>
									<dl class="service">
									    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGEAAABYCAYAAADlc5nGAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MDk3RTU2RjcxN0Q4MTFFOTlDRkY4MTZFNkI5NjUzNUYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MDk3RTU2RjgxN0Q4MTFFOTlDRkY4MTZFNkI5NjUzNUYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowOTdFNTZGNTE3RDgxMUU5OUNGRjgxNkU2Qjk2NTM1RiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowOTdFNTZGNjE3RDgxMUU5OUNGRjgxNkU2Qjk2NTM1RiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pgo/nXUAAAXjSURBVHja7J1ZaB1VGMdPFpu61GutFWkSBG31wQS3ulWjJaDWJRoblUrAreJDUfBBWheaB6FqXUCIbypYlEotVYrWtaYa21ilChqijVtoJVWsMXFBU625/j/ud/F4mDuZubOdmfn+8ON2bnNnzvn+M2eZOWdOTbFYVJarBpwCFoKTwMlgAZgDZjGk35gx8BUYBl+CXWAIWJvRGktNOBp0gotBOzg24P5+BNvAW2AzGyUmOKgWLAG3g8vBIREd52/wGngKvA6mxASl6kE3uJeLmjhFRdbD4HlwMK8mXAJ6uayvpF/AB1rZPgJGwQT43fjbI8BRYB44QatLzgMFl2NQ3XEnF1fxi0xIgCbwYrGyvgOPgUWgLoTj1fG+aJ97XI67kdMWazySMKALjFcIwnvgypAC72YIHePdCmmgtF2bVRMaQG+FjG8DbQmcEG18bCf1cpozY8IxYLtDRveB7oSKRJ1uToupHZz21JtAZexuhwxSnVCwwIAyhQr1FKW9Oc0mkAHfGpk6AO6wKPgmlLZJI80jUVbYUTZR54LtRvOTbitcA96x/FbJheBl7rnrzdgLwP609BNmgH5wjvYdJf4y8LFKh04Fb/PJVNaHbNBfaegnmK2gCXCGxUVQJU7ntOt6Mg11QpdDHdCeQgPKtHMedHXZbEKjw5mzIsUGlFnhcGU322rCRodmqMoIG4y8bbGxdXQpeEPbpptsLXyjLQuiG4ODoEn7rpOfT1jROqJnAZ8bt6KXcjMvS6Lm9UvGrXC6U/uPDa2jZcal2pehYshkq5HXG2wojugZ8KegVfuujTtqWRR12N7Xtge5T1EMUowE1RLDgP4MG6A4b/3adit3QlWSJtxkbD+qsi8zjzcmWTHTI8MfwExtVENjks9rY3wuPqqNApkEx/Gj2NivhC7NANL6HBigOI/rte2ZHItEiqMOY3uTyo82TROLWIqjOvATd2LKoyLmBG4zp0eU/zFtFEfV+Q9yJbRoBpAGcmSA4rwOGPVjS9zF0UJj+xOVP+2aJiaRm9BqbA/m0IQhh9IhVhPmG9sjOTTBzPOCuE1oNrb35dCE0WliErkJ5nD1iRya8KuxPTfuJiolYJa+L5VP6QGk0SRHxmmC+UMxoco4iAligpggJlhiQn0VB6VZMBc5fL/K2P4TPA3+yECgDwO3gUM9xsdfc93Hs9DFPIljquhdt2bkufJyH3me4jgt9rp/L/0EurweAH2qNA7Tz+XWkJEiZ4afIp7j1MdxqwmjOKLZjSuVyHd9C1bzibgqSI/5ajEgsCh+ndWaQE4+IjEMRWvdYu1mQvldEqLgojgucqsTqMyiYSuzjf87X2IXqu5R/x80RhoH68iE+0CPxChyXcGYaqLiaL7EJ1GdWCsxSF5igpggEhPEBJGYICaIxAQxQSQmiAkiMUFMELmZMCxhSFTD9DzhIbBHlaaA6qKHOh0So9D0CthhfPc9eIFMoBd4r3P40ZliQqiiUSsDfusEmoM2JLELRV+o0vu+fVfMNMZypbJ48YeUiOJ3t1scp2sd0ToDaySOgbSG41hRXkbg9bCL90uT1pdocYwHlYdBFLUeL6cebi3R+gJ+JoxPZiSgfvJB8XmT47XaS3FezfwEenUALQpB74JzWxiC5rQ9q0pD5NMuGhJ/s3Kej0ZN+7tU6RUTt3AF7GvNHlsXNkqTaFL9Z2AvOF5uWySjBu3KV2JCMmrkz/1iQnI6mz8HxYTktJQ/t1a7A6mYg+kqVXpDML37j95rUdUr/estytA87hBGkaaPwDMRNFvX8r8fVwHWVLDpSqBh469GtG96l2lbiPujWUzPqdJKibvBaeCA1Anx6XCwgQ2gSR4dQQwQE/yLVsTdCa5T/60P9HXQndbnJHiUz9lV/K7AFS6tDXQ9OIu/pyJomSq9I1yJCd50Lvg5hP2McSX8hArxnlheTDjIxYdfjXPzk854Wmlqi4rgznBeTNgZcusoVEnFLCaIxARLZFOPucDt7yhOjG+Uxet9/ivAAGXyQGMOF2zcAAAAAElFTkSuQmCC">
										<dt>SERVICE</dt>
										<dd>정확, 친절한 서비스를 제공하기 위해 최선을 다하고 있습니다. 신속한 주문을 위해서 고객이 주문
											후 1분 안에 제품을 받을 수 있도록 노력하고 있으며, 또한 오류 없는 정확하고 친절한 서비스를 위해 별도로
											카운터 응대 교육을 시행 중 입니다. 버거킹을 찾아주시는 모든 고객들이 만족하실 수 있도록 버거킹이 할 수
											있는 최고의 서비스, 밝은 미소와 감사하는 마음으로 고객들을 맞이하고 있습니다.</dd>
									</dl>
									<dl class="clean">
									    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAABlCAYAAAAF6B6sAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MTk5QjNEN0QxN0Q4MTFFOUEyMDU4MjAxOUQzNThENjIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MTk5QjNEN0UxN0Q4MTFFOUEyMDU4MjAxOUQzNThENjIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoxOTlCM0Q3QjE3RDgxMUU5QTIwNTgyMDE5RDM1OEQ2MiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoxOTlCM0Q3QzE3RDgxMUU5QTIwNTgyMDE5RDM1OEQ2MiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PhEekQ0AAARpSURBVHja7J1JaBRBFIZr4hYXNFEDUS9BYwwe3EVFEOMW4opGAxovrogrCpqTFwXRgyJeFJUEEU1QUIhRQeO+oyKCFzHGHTVIIqgRDzq+R7/BpjNLBbraqZn/h5+E7klXzzdVNa9eVXVC4XC4XCl1gNxbQbHUQt4YIljN9Eu24cJ+kVsNXr8buYvh99DMsMIBfDJPySPJJsoKkZ+Qh5t+ExkBVWN+I8WGrl0cBKggYbEqLLtu2yocUDOMaDz5gY/XG0e+H9TNB1mzWFt9vt62IG8+6Jr1h7yF/NOHa3Ul7wvyAw8altXKAALAAqz/rY4xjnMHfNdQxJ3s4hHBRHKmLqyr5NlpXInqyLPQDNFn/d8+y6t06LtCqFlohoAFWIAFWBBgARZgAVY6Dnf8FM9M7ySXkCe5jh9SzmSp3+LsyRwbYTGoueQr5CYPrB3kjwbKfGMjrFa5ac6V8Qzybs95TjY2GCh3RDI1Q86q3iMXxRm5MyhOpl2Xm79M7ut5TZ44pTv4/eSp5JXKmReMBmpmAlBp821YRu5HrhRgv13nfkhHfkM5q2jqbQXlF6xB5Gvk/uQq8goB9l1A3SSPElB9EGcpNUSADSAfIy+TpndLQHHTS7SycJz0eTruTn5kc5xVIMCmkI/LsdECSmdlYT75i2ZZDKuH7UHpYAE2nZxLvkjO0vzbE+kYwedLvNQBY0M9pRwoDKQBC7AAC7AACzIVZ+moUcaS7gVjn8nvDZTFgXJPW2HxYHsVeTn5sOv4WPI7A+XxGPW8jbAqBRQHrXM95zaQHxoos9TGZhjJd3Uin1Rtl2FuVUkuPzr4WnKhcnLrsXTUBaraz0/bNlicDX2unMmI+ijnuV9aLaBqyAvSOXRYTN6jnFz7PA8wBrVGQJ0iz0fo4OzOypB+h4GdlfBgrYA6HaVD9+qI0s9+8jbf7Srofd3h6Krj/U8u62qvvD6TzJuoOpNrNf8211NmIl8I+yv3teuivcDvb0PeHheSn53JZ1SUxfcxxHOPDe2oWRNSIYLfLFFzjnImIXSVp5J8ktVUnJWSW1kwkAYswAIswAIsCLCSIM6Kpw/KSQAuIS91HV+n/H30SkTlEihbB4tz7LzK5gV5qAcWr+N6ZqDMAhtrFoOaTH4pmYldnvO8rPubgXKzkgkWN6tT0rRirZniiYgiAcU5rRoZaHvvJVslsfzo4Ksky1ASo2a8ddWo0hig0ubbcL1yVvjdjgIsAqpRQFXbCsqvZsh9AqeSp5HvCLALynkCIze9V+SFypnR6RTnOk1Kf96Ql0kW2ho6RIBNF2D8HL5P5NfkRQIqUVljVPsmWS9JeVbGWRFgM9S/R8uVCSidlYAcZz3WLIszpcNsD0p7ySfO8RNvJDio9JdMVqgkl4k4i4Gdw9gQA2kIsAALsAALsAALAizAAizAAizAggALsADLGulmSkNAhZrlS83iZdkD05hLTtTmhX8lg2YIWIBlGawWYNBSC8PijdxfwSKumM+mvwIMACfR05S+8KRxAAAAAElFTkSuQmCC"> 
										<dt>CLEANILINESS</dt>
										<dd>아무리 맛 좋은 음식이라도 비위생적이라면 고객에게 독과 같다는 것이 버거킹의 신념 중
											하나입니다. 버거킹의 매니저들은 미국 NRA(National Restaurant Association)에서
											실시하는 AFS(Applied Foodservice Sanitation) 과정을 수료하고 테스트에 합격하여
											매장 내의 위생에 관한 개념이 철저합니다. 그리고 모든 직원들은 개인 위생은 물론, 제품 온도와 기계/소도구를
											규정된 절차에 따라 관리함으로써 최상의 청결 및 위생상태를 유지하여 고객이 안심하고 드실 수 있도록 노력하고
											있습니다.</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>

					<div class="tab-pane container" id="menu3">
						<div class="tab_cont bg_w" style="">
							<div class="TNT_wrap">
								<div class="web_container">
									<!-- <h4 class="MOB m_subtit">Trust in Taste 소개</h4> -->
									<p class="txt_intro">
										<span>Trust in Taste란? 전세계 버거킹의 고객들이 우리 제품에 만족감을 느낄 수있도록 하는</span>
										<span>활동입니다. 버거킹 코리아는 전세계 버거킹의 가치인 Trust inTaste를 시행하며&nbsp;</span>
										<span>최고의 제품과 서비스를 제공하기 위해 노력하고 있습니다.</span>
									</p>
									<ul>
										<li><div class="pic WEB">
												<img src="https://www.burgerking.co.kr/dist/img/img_TNT01.ea7c7e5b.jpg" alt="">
											</div>
											<div class="pic MOB">
												<img src="https://www.burgerking.co.kr/dist/img/img_TNT01_m.0dad5288.jpg" alt="">
											</div>
											<div class="cont">
												<strong class="tit">Trust in Taste1. 최고의 버거</strong>
												<p>WHOPPER의 맛과 퀄리티를 개선하여 고객들이 최고의 맛을 느낄 수 있도록 합니다. 버거킹의
													자산인 Flame-Grilling 방식으로 더욱 특별한 맛을 제공합니다. 버거킹의 소고기 패티는 100%
													순쇠고기로 만들어졌으며, 어떠한 방부제나 첨가물이 들어가지 않습니다.</p>
											</div></li>
										<li><div class="pic WEB">
												<img src="https://www.burgerking.co.kr/dist/img/img_TNT02.6358a079.jpg" alt="">
											</div>
											<div class="pic MOB">
												<img src="/dist/img/img_TNT02_m.534ad5c4.jpg" alt="">
											</div>
											<div class="cont">
												<strong class="tit">Trust in Taste2. 최고의 치킨</strong>
												<p>버거킹은 고객에게 가장 맛이 좋은 치킨 제품을 제공합니다.</p>
											</div></li>
										<li><div class="pic WEB">
												<img src="https://www.burgerking.co.kr/dist/img/img_TNT03.276c1779.jpg" alt="">
											</div>
											<div class="pic MOB">
												<img src="/dist/img/img_TNT03_m.4a9f1bd5.jpg" alt="">
											</div>
											<div class="cont">
												<strong class="tit">Trust in Taste3. 재료</strong>
												<p>버거킹은 고객에게 높은 품질의 제품을 제공하기 위해 재료에 대한 내부 정화 정책을 시행합니다.</p>
											</div></li>
										<li><div class="pic WEB">
												<img src="https://www.burgerking.co.kr/dist/img/img_TNT04.f427b94c.jpg" alt="">
											</div>
											<div class="pic MOB">
												<img src="/dist/img/img_TNT04_m.63c657fd.jpg" alt="">
											</div>
											<div class="cont">
												<strong class="tit">Trust in Taste4. 주방</strong>
												<p>버거킹의 주방 배치는 고객에게 신선한 준비 과정을 보여주며 품질 인식을 개선합니다.</p>
											</div></li>
									</ul>
								</div>
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