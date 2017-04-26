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
<!-- for-mobile-apps -->
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
<!-- header -->
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
							<li><a class="hvr-overline-from-center button2" href="${ctx}/user/toIndex.action?userId=${user.userId}">首页</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toUserInfo.action?userId=${user.userId}">个人中心</a></li>
							<!-- <li><a class="hvr-overline-from-center button2" href="onlinecheck.html">在线考试</a></li> -->
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toScoreQry.action?userId=${user.userId}">成绩查询</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toMyBooksPage.action?userId=${user.userId}">我的错题本</a></li>
							<li><a class="hvr-overline-from-center button2  active" href="${ctx}/toMyPaperPage.action?userId=${user.userId}">我的试卷</a></li>
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

	 <div class="container">	  
		  <h2 class="bars" align="center">高三（上）语文（期中）试题</h2>
		  
		  <h4 class="bars" align="left">一、选择题（每题5分）</h4>
			<!-- 选择题 -->
			
			<p><h4 class="bars" align="left">下列词语中，没有错别字的一项是（ ）</h4></p>
			<div class="input-group">
				<input name="userType" type="radio" value="1"/><font size="4">A．妨碍    功夫片    钟灵毓秀   管中窥豹，可见一斑</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">B．梳妆    吊胃口    瞠目结舌   文武之道，一张一驰</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">C．辐射    入场券    循章摘句   风声鹤唳，草木皆兵</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">D．蜚然    直辖市    秘而不宣   城门失火，殃及池鱼</font></br>
				<p><h4 class="bars"><font color="blue">我的答案：D </font></h4></p>
				<p><h4 class="bars">标准答案：A（ B.文武之道，一张一弛；C.寻章摘句；D.斐然）</h4></p>
				<p><h4 class="bars"><font color="red">解析：本题考察的都是高考高频字形。</font></h4></p>
			</div>
			
			<p><h4 class="bars" align="left">下列词语中加点字的读音，全部正确的一项是（ ）</h4></p>
			<div class="input-group">
				<input name="userType" type="radio" value="1"/><font size="4">A．暂时zàn    埋怨mái    谆谆告诫zhūn   引吭高歌háng</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">B．豆豉chǐ    踝骨huái    踉踉跄跄cāng   按图索骥jì</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">C．梗概gěn    删改shān    炊烟袅袅niǎo  明眸皓齿móu</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">D．搁浅gē     解剖pōu     鬼鬼祟祟suì   不屑一顾xiè</font></br>
				<p><h4 class="bars"><font color="blue">我的答案：D </font></h4></p>
				<p><h4 class="bars">标准答案：D ( A．埋 mán， B．跄 qiàng C.梗gěng  )</h4></p>
				<p><h4 class="bars"><font color="red">解析：本题考察的都是基础字音，没有出现偏难怪的字音。</font></h4></p>
			</div>
			
			
			<p><h4 class="bars" align="left">下列各句中加点词语的使用，不恰当的一项是（ ）</h4></p>
			<div class="input-group">
				<input name="userType" type="radio" value="1"/><font size="4">A．“2015年度中国文化跨界论坛”日前在北京举行，届时来自世界各国的艺术家、企业家和媒体人围绕当前文化创意产业发展中的热点进行了交流。</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">B．对于那些熟稔互联网的人来说，进行“互联网+”创业，最难的可能并不是“互联网”这一部分，而是“+”什么以及怎么“+”的问题。</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">C．这家民用小型无人机公司一年前还寂寂无闻，一年后却声名鹊起，其系列产品先后被评为“十大科技产品“2014年杰出高科技产品”。</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">D．近年来，广袤蜀地的新村建设全面推进，大巴山区漂亮民居星罗棋雍，大凉山上彝家    新寨鳞次栉比，西部高原羌寨碉楼拔地而起。</font></br>
				<p><h4 class="bars"><font color="blue">我的答案：D </font></h4></p>
				<p><h4 class="bars">标准答案：A（届时是“到时候”的意思，而本句所叙述的是已经发生了的事实。）解析：本题考察的是词语和成语运用。都是考纲内的高频词语辨析和成语分析，难度不大。</h4></p>
				<p><h4 class="bars"><font color="red">解析：</font></h4></p>
			</div>
			<p><h4 class="bars" align="left">下列各句中，没有语病的一项是（ ）</h4></p>
			<div class="input-group">
				<input name="userType" type="radio" value="1"/><font size="4">A．首届“书香之家”颁奖典礼，是设在杜甫草堂古色古香的仰止堂举行的，当场揭晓了书香家庭、书香校园、书香企业、书香社区等获奖名单。</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">B．专家强调，必须牢固树立保护生态环境就是保护生产力的理念，形成绿水青山也是金山银山的生态意识，构建与生态文明相适应的发展模式。 </font></br>
				<input name="userType" type="radio" value="1"/><font size="4">C．市旅游局要求各风景区进一步加强对景区厕所、停车场的建设和管理，整治和引导不文明旅游的各种顽疾和陋习，有效提升景区的服务水平。</font></br>
				<input name="userType" type="radio" value="1"/><font size="4">D．《四川省农村扶贫开发条例》是首次四川针对贫困人群制定的地方性法规，将精准扶贫确定为重要原则，从最贫困村户人手，让老乡过上好日子。</font></br>
			</div>
		  <h4 class="bars" align="left">二、填空题（每题5分）</h4>
			<div></div>
			<!-- 填空题 -->
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">@</span>
			  <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
			</div>

			<div class="input-group">
			  <input type="text" class="form-control" placeholder="Recipient's username" aria-describedby="basic-addon2">
			  <span class="input-group-addon" id="basic-addon2">@example.com</span>
			</div>
		  <h4 class="bars" align="left">三、判断题（每题5分）</h4>
			<div></div>
			<!--判断题-->
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">@</span>
			  <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
			</div>

			<div class="input-group">
			  <input type="text" class="form-control" placeholder="Recipient's username" aria-describedby="basic-addon2">
			  <span class="input-group-addon" id="basic-addon2">@example.com</span>
			</div>
		  <h4 class="bars" align="left">四、简答题（每题20分）</h4>
			<div></div>
			<!--简答题-->
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">@</span>
			  <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
			</div>

			<div class="input-group">
			  <input type="text" class="form-control" placeholder="Recipient's username" aria-describedby="basic-addon2">
			  <span class="input-group-addon" id="basic-addon2">@example.com</span>
			</div>
			
	<h3 class="bars">Forms</h3>
	<div class="input-group">
	  <span class="input-group-addon" id="basic-addon1">@</span>
	  <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
	</div>

	<div class="input-group">
	  <input type="text" class="form-control" placeholder="Recipient's username" aria-describedby="basic-addon2">
	  <span class="input-group-addon" id="basic-addon2">@example.com</span>
	</div>

	<div class="input-group">
	  <span class="input-group-addon">$</span>
	  <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
	  <span class="input-group-addon">.00</span>
	</div>
	<div class="input-group input-group-lg">
	  <span class="input-group-addon" id="sizing-addon1">@</span>
	  <input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon1">
	</div>

	<div class="input-group">
	  <span class="input-group-addon" id="sizing-addon2">@</span>
	  <input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2">
	</div>

	<div class="input-group input-group-sm">
	  <span class="input-group-addon" id="sizing-addon3">@</span>
	  <input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon3">
	</div>

	<!-- row -->
	<div class="row">
	  <div class="col-lg-6 in-gp-tl">
		<div class="input-group">
		  <span class="input-group-addon">
			<input type="checkbox" aria-label="...">
		  </span>
		  <input type="text" class="form-control" aria-label="...">
		</div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
	  <div class="col-lg-6 in-gp-tb">
		<div class="input-group">
		  <span class="input-group-addon">
			<input type="radio" aria-label="...">
		  </span>
		  <input type="text" class="form-control" aria-label="...">
		</div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
	</div><!-- /.row -->
<div class="row">
  <div class="col-lg-6 in-gp-tl">
    <div class="input-group">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
      <input type="text" class="form-control" placeholder="Search for...">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-lg-6 in-gp-tb">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->
<div class="row">
  <div class="col-lg-6 in-gp-tl">
    <div class="input-group">
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action <span class="caret"></span></button>
        <ul class="dropdown-menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="#">Separated link</a></li>
        </ul>
      </div><!-- /btn-group -->
      <input type="text" class="form-control" aria-label="...">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-lg-6 in-gp-tb">
    <div class="input-group">
      <input type="text" class="form-control" aria-label="...">
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action <span class="caret"></span></button>
        <ul class="dropdown-menu dropdown-menu-right">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="#">Separated link</a></li>
        </ul>
      </div><!-- /btn-group -->
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
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