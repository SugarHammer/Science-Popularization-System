<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发布文物</title>
<link rel="stylesheet" href="../layui-v2.5.7/layui/css/layui.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="../layui-v2.5.7/layui/layui.js" charset="utf-8"></script>

<script type="text/javascript">
    window.onload = function(){	
    	
    	var p = "${requestScope.msg}";
    	if(p =="OK"){
             layer.msg("文物发布成功",{icon:1});
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
    	$("#culturalRelicTime").attr("value",now);
    	
    }
    </script>
</head>
<body>

	<form class="layui-form"
		action="${pageContext.request.contextPath}/admin/culturalRelic">
		<div class="layui-form-item">

			<label class="layui-form-label">文物编号</label>
			<div class="layui-input-inline">
				<input type="text" name="culturalRelicId" lay-verify="required"
					placeholder="请输入文物编号" autocomplete="off" class="layui-input">
			</div>

			<label class="layui-form-label">文物类型</label>
			<div class="layui-input-inline">
				<input type="text" name="culturalRelicType" required
					lay-verify="required" placeholder="请输入文物类型" autocomplete="off"
					class="layui-input">
			</div>

		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">文物名称</label>
			<div class="layui-input-block">
				<input type="text" name="culturalRelicName" lay-verify="required"
					placeholder="请输入文物名称" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">文物描述</label>
			<div class="layui-input-block">
				<textarea name="culturalRelicDescription" placeholder="请输入文物描述"
					class="layui-textarea"
					style="margin-top: 0px; margin-bottom: 0px; height: 200px;"></textarea>
			</div>
		</div>
		<input type="hidden" name="culturalRelicTime" id="culturalRelicTime"
			value="2001-1-1 00:00:00">
		<div class="layui-form-item">
			<div class="layui-upload" style="margin-left: 112px;">
				<button type="button" class="layui-btn" id="test1">上传图片</button>
				<div class="layui-upload-list">
					<img class="layui-upload-img" id="demo1">
					<p id="demoText"></p>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script>
	/* layui.use('form', function(){
  		var form = layui.form;
  
	}); */
	layui.use(['upload','form'], function(){
		var form = layui.form;
		var $ = layui.jquery
		,upload = layui.upload;
		  
		  //普通图片上传
		  var uploadInst = upload.render({
		    elem: '#test1'
		    ,url: '../admin/save'
		    ,before: function(obj){
		      //预读本地文件示例，不支持ie8
		      obj.preview(function(index, file, result){
		        $('#demo1').attr('src', result); //图片链接（base64）
		      });
		    }
		    });
		  });
</script>
</body>
</html>