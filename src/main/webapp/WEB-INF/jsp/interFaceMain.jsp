<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>独孤九剑</title>
<link rel="stylesheet" type="text/css" href="info/css/amazeui.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="info/js/jquery.min.js"></script>

<script type="text/javascript">
	
</script>
</head>
<body>
	<header data-am-widget="header" class="am-header am-header-default">
	<h1 class="am-header-title">
		<a href="#title-link" class="">独孤九剑</a>
	</h1>
	<h>欢迎${userInfo.loginName}登录系统</h>
	<div class="am-header-right am-header-nav">
		<a href="#right-link" class=""> <i
			class="am-header-icon am-icon-bars" title="开发ing..."> </i>
			<div class="am-dropdown" data-am-dropdown>
				<button class="am-btn am-btn-primary am-dropdown-toggle"
					data-am-dropdown-toggle>
					查看功能<span class="am-icon-caret-down"></span>
				</button>
				<ul class="am-dropdown-content">
					<li><a href="goQueryPanel">接口查询</a></li>
					<li><a href="goAddInterFace">添加系统</a></li>
					<li><a href="#">添加产品</a></li>
					<li><a href="goAddInterFace" target="_blank">添加接口</a></li>
				</ul>
			</div>
		</a>
	</div>
	</header>
	<div class="filtrate">
		<form id="srearchFrom">
			<!-- 	
			筛选你需要查找的系统／接口 <select
				data-am-selected="{btnWidth: '10%', btnSize: 'sm'}">
				<option value="a">系统1</option>
				<option value="b">系统2</option>
				<option value="o">系统3</option>
			</select> <select data-am-selected="{btnWidth: '10%', btnSize: 'sm'}">
				<option value="a">接口1</option>
				<option value="b">接口2</option>
				<option value="o">接口3</option>
			</select> -->

			<!--搜索-->
			<div class="search">
				<input id="ifName" name="ifName" placeholder="输入需要查找的内容" />
				<button id="search">查找</button>

			</div>
		</form>
	</div>

	<nav class="navMid">
	<table id="propDateShow"
		class="am-table am-table-bordered am-table-hover am-table-compact am-table-centered">

		<thead>
			<th>序号</th>
			<th>接口名</th>
			<th>接口功能描述</th>
			<th>操作</th>

		</thead>
		<tbody id="propDateShowBody">
		<c:out value="${interFaceList}"/>
            
		</tbody>
	</table>

	<ul data-am-widget="pagination"
		class="am-pagination am-pagination-default pageUl">
	</ul>

	</nav>
	<input type="hidden" id="pageNum" value="1" />
	<script src="info/js/amazeui.min.js"></script>
	<script type="text/javascript" src="js/gigold.system.main.js"></script>
</body>

</html>