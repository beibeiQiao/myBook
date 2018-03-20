<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<html>
<head>
<meta charset="utf-8">
<title>购物车·</title>
  <base href="<%=basePath%>">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="user/css/order.css" rel="stylesheet" type="text/css">

</head>

<body>
<nav class="navbar  navbar-default navbar-inverse  navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
		<a class="navbar-brand"  id="BookStore">BookStore</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li><a href="user/index.jsp">首页</a></li>
            <li><a href="user/buyBook.jsp">在线选购</a></li>
			<li class="active"><a href="user_getMyOrder?user.userId=${currUser.userId}">订单查询</a></li>
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
<!--当前位置-->
<div class="now_positionm">
<span>当前位置：</span><a href="user/index.jsp">首页></a><a href="user/showOrder.jsp">订单查询</a>
</div>
<div class="centers_mr">
<div class="public_m2">购物车</div>
            <!--一个订单信息-->
            <div class="public_m5">
            	<table class="table table-hover table-responsive" border="0" cellspacing="0" cellpadding="0">
            	
                	<tbody>
						<tr style=" border-bottom:1px solid #000">
							<th class="olist1">序号</th>        
                        	<th class="olist2">订单号</th>       
                            <th class="olist3">顾客</th>
                            <th class="olist4">书籍信息</th>
                            <th class="olist5">订单类型</th>    
                            <!-- <th class="olist3">订单商家</th> -->		
                            <th class="olist6">订单总额</th>		
                            <th class="olist7">下单时间</th>
                            <th class="olist8">物流状态</th>		
                            <th class="olist9">操作</th>
                        </tr>	
                     <c:forEach var="order" items="${myOrderList}" varStatus="status">
						 <tr>
					        <td class="olist1"><c:out value="${status.index+1}"></c:out></td>
					        <td class="olist2"><c:out value="${order.orderNum}"></c:out></td>
					        <td class="olist3"><c:out value="${order.user.userName}"></c:out></td>
					        <td class="olist4"><c:out value="${order.book.bookName}"></c:out></td>
					        <td class="olist5">在线选购</td>	
					        <td class="olist6"><c:out value="${order.totalPrice}"></c:out></td>
					        <td class="olist7"><c:out value="${order.orderDate}"></c:out></td>
					        <td class="olist8"><c:out value="${order.logistics}"></c:out></td>
					        <td class="olist9"><a href="user_deleteOrder?order.orderId=${order.orderId}&user.userId=${order.user.userId}" class="delete">删除</a></td>
				        </tr>
	    			</c:forEach>
<!-- 
                       	<tr>		
						  	<td><a href="#">2016102111523538</a></td>	 
							<td>餐位订餐</td>		
							<td><a href="#">牛牛的店</a></td>
                            <td>￥1666.00</td>
                            <td>16/06/06  20:45</td>
                            <td><font class="jds_m">待评价</font></td>		
							<td><a href="#">评价</a><a href="#">投诉</a></td>
                        </tr>
                        <tr>		
						  	<td><a href="#">2016102111523538</a></td>	 
							<td>餐位订餐</td>		
							<td><a href="#">牛牛的店</a></td>
                            <td>￥1666.00</td>
                            <td>16/06/06  20:45</td>
                            <td><font class="jds_m">已完成</font></td>		
							<td><a href="#">删除</a><a href="#">查看详情</a></td>
                        </tr>
                        <tr>		
						  	<td><a href="#">2016102111523538</a></td>	 
							<td>餐位订餐</td>		
							<td><a href="#">牛牛的店</a></td>
                            <td>￥1666.00</td>
                            <td>16/06/06  20:45</td>
                            <td><font class="jdqbsys_m">待付款</font></td>		
							<td><a href="#">付款</a><a href="#">取消订单</a></td>
                        </tr>
                        <tr>		
						  	<td><a href="#">2016102111523538</a></td>	 
							<td>餐位订餐</td>		
							<td><a href="#">牛牛的店</a></td>
                            <td>￥1666.00</td>
                            <td>16/06/06  20:45</td>
                            <td><font class="jdqbsys_m">待付款</font></td>		
							<td><a href="#">付款</a><a href="#">取消订单</a></td>
                        </tr>
                        <tr>		
						  	<td><a href="#">2016102111523538</a></td>	 
							<td>餐位订餐</td>		
							<td><a href="#">牛牛的店</a></td>
                            <td>￥1666.00</td>
                            <td>16/06/06  20:45</td>
                            <td><font class="jdqbsys_m">待付款</font></td>		
							<td><a href="#">付款</a><a href="#">取消订单</a></td>
                        </tr> -->
					</tbody>
                </table>
            </div>
            <div class="public_m6">
            	<img src="user/images/danmgydxm.png"/>
            </div>
	</div>
	 <footer>
       <p>这个冬天，让我们带你一起重温纸质经典--护眼，从现在做起！</p>
       <p>Copyright &copy; 2017 lxy All rights reserved. 联系我们：412854858@qq.com</p>
     </footer>
	</body>
</html>
