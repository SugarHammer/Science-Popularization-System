<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>博物馆文物智能科普系统</title>
<link rel="stylesheet" href="../layui-v2.5.7/layui/css/layui.css">
<script language="JavaScript"> 
　　		window.onload=init;
        function init() {
            var pop = "${requestScope.msg}";
            if(pop != ""){
                alert(pop);
            }
        }
	</script>
</head>
<body class="layui-layout-body" style="background-color: #f2f2f2;">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">博物馆文物智能科普系统</div>

			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> <%String name = (String)session.getAttribute("name");out.println(name);%>
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a
					href="${pageContext.request.contextPath}/jsp/logoff.jsp"> <i
						class="layui-icon layui-icon-logout"></i> 退出
				</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a class="" href="javascript:;">
							<i class="layui-icon layui-icon-home"></i> 系统首页
					</a></li>
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;"> <i class="layui-icon layui-icon-user"></i>
							用户管理
					</a>
						<dl class="layui-nav-child">
							<dd class="layui-this">
								<a href="${pageContext.request.contextPath}/jsp/table.jsp"
									target="iframe">用户信息</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/jsp/ech.jsp"
									target="iframe">用户数据</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">文物管理</a>
						<dl class="layui-nav-child">
							<dd class="layui-this">
								<a
									href="${pageContext.request.contextPath}/jsp/culturalRelic.jsp"
									target="iframe">文物一览</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/jsp/release.jsp"
									target="iframe">发布文物</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">公告管理</a>
						<dl class="layui-nav-child">
							<dd class="layui-this">
								<a href="${pageContext.request.contextPath}/jsp/notice.jsp"
									target="iframe">历史公告</a>
							</dd>
							<dd>
								<a
									href="${pageContext.request.contextPath}/jsp/announcement.jsp"
									target="iframe">发布公告</a>
							</dd>
						</dl></li>

				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">
				<iframe src="${pageContext.request.contextPath}/jsp/table.jsp"
					frameborder="0" id="demoAdmin" name="iframe"
					style="width: 100%; height: 580px;"></iframe>
			</div>
		</div>

		<div class="layui-footer" style="text-align: center;">
			<!-- 底部固定区域 -->
			©LIKEYOU 2024
		</div>
	</div>



	<script src="../layui-v2.5.7/layui/layui.js" charset="utf-8"></script>
	<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>



</body>
</html>
