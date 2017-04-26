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
	function exitSystem(){
		window.location.href = "${ctx}/user/exitSys.action"	;
	}
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
							<li><a class="hvr-overline-from-center button2  active" href="${ctx}/toMyBooksPage.action?userId=${user.userId}">我的错题本</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toMyPaperPage.action?userId=${user.userId}">我的试卷</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toAbout.action">关于</a></li>
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
<!-- <div class="typrography"> -->
	 <div class="container">
			<div class="grid_3 grid_5">
			  <h5 class="typ1 t-button">
				<span>年级：</span>
				<c:forEach items="${grade}" var="grade">
					<a href="#"><span class="label label-success" onclick="grade()">${grade.gradeName}</span></a>
				</c:forEach>
			  </h5>
			  <h5 class="typ1 t-button">
				<span>科目：</span>
				<c:forEach items="${course}" var="course">
					<a href="#"><span class="label label-success" onclick="course()">${course.courseName}</span></a>
				</c:forEach>
			  </h5>
			  <h5 class="typ1 t-button">
				<span>题型：</span>
				<c:forEach items="${type}" var="type">
					<a href="#"><span class="label label-success" onclick="type()">${type.typeName}</span></a>
				</c:forEach>
			  </h5>
			</div>	  
			<div class="progress">
				 <div class="progress-bar progress-bar-success" style="width: 35%"><span class="sr-only">35% Complete (success)</span></div>
				 <div class="progress-bar progress-bar-warning" style="width: 20%"><span class="sr-only">20% Complete (warning)</span></div>
				 <div class="progress-bar progress-bar-danger" style="width: 10%"><span class="sr-only">10% Complete (danger)</span></div>
			</div>
			<!-- 选择题 -->
			
			
			<c:forEach items="${requestScope.errorBook }" var="errorBook">
				<p><h4 class="bars" align="left">${errorBook.question.quesName }</h4></p>
				<c:if test="${errorBook.question.typeId==1}">
					<div class="input-group">
						<input name="userType" type="radio" value="1"/><font size="4">${errorBook.question.optionA }</font></br>
						<input name="userType" type="radio" value="1"/><font size="4">${errorBook.question.optionB }</font></br>
						<input name="userType" type="radio" value="1"/><font size="4">${errorBook.question.optionC }</font></br>
						<input name="userType" type="radio" value="1"/><font size="4">${errorBook.question.optionD }</font></br>
						<p><h4 class="bars"><font color="blue">我的答案：${errorBook.userAnswer } </font></h4></p>
						<p><h4 class="bars">标准答案：${errorBook.question.answer }（ ${errorBook.question.answerDetail }）</h4></p>
						<p><h4 class="bars"><font color="red">解析：${errorBook.question.remark }</font></h4></p>
					</div>
				</c:if>
				<c:if test="${errorBook.question.typeId==4}">
					<div class="input-group">
						<p><h4 class="bars"><font color="blue">我的答案：${errorBook.userAnswer } </font></h4></p>
						<p><h4 class="bars">标准答案：${errorBook.question.answer }（ ${errorBook.question.answerDetail }）</h4></p>
						<p><h4 class="bars"><font color="red">解析：${errorBook.question.remark }</font></h4></p>
					</div>
				</c:if>
				<c:if test="${errorBook.question.typeId==5}">
					<div class="input-group">
						<p><h4 class="bars"><font color="blue">我的答案：${errorBook.userAnswer } </font></h4></p>
						<p><h4 class="bars">标准答案：${errorBook.question.answer }（ ${errorBook.question.answerDetail }）</h4></p>
						<p><h4 class="bars"><font color="red">解析：${errorBook.question.remark }</font></h4></p>
					</div>
				</c:if>
				
			</c:forEach>
	</div>
<!-- </div> -->
<script src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({ easingType: 'easeOutQuart' });
	});
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>
