<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta charset="utf-8">
    <title>用户管理</title>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="admin/css/x-admin.css" media="all">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://www.imooc.com/static/lib/jquery/1.9.1/jquery.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

  </head>
  
  <body>
        <div class="layui-layout layui-layout-admin">
            <header>
				<span class="bookstore">BookStore</span>
				<span class="index"><a href="userLogin.jsp">前台首页</a></span>
				<span class="admin"><a>admin</a></span>
				<span class="logoImg"><a><img src="admin/images/admin.jpg"></a></span>
	        </header>
            <div class="layui-side layui-bg-black x-side" style="height:800px;">
              <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree site-demo-nav">
                 <li class=" layui-nav-item">
                     <a  href="admin_getAllUser">
                         <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>用户管理</cite>
                     </a>
                 <li>
                 <li class="layui-nav-item">
                 	<a href="admin_getAllBook">
                         <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>书籍管理</cite>
                     </a>
                 <li>
                 <li class="layui-nav-item">
                     <a href="admin_getAllOrder">
                         <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>订单管理</cite>
                     </a>
                 <li>
                 <li class="layui-nav-item">
                 	<a  href="admin_getAllType">
                         <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>类型管理</cite>
                     </a>
                 <li>
                <li class="layui-nav-item">
                     <a href="admin_getAllAdmin">
                         <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>管理员</cite>
                     </a>
                 <li>
                 <li class="layui-nav-item">
                 	<a href="admin_getAllSuper">
                         <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>超级管理员</cite>
                     </a>
                 <li>
                    </ul>
                </div>
            </div>
            <div class="layui-tab layui-tab-card site-demo-title x-main">
                <div class="x-slide_left"></div>
                <ul class="layui-tab-title">
                    <li class="layui-this">
                       		欢迎你,<span style="font-size:16px;color:blue;font-weight:400;">${currAdmin.adminName}</span>!
                    </li>
                </ul>
                <div class="x-nav">
			<span class="layui-breadcrumb">
				<a><cite>首页</cite></a>
				<a><cite>用户管理</cite></a>
			</span> <a class="layui-btn layui-btn-small"
				style="line-height:1.6em;margin-top:3px;float:right"
				href="admin_getAllBook" title="刷新"><i
				class="layui-icon" style="line-height:30px">ဂ</i></a>
			 </div>
		<div class="x-body">
			<!-- 关键字查询 -->
			<form action="admin_getUserInfo" class="layui-form x-center"  style="width:500px">
				<div class="layui-form-pane" style="margin-top:-10px;">
					<div class="layui-form-item">
						<div class="layui-input-inline" style="width:400px">
							<input type="text" name="keywords" placeholder="搜索内容"
								autocomplete="off" class="layui-input">
						</div>
						<div class="layui-input-inline" style="width:80px">
							<button class="layui-btn">
								<i class="layui-icon">&#xe615;</i>
							</button>
						</div>
					</div>
				</div>
			</form>
			
			<a data-toggle="modal" href="#add" title="增加操作">
				<button type="button" class="btn btn-primary">增加用户</button>
			</a>
			
			<span class="x-right" style="line-height:25px">共有数据：
				<span style="color:green;font-weight:600;">${userNumber}</span>
			 条</span>
		<table class="layui-table">
			<thead>
				<tr>
					<th>ID</th>
					<th>账号</th>
					<th>用户名</th>
					<th>密码</th>
					<th>性别</th>
					<th>邮箱</th>
					<th>头像</th>
					<th>QQ</th>
					<th>生日</th>
					<th>收货地址</th>
					<th>个性签名</th>
					<th>编辑</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}" varStatus="status">
					<tr>
						<td>${user.userId}</td>
						<td>${user.userTele}</td>
						<td>${user.userName}</td>
						<td>${user.userPwd}</td>
						<td>${user.userSex}</td>
						<td>${user.userEmail}</td>
						<td>${user.userHeadImg}</td>
						<td>${user.userQQ}</td>
						<td>${user.userBirth}</td>
						<td>${user.userAddress}</td>
						<td>${user.userAuto}</td>
						<td class="td-manage"><a data-toggle="modal" href="admin_skipUpdateUser?user.userId=${user.userId}"
							title="修改操作"><span class="glyphicon glyphicon-edit"></span></a>
							<a data-toggle="modal" href="admin_deleteUser?user.userId=${user.userId}" title="删除操作"><span
								class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
            </div>
             <div class="site-mobile-shade"></div>
        </div>
        <!--      弹出了框1    -->
     <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	   <form action="admin_addUser">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">用户信息</h4>
				</div>
				<div class="modal-body">
					      手机号：<input type="text" name="user.userTele" class="form-control" id="name" placeholder="请输入手机号">
					      姓名：<input type="text" name="user.userName" class="form-control" id="name" placeholder="请输入姓名">
					      密码： <input type="password" name="user.userPwd" class="form-control" id="inputPassword" placeholder="请输入密码">
					      性别：
					       <input type="radio" name="user.userSex" id="sexRadios1" value="男" checked="checked" > 男
					       <input type="radio" name="user.userSex" id="sexRadios2" value="女"> 女
					       <br>
					       邮箱：<input type="text" name="user.userEmail" class="form-control" id="email" placeholder="请输入邮箱">
					       头像： <input type="file" id="inputfile">
					  QQ：<input type="text" name="user.userQQ" class="form-control" id="QQ" placeholder="请输入QQ号码">
					       生日：<input type="text" name="user.userBirth" class="form-control" id="birthday" placeholder="请输入生日">
					       收货地址：<input type="text" name="user.userAddress" class="form-control" id="address" placeholder="请输入收货地址">
					        个性签名：<input type="text" name="user.userAuto" class="form-control" id="signature" placeholder="请输入个性签名">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-primary">保存</button>
				</div>
			</div>
		</form>
	</div>
	
</div>
        <script src="admin/lib/layui/layui.js" charset="utf-8"></script>
        <script src="admin/js/x-admin.js"></script>
        <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
        </script>
    </body>
</html>
