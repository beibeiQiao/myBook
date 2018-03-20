<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//User modifyUser = request.

%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>修改book信息</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  </head>
  
  <body>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" ><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">编辑用户信息</h4>
			</div>
			<div class="modal-body">
			
			<form action="admin_updateBook" method="post">
			    ISBN：：<input type="text" name="book.bookCode" class="form-control" id="ISBN" value="${updateBook.bookCode}">
					     书籍名称：：<input type="text" name="book.bookName" class="form-control" id="name" value="${updateBook.bookName}">
					      书籍图片： <input type="file" id="inputfile">
					      书籍作者： <input type="text" name="book.bookAuthor" class="form-control" id="author" value="${updateBook.bookAuthor}">
					       书籍简介：  <input type="text" name="book.bookDes" class="form-control" id="des" value="${updateBook.bookDes}">
					   书籍服务：<input type="text" name="book.bookService" class="form-control" id="service" value="${updateBook.bookService}">
					      书籍单价：<input type="text" name="book.bookPrice" class="form-control" id="price" value="${updateBook.bookPrice}">
					      书籍类型：
					        <input type="radio" name="book.bookType" id="sexRadios1" value="1"> 经典名著
					        <input type="radio" name="book.bookType" id="sexRadios2" value="2"> 热门小说
					        <input type="radio" name="book.bookType" id="sexRadios3" value="3"> 杂志期刊
					        <input type="radio" name="book.bookType" id="sexRadios4" value="4"> 工具类书
					        <input type="radio" name="book.bookType" id="sexRadios5" value="5"> 编程苦海
					        <br>
	      </form>
			</div>
			<div class="modal-footer">
			    <a href="admin_getAllBook" class="btn btn-primary" style="float:left">返回</a>
			    <span><c:out value="${user.userName}"></c:out></span>
				<a href="admin_updateBook" class="btn btn-primary">保存</a>
			</div>
		</div>
	</div>
  </body>
</html>
