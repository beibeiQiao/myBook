<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户注册</title>
    <!-- Library字+背景的样式的样式 -->
	<link rel="stylesheet" type="text/css" href="css/library.css" />
	<!--登录窗口的样式-->
	<link rel="stylesheet" type="text/css" href="css/style.css" />
  </head>
  
  <body>
   	 <div class="codrops-demos">
		<span>点击 <strong>"注册"</strong>加入我们</span>
		<a class="current-demo">Library</a> 
	</div>

	<div id="container_demo">
		<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
			id="tologin"></a>
		<div id="wrapper">
			<div id="login" class="animate form">
				<form action="user_register" autocomplete="on" method="get" name="register">
					<h1>注册</h1>
					<p>
						<label for="accountNumber" class="uname" data-icon="u">账号:</label>
						<input id="accountNumber" name="user.userTele" required="required"
							type="text" placeholder="请输入手机号" />
					</p>
					<p>
						<label for="username" class="uname" data-icon="u">用户名:</label>
						<input id="username" name="user.userName" required="required"
							type="text" placeholder="请输入用户名" />
					</p>
					<p>
						<label for="passwordsignup" class="youpasswd" data-icon="p">密码:</label>
						<input id="passwordsignup" name="user.userPwd"
							required="required" type="password" placeholder="请设置密码" />
					</p>
					<p>
						<label for="passwordsignup_confirm" class="youpasswd"
							data-icon="p">确认密码:</label> <input id="passwordsignup_confirm"
							name="passwordsignup_confirm" required="required" type="password"
							placeholder="请确认密码" />
					</p>
					<p class="login button">
						<input type="submit" value="注册" />
					</p>
					<p class="change_link">
						已有账号?<a href="userLogin.jsp" class="to_register">我要登录</a>
					</p>
				</form>
			</div>
		</div>
	</div>
  </body>
</html>