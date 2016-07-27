<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<script src="${ctx}/script/highcharts/highcharts.js"></script>
<script src="${ctx}/script/highcharts/modules/exporting.js"></script>
<script src="${ctx}/script/anychart/AnyChart.js"></script>
<% 
	String monitorNodeId = request.getParameter("monitorNodeId");
	String instanceSid = request.getParameter("instanceSid");
	String resInstanceSid = request.getParameter("resInstanceSid");
	String allocateIp = request.getParameter("allocateIp");
%>
	<style type="text/css">
		body{
			width:99.5%;
			height:99%;
			margin:0px;
			padding:0px;
		}
		.basicInfo {
			width:100%;
		}
		.basic {
		    position:relative;
			width:48%;
			height:200px;
			margin-left:1.2%;
			margin-top:10px;
			border:1px solid gray;
			border-bottom: 1px solid #DADADA;
			border-left: 1px solid #DADADA; 
			border-right: 1px solid #DADADA;
			border-top: 1px solid #DADADA; 
			box-shadow: #DADADA 0px 3px 3px;
			float:left;
		}
		.basic_search {
			height:245px;
		}
		.basic h2{
		        position:relative;
				width:98%;
				height:30px;
				border-bottom:1px solid #DADADA;
				background:#F9F9F9;
				margin:0px;
				padding:0px;
				font-size:14px;
				padding-left:2%;
				line-height:30px;
				color:#0099d7;
		}
		.basic dd{
			font-size:14px;
		}
		.gauge-container{
			position:relative;
			background:url(${ctx}/images/dataviz/gauge-container2.png) no-repeat;
            width: 150px;
            height: 150px;
            text-align: center;
            margin-left:10px;
            float:left;
			margin-top:8px;
	   }
	   
	   #chartContainer {
			width: 160px;
			height: 230px;
			padding: 0;
			margin-top: -40px;
			margin-left: -25px;
		
		}
		#gauge_disk{
 			background:url(../../../images/dataviz/linear-gauge-container.png); 
 			background-size:80px 150px; 
 			background-repeat:no-repeat; 
 			background-position:center; 
			width:100%; 
			height:150px;
			margin-top: 3px;
	    }
	</style> 
	</head>
	<body>
	       	<div class="basicInfo" style="height:210px;">
	       			<div class="basic"> 
	       					<h2>基本信息</h2>  
	       					<div style="position:absolute;left:10px;top:42px;width:100px;height:145px;margin:0px;">
								 	<img src="${ctx}/images/index/hp_server.gif" ></img> 
							</div>
	       					<div style="width:300px;height:145px;margin:0px;position:absolute;left:110px;top:42px;">
	       					    <table width="100%" height="100%"  style="font-size:14px;"  cellpadding="5" cellspacing="0">
	       					    		<tr>
	       					    				<td align="right">主机名:</td> 
	       					    				<td><font id="instanceName"></font></td>
	       					    		</tr>
	       					    		<tr>
	       					    				<td align="right">CPU:</td>
	       					    				<td><font id="cpu"></font></td>
	       					    		</tr>
	       					    		<tr>
	       					    				<td align="right">内存:</td>
	       					    				<td><font id="memory"></font></td>
	       					    		</tr>
	       					    		<tr>
	       					    				<td align="right">硬盘:</td>
	       					    				<td><font id="disk"></font></td>
	       					    		</tr>
	       					    		<tr>
	       					    				<td align="right">操作系统:</td>
	       					    				<td><font id="os"></font></td>
	       					    		</tr>
	       					    </table>
							</div>
	       			</div>
	       			<div class="basic">
	       					<h2>CPU、内存、硬盘实时状态<img src="${ctx}/images/console/refresh.png" style="position:absolute;right:10px;top:8px;cursor:pointer" width="12px"  height="12px" onclick="getCurrentNodeMonitorInfo()"></img></h2>
	       					<div class="gauge-container">
				                <div id="gauge_cpu" style="width:120px;height:120px;margin:2px 0 0  15px;font-size:8px;"></div>
				                <font id="cpuUsage" style="color:red;width:14px;position:absolute;top:100px;left:68px;font-size:10px;text-align: center;"></font>
              					<font style="color:#0099d7;position:absolute;top:115px;left:55px;font-size:12px;">CPU(%)</font>
				            </div>
				            <div class="gauge-container">
				                <div id="gauge_memery" style="width:120px;height:120px;margin:2px 0 0  15px;font-size:8px;"></div>
				                <font id="memoryUsage" style="color:red;width:14px;position:absolute;top:100px;left:70px;font-size:10px;"></font>
              					<font style="color:#0099d7;position:absolute;top:115px;left:55px;font-size:12px;">内存(%)</font>
				            </div>
				             <div class="gauge-container" style="width:100px;height:150px;background:none;margin-top:8px;margin-left:0px;"> 
								<div id="gauge_disk"></div> 
 							</div> 
	       			</div>
	       	</div>
	       	<div  class="basicInfo" style="height:260px;">
	       			<div class="basic  basic_search">
       						<h2>CPU使用趋势<img src="${ctx}/images/console/refresh.png" style="position:absolute;right:10px;top:8px;cursor:pointer" width="12px"  height="12px" onclick="getCurrentNodeCpuInfo()"></img></h2> 
	       					<div class="chart-wrapper" style="width:100%;height:180px;">
			 					<div id="chart_cpu" style="width:100%;height:100%;"></div>
			 				</div> 
	       			</div>
	       			<div class="basic  basic_search">
	       					<h2>内存使用趋势<img src="${ctx}/images/console/refresh.png" style="position:absolute;right:10px;top:8px;cursor:pointer" width="12px"  height="12px" onclick="getCurrentNodeMemoryInfo()"></img></h2>
<!-- 	       					<div style="width:100%;height:30px;border:1px solid lime"> -->
	       							
<!-- 	       					</div> -->
	       					<div class="chart-wrapper" style="width:100%;height:180px;">
			 					<div id="chart_memory" style="background:url(../../images/dataviz/world-map.png);width:100%;height:100%;"></div>
			 				</div> 
	       			</div>
	       	</div>
	</body>
	<script type="text/javascript">
		var monitorNodeId = '<%=monitorNodeId %>';
		var instanceSid = '<%=instanceSid %>';
		var resInstanceSid = '<%=resInstanceSid %>';
		var allocateIp = '<%=allocateIp %>';
		
		
		//根据传入参数毫秒数获得当前时区时间
		function timeAtCurrntTimeZone(dateMillis){
			var currentDate = new Date(dateMillis);
			 return Date.UTC(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate(),currentDate.getHours(),currentDate.getMinutes(), currentDate.getSeconds())
		}
		
		
		//获取当前节点监控信息
		function getCurrentNodeMonitorInfo(){
			
			//获取当前节点监控信息
			Core.AjaxRequest({
				url : ws_url+ "/rest/resourceMonitor/getCurrentNodeInfo?nodeId="+monitorNodeId+"&resInstanceSid="+resInstanceSid+"&allocateIp="+allocateIp,
				type : "get",
				callback : function(data) {
					 createGaugeCpu(Math.round(data.cpuUsage));
					 createGaugeMemery(Math.round(data.memUsage));
					 createGauges(Math.round(data.diskUsage));
				}
			});
		}
		
		//取得当前节点CPU监控信息
		function getCurrentNodeCpuInfo(){
// 			//获取当前节点CPU信息
			Core.AjaxRequest({
				url : ws_url+ "/rest/resourceMonitor/getCurrentNodeCpuInfo?nodeId="+monitorNodeId+"&resInstanceSid="+resInstanceSid+"&allocateIp="+allocateIp,
				type : "get",
				callback : function(data) {
					var utcDate=timeAtCurrntTimeZone(data.startTime);
					createCpuLineCharts(utcDate, data.peridData);
				}
			});
		}
		//取得当前节点MEMORY监控信息
		function getCurrentNodeMemoryInfo(){
			//获取当前节点Memory信息
			Core.AjaxRequest({
				url : ws_url+ "/rest/resourceMonitor/getCurrentNodeMemoryInfo?nodeId="+monitorNodeId+"&resInstanceSid="+resInstanceSid+"&allocateIp="+allocateIp,
				type : "get",
				callback : function(data) {
					var utcDate=timeAtCurrntTimeZone(data.startTime);
					createMemoryLineCharts(utcDate,data.peridData,data.totalMem);
				}
			});
		}
		
		$(function(){
			
			createGaugeCpu(0);
			createGaugeMemery(0);
			createGauges(0);
			createCpuLineCharts(new Date(),0);
			createMemoryLineCharts(new Date(),0,1000);
			getCurrentNodeMonitorInfo();
			getCurrentNodeCpuInfo();
			getCurrentNodeMemoryInfo();
			getServiceInstanceInfo(instanceSid);
		});
	    
       // 创建圆形监控图
       // cpu
       function createGaugeCpu(value) {
                  $("#gauge_cpu").kendoRadialGauge({
                      pointer: {
                          value: value
                      },
                      scale: {
                          minorUnit: 5,
                          startAngle: -30,
                          endAngle: 210,
                          max: 100,
                          labels: {
                              position: "inside"
                          },
                          ranges: [
                              {
                               from: 0,
                               to: 50,
                               color: "#489815"
                           }, {
                               from: 50,
                               to: 80,
                               color: "#ff7a00"
                           }, {
                               from: 80,
                               to: 100,
                               color: "#c20000"
                           }
                          ]
                      }
                  });
                  $("#cpuUsage").html(value);
      }
       // 内存
       function createGaugeMemery(value) {
           $("#gauge_memery").kendoRadialGauge({
               pointer: {
                   value: value
               },
               scale: {
                   minorUnit: 5,
                   startAngle: -30,
                   endAngle: 210, 
                   max: 100,
                   labels: {
                       position: "inside"
                   },
                   ranges: [
                       {
                               from: 0,
                               to: 50,
                               color: "#489815"
                           }, {
                               from: 50,
                               to: 80,
                               color: "#ff7a00"
                           }, {
                               from: 80,
                               to: 100,
                               color: "#c20000"
                           }
                   ]
               }
           });
           $("#memoryUsage").html(value);
       }
       //硬盘
       function createGauges(value) {

           $("#gauge_disk").kendoLinearGauge({
               pointer: {
                   value: value,
                   color: "#007BC3",
                   size:10
               },

               scale: {
                   majorUnit: 25,
                   minorUnit: 2,
                   min: 0,
                   max: 100,
                   vertical: true,
                   ranges: [
                       {
                           from: 0,
                           to: 50,
                           color: "#489815"
                       }, {
                           from: 50,
                           to: 80,
                           color: "#ffc700"
                       }, {
                           from: 80,
                           to: 100,
                           color: "#c20000"
                       }
                   ]
               }
           });
       }

           $(document).bind("kendo:skinChange", function(e) {
               createGauges();
           });
    /***********************实时监控图***************************/
    		// cpu使用率
    		function createCpuLineCharts(utcDate,peridData){
		        $('#chart_cpu').highcharts({
		            chart: {
		                zoomType: 'x',
		                spacingRight: 20
		            },
		            title: {
		                text: ''
		            },
		            subtitle: {
		                text: '（单击图表拖动进行放大）',
						style : {
							color: '#666666',
							fontFamily : '微软雅黑'
						}
		            },
		            xAxis: {
	                    type: 'datetime',
	                    dateTimeLabelFormats: {
	                        day: '%m-%d'
	                    },
	                    style: {
	                        fontFamily : '微软雅黑'
	                    },
		                minRange : 1800 * 1000,
		                maxZoom: 7 * 24 * 3600 * 1000, // fourteen days
		                title: {
		                    text: ""
		                }
		            },
		            yAxis: {
		                title: {
		                    text: '使用率(%)',
			                style: {
		                		fontSize : '12px',
		                		fontWeight : 'bold',
								fontFamily : '微软雅黑'
			                }
		                },
		                min: 0,
		                max:100
		            },
		            tooltip: {
		                shared: true
		            },
		            credits:{ 
	                    enabled:false
	                },
		            exporting:{ 
	                    enabled:false
	                },
		            legend: {
		                enabled: false
		            },
		            plotOptions: {
		                area: {
	                       tooltip: {
	                            xDateFormat: '%Y-%m-%d %H:%M',
	                            valueDecimals: 0,
	                            valueSuffix: '%'
	                        },
		                    fillColor: {
		                        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
		                        stops: [
		                            [0, Highcharts.getOptions().colors[0]],
		                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
		                        ]
		                    },
		                    lineWidth: 1,
		                    marker: {
		                        enabled: false
		                    },
		                    shadow: false,
		                    states: {
		                        hover: {
		                            lineWidth: 1
		                        }
		                    },
		                    threshold: null
		                }
		            },
		    
		            series: [{
		                type: 'area',
		                name: '使用率',
		                pointInterval: 300 * 1000,
		                pointStart: utcDate,
		                data:peridData
		            }]
		        });
    };

        // 内存使用率
          function createMemoryLineCharts(utcDate,peridData,totalMem){
	        $('#chart_memory').highcharts({
	            chart: {
	                zoomType: 'x',
	                spacingRight: 20
	            },
	            title: {
	                text: ''
	            },
	            subtitle: {
	                text: '（单击图表拖动进行放大）',
					style : {
						color: '#666666',
						fontFamily : '微软雅黑'
					}
	            },
	            xAxis: {
                    type: 'datetime',
                    dateTimeLabelFormats: {
                        day: '%m-%d'
                    },
                    style: {
                        fontFamily : '微软雅黑'
                    },
	                minRange : 1800 * 1000,
	                maxZoom: 7 * 24 * 3600 * 1000, // fourteen days
	                title: {
	                    text: ""
	                }
	            },
	            yAxis: {
	                title: {
	                    text: '已用内存（MB）',
		                style: {
	                		fontSize : '12px',
	                		fontWeight : 'bold',
							fontFamily : '微软雅黑'
		                }
	                },
	                min: 0,
	                max:totalMem
	            },
	            tooltip: {
	                shared: true
	            },
	            credits:{ 
                    enabled:false
                },
	            exporting:{ 
                    enabled:false
                },
	            legend: {
	                enabled: false
	            },
	            plotOptions: {
	                area: {
                       tooltip: {
                            xDateFormat: '%Y-%m-%d %H:%M',
                            valueDecimals: 0,
                            valueSuffix: 'MB'
                        },
	                    fillColor: {
	                        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
	                        stops: [
	                            [0, Highcharts.getOptions().colors[0]],
	                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
	                        ]
	                    },
	                    lineWidth: 1,
	                    marker: {
	                        enabled: false
	                    },
	                    shadow: false,
	                    states: {
	                        hover: {
	                            lineWidth: 1
	                        }
	                    },
	                    threshold: null
	                }
	            },
	    
	            series: [{
	                type: 'area',
	                name: '已用内存',
	                pointInterval: 300 * 1000,
	                pointStart: utcDate,
	                data: peridData
	            }]
	        });
    };
        
     //获取服务实例基本信息
   	function getServiceInstanceInfo(instanceSid) {
   		Core.AjaxRequest({
   			url : ws_url + "/rest/resourceInstance/" + instanceSid,
   			type : "get",
   			callback : function(data) {
   				$("#instanceName").html(data.resInstanceName);  
   				$("#cpu").html(data.cpuCores + "核");
   				$("#memory").html(data.memorySize +"MB");
   				if(data.dataDisk == null || data.dataDisk == 0){
   					$("#disk").html("无");
   				}else{
   					$("#disk").html(data.dataDisk +"GB");
   				}
   				$("#os").html(data.osTypeName);
   			}	
   		});
   		
   		
   	}
	</script> 
</html>