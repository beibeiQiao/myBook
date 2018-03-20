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
    <title>修改用户</title>
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
			
			<form action="admin_updateUser" method="post">
			   手机号：<input type="text" name="user.userTele" class="form-control" id="name" value="${user2.userTele }">
			    姓名：<input type="text" name="user.userName" class="form-control" id="name" value="${user2.userName }">
			    密码： <input type="text" name="user.userPwd" class="form-control" id="inputPassword" value="${user2.userPwd }">
			    性别：
			    <c:choose>
				    <c:when test="${user2.userSex=='男'}">
				       <input type="radio" name="user.userSex" id="sexRadios1" value="男" checked="checked"> 男
			    	   <input type="radio" name="user.userSex" id="sexRadios2" value="女"> 女
				    </c:when>
				    <c:otherwise>
				        <input type="radio" name="user.userSex" id="sexRadios1" value="男"> 男
			           <input type="radio" name="user.userSex" id="sexRadios2" value="女" checked="checked"> 女
				    </c:otherwise>
				</c:choose>
			     <br>
			     邮箱：<input type="text" name="user.userEmail" class="form-control" id="email" value="${user2.userEmail }">
			     头像： <input type="file" id="inputfile">
			QQ：<input type="text" name="user.userQQ" class="form-control" id="QQ" value="${user2.userQQ }">
			     生日：<input type="text" name="user.userBirth" class="form-control" id="birthday" value="${user2.userBirth}">
			     收货地址：<input type="text" name="user.userAddress" class="form-control" id="address" value="${user2.userAddress }">
			      个性签名：<input type="text" name="user.userAuto" class="form-control" id="signature" value="${user2.userAuto }">
		      
	      </form>
			</div>
			<div class="modal-footer">
			    <a href="admin_getAllUser" class="btn btn-primary" style="float:left">返回</a>
			    <span><c:out value="${user.userName}"></c:out></span>
				<a href="admin_updateUser" class="btn btn-primary">保存</a>
			</div>
		</div>
	</div>
  </body>
</html>
