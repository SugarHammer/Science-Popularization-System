<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
.layui-table-view .layui-table {
    position: relative;
    width: 100% !important;
    margin: 0;
}
</style>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>lay</title>
<link rel="stylesheet" href="../layui-v2.5.7/layui/css/layui.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>

	<div class="layui-form-item">
		<div class="layui-input-inline">
			<input type="text" id="userName" name="userName" class="layui-input"
				placeholder="请输入要查询的用户名" autocomplete="off">
		</div>
		<button class="layui-btn layui-btn-md layui-btn-normal" lay-submit
			lay-filter="LAY-user-front-search">查询</button>
	</div>

	<table class="layui-hide" id="userTable" lay-filter="userTable"></table>


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
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

	<script>
    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;

        table.render({
            elem: '#userTable'
            ,url:'../admin/allUser'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print']
            ,title: '用户数据表'
            ,id:'contenttable'
            ,cols: [
            	[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'userName', title:'用户名', width:150}
                ,{field:'userPwd', title:'密码', width:150}
                ,{field:'userSex', title:'性别', width:80}
                ,{field:'userPhone', title:'电话', width:200}
                ,{field:'userEmail', title:'邮箱',width:200}
                ,{field:'creation', title:'创建时间',width:250,sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]
            ]
            ,page: true
        });

        form.on('submit(LAY-user-front-search)', function(data){
            var field = data.field;   //得到搜索栏的所有的值
            var userName=$("#userName").val();
            console.log(userName);
            //执行重载
            table.reload('contenttable', {
                where: {userName:userName}     //传给后台数据并重载
            });
        });

        //头工具栏事件
        table.on('toolbar(userTable)', function(obj){
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
        table.on('tool(userTable)', function(obj){
            var data = obj.data;

            if(obj.event === 'del'){
                layer.confirm('真的删除'+data.userName+'么？', function(index){
                	$.post("../admin/deleteUser",{"userName":data.userName},
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
            	layer.alert('用户名：'+ data.userName+'<br>密码：'+data.userPwd+'<br>性别：'+data.userSex+'<br>电话：'+data.userPhone+'<br>邮箱：'+data.userEmail+'<br>创建时间：'+data.creation);
            }
        });
    });
</script>


</body>