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
<div class="title"><h2>题目详细</h2></div>
<div class="main">
	<p class="short-input ue-clear newstyle">
    	<label>问题编号：</label>${question.questionId}
    </p>
	<p class="short-input ue-clear newstyle">
    	<label>年级：</label>${question.gradeId}
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>科目：</label>${question.courseId}
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>难度：</label>${question.difficulty}
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>题型：</label>${question.typeId}
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>问题名称：</label>${question.quesName}
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>选项A：</label>${question.optionA}
    </p>   
    <p class="short-input ue-clear newstyle">
    	<label>选项B：</label>${question.optionB}
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>选项C：</label>${question.optionC}
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>选项D：</label>${question.optionD}
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>答案：</label>${question.answer}
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>详解：</label>${question.remark}
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>备注：</label>${question.answerDetail}
    </p>
</div>
<div class="btn ue-clear">
	<a href="${ctx}/toQuestionPage.action" class="confirm" onclick="addQuestion()">返回</a>
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

showRemind('input[type=text], textarea','placeholder');
</script>
</html>