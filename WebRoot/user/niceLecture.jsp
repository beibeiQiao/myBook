<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap - Prebuilt Layout</title>

<!-- Bootstrap -->
<link href="user/css/buybook.css" rel="stylesheet">
<link href="user/css/bootstrap-3.3.4.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="file:///E|/网页设计/bootstracp/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="background:rgba(242,241,227,1.00);padding-top:60px;"
>
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
            <li><a href="user/userPage.jsp">个人中心</a></li>
            <li class="active"><a href="user/niceLecture.jsp">美文鉴赏</a></li>
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
    <div align="center"><h1><img src="../images/美文鉴赏.jpg" width="70" height="70" alt="" class="img-rounded"/>   美文鉴赏</h1></div><br><h5 align="center">感谢生活，我们一生的引领者。把痛和泪留下的同时，她把更多的智慧留下了，把更多的财富留下了，把更多的快乐留下了……</h5><hr>
<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title" >
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseOne"><ul><strong>
					谁的浅夏渲染了流年</strong>——美文欣赏</ul>
				</a>
			</h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in">
			<div class="panel-body">
				　窗外，桂花暗香浮动，梧桐疏影摇曳，宛如金秋的寒露落在盛夏的花朵上，一切看起来如此随然。时光荏苒，岁月沧桑，时间如白驹过隙般从指尖匆匆流过，留下的只是仓促和茫然。身处喧嚣的世界，一个人独在幽居，即使身边有太多的纷杂，只要在心里种菊，也会收获一份淡然和宁静。总喜欢独自一人倚窗看窗外的景，桂树依然一树花香，梧桐树叶泛黄凋落，满地都是飘落的花瓣和树叶，随着风儿起舞，街上依然是匆匆的行人，偶尔，远眺远处那座秀丽的山峰，依然那么巍峨气派，看天际云卷云舒，变幻无常，闲观眼前的花开花落，落叶归根。收回潮水般的思绪，转身，拿起杯盏，泡一杯香茶，把心中的纷杂搁浅；深情回忆一段往事，把遗漏的光阴拾捡；捧一本书香，阅一段文字，把深埋在时光深处的痴念缱绻。
　　
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title" >
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseTwo"><ul><strong>
					无奈相思，一卷红尘</strong>——美文欣赏</ul>
				</a>
			</h4>
		</div>
		<div id="collapseTwo" class="panel-collapse collapse">
			<div class="panel-body">
				无奈相思，一卷红尘，是谁的挂牵，人生的无缘，一个错过，一个生死不见，爱梦断，人回首，只是江湖冷三生，岁月无情。一杯老酒，一段人生，沧海无奈，思念自己的孤独，伤害最后的生命。一段思念，一段无缘，守望人海的冷，憔悴自己的辜负。<br>
                一份爱情，一份再见，只是一个生死的契约，不回首的冷漠，不再见的缘，只是彼此一个等，只是今生一个散，多少的无缘，回首人海的花月无情，冷漠自己的孤独。人海苍老，一生无情，风月无奈，只是生死同路不同门，相思苦，一个人孤独，一生辜负，只是错过，错的太多。

			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title" >
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseThree"><ul><strong>
					江南夜半听雨声</strong>——美文欣赏</ul>
				</a>
			</h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse">
			<div class="panel-body">
				夜雨敲窗梦醒，轻叹一声，何由？年年客乡总漂伶，身如浮萍逐水流。<br>
　近来，时于夜半下雨，我也常在梦里被吵醒。究因，原是我楼下临窗的地方，以前是一块空地，房东在这里用彩钢板造了一个堆放杂物的小房子。时有四五只野猫在上面撒欢决斗，或时不时的一通乱嚎，让本就喜清静的我更不堪其扰。
			</div>
		</div>
	</div>
</div>
<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title" >
			  <a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseFour"><ul><strong>
					花开半夏</strong>——美文欣赏</ul>
				</a>
			</h4>
		</div>
  <div id="collapseFour" class="panel-collapse collapse">
			<div class="panel-body">
				清风过境，带着浓浓的秋意催开了将绽未绽的寒菊，逗笑了娃娃的笑脸，秋后，枝头缓缓飘落的秋叶铺满了整条不算宽敞的小路，偶尔三两片落叶调皮的跳着名为永不再见的舞曲，眨眼间，眉宇便染上淡淡的哀愁。<br>
                若遇下雨天，听那哔哩啪啦的雨点敲打在房顶的声音，时有一种隐隐的心疼感。看着那一滴滴晶银剔透的水珠，从高空落下，被摔的粉碎粉碎地化成一缕水雾，就忍不住有种喉结颤动的冲动。也就时于无眠之夜，依窗听雨，任思绪随这漫天丝雨纷飞，借这漫天风雨来填充空虚无依的心神，打发寂寞难耐的旅愁。
	</div>
		</div>
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
<script src="js/jquery-1.11.2.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed --> 
<!-- <script src="js/bootstrap.js"></script> -->
<script src="../js/bootstrap-3.3.4.js" type="text/javascript"></script>
</body>
</html>
