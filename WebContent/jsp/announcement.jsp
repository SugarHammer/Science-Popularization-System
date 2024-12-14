<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发公告</title>
<link rel="stylesheet" href="../layui-v2.5.7/layui/css/layui.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="../layui-v2.5.7/layui/layui.js" charset="utf-8"></script>

<script type="text/javascript">
    window.onload = function(){	
    	
    	var p = "${requestScope.msg}";
    	if(p =="OK"){
             layer.msg("公告发布成功",{icon:1});
         }
         else if(p == "F"){
             layer.msg("发布失败",{icon:5});
    	}
    	
    	function getNow(s) {
        	return s < 10 ? '0' + s: s;
    	}
    	var myDate = new Date();
    	//获取当前年
    	var year=myDate.getFullYear();
    	//获取当前月
    	var month=myDate.getMonth()+1;
    	//获取当前日
   	 	var date=myDate.getDate(); 
    	var h=myDate.getHours();       //获取当前小时数(0-23)
    	var m=myDate.getMinutes();     //获取当前分钟数(0-59)
    	var s=myDate.getSeconds();  

    	var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
    	$("#creation").attr("value",now);
    	//document.getElementById('name').value= now;
    	
    }
    </script>
</head>
<body>

	<form class="layui-form"
		action="${pageContext.request.contextPath}/admin/notice">
		<div class="layui-form-item">
			<label class="layui-form-label">公告号</label>
			<div class="layui-input-inline">
				<input type="text" name="id" lay-verify="required" placeholder="请输入"
					autocomplete="off" class="layui-input" value="WY2021">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input type="text" name="title" required lay-verify="required"
					placeholder="请输入标题" autocomplete="off" class="layui-input">
			</div>
		</div>
		<input type="hidden" name="publisher" id="name"
			value="<%=session.getAttribute("name")%>">
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">公告内容</label>
			<div class="layui-input-block">
				<textarea name="content" placeholder="请输入公告内容"
					class="layui-textarea"
					style="margin-top: 0px; margin-bottom: 0px; height: 370px;"></textarea>
			</div>
		</div>
		<input type="hidden" name="release_time" id="creation"
			value="2001-1-1 00:00:00">
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<script>
	layui.use('form', function(){
  		var form = layui.form;
	});
</script>
</body>
</html>