<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>独孤九剑</title>
<link rel="stylesheet" type="text/css" href="info/css/amazeui.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
	/* $(function() {
		$("#loginBtn").click(function() {
			alert($('#form-with-tooltip').serialize());
			$.ajax({
				type : "POST",
				url : "",
				data : $('#interFaceForm').serialize(),// 你的formid
				async : false,
				error : function(request) {
					alert("Connection error");
				},
				success : function(data) {
					alert("hehe" + data.success.messageInfo);
					console.log(data)
				}
			});

		});

	});
 */</script>

</head>

<body>
	<header data-am-widget="header" class="am-header am-header-default">
	<h1 class="am-header-title">
		<a href="#title-link" class="">独孤九剑</a>
	</h1>
	</header>

	<div class="am-tabs logPanel" data-am-tabs>
		<ul class="am-tabs-nav am-nav am-nav-tabs">
			<li class="am-active"><a href="#tab1">登陆</a></li>
			<li><a href="#tab2">注册</a></li>
		</ul>

		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="tab1">
				<form action="login" method="post" class="am-form" id="form-with-tooltip">
					<fieldset>
						<div class="am-form-group">
							<label for="doc-vld-name-2-0">用户名：</label> <input type="text"
								id="doc-vld-name-2-0" name="loginName" minlength="3" placeholder="输入用户名" required />
						</div>

						<div class="am-form-group">
							<label for="doc-vld-pwd-1-0">密码：</label> <input type="password" name="loginPassword"
								id="doc-vld-pwd-1-0" placeholder="输入密码" pattern="^\d{6}$"
								required data-foolish-msg="把 IQ 卡密码交出来！" />
						</div>
						<div class="am-checkbox">
							<label> <input type="checkbox"> 记住我
							</label>
						</div>
						<button class="am-btn am-btn-secondary" type="submit">登陆</button>
					</fieldset>
				</form>
			</div>

			<div class="am-tab-panel am-fade" id="tab2">
				<form  class="am-form" id="form-with-tooltip" action="addUser" method="POST">
					<fieldset>
						<div class="am-form-group">
							<label for="doc-vld-name-2-0">用户名：</label> <input type="text"
								id="doc-vld-name-2-0" name="loginName" minlength="3" placeholder="输入用户名" required />
						</div>

						<div class="am-form-group">
							<label for="doc-vld-pwd-1-0">密码：</label> <input type="password"
								id="doc-vld-pwd-1-0" name="loginPassword" placeholder="输入密码" required
								data-foolish-msg="把 IQ 卡密码交出来！" />
						</div>

						<div class="am-form-group">
							<label for="doc-vld-email-2">邮箱：</label> <input type="email"
								id="doc-vld-email-2" name="email" placeholder="输入邮箱" required />
						</div>

						<div class="am-form-group">
							<label for="doc-vld-userName-2">姓名：</label> <input type="text"
								id="doc-vld-userName-2" name="userName" placeholder="输入姓名" required />
						</div>

						<button id="loginBtn" class="am-btn am-btn-secondary" type="submit">注册</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="info/js/jquery.min.js"></script>
	<script src="info/js/amazeui.min.js"></script>
	<script src="js/ajax.js"></script>
	<script src="js/log.js"></script>
</body>
</html>