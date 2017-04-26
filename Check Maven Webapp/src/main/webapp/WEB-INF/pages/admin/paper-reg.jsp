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
<div class="title"><h2>新增试卷</h2></div>
<form action="${ctx}/addQuesInfo.action" method="post" name="myform" id="myform">
<div class="main">
    <div class="long-input select ue-clear">
    	<label><span style="color:red">*</span>年级：</label>
    	<c:forEach items="${grade}" var="cs">
			<input name="gradeId" type="radio" value="${cs.gradeId}" checked="checked"/>${cs.gradeName}
		</c:forEach>
    </div>
    <div class="long-input select ue-clear">
    	<label><span style="color:red">*</span>科目：</label>
    	<c:forEach items="${course}" var="cs">
			<input name="courseId" type="radio" value="${cs.courseId}" checked="checked"/>${cs.courseName}
		</c:forEach>
    </div>
    <p class="short-input ue-clear">
    	<label>试卷编号：</label>
        <input type="text" placeholder="请输入试卷编号" name="paperId" id="paperId" />
    </p>
    <p class="short-input ue-clear">
    	<label>试卷名称：</label>
        <input type="text" placeholder="请输入试卷名称" name="paperName" id="paperName" />
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="short-input ue-clear">
    	<label>允许时长：</label>
        <input type="text" placeholder="请输入允许时长" name="allowTime" id="allowTime" />分钟
    </p>
    <p class="short-input ue-clear" id="pa">
    	<label>选择题数量：</label>
        <input type="text" placeholder="选择题" name="selectNum" id="selectNum"/>
    </p>
<!--     <p class="short-input ue-clear" id="pb">
    	<label><span style="color:red"></span></label>
    	<label>简单：</label>
        <input type="text" name="selectNum" id="selectNum"/>
        <label>中等：</label>
        <input type="text" name="selectNum" id="selectNum"/>
        <label>较难：</label>
        <input type="text" name="selectNum" id="selectNum"/>
    </p> -->
    <p class="short-input ue-clear" id="pa">
    	<label>填空题数量：</label>
        <input type="text" name="inputNum" id="inputNum"/>
    </p>
    <p class="short-input ue-clear" id="pa">
    	<label>简答数量：</label>
        <input type="text" name="descNum" id="descNum"/>
    </p>
</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="addQuestion()">确定</a>
    <a href="${ctx}/toPaperPage.action" class="clear">返回</a>
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
	var questionId = $("#questionId").val();
	if(questionId == ""){
		$("#tipInfo").html("请输入题目名称");
		$("#questionId").focus();
		return;
	}else{
		$("#tipInfo").html("");
	}
}

//注册
function addQuestion(){
	document.myform.attributes["action"].value = "${ctx}/addPaper.action"; 
	$("form").submit();
}

function typeOnclick(){
	var typeId = $("input[name='typeId']:checked").val();
	if(typeId == "1" || typeId == "2"){//选择题就显示
		showOp();
	}else{
		hideOp();
	}
}

//隐藏选择题选项
function hideOp(){
	$("#pa").hide();
	$("#pb").hide();
	$("#pc").hide();
	$("#pd").hide();
}

//显示选择题选项
function showOp(){
	$("#pa").show();
	$("#pb").show();
	$("#pc").show();
	$("#pd").show();
}

//情况所有
function clearAll(){
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>