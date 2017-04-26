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
<link rel="stylesheet" href="${ctx}/css/jquery.searchableSelect.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>用户注册</h2></div>
<form action="${ctx}/admin/addUser.action" method="post" name="myform" id="myform">
<div class="main">
	<p class="short-input ue-clear">
    	<label><span style="color:red">*</span>账号：</label>
        <input type="text" placeholder="登录账号" name="userId" id="userId" onblur="checkUserId()" value="${userId }"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>昵称：</label>
        <input type="text" placeholder="用户昵称" name="userName" id="userName" maxlength="6"/>
    </p>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>密码：</label>
        <input type="password" placeholder="登录密码" name="userPwd" id="userPwd"/>
    </p>
    <div class="long-input select ue-clear">
    	<label><span style="color:red">*</span>年级：</label>
    	<c:forEach items="${grade}" var="cs">
			<input name="grade" type="radio" value="${cs.gradeId}" checked="checked"/>${cs.gradeName}
		</c:forEach>
    </div>

    <div class="short-input select ue-clear">
    	<label><span style="color:red">*</span>账号类型：</label>
    	<input name="userType" type="radio" value="0" checked="checked"/>学生
    	<input name="userType" type="radio" value="1"/>老师
    	<input name="userType" type="radio" value="2"/>管理员
    </div>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>邮箱：</label>
        <input type="text" onblur="checkEmail()" id="email" name="email"/>
        <span style="color: red" id="emailInfo"></span>
    </p>
    <p class="short-input ue-clear">
    	<label>联系电话：</label>
        <input type="text" onfocus="checkPhone()" id="telephone" name="telephone"/>
    </p>
    <p class="long-input ue-clear">
    	<label>地址：</label>
        <input type="text" id="address" name="address"/>
    </p>
    <p class="short-input ue-clear">
    	<label>备注：</label>
        <textarea placeholder="请输入内容" id="remark" name="remark"></textarea>
    </p>
</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="addUser()">确定</a>
    <a href="${ctx}/admin/getAllUser.action" class="clear" >返回</a>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.searchableSelect.js"></script>
<script type="text/javascript">
$(function(){
	$("#grade").searchableSelect();
});
$(".select-title").on("click",function(){
	$(".select-list").toggle();
	return false;
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(".select-title").find("span").text(txt);
});

function checkUserId(){
	var userId = $("#userId").val();
	var tipInfo = $("#tipInfo").val();
	if(userId == ""){
		$("#tipInfo").html("请输入账号");
		$("#userId").focus();
		return;
	}
 	$.ajax({
        type: "post",
        url: "${ctx}/admin/userRegist.action",
        data: {userId:userId},
        dataType: "json",
        success: function(data){
        	$("#tipInfo").html(data.errorInfo);
        }
    });
}

function checkEmail(){
	var email = $("#email").val();
	if(email == ""){
		$("#emailInfo").html("请输入邮箱");
		return;
	}
	var req = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	if(!req.test(email)){
		$("#emailInfo").html("邮箱格式不正确");
		$("#email").focus();
		return;
	}
}

//注册
function addUser(){
	document.myform.attributes["action"].value = "${ctx}/admin/addUser.action"; 
	$("form").submit();
}

//情况所有
function clearAll(){
	alert("清空所有内容");
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>