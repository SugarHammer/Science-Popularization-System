<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>历史公告</title>
<link rel="stylesheet" href="../layui-v2.5.7/layui/css/layui.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
    window.onload = function(){	
    	
    	var p = "${requestScope.msg}";
    	if(p =="OK"){
             layer.msg("公告发布成功",{icon:1});
         }
         else if(p == "F"){
             layer.msg("发布失败",{icon:5});
    	}
    }
    </script>
</head>
<body>

	<table class="layui-hide" id="noticeTable" lay-filter="noticeTable"></table>

	<!-- 更改公告页面 -->
	<form class="layui-form" id="editForm" name="editForm" method="post"
		hidden="hidden">
		<div class="layui-form-item"></div>
		<div class="layui-form-item">
			<label class="layui-form-label">公告号</label>
			<div class="layui-input-inline">
				<input type="text" name="id" id="id" placeholder="请输入"
					autocomplete="off" class="layui-input"
					style="background-color: #f2f2f2;">
			</div>
			<div class="layui-form-mid layui-word-aux">不可更改</div>
			<label class="layui-form-label">发布人</label>
			<div class="layui-input-inline">
				<input type="text" name="publisher" id="publisher" readonly
					autocomplete="off" class="layui-input"
					style="background-color: #f2f2f2;">
			</div>
			<div class="layui-form-mid layui-word-aux">不可更改</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input type="text" name="title" id="title" required
					autocomplete="off" class="layui-input">
			</div>
		</div>


		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">公告内容</label>
			<div class="layui-input-block">
				<textarea name="content" id="content" class="layui-textarea"
					style="height: 250px;"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发布时间</label>
			<div class="layui-input-inline">
				<input type="text" name="release_time" id="release_time" readonly
					autocomplete="off" class="layui-input"
					style="background-color: #f2f2f2;">
			</div>
			<div class="layui-form-mid layui-word-aux">不可更改</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
				<a type="button" class="layui-btn layui-btn-primary"
					href="${pageContext.request.contextPath}/jsp/notice.jsp">取消</a>
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
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#noticeTable'
            ,url:'../admin/allNotice'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print']
            ,title: '公告表'
            ,id:'contenttable'
            ,cols: [
            	[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'公告号', width:115,sort: true,fixed: 'left',align:'center'}
                ,{field:'title', title:'公告标题', width:265}
                ,{field:'publisher', title:'发布人', width:124,align:'center'}
                ,{field:'content', title:'公告内容', width:400}             
                ,{field:'release_time', title:'发布时间',width:172,sort: true,align:'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:173}
            ]
            ]
            ,page: true
        });      

        //头工具栏事件
        table.on('toolbar(noticeTable)', function(obj){
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
        table.on('tool(noticeTable)', function(obj){
            var data = obj.data;

            if(obj.event === 'del'){
                layer.confirm('真的删除编号:'+data.id+'的公告么?', function(index){
                	$.post("../admin/deleteNotice",{"id":data.id},
            				function(data){
            	            	if(data =="OK"){           	               
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
            }else if(obj.event === 'detail'){
            	layer.alert('公告号：'+ data.id+'<br>公告标题：'+data.title+'<br>发布人：'+data.publisher+'<br>公告内容：'+data.content+'<br>发布时间：'+data.release_time);            	
            }else if(obj.event === 'edit'){
            	var index = layer.open({
                    type: 1,
                    //area: ['500px', '700px'],
                    title: "更改信息",
                    fixed: false, //不固定
                    maxmin: true,
                    //maxmin: false,
                    shadeClose:false,
                    content: $('#editForm'),
                    shade : 0,
                    success : function(layero, index) {
                    	 layer.iframeAuto(index);
                    	 console.log(data)
                    	 $('#id').val(data.id); 
                    	 $('#title').val(data.title); 
                    	 $('#publisher').val(data.publisher); 
                    	 $('#content').val(data.content); 
                    	 $('#release_time').val(data.release_time); 
                    	  }
                  });
                 layer.full(index);                           
            }
        });
    });
        
</script>

	<script>
	layui.use('form', function(obj){
  	var form = layui.form;
  
  	//监听提交
  	form.on('submit(submit)',function(data,index){
    	//console.log(data);
    	$.post("../admin/updateNotice",data.field,
    			function(re){
            	console.log("data="+re);         	
				if(re=="OK"){
					layer.msg("修改成功",{icon: 1},function(){
						//history.go(0);
						layer.close(index);
					});
				}else{
					layer.msg("修改失败", {icon: 5});
				}
            }); 
  		});
  	});
</script>
</body>
</html>