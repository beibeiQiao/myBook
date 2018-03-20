<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!doctype html>
<html>
  <head>
  <meta charset="utf-8">
    <title>首页</title>
    <base href="<%=basePath %>">
     <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="user/css/one.css" rel="stylesheet" type="text/css">
   </head>
  
  <body>
    <nav class="navbar  navbar-default navbar-inverse  navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
		<a class="navbar-brand" href="#" id="BookStore">BookStore</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="user/index.jsp">首页</a></li>
            <li><a href="user/buyBook.jsp">在线选购</a></li>
			<li><a href="user_getMyOrder?user.userId=${currUser.userId}">订单查询</a></li>
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
        <!-- <ul class="nav navbar-nav navbar-right"> 
            <li><a href="userRegister.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
            <li><a href="userLogin.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li> 
        </ul>  -->
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

  
     <div id="circleContent" class="carousel slide"> 
 <ol class="carousel-indicators"> 
 <li data-target="#circleContent" data-slide-to="0" class="active"></li> 
 <li data-target="#circleContent" data-slide-to="1"></li> 
 <li data-target="#circleContent" data-slide-to="2"></li> 
 </ol> 
 <div class="carousel-inner"> 
 <div class="item active"> 
  <img src="user/images/timg.jpg" style="width:1000px;height:510px;margin:0 auto"> 
  <div class="carousel-caption"> 喜爱读书，就等于把生活中寂寞无聊的时光换成巨大享受的时刻。 —— 孟德斯鸠</div> 
 </div> 
 <div class="item"> 
  <img src="user/images/2465.jpg" style="width:1000px;height:510px;margin:0 auto"> 
  <div class="carousel-caption">外物之味，久则可厌，读书之味，愈久愈深。 —— 程颐</div> 
 </div> 
 <div class="item"> 
  <img src="user/images/back.jpg" style="width:1000px;height:510px;margin:0 auto"> 
  <div class="carousel-caption">真理的大海，让未发现的一切事物躺卧在我的眼前，任我去探寻。 —— 牛顿</div> 
 </div>
 </div> 
 <a class="carousel-control left" href="#circleContent" data-slide="prev">‹</a> 
 <a class="carousel-control right" href="#circleContent" data-slide="next">›</a> 
 </div> 

     
      
    
     <div id="text1">
     <p>我，你，世界</p>
     <p>我与世界只差一个你</p>
     <p>我在我的世界里思考，欢喜，忧伤。</p>
     <p>我好像是在海滨上玩耍的孩子，时而拾到几块莹洁的石子，时而拾到几片美丽的贝壳并为之欢欣。那浩瀚的真理的海洋仍展现在面前</p>
     </div>
	  
	  
	 <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
    <div class="hovereffect">
        <img class="img-responsive" src="user/images/2464.jpg" alt="">
            <div class="overlay">
                <h2>美文鉴赏</h2>
				<p>
					<a href="user/niceLecture.jsp">LINK HERE</a>
				</p>
            </div>
    </div>
</div>
	  
	  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
    <div class="hovereffect" style="margin-left: 150px;">
        <img class="img-responsive" src="user/images/timg (3).jpg" alt="">
            <div class="overlay">
                <h2>在线选购</h2>
				<p>
					<a href="user/buyBook.jsp">LINK HERE</a>
				</p>
            </div>
    </div>
</div><div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" >
    <div class="hovereffect" style="margin-left: 200px;">
        <img class="img-responsive" src="user/images/2467.jpg" alt="">
            <div class="overlay">
                <h2>加入我们</h2>
				<p>
					<a href="userRegister.jsp">LINK HERE</a>
				</p>
            </div>
    </div>
</div>
	  
	  <footer>
       <p>这个冬天，让我们带你一起重温纸质经典--护眼，从现在做起！</p>
       <p>Copyright &copy; 2017 lxy All rights reserved. 联系我们：412854858@qq.com</p>
     </footer>
	  
        
	</body>
</html>