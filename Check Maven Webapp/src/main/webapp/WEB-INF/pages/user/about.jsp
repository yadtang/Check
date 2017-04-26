<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>在线考试系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> 
	addEventListener("load", function() { 
		setTimeout(hideURLbar, 0); 
	}, false);
	function hideURLbar(){ 
		window.scrollTo(0,1); 
	} 
</script>
<link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/modernizr.custom.js"></script>
<script type="text/javascript" src="${ctx}/js/move-top.js"></script>
<script type="text/javascript" src="${ctx}/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>

</head>
<body>
<div class="header">
		<div class="container">
			<div class="header-nav">
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					   	<h3><span>欢迎您，<font color="blue">${userName }</font> 同学</span></h3>
					</div>
					
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a class="hvr-overline-from-center button2" href="${ctx}/user/toIndex.action">首页</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toUserInfo.action?userId=${user.userId}">个人中心</a></li>
<!-- 							<li><a class="hvr-overline-from-center button2" href="onlinecheck.html">在线考试</a></li> -->
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toScoreQry.action?userId=${user.userId}">成绩查询</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toMyBooksPage.action?userId=${user.userId}">我的错题本</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toMyPaperPage.action?userId=${user.userId}">我的试卷</a></li>
							<li><a class="hvr-overline-from-center button2  active" href="${ctx}/toAbout.action">关于</a></li>
						</ul>
						<div class="search-box">
							<div id="sb-search" class="sb-search">
								<span class="sb-icon-search" onclick="exitSystem()"></span>
							</div>
						</div>
					</div>
				</nav>
			</div>
		</div>
</div>

<div class="about-bottom-last">
	<div class="container">
				<div class="help-info">
					<h3 class="tittle">在线考试系统</h3>
				</div>
				<div class="client-say-grids">
					<div class="col-md-3 client-say-grid">
						<p>At vero eos et accusamus 
						et iusto odio dignissimos ducimus 
						qui blanditiis praesentium voluptatum 
						deleniti atque corrupti quos dolores 
						et quas molestias excepturi sint </p>
						<h4>界面简洁</h4>
					</div>
					<div class="col-md-3 client-say-grid">
						<p>At vero eos et accusamus 
						et iusto odio dignissimos ducimus 
						qui blanditiis praesentium voluptatum 
						deleniti atque corrupti quos dolores 
						et quas molestias excepturi sint </p>
						<h4>操作简单</h4>
					</div>
					<div class="col-md-3 client-say-grid">
						<p>At vero eos et accusamus 
						et iusto odio dignissimos ducimus 
						qui blanditiis praesentium voluptatum 
						deleniti atque corrupti quos dolores 
						et quas molestias excepturi sint </p>
						<h4>响应速度快</h4>
					</div>
					<div class="col-md-3 client-say-grid">
						<p>At vero eos et accusamus 
						et iusto odio dignissimos ducimus 
						qui blanditiis praesentium voluptatum 
						deleniti atque corrupti quos dolores 
						et quas molestias excepturi sint </p>
						<h4>可扩展性高</h4>
					</div>
					<div class="clearfix"></div>
				</div>
	</div>
</div>
<!-- //about -->
<!-- footer -->
<div class="footer">
	<div class="container">
		<div class="footer-grids">
			<div class="col-md-3 footer-grid">
				<h3>简洁美观</h3>
				<ul>
					<li><a href="#">SUMMER CAMPS</a></li>
					<li><a href="#">CELEBRATIONS</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h3>联系地址</h3>
				<ul>
					<li><a href="#">福州闽侯上街</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h3>联系电话</h3>
				<ul>
					<li><a href="#">+86 183****1234</a></li>
					<li><a href="#">0591 55555555</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h3>响应速度快</h3>
				<ul>
					<li><a href="#">PRESENTATIONS</a></li>
					<li><a href="#">SEMINARS</a></li>
				</ul>
			</div>


		</div>
</p>
	</div>
</div>
<!-- //footer -->
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- smooth scrolling -->
	<script type="text/javascript">
		$(document).ready(function() {
		/*
			var defaults = {
			containerID: 'toTop', // fading element id
			containerHoverID: 'toTopHover', // fading element hover id
			scrollSpeed: 1200,
			easingType: 'linear' 
			};
		*/								
		$().UItoTop({ easingType: 'easeOutQuart' });
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- //smooth scrolling -->

</body>
</html>
