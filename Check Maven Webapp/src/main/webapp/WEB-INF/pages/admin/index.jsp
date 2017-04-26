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
<meta charset="utf-8">
<link rel="stylesheet" href="${ctx}/css/base.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery.dialog.css" />
<link rel="stylesheet" href="${ctx}/css/index.css" />

<title>在线考试后台管理系统</title>
</head>

<body>
<form name="icform" method="post"></form>
<div id="container">
	<div id="hd">
    	<div class="hd-wrap ue-clear">
        	<div class="top-light"></div>
             <h1 class="logo"></h1> 
            <div class="login-info ue-clear">
                <div class="welcome ue-clear"><span>欢迎您,</span><a href="javascript:;" class="user-name">${userName }</a></div>
<!--                 <div class="login-msg ue-clear">
                    <a href="javascript:;" class="msg-txt">消息</a>
                    <a href="javascript:;" class="msg-num">10</a>
                </div> -->
            </div>
            <div class="toolbar ue-clear">
                <a href="javascript:;" class="home-btn">首页</a>
                <a href="javascript:;" class="quit-btn exit"></a>
            </div>
        </div>
    </div>
    <div id="bd">
    	<div class="wrap ue-clear">
        	<div class="sidebar">
            	<h2 class="sidebar-header"><p>功能导航</p></h2>
                <ul class="nav">
                    <li class="nav-info">
                    	<div class="nav-header"><a href="javascript:;" class="ue-clear"><span>题库管理</span><i class="icon"></i></a></div>
                        <ul class="subnav">
                        	<li><a href="javascript:;" onclick="formSubmit('${ctx}/toQuestionPage.action','mframe');this.blur();">试题管理</a></li>
                            <li><a href="javascript:;" onclick="formSubmit('${ctx}/toTypePage.action','mframe');this.blur();">题型管理</a></li>
                        </ul>
                    </li>
                    <li class="konwledge">
						<div class="nav-header"><a href="javascript:;" class="ue-clear"><span>用户管理</span><i class="icon"></i></a></div>
						<ul class="subnav">
                        	<li><a href="#" onclick="formSubmit('${ctx}/admin/getAllUser.action','mframe');this.blur();">信息管理</a></li>
                            <li><a href="#" onclick="formSubmit('${ctx}/admin/getFindPending.action','mframe');this.blur();">身份审核</a></li>
                        </ul>
					</li>
                    <li class="agency">
						<div class="nav-header"><a href="javascript:;" class="ue-clear"><span>基础管理</span><i class="icon"></i></a></div>
						<ul class="subnav">
                        	<li><a href="javascript:;" onclick="formSubmit('${ctx}/toGradePage.action','mframe');this.blur();">年级管理</a></li>
                            <li><a href="javascript:;" onclick="formSubmit('${ctx}/toCoursePage.action','mframe');this.blur();">课程管理</a></li>
                        </ul>
					</li>
                    <li class="system"><div class="nav-header"><a href="javascript:;" class="ue-clear"><span>试卷管理</span><i class="icon"></i></a></div>
                    	<ul class="subnav">
                        	<li><a href="javascript:;" onclick="formSubmit('${ctx}/toPaperPage.action','mframe');this.blur();">试卷管理</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="content">
            	<iframe name="mframe" id="mframe" width="100%" height="100%" frameborder="0"></iframe>
            </div>
        </div>
    </div>
    <div id="ft" class="ue-clear">
    	<div class="ft-left">
            <span>福建师范大学</span>
            <em>Online&nbsp;Exame&nbsp;System</em>
        </div>
        <div class="ft-right">
            <span>Automation</span>
            <em>V1.0</em>
        </div>
    </div>
</div>
<div class="exitDialog">
	<div class="dialog-content">
    	<div class="ui-dialog-icon"></div>
        <div class="ui-dialog-text">
        	<p class="dialog-content">你确定要退出系统？</p>
            <p class="tips">如果是请点击“确定”，否则点“取消”</p>
            
            <div class="buttons">
                <input type="button" class="button long2 ok" value="确定" id="btn_ok"/>
                <input type="button" class="button long2 normal" value="取消" />
            </div>
        </div>
        
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/core.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.dialog.js"></script>
<script type="text/javascript" src="${ctx}/js/index.js"></script>
<script type="text/javascript">
	/* 打开一个新页面：调用时不加第二个参数 add by tony */
	function formSubmit (url,sTarget){
	    document.forms[0].target = sTarget
	    document.forms[0].action = url;
	    document.forms[0].submit();
	    return true;
	}
</script>

</html>
