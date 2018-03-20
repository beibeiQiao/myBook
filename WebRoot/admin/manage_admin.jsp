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
            <div class="layui-side layui-bg-black x-side">
              <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree site-demo-nav">
                 <li class=" layui-nav-item">
                     <a href="admin_getAllUser">
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
                 	<a href="admin_getAllType">
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
            <div class="layui-tab layui-tab-card site-demo-title x-main" >
                <div class="x-slide_left"></div>
                <ul class="layui-tab-title">
                    <li class="layui-this">
                       		欢迎你,<span style="font-size:16px;color:blue;font-weight:400;">${currAdmin.adminName}</span>!
                    </li>
                </ul>
			<div class="x-nav">
				<span class="layui-breadcrumb"> <a><cite>首页</cite></a> <a><cite>管理员</cite></a>
				</span> <a class="layui-btn layui-btn-small"
					style="line-height:1.6em;margin-top:3px;float:right"
					href="admin_getAllType" title="刷新"><i class="layui-icon"
					style="line-height:30px">ဂ</i></a>
			</div>
			<div class="x-body">
			<form class="layui-form x-center" action="" style="width:500px">
				<div class="layui-form-pane" style="margin-top:-10px;">
					<div class="layui-form-item">
						<div class="layui-input-inline" style="width:400px">
							<input type="text" name="username" placeholder="搜索内容"
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
			<!-- <a data-toggle="modal" href="#add" title="增加操作">
				<button type="button" class="btn btn-primary">增加书籍</button>
			</a> -->
			<span class="x-right" style="line-height:25px">共有数据：
				<span style="color:green;font-weight:600;">${adminNumber}</span>
			 条</span>
		<table class="layui-table">
                <thead>
                    <tr>
				     <th>管理员id</th>                         
	                 <th>管理员账号</th>
	                 <th>管理员姓名</th>
                    </tr>
                </thead>
                <tbody>
                  <c:forEach var="admin" items="${adminList}" varStatus="status">
                    <tr>
                        <td>${admin.adminId}</td>
                        <td>${admin.adminNum}</td>
                        <td>${admin.adminName}</td>
					</tr>
				 </c:forEach>
                </tbody>
            </table>
	</div>
            </div>
            <div class="site-mobile-shade">
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
