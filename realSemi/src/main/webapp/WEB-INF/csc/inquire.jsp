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
<title>문의</title>

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
	href="<%=ctxPath%>/chy.css/csc/inquire.css" />

<%-- Optional JavaScript  --%>
<script type="text/javascript" src="<%=ctxPath%>/pys.js/jquery-3.7.1.min.js"></script>
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
<jsp:include page="../header.jsp" />
</head>
<body>

	<div class="contentsWrap eventWrap">
		<div class="locationWrap WEB">
			<div class="web_container">
				<div class="page_navi">
					<a href="#/home" class=""><span>HOME</span></a><span>고객센터</span><span>문의</span>
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
							<li><a href="<%= ctxPath%>/csc/app.bk">버거킹앱 이용안내</a></li>
							<li><a href="#">FAQ</a></li>
							<li class="on"><a>문의</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="tab_cont">
			<!-- <h4 class="hide">문의</h4> -->
			<div class="contentsBox01 bg_w CS_intro">
				<div class="web_container">
					<div class="help_infotxt">
						<p class="tit">
							<span>고객의 의견에 </span><span>귀 기울입니다</span>
						</p>
						<p class="txt">
							<span>버거킹은 언제나 고객의 의견에 귀 기울이며 더 나은 서비스 이용 경험을 제공하고자 노력하고
								있습니다.</span><span>궁금하신 사항이 있거나 문제를 해결하는데 도움이 필요하신 경우<a><strong>앱
										이용안내 페이지</strong></a>와 <a><strong>FAQ 페이지</strong></a>에서도 도움을 받으실 수 있습니다.
							</span>
						</p>
					</div>
				</div>
			</div>
			<div class="contentsBox01 CS_contact">
				<div class="web_container">
					<div class="help_info">
						<dl>
							<dt>대표 소비자 상담</dt>
							<dd>
								<div>
									<strong>080. 022. 8163</strong>
								</div>
							</dd>
							<dd>
								<p>
									상담가능 시간 : 월~일 09:00 ~ 18:00<br>(점심시간 12:00 ~ 13:00)
								</p>
							</dd>
						</dl>
						<dl class="cs_email">
							<dt>온라인 문의</dt>
							<dd>
								<p>
									서비스를 이용하시면서 궁금하시거나 <br>불편한사항은 온라인으로 접수 해주세요
								</p>
								<div class="btn_area">
									<br>
									<br>
								</div>
							</dd>
						</dl>
						<ul>
							<li class="service">
							<img src="data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAA8AAD/4QMraHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzYgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkQ0NEExQTlGMTMxMDExRTk5RDFGRUExMUY4ODM4OTZGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkQ0NEExQUEwMTMxMDExRTk5RDFGRUExMUY4ODM4OTZGIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RDQ0QTFBOUQxMzEwMTFFOTlEMUZFQTExRjg4Mzg5NkYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RDQ0QTFBOUUxMzEwMTFFOTlEMUZFQTExRjg4Mzg5NkYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAGBAQEBQQGBQUGCQYFBgkLCAYG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"><br>
							<span>서비스/제품 관련</span><strong>080. 022. 8163</strong></li>
							<li class="shop"><img src="data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAA8AAD/4QMraHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzYgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkQ0NEExQTlGMTMxMDExRTk5RDFGRUExMUY4ODM4OTZGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkQ0NEExQUEwMTMxMDExRTk5RDFGRUExMUY4ODM4OTZGIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RDQ0QTFBOUQxMzEwMTFFOTlEMUZFQTExRjg4Mzg5NkYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RDQ0QTFBOUUxMzEwMTFFOTlEMUZFQTExRjg4Mzg5NkYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAGBAQEBQQGBQUGCQYFBgkLCAYG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"><br>
	                         <span></span>매장/SITE 개설상담<strong>02. 6331. 8344</strong></li>
							
						</ul>
						<div class="btnBox"></div>
					</div>
				</div>
			</div>
		</div>
		<!---->
	</div>
<jsp:include page="../footer.jsp" />
</body>
</html>