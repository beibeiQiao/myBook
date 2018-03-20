<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>账号登录</title>
	  <base href="<%=basePath%>">
    <!-- Library字+背景的样式的样式 -->
	<link rel="stylesheet" type="text/css" href="user/css/library.css" />
	<!--登录窗口的样式-->
	<link rel="stylesheet" type="text/css" href="user/css/style.css" />
</head>
<body>
	<div class="codrops-demos">
		<span>点击 <strong>"登录"</strong>进入首页</span>
		<a class="current-demo">Library</a> 
	</div>

	<div id="container_demo">
		<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
			id="tologin"></a>
		<div id="wrapper">
			<div id="login" class="animate form">
				<form action="user_userLogin" autocomplete="on" method="post" name="login">
					<h1>登录</h1>
					<p>
						<label for="username" class="uname" data-icon="u">账号:</label>
						<input id="username" name="user.userTele" required="required"
							type="text" placeholder="请输入账号" />
					</p>
					<p>
						<label for="password" class="youpasswd" data-icon="p">密码:</label>
						<input id="password" name="user.userPwd" required="required"
							type="password" placeholder="请输入密码" />
					</p>
					<p class="keeplogin">
						<input type="checkbox" name="loginkeeping" id="loginkeeping"
							value="loginkeeping" /> <label for="loginkeeping">记住密码</label>
					</p>
					<p class="login button">
						<input type="submit" value="登录" />
					</p>
					<p class="change_link">
						没有账号?<a href="userRegister.jsp" class="to_register">我要注册</a>
						我是管理?<a href="adminLogin.jsp" class="to_register">后台登录</a>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
