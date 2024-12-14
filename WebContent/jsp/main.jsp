<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("index.jsp");%>
<!DOCTYPE html>
<html style="height:100%">
<head>
<title>博物馆文物智能科普系统</title>

<link
	href="https://cdn.jsdelivr.net/gh/ihewro/handsome-static@8.1.0.1/assets/libs/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../layui-v2.5.7/layui/css/layui.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body style="height:100%">
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 内容主体区域 -->
	<div class="content" style="height:100%">
		<div style="height:100%">
			<iframe src="${pageContext.request.contextPath}/jsp/hot.jsp"
				frameborder="0" id="demoAdmin" name="iframe" style="height:100%!importent"></iframe>
		</div>
	</div>
	<!-- 内容主体区域结束 -->

	<!-- 底部固定区域 -->
	<div class="footer">©LIKEYOU 2024</div>
	<script src="../layui-v2.5.7/layui/layui.js" charset="utf-8"></script>
	<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
