<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<!--
	Arcana 2.1 by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>efarm africa</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700|Fredericka+the+Great|Chelsea+Market|PT+Sans"
	rel="stylesheet" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/config.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/skel-panels.min.js"></script>
<noscript>
	<link rel="stylesheet" href="resources/css/skel-noscript.css" />
	<link rel="stylesheet" href="resources/css/style1.css" />
	<link rel="stylesheet" href="resources/css/style-desktop.css" />
</noscript>
<!--[if lte IE 9]><link rel="stylesheet" href="resources/css/style-ie9.css" /><![endif]-->
<!--[if lte IE 8]><script src="resources/js/html5shiv.js"></script><![endif]-->
<script type="text/javascript">
	$(function() {
	  $('span.bold-list').each(function(){
		var col = '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
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
						<h1>efarm africa</h1>
					</div>
					<nav id="nav">
						<ul>
							<c:set var = "page" value="${pageContext.request.requestURI}" />
							<li <c:if test="${fn:endsWith(page,'index.jsp')}"> class="current_page_item"</c:if>><a href="index">Home</a></li>
							<li <c:if test="${fn:endsWith(page,'prices.jsp')}"> class="current_page_item"</c:if>> <a href="prices">Prices</a></li>
							<li <c:if test="${fn:endsWith(page,'buy.jsp')}"> class="current_page_item"</c:if>><a href="buy">Buy</a></li>
							<li <c:if test="${fn:endsWith(page,'marketplace.jsp')}"> class="current_page_item"</c:if>><a href="marketplace">MarketPlace</a></li>
							<li <c:if test="${fn:endsWith(page,'contact.jsp')}"> class="current_page_item"</c:if>><a href="contact">Contact</a></li>
							<li <c:if test="${fn:endsWith(page,'login.jsp')}"> class="current_page_item"</c:if>><a href="login">Register/Login</a></li>
							<!-- <li><a href="onecolumn">One Column</a></li> -->
							
						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>