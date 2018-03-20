<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>个人主页</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="user/css/user.css" rel="stylesheet" type="text/css">
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
            <li class="active"><a href="user/userPage.jsp">个人中心</a></li>
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
<!--当前位置-->
<div class="now_positionm">
<span>当前位置：</span><a href="#">首页></a><a href="#">个人中心</a>
</div>

<div class="centers_mr">
    <h1 class="welcom_tm">欢迎您,<font style="font-weight:600">${currUser.userName}</font>,尊敬的用户! </h1>
    <!--一条开始-->
    	<div class="public_m1">
        	<div class="public_m2">资料管理</div>
            <!--照片和内容-->	
            <div class="zp_nrm">
            	<!--left-->
                <div class="zp_nrm_l">
                	<img src="user/images/whoami.jpg"/>
                    <a href="#" style="text-decoration:none">更换头像</a>
                </div>
                <!--right-->
                <div class="zp_nrm_r">
                	<p><em>用户名：</em><c:out value="${currUser.userName}"></c:out></p>
                    <p><em>邀请码：</em><i>bookstore132456487943321</i><font>(推荐邀请有奖)</font></p>
                    <p><em>邮箱：</em><c:out value="${currUser.userEmail}"></c:out><a href="#">更改绑定</a></p>
                    <p><em>手机号：</em><c:out value="${currUser.userTele}"></c:out><a href="#">更改绑定</a></p>
                    <p><em>地址：</em><c:out value="${currUser.userAddress}"></c:out><a href="#">立即修改</a></p>
                    <p><em>性别：</em><c:out value="${currUser.userSex}"></c:out><input type="radio" name="sex" class="sex_m"><i>保密</i><input type="radio" name="sex" class="sex_m"><i>男</i><input type="radio" name="sex" class="sex_m"><i>女</i></p>
                    <span class="borth_m">
                    	<em>生日：</em><c:out value="${currUser.userBirth}"></c:out>
                        <select style=" float:left; height:23px; border:1px solid #eaeaea; margin-top:13px; margin-right:3px">
                        	<option>-年-</option>
                            <option>1995年</option>
                            <option>1996年</option>
                            <option>1997年</option>
                            <option>1998年</option>
                            <option>1999年</option>
                            <option>2000年</option>
                        </select>
                        <select style=" float:left; border:1px solid #eaeaea; margin-top:13px; margin-right:3px">
                        	<option>-月-</option>
                            <option>01月</option>
                            <option>02月</option>
                            <option>03月</option>
                            <option>04月</option>
                            <option>05月</option>
                            <option>06月</option>
                            <option>07月</option>
                            <option>08月</option>
                            <option>09月</option>
                            <option>10月</option>
                            <option>11月</option>
                            <option>12月</option>
                        </select>
                        <select style=" float:left; border:1px solid #eaeaea; margin-top:13px; margin-right:3px">
                        	<option>-日-</option>
                            <option>1日</option>
                            <option>2日</option>
                            <option>3日</option>
                            <option>4日</option>
                            <option>5日</option>
                            <option>6日</option>
                            <option>7日</option>
                            <option>8日</option>
                            <option>9日</option>
                            <option>10日</option>
                            <option>11日</option>
                            <option>12日</option>
                            <option>13日</option>
                            <option>14日</option>
                            <option>15日</option>
                        </select>
                        <font>(可能有惊喜哦)</font>
                    </span>
                    <p><em>喜欢：</em><input type="radio" name="sexl" class="sex_m"><i>经典文学</i><input type="radio" name="sexl" class="sex_m"><i>流行小说</i><input type="radio" name="sexl" class="sex_m"><i>期刊杂志</i></p>
                    <a href="#" class="public_m3">保存修改</a>
                </div>
            </div>
        </div>
        </div>
      <footer>
       <p>这个冬天，让我们带你一起重温纸质经典--护眼，从现在做起！</p>
       <p>Copyright &copy; 2017 lxy All rights reserved. 联系我们：412854858@qq.com</p>
     </footer>

</body>
</html>
