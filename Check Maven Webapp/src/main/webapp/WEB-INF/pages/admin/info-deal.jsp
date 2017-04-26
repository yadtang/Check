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
<link rel="stylesheet" href="${ctx}/css/info-mgt.css" />
<link rel="stylesheet" href="${ctx}/css/WdatePicker.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>身份审核</h2></div>
<form action="${ctx}/admin/failinfo.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<a href="#" class="add" onclick="addUser()">通过</a>
    <a href="javascript:;" class="del" onclick="deleteUser()">注销</a>
</div>
<div class="table-box" id="myDiv">
	<table border="1" cellspacing="1">
    	<thead>
        	<tr>
        		<th class="num"></th>
        		<th class="name">账号</th>
                <th class="name">昵称</th>
                <th class="process">账户类型</th>
                <th class="process">账户状态</th>
                <th class="node">邮箱</th>
                <th class="time">联系电话</th>
                <th class="operate">操作</th>
            </tr>
        </thead>
        <tbody align="center">
        	<c:forEach items="${dataList}" var="o">
				<tr align="center">
					<td><input type="checkbox" name="userId" value="${o.userId}"/></td>
					<td>${o.userId}</td>
					<td>${o.userName}</td>
					<td>
						<c:if test="${o.userType==0}">学生</c:if>
						<c:if test="${o.userType==1}">老师</c:if>
						<c:if test="${o.userType==2}">管理员</c:if>
					</td>
					<td>
						<c:if test="${o.userState==0}"><font color="blue">待审核</font></c:if>
						<c:if test="${o.userState==1}">在用</c:if>
						<c:if test="${o.userState==2}"><font color="red">注销</font></c:if>
						<c:if test="${o.userState==3}"><font color="red">审核不通过</font></c:if>
					</td>
					<td>${o.email}</td>
					<td>${o.telephone}</td>
					<td class="operate">
						<a href="javascript:;" class="del" onclick="addUser()">通过</a>
						<a href="javascript:;" class="edit" onclick="deleteUser()">注销</a>
						<a href="javascript:;" class="count" onclick="showDetail('+${o.userId}+')">查看</a>
					</td>
				</tr>
			</c:forEach>
        </tbody>
    </table>
</div>
<div class="pagination ue-clear"></div>
</form>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.pagination.js"></script>
<script type="text/javascript">
$(".select-title").on("click",function(){
	$(".select-list").hide();
	$(this).siblings($(".select-list")).show();
	return false;
})
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(this).parent($(".select-list")).siblings($(".select-title")).find("span").text(txt);
})

$('.pagination').pagination(${pageInfo.total},{
	callback: function(page){
		$.ajax({
			url:"${ctx}/admin/qryFindPending.action",
			method:"post",
			dataType: "json",
			data:{page:page+1},
			success: function(data){
				var html = "";
				html += "<div class='table-box' id='myDiv'>";
				html += "<table border='1' cellspacing='1'>";
				html += "<thead>";
				html += "<th class='num'></th>";
				html += "<th class='name'>账号</th><th class='operate'>昵称</th>";
				html += "<th class='process'>账户类型</th><th class='process'>账户状态</th><th class='node'>邮箱</th>";
				html += "<th class='time'>联系电话</th><th class='operate'>操作</th>";
				html += "</thead>";
				html += "<tbody align='center'>";
				for(dataList in data){
					html += "<tr align='center'>";
					html += "<td><input type='checkbox' name='userId' value='"+data[dataList].userId+"'/></td>";
					html += "<td>"+data[dataList].userId+"</td>";
					html += "<td>"+data[dataList].userName+"</td>";
					if(data[dataList].userType == 0){
						html += "<td>学生</td>";
					}else if(data[dataList].userType == 1){
						html += "<td>老师</td>";
					}else{
						html += "<td>管理员</td>";
					}
					if(data[dataList].userState == 0){
						html += "<td><font color='blue'>待审核</font></td>";
					}else if(data[dataList].userState == 1){
						html += "<td>在用</td>";
					}else if(data[dataList].userState == 2){
						html += "<font color='red'>注销</font>";
					}else{
						html += "<font color='red'>审核不通过</font>";
					}
					html += "<td>"+data[dataList].email+"</td>";
					html += "<td>"+data[dataList].telephone+"</td>";
					html += "<td class='operate'><a href='${ctx}/admin/passinfo.action?userId="+data[dataList].userId+"' class='del'>通过</a>&nbsp;";
					html += "<a href='${ctx}/admin/failinfo.action?userId="+data[dataList].userId+"' class='del'>注销</a>&nbsp;";
					html += "<a href='${ctx}/admin/toQryUser.action?userId="+data[dataList].userId+"' class='del'>查看</a></td>";
					html += "</tr>";
				}
				html += "</tbody>"; 
				html += "</table>";
				html += "</div>";
		        $("#myDiv").html("");
		        $("#myDiv").html(html);
		    }
		});
	},
	display_msg: true,
	setPageNo: false
});

//不通过审核,即注销用户信息
function deleteUser(){
	var ids = "";
	$("input:checkbox[name='userId']:checked").each(function() {
		ids += $(this).val() + ",";
    });
	//判断最后一个字符是否为逗号，若是截取
	var id = ids.substring(ids.length -1, ids.length);
	if(id == ","){
		ids = ids.substring(0, ids.length-1);
	}
	if(ids == ""){
		alert("请选择要删除的记录！");
		return;
	}
	$("form").submit();
}
//通过审核
function addUser(){
	var ids = "";
	$("input:checkbox[name='userId']:checked").each(function() {
		ids += $(this).val() + ",";
    });
	//判断最后一个字符是否为逗号，若是截取
	var id = ids.substring(ids.length -1, ids.length);
	if(id == ","){
		ids = ids.substring(0, ids.length-1);
	}
	if(ids == ""){
		alert("请选择要通过的记录！");
		return;
	}
	//  以下三行，随便哪一行都行         
/*	$("#myform").action="${ctx}/admin/toAddUser.action";
 	document.myform.action=‘new_url’;*/
	document.myform.attributes["action"].value = "${ctx}/admin/passinfo.action"; 
	$("form").submit();
}

function showDetail(id){
	alert()
	document.myform.attributes["action"].value = "${ctx}/admin/toQryUser.action?userId="+id; 
	$("form").submit();
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

showRemind('input[type=text], textarea','placeholder');
</script>
</html>