<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML>
<!--
	Arcana 2.1 by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>e-farm africa</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700|Fredericka+the+Great|Chelsea+Market|PT+Sans"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/css/pure-min.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/config.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/skel-panels.min.js"></script>
<noscript>
	<link rel="stylesheet" href="resources/css/skel-noscript.css" />
	<link rel="stylesheet" href="resources/css/style.css" />
	<link rel="stylesheet" href="resources/css/style-desktop.css" />
</noscript>
<!--[if lte IE 9]><link rel="stylesheet" href="resources/css/style-ie9.css" /><![endif]-->
<!--[if lte IE 8]><script src="resources/js/html5shiv.js"></script><![endif]-->
<script type="text/javascript">
	$(function() {
		$('#facet-form li').click(function(){
			$('#facet-form').submit();	
		});
		$('#sort-select').change(function(){
			$('#facet-form').submit();	
		});
		//$('.msg-reg').css('display', 'none');
		/* $(".msg-reg").css('display', 'none');
		$('.msg-login').click(function() {
			$("#reg-form").css('display', 'none');
			$("#login-form").css('display', 'block');
			$('.msg-reg').toggle();
			$('.msg-login').toggle();
			return false;
		});
		$('.msg-reg').click(function() {
			$("#reg-form").css('display', 'block');
			$("#login-form").css('display', 'none');
			$('.msg-reg').toggle();
			$('.msg-login').toggle();
			return false;
		}); */
		$('span.bold-list').each(
				function() {
					var col = '#'
							+ (0x1000000 + (Math.random()) * 0xffffff)
									.toString(16).substr(1, 6);
					$(this).css('background-color', col);
				});
	});
</script>
</head>
<body>

	<!-- Header -->

	<div id="header-wrapper">
		<header class="container" id="site-header">
			<div class="row">
				<div class="12u">
					<div id="logo">
						<h1>e-farm africa</h1>
					</div>
					<nav id="nav">
						<ul>
							<c:set var="page" value="${pageContext.request.requestURI}" />
							<li
								<c:if test="${fn:endsWith(page,'index.jsp')}"> class="current_page_item"</c:if>><a
								href="index">Home</a></li>
							<li
								<c:if test="${fn:endsWith(page,'prices.jsp')}"> class="current_page_item"</c:if>>
								<a href="prices">Prices</a>
							</li>
							<li
								<c:if test="${fn:endsWith(page,'buy.jsp')}"> class="current_page_item"</c:if>><a
								href="buy">Buy</a></li>
							<li
								<c:if test="${fn:endsWith(page,'marketplace.jsp')}"> class="current_page_item"</c:if>><a
								href="marketplace">MarketPlace</a></li>
							<%-- <li <c:if test="${fn:endsWith(page,'contact.jsp')}"> class="current_page_item"</c:if>><a href="contact">Contact</a></li> --%>
							<c:set var="authenticated" value="${false}"/>
								<sec:authorize access="isAuthenticated()">
    								<c:set var="authenticated" value="${true}"/>
								</sec:authorize>
								<c:choose>
									<c:when test="${authenticated eq true}">
										<li style="width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">Hello <sec:authentication property="principal.username" /></li>
										<li><a href="logout">logout</a></li>
									</c:when>
									<c:otherwise>
										<li <c:if test="${fn:endsWith(page,'login.jsp')}"> class="current_page_item"</c:if>><a
								href="login">Register/Login</a></li>
									</c:otherwise>
								</c:choose>
							<!-- <li><a href="onecolumn">One Column</a></li> -->

						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>