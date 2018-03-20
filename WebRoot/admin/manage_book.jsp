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
            <div class="layui-tab layui-tab-card site-demo-title x-main" lay-filter="x-tab" lay-allowclose="true">
                <div class="x-slide_left"></div>
                <ul class="layui-tab-title">
                    <li class="layui-this">
                       		欢迎你,<span style="font-size:16px;color:blue;font-weight:400;">${currAdmin.adminName}</span>!
                    </li>
                </ul>
                <div class="x-nav">
			<span class="layui-breadcrumb">
				<a><cite>首页</cite></a>
				<a><cite>书籍管理</cite></a>
			</span> <a class="layui-btn layui-btn-small"
				style="line-height:1.6em;margin-top:3px;float:right"
				href="admin_getAllBook" title="刷新"><i
				class="layui-icon" style="line-height:30px">ဂ</i></a>
			 </div>
		<div class="x-body">
			<form  action="admin_getBookInfo" class="layui-form x-center" style="width:500px">
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
			<button type="button" data-toggle="modal" data-target="#add" class="btn btn-primary">增加书籍</button>
			<span class="x-right" style="line-height:25px">共有数据：
				<span style="color:green;font-weight:600;">${bookNumber}</span>条</span>
		<table class="layui-table">
                <thead>
                    <tr>
				     <th>书籍id</th>                         
	                 <th>ISBN</th>
	                 <th>书籍名称</th>
	                 <th>书籍图片</th>
	                 <th>书籍作者</th>
	                 <th>书籍简介</th>
	                 <th>物流公司</th>
	                 <th>书籍单价</th>
	                 <th>书籍类型</th>
					 <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${bookList}" varStatus="status">
					<tr>
						<td>${book.bookId}</td>
						<td>${book.bookCode}</td>
						<td>${book.bookName}</td>
						<td>${book.bookImg}</td>
						<td>${book.bookAuthor}</td>
						<td>${book.bookDes}</td>
						<td>${book.bookService}</td>
						<td>${book.bookPrice}</td>
						<td>${book.type.typeName}</td>
						<td class="td-manage"><a data-toggle="modal" href="admin_skipUpdateBook?book.bookId=${book.bookId}"
							title="修改操作"><span class="glyphicon glyphicon-edit"></span></a>
							<a data-toggle="modal" href="admin_deleteBook?user.userId=${book.bookId}" title="删除操作"><span
								class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
                </tbody>
            </table>
	</div>
            </div>
            <div class="site-mobile-shade">
            </div>
        </div>
        
        <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	   <form action="admin_addUser">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">增加书籍</h4>
				</div>
				<div class="modal-body">
					  ISBN：：<input type="text" name="book.bookCode" class="form-control" id="ISBN" placeholder="请输ISBN">
					     书籍名称：：<input type="text" name="book.bookName" class="form-control" id="name" placeholder="请输入书籍名称">
					      书籍图片： <input type="file" id="inputfile">
					      书籍作者： <input type="text" name="book.bookAuthor" class="form-control" id="author" placeholder="请输入作者">
					       书籍简介：  <input type="text" name="book.bookDes" class="form-control" id="des" placeholder="请输入书籍简介">
					   书籍服务：<input type="text" name="book.bookService" class="form-control" id="service" placeholder="请输入服务内容">
					      书籍单价：<input type="text" name="book.bookPrice" class="form-control" id="price" placeholder="请输入书籍单价">
					      书籍类型：
					        <input type="radio" name="book.bookType" id="sexRadios1" value="1" checked="checked" > 经典名著
					        <input type="radio" name="book.bookType" id="sexRadios2" value="2"> 热门小说
					        <input type="radio" name="book.bookType" id="sexRadios3" value="3"> 杂志期刊
					        <input type="radio" name="book.bookType" id="sexRadios4" value="4"> 工具类书
					        <input type="radio" name="book.bookType" id="sexRadios5" value="5"> 编程苦海
					        <br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<a href="admin_addBook"><button type="submit" class="btn btn-primary">保存</button></a>
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
