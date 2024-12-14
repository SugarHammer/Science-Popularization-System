<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>热门</title>
<link rel="stylesheet" href="../css/sliderx.css">
<link href="../layui-v2.5.7/layui/css/layui.css" rel="stylesheet">
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../layui-v2.5.7/layui/layui.js"></script>
<style>
.item{
	display: flex;
    flex-direction: column;
    width: 100%"
}
</style>
</head>
<body>
<div class="item">
	<div class="control-box">
		<ul>
			<li class="prev"><img src="../images/left_02.png" alt="prev">
			</li>
			<li class="next"><img src="../images/right_02.png" alt="next">
			</li>
		</ul>
		<div class="bigbox">
			<div id="switcher">
				<div class="content_1">
					<div id="box1" class="box">
						<div class="shadow">
							<a href="#">胭脂红蓝地轧道珐琅彩折纸花纹合欢瓶 清</a>
						</div>
					</div>
					<div id="box2" class="box"">
						<div class="shadow">
							<a href="#">光绪款粉彩云蝠纹赏瓶 清</a>
						</div>
					</div>
					<div id="box3" class="box">
						<div class="shadow">
							<a href="#">青花花卉纹双耳四足带盖锅 清</a>
						</div>
					</div>
					<div id="box4" class="box">
						<div class="shadow">
							<a href="#">景德镇窑蓝釉描金朵云折枝莲纹匜 元</a>
						</div>
					</div>
				</div>
				<div class="content_2"></div>
			</div>
		</div>
	</div>
	
	<div style="display: flex;
    justify-content: center;">
	<div  class="visi">
		<div class="itemHeader1">
			<div class="h1" id="date11">2021 / 2 / 3</div>
		</div>
		<div class="itemContent1">

			<div class="h2">今日开馆</div>
			<div class="p">
				除法定节假日，无忧博物院全年实行周一闭馆<strong> 入馆参观需验证健康码，测体温，刷身份证</strong>
			</div>
		</div>

	</div>
	<div class="visi">
		<div class="itemHeader">
			<span>第一资讯</span>
		</div>
		<div class="itemContent">
			<ul style="width: 250px;" id="userTable">
				<li><a id="li1" data-type="0"></a></li>
				<li><a id="li2" data-type="1"></a></li>
				<li><a id="li3" data-type="2"></a></li>
				<li><a id="li4" data-type="3"></a></li>
			</ul>
		</div>

	</div>
	<div class="visi">
		<div class="itemHeader">
			<span>馆内上新</span>
		</div>
		<div class="itemContent">
			<ul style="width: 250px;" id="cu">
				<table id="userTable">
					<tr>
						<li><a id="li5" data-type="0"></a></li>
					</tr>
					<tr>
						<li><a id="li6" data-type="1"></a></li>
					</tr>
					<tr>
						<li><a id="li7" data-type="2"></a></li>
					</tr>
					<tr>
						<li><a id="li8" data-type="3"></a></li>
					</tr>
				</table>
			</ul>
		</div>

	</div>
	</div>
	</div>
	<script type="text/javascript" src="../js/sliderx.js"></script>
	<script type="text/javascript">
    window.onload = function () {
        function getNow(s) {
            return s < 10 ? s : s;
        }

        let myDate = new Date();
        let now = myDate.getFullYear() + '/' + getNow(myDate.getMonth() + 1) + "/" + getNow(myDate.getDate());
        console.log(now);
        $("#date11").text(now);
       
        $.ajax({
            url: "../user/newNotice",
            type:"POST",
            success: function (data) {
            	//console.log(data);
             	$("#li1").text(data[0].title);
            	$("#li2").text(data[1].title);
            	$("#li3").text(data[2].title);		
            	$("#li4").text(data[3].title);
            	
            	$('#userTable a').on('click', function() {
            		
            		var othis = $(this);
            	    var i = othis.data('type');
            		
        			layer.open({
        				type : 1,
        				title : false //不显示标题栏
        				,
        				closeBtn : false,
        				area : '300px;',
        				shade : 0,
        				id : 'LAY_layuipro' //设定一个id，防止重复弹出
        				,
        				btn : '确定',
        				btnAlign : 'c',
        				moveType : 1 //拖拽模式，0或者1
        				,
        				content : '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+data[i].title+'<br><br>'+data[i].content+'<br><br>发布人：'+data[i].publisher+'<br><br>时间：'+data[i].release_time+'</div>',
        				success : function(layero) {
        					var btn = layero.find('.layui-layer-btn');
        				}
        			});
        		});
            }
        });
        $.ajax({
            url: "../user/newCu",
            type:"POST",
            success: function (data) {
            	$("#li5").text(data[0].culturalRelicName);
        		$("#li6").text(data[1].culturalRelicName);
        		$("#li7").text(data[2].culturalRelicName);
            	$("#li8").text(data[3].culturalRelicName);
            	
            	$("#box1 ").css("background-image","url(../img/"+data[0].img+")");
            	$("#box1 a").text(data[0].culturalRelicName);
            	$("#box2 ").css("background-image","url(../img/"+data[1].img+")");
            	$("#box2 a").text(data[1].culturalRelicName);
            	$("#box3 ").css("background-image","url(../img/"+data[2].img+")");
            	$("#box3 a").text(data[2].culturalRelicName);
            	$("#box4 ").css("background-image","url(../img/"+data[3].img+")");
            	$("#box4 a").text(data[3].culturalRelicName);
            	
            	
				$('#cu a').on('click', function() {
            		
            		var othis = $(this);
            	    var i = othis.data('type');
            		
        			layer.open({
        				type : 1,
        				title : false //不显示标题栏
        				,
        				closeBtn : false,
        				area : '400px;',
        				shade : 0,
        				id : 'LAY_layuipro' //设定一个id，防止重复弹出
        				,
        				btn : '确定',
        				btnAlign : 'c',
        				moveType : 1 //拖拽模式，0或者1
        				,
        				content : '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+data[i].culturalRelicName+'<br><br>文物类型：'+data[i].culturalRelicType+'<br><br>文物描述：'+data[i].culturalRelicDescription+'<br><br>时间：'+data[i].culturalRelicTime+'</div>',
        				success : function(layero) {
        					var btn = layero.find('.layui-layer-btn');
        				}
        			});
        		});
        
            }
        });
        
		
    };
</script>
	<script type="text/javascript">
		layui.use('layer', function(obj) {
			let $ = layui.jquery;
			let layer = layui.layer;
			
			  
			

	});
</script>
</body>
</html>