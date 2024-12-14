<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>博物馆文物智能科普系统</title>

<link
	href="https://cdn.jsdelivr.net/gh/ihewro/handsome-static@8.1.0.1/assets/libs/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../layui-v2.5.7/layui/css/layui.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../layui-v2.5.7/layui/layui.js"></script>


</head>
<body>
	<%--头部导航开始--%>
	<header>
		<div>
			<span>博物馆文物智能科普系统</span>
			<div class="div3">
				<%String name = (String)session.getAttribute("name");out.println(name + " 欢迎你!");%>
				<div class="btn-group">
					<button type="button"
						class="btn btn-default dropdown-toggle btn-xs glyphicon glyphicon-cog"
						data-toggle="dropdown">
						<span class="caret"> </span>
					</button>
					<ul class="dropdown-menu pull-right" role="menu">
						<li><a
							href="${pageContext.request.contextPath}/user/querUser"
							class="glyphicon glyphicon-user">个人中心</a></li>
						<li><a
							href="${pageContext.request.contextPath}/jsp/loginoff1.jsp"
							class="glyphicon glyphicon-off">退出登录</a></li>
					</ul>
				</div>
			</div>
		</div>
		<ul>
			<il>
			<a href="${pageContext.request.contextPath}/jsp/hot.jsp"
				target="iframe">首页</a></il>
			<il>
			<a href="${pageContext.request.contextPath}/jsp/un.html"
				target="iframe">所有藏品</a></il>
			<il>
			<a href="${pageContext.request.contextPath}/jsp/un1.html"
				target="iframe">我的收藏</a></il>
			<il>
			<a href="${pageContext.request.contextPath}/jsp/user.jsp"
				target="iframe">个人中心</a></il>
		</ul>
	</header>
</body>
</html>