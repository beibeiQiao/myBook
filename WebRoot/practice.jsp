<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'practice.jsp' starting page</title>
    
  </head>
  
  <body>
    <s:iterator value="orderList" status="status">
    	<s:property value="#status.index+1"/>
    	<s:a href="order/order_showDetail?order.orderId=%{orderId}"><s:property value="orderId"/></s:a>
    </s:iterator>
  </body>
</html>
