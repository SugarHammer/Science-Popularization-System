<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/echarts.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
	<div id="main" style="width: 500px; height: 300px;"></div>
	<script type="text/javascript">
    
    $(function(){
    	$.ajax({
    		"url":"../admin/querySex",
    		"type":"POST",
    		"success":function(data){
    			console.log(data);
    			
    			// 基于准备好的dom，初始化echarts实例
    	        var myChart = echarts.init(document.getElementById('main'));

    	        // 指定图表的配置项和数据
    	        var option = {
    	        	    backgroundColor: '#2c343c',

    	        	    title: {
    	        	        text: '用户男女比例',
    	        	        left: 'center',
    	        	        top: 20,
    	        	        textStyle: {
    	        	            color: '#ccc'
    	        	        }
    	        	    },

    	        	    tooltip: {
    	        	        trigger: 'item'
    	        	    },

    	        	    visualMap: {
    	        	        show: false,
    	        	        min: 80,
    	        	        max: 600,
    	        	        inRange: {
    	        	            colorLightness: [0, 1]
    	        	        }
    	        	    },
    	        	    series: [
    	        	        {
    	        	            //name: '访问来源',
    	        	            type: 'pie',
    	        	            radius: '55%',
    	        	            center: ['50%', '50%'],
    	        	            data: data.sort(function (a, b) { return a.value - b.value; }),
    	        	            roseType: 'radius',
    	        	            label: {
    	        	                color: 'rgba(255, 255, 255, 0.3)'
    	        	            },
    	        	            labelLine: {
    	        	                lineStyle: {
    	        	                    color: 'rgba(255, 255, 255, 0.3)'
    	        	                },
    	        	                smooth: 0.2,
    	        	                length: 10,
    	        	                length2: 20
    	        	            },
    	        	            itemStyle: {
    	        	                color: '#c23531',
    	        	                shadowBlur: 200,
    	        	                shadowColor: 'rgba(0, 0, 0, 0.5)'
    	        	            },

    	        	            animationType: 'scale',
    	        	            animationEasing: 'elasticOut',
    	        	            animationDelay: function (idx) {
    	        	                return Math.random() * 200;
    	        	            }
    	        	        }
    	        	    ]
    	        	};

    	        // 使用刚指定的配置项和数据显示图表。
    	        myChart.setOption(option);
    		}
    	});
    	
    })
        
    </script>
</body>
</html>