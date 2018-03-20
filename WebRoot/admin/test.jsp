<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>首页</title>
   </head>
  
  <body>
    <p style="color:red;font-size:30px;text-align:center">后台登录成功</p>
    <h3 style="text-align:center;color:deepgray;font-size:25px">所有图书</h3>
	   <table class="table table-striped table-hover" id="dataTables-example" 
       		   style="width:90%;margin:10px auto;padding:10px 120px">
         <thead>
             <tr>
                <th>序号</th>  
		        <th>ISBN</th>
		        <th>名称</th>
		        <th>作者</th> 
		        <th>单价</th>  
		        <th>类型</th>
		        <th>操作</th>
             </tr>
         </thead>
         <tbody>
           <c:forEach items="${bookList}" var="p" varStatus="status">
              <tr style="background-color:${status.index%2==0 ? 'pink':'palegoldenrod' };text-align:center">
                <td>${p.bookId}</td>
                <td>${p.bookCode}</td>
                <td>${p.bookName}</td>
                <td>${p.bookAuthor}</td>
                <td>${p.bookPrice}</td>
                <td>${p.type.typeName}</td>
             <!-- 利用a链接进行删除book数据的方法  href="actionName?book.bookId" (传入一个bookId数据)-->
                <td><a href="admin_deleteBook?book.bookId=${p.bookId}">删除</a></td>
              </tr>
          </c:forEach>
           
         </tbody>
       </table>
  </body>
</html>
