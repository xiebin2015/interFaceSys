<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>独孤九剑－新增接口</title>
<link rel="stylesheet" type="text/css" href="info/css/amazeui.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="info/js/jquery.min.js"></script>
<script src="info/js/amazeui.min.js"></script>
<script type="text/javascript">

	$(function() {
		 var contextPath='<%=request.getContextPath()%>';

		$("#saveInterFaceBtn").click(function() {
				$.ajax({
					type : "POST",
					url : "addInterface",
					data : $('#interFaceForm').serialize(),// 你的formid
					async : false,
					error : function(request) {
						alert("Connection error");
					},
					success : function(data) {
						self.location.href=contextPath+"/queryDetailById/"+data.messageInfo.id;
					}
				});

		});

	});
</script>

</head>

<body>
	<header data-am-widget="header" class="am-header am-header-default am-titlebar am-no-layout">
	<h1 class="titleH1">
		<a href="#title-link" class="">独孤九剑</a>
	</h1>
	<div class="am-header-right am-header-nav">
		<i
			class="am-header-icon am-icon-bars" title="开发ing..."> </i>
			<div class="am-dropdown" data-am-dropdown>
				<button class="am-btn am-btn-primary am-dropdown-toggle menu"
					data-am-dropdown-toggle>
					查看功能<span class="am-icon-caret-down"></span>
				</button>
				<ul class="am-dropdown-content">
					<li><a href="goQueryPanel">接口查询</a></li>
					<!-- <li><a href="goAddInterFace">添加系统</a></li>
					<li><a href="#">添加产品</a></li> -->
					<li><a href="goAddInterFace">添加接口</a></li>
				</ul>
			</div>
	</div>
	</header>

	<form id="interFaceForm">
		<table class="am-table am-table-bordered am-table-hover">
		<caption>新增接口信息</caption>
			<tr>
				<th class="am-primary">接口名字</th>
				<td><input id="ifName" name="ifName" /></td>
			</tr>
			<tr>
				<th class="am-primary">接口功能描述</th>
				<td><input id="ifDesc" name="ifDesc" /></td>
			</tr>
			<tr>
				<th class="am-primary">接口URL</th>
				<td colspan="5"><input id="ifUrl" name="ifUrl" /></td>
			</tr>
			<tr>
				<th class="am-primary">请求部分</th>
				<td colspan="6" rowspan="3"><textarea id="ifRequest"
						name="ifRequest"></textarea></td>
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
						name="ifResponseSuccuss"></textarea></td>
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
						name="ifResponseFailure"></textarea></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>

		
			<div class="propButton">
		<button type="button" id="saveInterFaceBtn"
			class="am-btn am-btn-success">保存</button>
			</div>	
			
	</form>
</body>
</html>