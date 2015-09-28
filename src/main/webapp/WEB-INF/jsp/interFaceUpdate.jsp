<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>独孤九剑</title>
<link rel="stylesheet" type="text/css"
	href="/interfaceSys/info/css/amazeui.min.css">
<link rel="stylesheet" type="text/css"
	href="/interfaceSys/css/style.css">
<script type="text/javascript" src="/interfaceSys/info/js/jquery.min.js"></script>
<script type="text/javascript">
var contextPath='<%=request.getContextPath()%>';
   $(function(){
	   
	       $("#updateInterFaceBtn").click(function(){
	    	   $.ajax({
	   			 type : "POST",
	   			 url : contextPath+"/updateInterFace",
	   			 data :$('#interFaceUpdateForm').serialize(),// 你的formid,
	   			 async : false,
	   			 error : function(request) {
	   				alert("Connection error");
	   		     },
	   			 success : function(data) {
	   				console.log(data);
	   			 }
	   		   });
	    	        
	    	   
	    	   
	       });
	   
	   
	   
	   
   });


</script>
</head>
<body>
	<header data-am-widget="header" class="am-header am-titlebar am-header-default">
	<h1 class="am-header-title">
		<a href="#title-link" class="">独孤九剑 修改接口 </a>
	</h1>

	<div class="am-header-right am-header-nav">
		<a href="#right-link" class=""> <i
			class="am-header-icon am-icon-bars" title="开发ing..."> </i>
			<div class="am-dropdown" data-am-dropdown>
				<button class="am-btn am-btn-primary am-dropdown-toggle"
					data-am-dropdown-toggle>
					查看功能<span class="am-icon-caret-down"></span>
				</button>
				<ul class="am-dropdown-content">
					<li><a href="/interfaceSys/goQueryPanel">接口查询</a></li>
					<li><a href="goAddInterFace">添加系统</a></li>
					<li><a href="#">添加产品</a></li>
					<li><a href="/interfaceSys/goAddInterFace" target="_blank">添加接口</a></li>
				</ul>
			</div>
		</a>
	</div>
	</header>
    
	<form id="interFaceUpdateForm">
		<table class="am-table am-table-bordered am-table-hover">
		<caption>新增接口信息</caption>
			<tr>
				<th class="am-primary">接口名字</th>
				<td><input id="ifName" name="ifName" value="${interFaceInfo.ifName }"/></td>
			</tr>
			<tr>
				<th class="am-primary">接口功能描述</th>
				<td><input id="ifDesc" name="ifDesc" value="${interFaceInfo.ifDesc }"/></td>
			</tr>
			<tr>
				<th class="am-primary">接口URL</th>
				<td colspan="5"><input id="ifUrl" name="ifUrl" value="${interFaceInfo.ifUrl }"/></td>
			</tr>
			<tr>
				<th class="am-primary">请求部分</th>
				<td colspan="6" rowspan="3"><textarea id="ifRequest"
						name="ifRequest">
						      ${interFaceInfo.ifRequest }
						</textarea></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th colspan="6" class="am-warning">响应部分</th>
			</tr>
			<tr>
				<th class="am-primary">成功(Success)</th>
				<td colspan="6" rowspan="3"><textarea id="ifResponseSuccuss"
						name="ifResponseSuccuss">
						${interFaceInfo.ifResponseSuccuss}
						</textarea></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th class="am-primary">失败(Error)</th>
				<td colspan="6" rowspan="3"><textarea id="ifResponseFailure"
						name="ifResponseFailure">
						${interFaceInfo.ifResponseFailure}</textarea></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>

		<button type="button" id="updateInterFaceBtn"
			class="am-btn am-btn-success propButton" >确认修改</button>
	</form>
	<script src="/interfaceSys/info/js/amazeui.min.js"></script>
</body>
</html>