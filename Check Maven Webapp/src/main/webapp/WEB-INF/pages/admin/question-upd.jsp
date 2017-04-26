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
<div class="title"><h2>题目更新</h2></div>
<form action="${ctx}/updQuestion.action" method="post" name="myform" id="myform">
<div class="main">
	<p class="short-input ue-clear">
    	<label>问题编号：</label>
        <input type="text" name="questionId" id="questionId" value="${question.questionId}" readonly="readonly"/>
    </p>
    <div class="long-input select ue-clear">
    	<label><span style="color:red">*</span>年级：</label>
    	<c:forEach items="${gradeList}" var="grade">
			<input name="gradeId" type="radio" value="${grade.gradeId}" 
				<c:if test="${grade.gradeId eq question.gradeId }">checked</c:if> />${grade.gradeName}
		</c:forEach>
    </div>
    <div class="long-input select ue-clear">
    	<label><span style="color:red">*</span>科目：</label>
    	<c:forEach items="${courseList}" var="course">
			<input name="courseId" type="radio" value="${course.courseId}" 
				<c:if test="${course.courseId eq question.courseId }">checked</c:if>/>${course.courseName}
		</c:forEach>
    </div>
    <div class="short-input select ue-clear">
    	<label><span style="color:red">*</span>难度：</label>
    	<input name="difficulty" type="radio" value="0" checked="checked"/>简单
    	<input name="difficulty" type="radio" value="1"/>中等
    	<input name="difficulty" type="radio" value="2"/>较难
    </div>
    <div class="long-input select ue-clear">
    	<label><span style="color:red">*</span>题型：</label>
    	<c:forEach items="${typeList}" var="typeInfo">
			<input id="typeId" name="typeId" type="radio" onclick="typeOnclick()" value="${typeInfo.typeId}"
				<c:if test="${typeInfo.typeId eq question.typeId }">checked</c:if>/>${typeInfo.typeName}
		</c:forEach>
    </div>
    <p class="long-input ue-clear">
    	<label>名称：</label>
        <input type="text" placeholder="请输入问题名称" name="quesName" id="quesName" value="${question.quesName}"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="long-input ue-clear" id="pa">
    	<label>选项A：</label>
        <input type="text" placeholder="选项A" name="optionA" id="optionA" value="${question.optionA}"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="long-input ue-clear" id="pb">
    	<label>选项B：</label>
        <input type="text" placeholder="选项B" name="optionB" id="optionB"  value="${question.optionB}"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="long-input ue-clear" id="pc">
    	<label>选项C：</label>
        <input type="text" placeholder="选项C" name="optionC" id="optionC"  value="${question.optionC}"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="long-input ue-clear" id="pd">
    	<label>选项D：</label>
        <input type="text" placeholder="选项D" name="optionD" id="optionD"  value="${question.optionD}"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="long-input ue-clear">
    	<label>答案：</label>
        <input type="text" placeholder="请输入答案" id="answer" name="answer" value="${question.answer}"/>
    </p>
    <p class="long-input ue-clear">
    	<label>详解：</label>
        <input type="text"id="answerDetail" placeholder="请输入详解" name="answerDetail" value="${question.answerDetail}"/>
    </p>
    <p class="long-input ue-clear">
    	<label>备注：</label>
        <input type="text" id="remark" name="remark" placeholder="请输入备注信息" value="${question.remark}"/>
    </p>

</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="updQuestion()">更新</a>
    <a href="${ctx}/toQuestionPage.action" class="clear">返回</a>
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
function updQuestion(){
	document.myform.attributes["action"].value = "${ctx}/updQuestion.action"; 
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
	alert("清空所有内容");
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>