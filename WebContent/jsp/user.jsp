<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("index.jsp");%>

<html>
<head>
<title>用户信息</title>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../layui-v2.5.7/layui/css/layui.css" rel="stylesheet">
<script type="text/javascript">
window.onload = function () {

		$.ajax({
            url: "../user/querUser",
            type:"POST",
            success: function (data) {
            	$("#Name").text(data.userName);
            	$("#Sex").text(data.userSex);
            	$("#Phone").text(data.userPhone);
            	$("#Email").text(data.userEmail);    
            	$("#userName").val(data.userName);          	
            	$("#userPhone").val(data.userPhone);
            	$("#userEmail").val(data.userEmail);
            	if (data.userSex=="男") {
            		$('#sexl').checked=true;
            	　　　$(".layui-input-block ").children('.layui-unselect').eq(0).addClass('layui-form-radioed');
            	     $(".layui-input-block ").children('.layui-unselect').eq(0).children('i').addClass('layui-anim-scaleSpring');
            			console.log(2);
            	} else {
            		console.log(1);
            		$('#sexn').checked=true;
            	　$(".layui-input-block ").children('.layui-unselect').eq(1).addClass('layui-form-radioed');
            	 $(".layui-input-block ").children('.layui-unselect').eq(1).children('i').addClass('layui-anim-scaleSpring');
            	}
            }
		});
};
</script>
</head>
<body style="background-color: white;">
	<div class="con1">
		<div class="con2">
			<div class="con3">
				<a href="${pageContext.request.contextPath}/jsp/main.jsp"
					style="color: gray; fint-size: 18px">首页></a> <span
					style="color: gray; fint-size: 18px">个人中心</span><br> <br>
				<h2>个人信息</h2>
				<div class="div1">
					<button id="up"
						class="btn btn-sm btn-info glyphicon glyphicon-edit">修改密码</button>
					<button id="ui"
						class="btn btn-sm btn-warning glyphicon glyphicon-repeat">修改信息</button>
					<br>
				</div>
				<div class="row clearfix" style="margin-left: 250px;">
					<div class="col-md-12 column">
						<table class="table table-bordered">
							<tr>
								<td>用户名</td>
								<td id="Name"></td>
							</tr>
							<tr>
								<td>性别</td>
								<td id="Sex"></td>
							</tr>
							<tr>
								<td>邮箱</td>
								<td id="Email"></td>
							</tr>
							<tr>
								<td>电话</td>
								<td id="Phone"></td>
							</tr>
							<tr>
								<td>密码</td>
								<td>******</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改密码框 -->
	<form class="layui-form" id="upwd" name="upwd" method="post"
		hidden="hidden">
		<div class="layui-form-item"></div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">旧密码</label>
			<div class="layui-input-inline">
				<input type="password" name="oldPwd" id="oldPwd" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">新密码</label>
			<div class="layui-input-inline">
				<input type="password" name="userPwd" id="userPwd"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">确认密码</label>
			<div class="layui-input-inline">
				<input type="password" id="newPwd" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
				<a type="button" class="layui-btn layui-btn-primary"
					href="${pageContext.request.contextPath}/jsp/user.jsp"
					target="iframe">取消</a>
			</div>
		</div>
	</form>
	<!-- 修改密码框结束 -->

	<!-- 修改信息框 -->
	<form class="layui-form" id="uin" name="uin" method="post"
		hidden="hidden">
		<div class="layui-form-item"></div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-inline">
				<input type="text" name="userName" id="userName" autocomplete="off"
					class="layui-input" readonly style="background-color: #f2f2f2;"
					value="">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block">
				<input type="radio" id="sexl" name="userSex" value="男" title="男">
				<input type="radio" id="sexn" name="userSex" value="女" title="女">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱</label>
			<div class="layui-input-inline">
				<input type="text" id="userEmail" name="userEmail"
					autocomplete="off" class="layui-input" value="${user.userEmail}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">电话</label>
			<div class="layui-input-inline">
				<input type="text" id="userPhone" name="userPhone"
					autocomplete="off" class="layui-input" value="${user.userPhone}">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="submitU">立即提交</button>
				<a type="button" class="layui-btn layui-btn-primary"
					href="${pageContext.request.contextPath}/jsp/user.jsp"
					target="iframe">取消</a>
			</div>
		</div>
	</form>
	<!-- 修改信息框结束 -->


	<script src="../js/jquery-1.11.3.min.js" charset="utf-8"></script>
	<script src="../layui-v2.5.7/layui/layui.js" charset="utf-8"></script>
	<script
		src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		layui.use('layer', function() {
			let $ = layui.jquery;
			let layer = layui.layer;
			
			$(document).on('click', '#up', function() {

				layer.open({
					type:1,
					title : '修改密码',
					content : $('#upwd'),
					area : [ '350px', '290px' ],
					closeBtn : 2,
					shade : 0.1,
					shadeClose : true,
					anim : 1,
					resize : false
				});
			});
			
			$(document).on('click', '#ui', function() {

				layer.open({
					type:1,
					title : '修改个人信息',
					content : $('#uin'),
					area : [ '350px', '350px' ],
					closeBtn : 2,
					shade : 0.1,
					shadeClose : true,
					anim : 1,
					resize : false
				});
			});
			
			$(document).on('blur','#oldPwd',function () {
				let old = $("#oldPwd").val();
				$.ajax({
	                url: "../user/pwd",
	                type:"POST",
	                data:{oldPwd:old},
	                success: function (data) {
	                    if (data == "F") {
	                    	layer.msg('旧密码错误！',{icon:2,anim:6,});
	                    	return false;
	                    }
	                }
	            })
			});
			
		});
	</script>
	<script>
		layui.use('form', function(obj) {
			var form = layui.form;

			//修改密码监听提交
			form.on('submit(submit)', function(data, index) {
				
				let userPwd = $('#userPwd').val();			
				$.ajax({
	                url: "../user/updatePwd",
	                type:"POST",
	                data:{userPwd:userPwd},
	                success: function (data) {
	                	if (data == "OK") {
							layer.msg("修改成功", {icon : 1,anim:3,});
							return false;
						} else {
							layer.msg("修改失败", {icon : 5,anim:6,});
						}
	                }
	            });
			});
			
			//修改个人信息监听提交
			form.on('submit(submitU)', function(data, index) {
				
				$.ajax({
	                url: "../user/updateUser",
	                type:"POST",
	                data:data.field,
	                success: function (data) {
	                	if (data == "OK") {
	                		window.location.href="../user/querUser";
						} else {
							layer.msg("修改失败", {icon : 5,anim:6,});
						}
	                }
	            });
			});
			
		});
	</script>

	<script>
    	$(document).ready(function () {
    		$("#newPwd").blur(function () {
    			if($("#newPwd").val() == $("#userPwd").val()){
    				$("#newPwd").css('border-color','null');
    				$("#userPwd").css('border-color','null');
    			}else{
        			$("#newPwd").css('border-color','red');
    				$("#userPwd").css('border-color','red');
        		}
    		
    	});
    	});
    </script>
</body>
</html>