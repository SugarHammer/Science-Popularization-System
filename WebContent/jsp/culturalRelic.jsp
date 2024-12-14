<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>文物一览</title>
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
    }
    </script>
</head>
<body>

	<div class="layui-form-item">
		<div class="layui-input-inline">
			<input type="text" id="culturalRelicName" name="culturalRelicName"
				class="layui-input" placeholder="请输入要查询的文物名称" autocomplete="off">
		</div>
		<button class="layui-btn layui-btn-md layui-btn-normal" lay-submit
			lay-filter="cultural">查询</button>
	</div>

	<table class="layui-hide" id="culturalRelic" lay-filter="culturalRelic"></table>

	<form class="layui-form" id="editForm" name="editForm" method="post"
		hidden="hidden">
		<div class="layui-form-item"></div>

		<div class="layui-form-item">
			<label class="layui-form-label">文物编号</label>
			<div class="layui-input-inline">
				<input type="text" name="culturalRelicId" id="culturalRelicId"
					readonly autocomplete="off" class="layui-input"
					style="background-color: #f2f2f2;">
			</div>
			<div class="layui-form-mid layui-word-aux">不可更改</div>

			<label class="layui-form-label">发布时间</label>
			<div class="layui-input-inline">
				<input type="text" name="culturalRelicTime" id="culturalRelicTime"
					readonly autocomplete="off" class="layui-input"
					style="background-color: #f2f2f2;">
			</div>
			<div class="layui-form-mid layui-word-aux">不可更改</div>
		</div>

		<div class="layui-form-item">

			<label class="layui-form-label">文物名称</label>
			<div class="layui-input-inline">
				<input type="text" name="culturalRelicName" id="culturalRelicName"
					autocomplete="off" class="layui-input">
			</div>

			<label class="layui-form-label">文物类型</label>
			<div class="layui-input-inline">
				<input type="text" name="culturalRelicType" id="culturalRelicType"
					autocomplete="off" class="layui-input">
			</div>

		</div>

		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">文物描述</label>
			<div class="layui-input-block">
				<textarea name="culturalRelicDescription"
					id="culturalRelicDescription" class="layui-textarea"
					style="height: 250px;"></textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit
					lay-filter="submitCulturalRelic">立即提交</button>
				<a type="button" class="layui-btn layui-btn-primary"
					href="${pageContext.request.contextPath}/jsp/culturalRelic.jsp">取消</a>
			</div>
		</div>
	</form>



	<script src="../layui-v2.5.7/layui/layui.js" charset="utf-8"></script>
	<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

	<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

	<script>
    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;

        table.render({
            elem: '#culturalRelic'
            ,url:'../admin/allCulturalRelic'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print']
            ,title: '用户数据表'
            ,id:'contenttable'
            ,cols: [
            	[
                {type: 'checkbox', fixed: 'left'}         
                ,{field:'culturalRelicId', title:'文物编号', width:153,fixed: 'left',align:'center',sort: true}
                ,{field:'culturalRelicName', title:'文物名称', width:170}
                ,{field:'culturalRelicType', title:'文物类型', width:146,sort: true}
                ,{field:'culturalRelicDescription', title:'文物描述', width:282}
                ,{field:'culturalRelicTime', title:'发布时间', width:170,sort: true}
                ,{field:'culturalRelicNumber', title:'被收藏量',width:112,sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:216}
            ]
            ]
            ,page: true
        });

        form.on('submit(cultural)', function(data){
            var field = data.field;   //得到搜索栏的所有的值
            var culturalRelicName=$("#culturalRelicName").val();
            console.log(culturalRelicName);
            //执行重载
            table.reload('contenttable', {
                where: {culturalRelicName:culturalRelicName}     //传给后台数据并重载
            });
        });

        //头工具栏事件
        table.on('toolbar(culturalRelic)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;	
            };                     
        });
        
        //监听行工具事件
        table.on('tool(culturalRelic)', function(obj){
            var data = obj.data;

            if(obj.event === 'del'){
                layer.confirm('真的删除'+data.culturalRelicName+'么？', function(index){
                	$.post("../admin/deleteCulturalRelic",{"culturalRelicId":data.culturalRelicId},
            				function(data){
            	            	if(data =="OK"){
            	                	//alert("删除成功！");
            	                	 obj.del();
            	                	 layer.close(index);
                                     console.log(index);
                                     layer.msg("删除成功",{icon:1});
                                 }
                                 else{
                                     layer.msg("删除失败",{icon:5});
                                
            	            	}
            	        	});
                	
                    layer.close(index);         
                });
            } else if(obj.event === 'detail'){
            	layer.alert('文物编号：'+ data.culturalRelicId+'<br>文物名称：'+data.culturalRelicName+'<br>文物类型：'+data.culturalRelicType+'<br>文物描述：'+data.culturalRelicDescription+'<br>发布时间：'+data.culturalRelicTime+'<br>被收藏量：'+data.culturalRelicNumber);
            }else if(obj.event === 'edit'){
            	var index = layer.open({
                    type: 1,
                    //area: ['500px', '700px'],
                    title: "更改文物信息",
                    fixed: false, //不固定
                    maxmin: true,
                    //maxmin: false,
                    shadeClose:false,
                    content: $('#editForm'),
                    shade : 0,
                    success : function(layero, index) {
                    	 layer.iframeAuto(index);
                    	 console.log(data)
                    	 $('#culturalRelicId').val(data.culturalRelicId);
                    	 $('#culturalRelicName').val(data.culturalRelicName); 
                    	 $('#culturalRelicType').val(data.culturalRelicType); 
                    	 $('#culturalRelicDescription').val(data.culturalRelicDescription); 
                    	 $('#culturalRelicTime').val(data.culturalRelicTime); 
                    	 $('#culturalRelicNumber').val(data.culturalRelicNumber); 
                    	  }
                  });
                 layer.full(index);                           
            }
        });
    });
</script>
	<script>
		layui.use('form', function(obj) {
			var form = layui.form;

			//监听提交
			form.on('submit(submitCulturalRelic)', function(data, index) {

				$.post("../admin/updateCulturalRelic", data.field, 
						function(re) {
						if (re == "OK") {
							layer.msg("修改成功", {icon : 1}, function() {
								layer.close(index);
						});
					} else {
						layer.msg("修改失败", {icon : 5});
					}
					
				});
			});
		});
	</script>

</body>