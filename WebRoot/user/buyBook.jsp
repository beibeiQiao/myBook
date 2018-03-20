<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<base href="<%=basePath%>">
<title> 在线选购 </title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>user/css/buybook.css">
 
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
            <li class="active"><a href="user/buyBook.jsp">在线选购</a></li>
			<li><a href="user/showOrder.jsp">订单查询</a></li>
            <li><a href="user/userPage.jsp">个人中心</a></li>
            <li><a href="user/niceLecture.jsp">美文鉴赏</a></li>
            <li><a href="user/aboutUs.jsp">关于我们</a></li>
        </ul>
        
        
        
        <form  class="navbar-form navbar-left form" role="search" method="post">
            <div class="form-group">
                <input type="text" name="keyWords" id="bt1" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default" id="bt2">搜索</button>
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
<header>
        海   量   精   美   图   书  ,  等   你   抱   回   家   哦  \^o^/
</header>

<div class="container">

<indexer>
<li class="link">
  <a href="user/buyBook.jsp#新书上架">新书上架</a>
</li>
<li class="link">
  <a href="user/buyBook.jsp#经典名著">经典名著</a>
</li>
<li class="link">
  <a href="user/buyBook.jsp#热门小说">热门小说</a>
</li>
<li class="link">
  <a href="user/buyBook.jsp#杂志期刊">杂志期刊</a>
</li>
<li class="link">
  <a href="user/buyBook.jsp#工具类书">工具类书</a>
</li>
<li class="link">
  <a href="user/buyBook.jsp#编程苦海">编程苦海 </a>
</li>
</indexer>

<mainbody>
<div class="box 新书上架" id="新书上架">
   <div class="link1 大话数据结构"> 
   <a href="user/dataStruct.jsp"><img src="user/images/编程苦海/大话数据结构.jpg" class="icon"></a>
   </div>
    <div class="link1 致我们单纯的小美好"> 
  <a href="user/beauty.jsp"><img src="user/images/热门小说/小美好.jpg"  class="icon" ></a> 
   </div>
   <div class="link1 爱格"> 
  <a href="user/aiGe.jsp"><img src="user/images/杂志期刊/爱格.jpg" class="icon"></a>
   </div>
   <div class="link1 海上牧云记"> 
  <img src="user/images/热门小说/海上牧云记.jpg" class="icon" >  
  </div>
   
  </div>
  <div class="box 经典名著" id="经典名著">
  <div class="link 红楼梦"> 
  <img src="user/images/经典名著/红楼梦.jpg" class="icon">
  <a href="user/hongLou.jsp" class="button" data="This is 红楼梦!">  
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">红楼梦</span> </a> 
  </div>
  <div class="link 三国演义"> 
  <img src="user/images/经典名著/三国演义.jpg" class="icon" > 
  <a href="#" class="button" data="This is 三国演义!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">三国演义</span> </a> 
  </div>
  <div class="link 西游记"> 
  <img src="user/images/经典名著/西游记.jpg" class="icon" > 
  <a href="#" class="button" data="This is 西游记!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">西游记</span> </a> 
  </div>
  <div class="link 水浒传"> 
  <img src="user/images/经典名著/水浒传.jpg" class="icon" > 
  <a href="#" class="button" data="This is 水浒传!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">水浒传</span> </a> 
  </div>
     <div class="link 哈姆雷特"> 
  <img src="user/images/经典名著/哈姆雷特.jpg"  class="icon">
   <a href="user/Harmlet.jsp" class="button" data="This is 哈姆雷特!"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">哈姆雷特</span> </a> 
   </div>
  <div class="link 飘"> 
  <img src="user/images/经典名著/飘.jpg" class="icon" > 
  <a href="#" class="button" data="This is 飘!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">飘</span> </a> 
  </div>
  <div class="link 傲慢与偏见"> 
  <img src="user/images/经典名著/傲慢与偏见.jpg"  class="icon">
   <a href="" class="button" data="This is 傲慢与偏见!"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">傲慢与偏见</span> </a> 
   </div>
  <div class="link 简爱"> 
  <img src="user/images/经典名著/简爱.jpg" class="icon" >
   <a href="#" class="button" data="This is 简爱!"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">简爱</span> </a> 
   </div>
</div>
<div class="box 热门小说" id="热门小说">
  <div class="link 致我们单纯的小美好"> 
  <img src="user/images/热门小说/小美好.jpg"  class="icon">
   <a href="user/beauty.jsp" class="button" data="This is 致我们单纯的小美好!"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">致我们单纯的小美好</span> </a> 
   </div>
  <div class="link 霸道总裁爱上我"> 
  <img src="user/images/热门小说/霸道总裁爱上我.jpg" class="icon" >
  <a href="#" class="button" data="This is 霸道总裁爱上我!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">霸道总裁爱上我</span> </a> 
  </div>
   <div class="link 霸道总裁爱上我605"> 
  <img src="user/images/热门小说/霸道总裁爱上我605.jpg" class="icon">
  <a href="#" class="button" data="This is 霸道总裁爱上我605!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">霸道总裁爱上我605</span> </a> 
  </div>
  <div class="link 海上牧云记"> 
  <img src="user/images/热门小说/海上牧云记.jpg" class="icon" > 
  <a href="#" class="button" data="This is 海上牧云记!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">海上牧云记</span> </a> 
  </div>
   <div class="link 你的孤独，虽败犹荣"> 
  <img src="user/images/热门小说/你的孤独虽败犹荣.jpg" class="icon" > 
  <a href="user/yourAlone.jsp" class="button" data="This is 你的孤独，虽败犹荣!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">你的孤独，虽败犹荣</span> </a> 
  </div>
  <div class="link 霍乱时期的爱情"> 
  <img src="user/images/热门小说/霍乱时期的爱情.jpg" class="icon" > 
  <a href="#" class="button" data="This is 霍乱时期的爱情!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">霍乱时期的爱情</span> </a> 
  </div>
  <div class="link 我在未来等你"> 
  <img src="user/images/热门小说/我在未来等你.jpg" class="icon" > 
  <a href="#" class="button" data="This is 我在未来等你!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">我在未来等你</span> </a> 
  </div>
  <div class="link 嫌疑人x的现身"> 
  <img src="user/images/热门小说/x的现身.jpg" class="icon">
   <a href="#" class="button" data="This is 嫌疑人x的现身!"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">嫌疑人x的现身</span> </a> 
   </div>
</div>
<div class="box 杂志期刊" id="杂志期刊">
  <div class="link 爱格"> 
  <img src="user/images/杂志期刊/爱格.jpg" class="icon">
   <a href="user/aiGe.jsp" class="button" data="This is 爱格"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">爱格</span> </a> 
   </div>
  <div class="link 读者"> 
  <img src="user/images/杂志期刊/读者.jpg" class="icon">
  <a href="#" class="button" data="This is 读者!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">读者</span> </a> 
  </div>
  <div class="link 故事会"> 
  <img src="user/images/杂志期刊/故事会.jpg" class="icon"> 
  <a href="#" class="button" data="This is 故事会!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">故事会</span> </a> 
  </div>
  <div class="link 看天下"> 
  <img src="user/images/杂志期刊/看天下.jpg" class="icon"> 
  <a href="#" class="button" data="This is 看天下!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">看天下</span> </a> 
  </div>
  <div class="link 意林"> 
  <img src="user/images/杂志期刊/意林.jpg" class="icon"> 
  <a href="user/意林.jsp" class="button" data="This is 意林!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">意林</span> </a> 
  </div>
  <div class="link 萌芽"> 
  <img src="user/images/杂志期刊/萌芽.jpg" class="icon"> 
  <a href="#" class="button" data="This is 萌芽!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">萌芽</span> </a> 
  </div>
  <div class="link 时代周刊"> 
  <img src="user/images/杂志期刊/时代周刊.jpg" class="icon"> 
  <a href="#" class="button" data="This is 时代周刊!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">时代周刊</span> </a> 
  </div>
  <div class="link 瑞丽 "> 
  <img src="user/images/杂志期刊/瑞丽.jpg" class="icon">
   <a href="#" class="button" data="This is 瑞丽!"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">瑞丽</span> </a> 
   </div>
</div>
<div class="box 工具类书" id="工具类书">
  <div class="link 新华字典"> 
  <img src="user/images/工具类书/新华字典.jpg" class="icon" >
  <a href="user/新华字典.jsp" class="button" data="This is 新华字典!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">新华字典</span> </a> 
  </div>
  <div class="link 古代汉语词典"> 
  <img src="user/images/工具类书/古代汉语词典.jpg" class="icon">
   <a href="" class="button" data="This is 古代汉语词典!"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">古代汉语词典</span> </a> 
   </div>
  <div class="link 牛津高阶英语词典"> 
  <img src="user/images/工具类书/牛津高阶英语词典.jpg" class="icon"> 
  <a href="#" class="button" data="This is 牛津高阶英语词典!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">牛津高阶英语词典</span> </a> 
  </div>
  <div class="link 中华成语词典"> 
  <img src="user/images/工具类书/中华成语词典.jpg" class="icon" > 
  <a href="#" class="button" data="This is 中华成语词典!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">中华成语词典</span> </a> 
  </div>
  <div class="link 十万个为什么"> 
  <img src="user/images/工具类书/十万个为什么.jpg" class="icon">
   <a href="user/十万个为什么.jsp" class="button" data="This is 十万个为什么!"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">十万个为什么</span> </a> 
   </div>
  <div class="link 庞中华楷书钢笔字帖"> 
  <img src="user/images/工具类书/庞中华楷书钢笔字帖.jpg" class="icon" > 
  <a href="#" class="button" data="This is 庞中华楷书钢笔字帖!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">庞中华楷书钢笔字帖</span> </a> 
  </div>
  <div class="link 考研思想政治理论终极预测"> 
  <img src="user/images/工具类书/考研思想政治理论终极预测.jpg" class="icon"> 
  <a href="#" class="button" data="This is 考研思想政治理论终极预测!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">考研思想政治理论终极预测</span> </a> 
  </div>
  <div class="link 新四级710分模拟试题"> 
  <img src="user/images/工具类书/新四级710分模拟试题.jpg" class="icon"> 
  <a href="#" class="button" data="This is 新四级710分模拟试题!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">新四级710分模拟试题</span> </a> 
  </div>
</div>
<div class="box 编程苦海" id="编程苦海">
  <div class="link 大话数据结构"> 
  <img src="user/images/编程苦海/大话数据结构.jpg" class="icon">
   <a href="user/dataStruct.jsp" class="button" data="This is 大话数据结构!"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">大话数据结构</span> </a> 
   </div>
  <div class="link C++Primer"> 
  <img src="user/images/编程苦海/C++Primer.jpg"class="icon">
   <a href="#" class="button" data="This is C++Primer!"> 
   <span class="line line-top"></span> 
   <span class="line line-right"></span> 
   <span class="line line-bottom"></span> 
   <span class="line line-left"></span> 
   <span class="text">C++Primer</span> </a> 
   </div>
  <div class="link APP Inventor 2"> 
  <img src="user/images/编程苦海/APP Inventor 2.jpg" class="icon">
  <a href="#" class="button" data="This is APP Inventor 2!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">APP Inventor 2</span> </a> 
  </div>
  <div class="link GitHub入门与实践"> 
  <img src="user/images/编程苦海/GitHub入门与实践.png" class="icon"> 
  <a href="#" class="button" data="This is GitHub入门与实践!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">GitHub入门与实践</span> </a> 
  </div>
  <div class="link java从入门到精通"> 
  <img src="user/images/编程苦海/java从入门到精通.jpg" class="icon"> 
  <a href="user/Java从入门到精通.jsp" class="button" data="This is java从入门到精通!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">java从入门到精通</span> </a> 
  </div>
  <div class="link Javaweb开发与实战"> 
  <img src="user/images/编程苦海/Javaweb开发与实战.jpg" class="icon"> 
  <a href="#" class="button" data="This is Javaweb开发与实战!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">Javaweb开发与实战</span> </a> 
  </div>
  <div class="link Python3程序开发指南"> 
  <img src="user/images/编程苦海/Python3程序开发指南.jpg" class="icon"> 
  <a href="#" class="button" data="This is Python3程序开发指南!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">Python3程序开发指南</span> </a> 
  </div>
  <div class="link 企业微信公众平台开发实战"> 
  <img src="user/images/编程苦海/企业微信公众平台开发实战.jpg" class="icon"> 
  <a href="#" class="button" data="This is 企业微信公众平台开发实战!"> 
  <span class="line line-top"></span> 
  <span class="line line-right"></span> 
  <span class="line line-bottom"></span> 
  <span class="line line-left"></span> 
  <span class="text">企业微信公众平台开发实战</span> </a> 
  </div>
</div>
</mainbody>
</div>

    <footer>
       <p>这个冬天，让我们带你一起重温纸质经典--护眼，从现在做起！</p>
       <p>Copyright &copy; 2017 lxy All rights reserved. 联系我们：412854858@qq.com</p>
     </footer>
   <script type="text/javascript">
            window.onload=function(){
                var bt=document.getElementById("bt2");
                var btt=document.getElementById("bt1").text();
                bt.onclick=function(){
                  /*   alert(bt1.value); */
                 window.navigate(btt+".jsp"); 
                }
            }
        </script>
</body>
</html>