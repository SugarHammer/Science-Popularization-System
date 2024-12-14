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
<body style="background-image: url('../images/Great Court 04.jpg');">
	<%--头部导航开始--%>
	<header>
		<div>
			<span>博物馆文物智能科普系统</span>
			<%--            <div style="display: inline-block;color: white;display: inline-block;padding-left: 1100px" class="glyphicon glyphicon-user"></div>--%>
			<%--            <b class="glyphicon glyphicon-chevron-down"></b>--%>
			<button id="login" class="layui-btn layui-btn-normal layui-btn-sm">登录</button>
			<a id="register" class="layui-btn layui-btn-normal layui-btn-sm"
				href="re.html">注册</a>
		</div>
		<ul>
			<il>
			<a href="${pageContext.request.contextPath}/jsp/hot.jsp"
				target="iframe">首页</a></il>
			<il>
			<a href="${pageContext.request.contextPath}/jsp/un.html"
				target="iframe">所有藏品</a></il>
		</ul>
	</header>
	<%--头部导航结束--%>

	<div class="content">
		<!-- 内容主体区域 -->
		<div>
			<iframe src="${pageContext.request.contextPath}/jsp/hot.jsp"
				frameborder="0" id="demoAdmin" name="iframe"></iframe>
		</div>
	</div>

	<div class="footer">
		<!-- 底部固定区域 -->
		©LIKEYOU 2024
	</div>

	<%--登录框--%>
	<div class="model" id="model1">
		<div class="ba"></div>
		<div class="pu">
			<form id="userLogin"
				action="${pageContext.request.contextPath}/user/login" method="post">
				<p>
					<span class="text">用户名</span>
				</p>
				<p>
					<input type="text" class="layui-input" name="userName"
						id="userName" autocomplete="off">
				</p>
				<p>
					<span class="text">密码</span>
				</p>
				<p>
					<input class="layui-input" type="password" name="userPwd"
						id="userPwd" autocomplete="off">
				</p>
				<button type="button" class="submit" lay-submit
					lay-filter="userLogin">登录</button>
				<!-- <input type="submit" class="submit" value="登录"/> -->
			</form>
		</div>
	</div>
	<%--登录框结束--%>

	<script type="text/javascript">
    window.onload = function () {
        function getNow(s) {
            return s < 10 ? s : s;
        }

        let myDate = new Date();
        let now = myDate.getFullYear() + '/' + getNow(myDate.getMonth() + 1) + "/" + getNow(myDate.getDate());
        console.log(now);
        $("#date11").text(now);
        
        /* var pop = "${requestScope.msg}";
        if(pop != ""){
        	layer.msg('密码错误！',{icon:2,offset:'rt',anim:6,});
        } */
    }
</script>
	<script>
    $(document).ready(function () {
        $("#login").click(function () {
            console.log("111");
            //$("#model1").css({"visibility": "visible"});
            $("#model1").fadeIn(1000);
        });

        let models = document.querySelectorAll(".ba");
        for (let m in models) {
            let model = models[m];
            model.onclick = function () {
                // $("#model1").css({"visibility": "hidden"});
                $("#model1").fadeOut(1000);
            };
        }         
    });
</script>
	<script>
    layui.use('form', function(){
        //let element = layui.element;
        let form = layui.form;
        
        $(document).on('blur','#userName',function () {
        	let userName = $("#userName").val();
            $.ajax({
                url: "../user/judgeUser",
                type:"POST",
                data:{userName:userName},
                success: function (data) {
                    if (data == "F") {
                    	layer.msg('用户名不存在！',{icon:2,offset:'rt',anim:6,});
                    	return false;
                    }
                }
            })
        });
        
        form.on('submit(userLogin)', function(data){
        	let userName = $("#userName").val();
        	let userPwd = $("#userPwd").val();

            $.post("../user/login",{userName:userName,userPwd:userPwd} ,function(data){
            	if(data == "F"){
            		layer.msg('密码错误！',{icon:2,offset:'rt',anim:6,});
            		return false;
            	}else{
            		//var da = JSON.parse(data);
            		console.log(data)
            		sessionStorage.setItem('name',data.userName);
            		console.log(sessionStorage.getItem('name'));
            		window.location.href="main.jsp";
            	}
            })
        });
        
    });
</script>
</body>
</html>
