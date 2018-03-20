<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="user/css/order.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
<nav class="navbar  navbar-default navbar-inverse  navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
		<a class="navbar-brand" href="#" id="BookStore">BookStore</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
           <li><a href="user/index.jsp">首页</a></li>
            <li><a href="user/buyBook.jsp">在线选购</a></li>
			<li><a href="user/showOrder.jsp">订单查询</a></li>
            <li><a href="user/userPage.jsp">个人中心</a></li>
            <li><a href="user/niceLecture.jsp">美文鉴赏</a></li>
            <li  class="active"><a href="user/aboutUs.jsp">关于我们</a></li>
        </ul>
        <form class="navbar-form navbar-left form" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>
       <c:choose>
		       <c:when test="${currUser.userTele==null}">
		     <ul class="nav navbar-nav navbar-right">   
            <li><a href="userRegister.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            <li><a href="userLogin.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
             </ul> 
		       </c:when>
		       <c:otherwise>
		         <span style="float:right;color:snow;font-size:18px;margin-top:12px">${currUser.userName}:欢迎您!</span>
		       </c:otherwise>
		 </c:choose>

        
    </div>
    </div>
</nav>
<!--当前位置-->
<div class="now_positionm">
<span>当前位置：</span><a href="index.jsp">首页</a><a href="showOrder.jsp">订单查询</a>
</div>
<div class="centers_mr">
<div class="public_m2">关于我们</div>
            <!--一个订单信息-->
    <div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">软件工程与计算大作业展示第六组</h4>
			</div>
			<div class="modal-body">
				<span><h4>作品名称：</h4><h5>书店管理系统</h5></span>
				<span><h4>小组成员：</h4><h5>汤吉安、韦军林、王丽萍、乔蓓蓓、刘贤颖</h5></span>
				<span><h4>指导老师：</h4><h5>孙娜</h5></span>
			</div>
		</div>
	</div>
          <div class="public_m2">联系我们</div>
           <section class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				
				<h4 class="modal-title">我们的联系方式</h4>
			</div>
			<div class="modal-body">
				<span><h4>电话：</h4><h5>18810392133</h5></span>
				<span><h4>微信：</h4><h5>18810392133</h5></span>
				<span><h4>电子邮箱：</h4><h5>2541747035@qq.com</h5></span>
			</div>
		</div>
	</section>
	</section>
	</section>
	</section>
	</div>
	 <footer>
       <p>这个冬天，让我们带你一起重温纸质经典--护眼，从现在做起！</p>
       <p>Copyright &copy; 2017 lxy All rights reserved. 联系我们：412854858@qq.com</p>
     </footer>
  </body>
</html>
