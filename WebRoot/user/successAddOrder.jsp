<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE> <!-- 使用H5的声明 -->
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="refresh" content="2;url=user_getMyOrder?user.userId=${orderUser.userId}">
    <title>My JSP 'successAddOrder.jsp' starting page</title>
    
  </head>
  	
  <body style="background-image:url(user/images/timg.gif)">
	<h1 >您已经成功加入购物车...跳转中...</h1>
  </body>
</html>
