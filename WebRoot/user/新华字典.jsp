<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath %>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap - Prebuilt Layout</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="user/css/buybook.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="user/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
</style>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="background:rgba(242,241,227,1.00);padding-top:60px">
<nav class="navbar  navbar-default navbar-inverse  navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
		<a class="navbar-brand" href="#" id="BookStore">BookStore</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li><a href="user/index.jsp">首页</a></li>
            <li class="active"><a href="user/buyBook.jsp">在线选购</a></li>
			<li><a href="user/showOrder.jsp">订单查询</a></li>
            <li><a href="user/userPage.jsp">个人中心</a></li>
            <li><a href="user/niceLecture.jsp">美文鉴赏</a></li>
            <li><a href="user/aboutUs.jsp">关于我们</a></li>
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
<div class="container">
  <div class="container">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <h1 class="text-center">图书信息</h1>
        </div>
      </div>
      <hr>
    </div>
  </div>
</div>
<div >
  <div style="width:500px; height:auto; float:left; display:inline"><h5 style="margin-left:300px;margin-top:30px">图书封面</h5>
  <img src="user/images/工具类书/新华字典.jpg" width="200px" height="250px" alt="" style="margin-left:250px"/><h3  style="margin-left:260px">《新华字典》</h3></div>
  <div style="width:500px; height:auto; float:left; display:inline">
   <table class="table table-striped" style="margin-top:40px;margin-left:0px">
  <caption>基本详情</caption>
  <thead>
    <tr>
      <th>图书名称</th>
      <th>图书作者</th>
      <th>图书ID</th>
      <th>ISBN</th>
       <th>单价</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>新华字典</td>
      <td>专家</td>
      <td>33</td>
      <td>0401</td>
      <td>10元</td>
    </tr>
  </tbody>
</table>
</div></div>
<div class="row">
    <div class="text-justify col-sm-4" style="margin-top:0px"> 工具书：</div>
    <div class="col-sm-4 text-justify"><strong>《新华字典通》</strong>推荐理由：由1998年修订本已经问世。作为修订工作的参加者,有必要就修订的有关事项作些说明。为什么要进行修订，新华字典的影响及修订的必要1950年由新华辞书社。</div>
    <div><button type="button" class="btn btn-link"><a href="#"><span class="label label-danger">加入购物车</span></a></button></div>
  </div>
  <hr>
  <div class="row">
    <div class="text-center col-md-12">
      <div class="well"><strong>书籍是人类进步的阶梯——高尔基</strong></div>
    </div>
  </div>
  <hr>
  <div class="row">
    <div class="text-center col-md-6 col-md-offset-3">
      <h4>已经到底部啦 </h4>
      <p>Copyright &copy; 2017Wlp &middot; 购书网站 &middot; <a href="http://yourwebsite.com/" >BOOKwebsite</a></p>
    </div>
  </div>
  <hr>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="user/js/jquery-1.11.2.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="user/js/bootstrap.js"></script>
</body>
</html>
