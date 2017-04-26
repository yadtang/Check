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
<link rel="stylesheet" href="${ctx}/css/info-reg.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>用户信息查询</h2></div>
<form action="${ctx}/admin/updateUser.action" method="post" name="myform" id="myform">
<div class="main">
	<p class="short-input ue-clear">
    	<label><span style="color:red">*</span>账号：</label>
        <input type="text" name="userId" id="userId" value="${user.userId }"/>
    </p>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>昵称：</label>
        <input type="text" placeholder="用户昵称" name="userName" id="userName" value="${user.userName }"/>
    </p>
    
    <div class="long-input select ue-clear">
    	<label><span style="color:red">*</span>年级：</label>
    	<c:forEach items="${grade}" var="grade">
			<input name="gradeId" type="radio" value="${grade.gradeId}" 
				<c:if test="${grade.gradeId eq user.grade  }">checked</c:if> />${grade.gradeName}
		</c:forEach>
    </div>
    <div class="short-input select ue-clear">
    	<label><span style="color:red">*</span>账号类型：</label>
    	<input name="userType" type="radio" value="0" checked="checked"/>学生
    	<input name="userType" type="radio" value="1"/>老师
    	<input name="userType" type="radio" value="0"/>管理员
    </div>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>邮箱：</label>
        <input type="text" onfocus="checkEmail()" id="email" name="email" value="${user.email }"/>
    </p>
    <p class="short-input ue-clear">
    	<label>联系电话：</label>
        <input type="text" onfocus="checkPhone()" id="telephone" name="telephone" value="${user.telephone }"/>
    </p>
    <p class="long-input ue-clear">
    	<label>地址：</label>
        <input type="text" id="address" name="address" value="${user.address }"/>
    </p>
    <p class="short-input ue-clear">
    	<label>备注：</label>
        <textarea placeholder="请输入内容" id="remark" name="remark">${user.remark }</textarea>
    </p>
</div>
</form>
<div class="btn ue-clear">
	<a href="${ctx}/admin/getFindPending.action" class="confirm">返回</a>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript">
$(".select-title").on("click",function(){
	$(".select-list").toggle();
	return false;
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(".select-title").find("span").text(txt);
});

function checkPhone(){
	
}

//注册
function addUser(){
	$("form").submit();
}

//情况所有
function clearAll(){
	alert("清空所有内容");
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>