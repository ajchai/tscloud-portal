<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.dashboard_Statistics {
	width: 49%;
	min-width: 450px;
	height: 230px;
	margin-top: 5px;
	margin-left:0.5%;
	float: left;
	border-bottom: 1px solid #DADADA;
	border-left: 1px solid #DADADA;
	border-right: 1px solid #DADADA;
	border-top: 1px solid #DADADA;
	box-shadow: #DADADA 0px 3px 3px;
	overflow-x:auto;
	overflow-y:hidden;
}

.dashboard_Tenant_Statistics {
	width: 99%;
	height: 230px;
	margin-top: 5px;
	margin-left:0.5%;
	float: left;
	border-bottom: 1px solid #DADADA;
	border-left: 1px solid #DADADA;
	border-right: 1px solid #DADADA;
	border-top: 1px solid #DADADA;
	box-shadow: #DADADA 0px 3px 3px;
}

.k-selectable tr {
	cursor: pointer;
}

.gauge-container {
	position: relative;
	background: url(../../images/dataviz/gauge-container.png) no-repeat;
	background-size: 180px 180px;
	width: 180px;
	height: 180px;
	text-align: center;
	float: left;
	margin-left: 10px;  
	margin-top: 8px;
}

.chartContainer {
	width: 200px;
	height: 180px;
	padding: 0;
	margin-top: 10px;
	margin-left: 10px;
}

#gauge_disk {
	background: url(../../images/dataviz/linear-gauge-container.png);   
	background-size: 100px 180px;
	background-repeat: no-repeat;
	background-position: center;
	width: 100%;
	height: 180px;
	margin-top: 3px;
}

#details {
	padding-bottom: 0px;
}
</style>

<div style="width: 100%; height: 100%; margin: 0px; padding: 0px;">
	<div style="width: 100%; height: 48px; background: #F9F9F9; color: #000; line-height: 48px; border-bottom: 1px solid #DADADA;">
		&nbsp;&nbsp;<font style="color: #0099d7; font-weight: bold">我的仪表盘</font>
	</div>

	<div id="tabstrip" style="height: 91%; width: 99.9%;padding:0px;">
		<ul>
			<li class="k-state-active">个人资源概况</li>
			<li>租户服务概况</li>
			<li>租户配额概况</li>
		</ul>
		<div style="width: 99.5%; height: 91%;padding:0px;">  
			<div style="width: 100%; height: 250px;">     
				<div id="txt" class="dashboard_Statistics">  
					<p style="margin: 0px; padding-left: 1%; width: 99%; height: 30px; border-bottom: 1px solid #DADADA; background: #F9F9F9; line-height: 30px; color: #0099d7; font-size: 14px;">CPU、内存、硬盘实时状态</p>
					<div id="monitor_div" style="width:560px;height: 200px; margin: 0 auto;">
						<div class="gauge-container">
							<div id="gauge_cpu" style="width: 150px; height: 150px; margin: -2px 0 0 15px; font-size: 8px;"></div>
							<font id="cpuUsage" style="color: red; width: 14px; position: absolute; top: 120px; left: 82px; font-size: 12px;"></font>
							<font style="color: #0099d7; position: absolute; top: 140px; left: 68px; font-size: 14px;">CPU(%)</font>
						</div>  
						<div class="gauge-container">
							<div id="gauge_memery" style="width: 150px; height: 150px; margin: -2px 0 0 16px; font-size: 8px;"></div>
							<font id="memoryUsage" style="color: red; position: absolute; width: 14px; top: 120px; left: 85px; font-size: 12px;"></font>
							<font style="color: #0099d7; position: absolute; top: 140px; left: 68px; font-size: 14px;">内存(%)</font>
						</div>
						<div class="gauge-container-disk" style="width: 100px; height: 180px; overflow: hidden; background: none; margin-top: 8px; margin-left: 22px;">
							<div id="gauge_disk"></div>
						</div>
					</div>
				</div>
				<div class="dashboard_Statistics">
					<div class="chart-wrapper" style="width: 100%; height: 100%;">
						<p style="margin: 0px; padding-left: 2%; width: 98%; height: 30px; border-bottom: 1px solid #DADADA; background: #F9F9F9; line-height: 30px; color: #0099d7; font-size: 14px;">我的资源池</p>
						<div id="chart" style="background: url(../../images/dataviz/world-map.png); width: 100%; height: 200px;">
						
						</div>
					</div>
				</div>  
			</div>
			<div style="width: 98.9%; margin-left: 0.5%; height: 50%; overflow-y: auto">
				<div id="serviceInstanceGrid" style="width: 99.8%; height: 99.4%; font-size: 14px;"></div>
			</div>
		</div>
		
		
		<div id="allTenantService" style="width: 99.5%; height: 91%;padding:0px;" >
			<div style="width: 100%; height: 245px;">  
				<div id="txtAll" class="dashboard_Tenant_Statistics">
					<p style="margin: 0px; padding-left: 1%; width: 99%; height: 30px; border-bottom: 1px solid #DADADA; background: #F9F9F9; line-height: 30px; color: #0099d7; font-size: 14px;">租户云主机,块存储服务概况统计</p>
					<div id="monitor_divAll" style="width: 99%; height: 200px;margin:5px 0px 0px 5px">

						<div class="chartContainer">
							<div id="tenant_vm_count" style="width: 200px; height: 180px; font-size: 8px;"></div>
						</div>
						<div class="chartContainer">
							<div id="tenant_st_count" style="width: 200px; height: 180px; font-size: 8px;"></div>
						</div>
						<div class="chartContainer">
							<div id="tenant_vmcpu_count" style="width: 200px; height: 180px; font-size: 8px;"></div>  
						</div>
						<div class="chartContainer">
							<div id="tenant_vmmemory_count" style="width: 200px; height: 180px; font-size: 8px;"></div>
						</div>
						<div class="chartContainer">
							<div id="tenant_stdisk_count" style="width: 200px; height: 180px; font-size: 8px;"></div>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 99%; margin-left: 0.5%; height:45px">
					 <table height="30px" border="0" cellpadding="3" cellspacing="0">
						  <tr>
							<td><span class="k-content">用户:</span></td>
							<td>
								<select id="tenantUserName" size="1" style="font-size:12px;width:180px;" placeholder="请选择"></select>
								
							</td>
							<td><span class="k-content">服务:</span></td>
							<td>
								 <select id="serviceOwner" size="1" style="font-size:12px;width:180px;" placeholder="请选择"></select>
							</td>
							<td>
								<button class="k-button"  style="width:50px" type="submit"  onclick="searchTenantUserService()">查询</button>
							</td>
						  </tr>
					</table>
			</div>
			<div style="width: 99%; margin-left:0.5%; height: 40%; overflow-y: auto">
				 <div id="serviceInstanceGridAll" style="width: 99.8%; font-size: 14px;"></div>
			</div>
		</div>
		
		<div id="allTenantServiceQuota" style="width: 99.5%; height: 91%;padding:0px;" >
			<div style="width: 100%; height: 245px;">  
				<div id="txtAllQuota" class="dashboard_Tenant_Statistics">
					<p style="margin: 0px; padding-left: 1%; width: 99%; height: 30px; border-bottom: 1px solid #DADADA; background: #F9F9F9; line-height: 30px; color: #0099d7; font-size: 14px;">租户云主机,块存储配额概况统计</p>
					<div id="monitor_divAllQuota" style="width: 99%; height: 200px;margin:5px 0px 0px 5px">

						<div class="chartContainer">
							<div id="tenant_vm_countQuota" style="width: 200px; height: 180px; font-size: 8px;"></div>
						</div>
						<div class="chartContainer">
							<div id="tenant_st_countQuota" style="width: 200px; height: 180px; font-size: 8px;"></div>
						</div>
						<div class="chartContainer">
							<div id="tenant_vmcpu_countQuota" style="width: 200px; height: 180px; font-size: 8px;"></div>  
						</div>
						<div class="chartContainer">
							<div id="tenant_vmmemory_countQuota" style="width: 200px; height: 180px; font-size: 8px;"></div>
						</div>
						<div class="chartContainer">
							<div id="tenant_stdisk_countQuota" style="width: 200px; height: 180px; font-size: 8px;"></div>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 99%; margin-left: 0.5%; height:45px">
					 <table height="30px" border="0" cellpadding="3" cellspacing="0">
						  <tr>
							<td><span class="k-content">用户:</span></td>
							<td>
								<select id="tenantUserNameQuota" size="1" style="font-size:12px;width:180px;" placeholder="请选择"></select>
								
							</td>
							<td>
								<button class="k-button"  style="width:50px" type="submit"  onclick="searchTenantUserServiceQuota()">查询</button>
							</td>
						  </tr>
					</table>
			</div>
			<div style="width: 99%; margin-left:0.5%; height: 40%; overflow-y: auto">
				 <div id="serviceInstanceGridAllQuota" style="width: 99.8%; font-size: 14px;"></div>
			</div>
		</div>
	</div>

</div>
<div id="monitorWindow" style="margin: 0px; padding: 0px; overflow: hidden"></div>
<div id="details"></div>
<div id="resInsDetails"></div>
<script type="text/javascript">
	// 设置cpu、内存的div宽度
	var str = $("#txt").css("width");
	if (str.substring(0, str.length - 2) - 560 > 0) {
		$("#monitor_div").css("margin-left",
				"" + (str.substring(0, str.length - 2) - 560) / 2 + "px");
	}

	var str = $("#txtAll").css("width");
	//if (str.substring(0, str.length - 2) - 560 > 0) {
	//	$("#monitor_divAll").css("margin-left",
	//			"" + (str.substring(0, str.length - 2) - 560) / 2 + "px");
	//}
	var allocateIpAll="";
	$(function() {
		// 设置table的切换效果
		$("#tabstrip").kendoTabStrip({
			animation : {
				open : {
					effects : "fadeIn"
				}
			}
		});
		
	    var tabStrip = $("#tabstrip").kendoTabStrip().data("kendoTabStrip");

	    // 判断全局资源是否可以显示出来
	   Core.AjaxRequest({
				url : ws_url + "/rest/serviceInstance/checkAllServiceShow",
				type : "GET",
				async : false,
				callback : function (data) {
					if(data.isTenantMgt == false){
						tabStrip.remove(tabStrip.tabGroup.children("li:eq(2)"));
						tabStrip.remove(tabStrip.tabGroup.children("li:eq(1)"));
					}
			    },
			    failure : function(data) {
					tabStrip.remove(tabStrip.tabGroup.children("li:eq(2)"));
					tabStrip.remove(tabStrip.tabGroup.children("li:eq(1)"));
			    }
			});
	    
		//初始化个人资源管理
		Core.AjaxRequest({
					url : ws_url
							+ "/rest/serviceInstance/serviceInstancelistAndCurrentState",
					params : {
						serviceSid : 100,
					},
					callback : function(data) {
						createGrid(data);
					}
				});
		
		// 初始化服务视图datagrid
		Core.AjaxRequest({
			url : ws_url + "/rest/serviceInstance/getTenantOrderServiceInstancelist",
			callback : function (data) {
	            initDataAllGrid(data.serviceInstanceList);
	            createTenantVm(data.userServiceVmList);
	            createTenantSt(data.userServiceStList);
	            createTenantVmCpu(data.userServiceVmCpuList);
	            createTenantVmMemory(data.userServiceVmMemoryList);
	            createTenantStDisk(data.userServiceStDiskList);
			}
	    });
		
		// 初始化配额视图datagrid
		Core.AjaxRequest({
			url : ws_url + "/rest/serviceInstance/getTenantOrderServiceInstanceQuotalist",
			callback : function (data) {
	            initDataAllGridQuota(data.serviceInstanceList);
	            createTenantVmQuota(data.userServiceVmList);
	            createTenantStQuota(data.userServiceStList);
	            createTenantVmCpuQuota(data.userServiceVmCpuList);
	            createTenantVmMemoryQuota(data.userServiceVmMemoryList);
	            createTenantStDiskQuota(data.userServiceStDiskList);
			}
	    });
		
		// 初始化cpu仪表盘
		createGaugeCpu(0);
		// 初始化内存仪表盘
		createGaugeMemery(0);

		//获取我的资源池信息
		getMyPoolServiceInfo();
		
		createGauges(0);
		
		//初始化租户名称
		Core.AjaxRequest({
			url : ws_url + "/rest/user/findTenantUsers",
			params:{
				
			}, 
			callback : function (data) {
				var dataSource= new kendo.data.DataSource({
					data: data,
					schema: {
						model: { id: "account" }
					}
				});
				dataSource.fetch(function() {
					dataSource.insert(0, { "realName": "全部", "account": "" });
				});
                $("#tenantUserName").kendoDropDownList({
                	    dataTextField: "realName",
                        dataValueField: "account",
                        placeholder: "请选择...",
                        dataSource:dataSource,
                        index: 0
                });
                $("#tenantUserNameQuota").kendoDropDownList({
            	    dataTextField: "realName",
                    dataValueField: "account",
                    placeholder: "请选择...",
                    dataSource:dataSource,
                    index: 0
            });
            } 
       });
		//初始化所属服务
		Core.AjaxRequest({
			url : ws_url + "/rest/service/findAll",
			params:{
				"canOrder" : "1",
				"serviceStatus" :"03"
			}, 
			callback : function (data) {
				var dataSource= new kendo.data.DataSource({
					data: data,
					schema: {
						model: { id: "serviceSid" }
					}
				});
				dataSource.fetch(function() {
					dataSource.insert(0, { "serviceName": "全部", "serviceSid": "" });
				});
                $("#serviceOwner").kendoDropDownList({
                	    dataTextField: "serviceName",
                        dataValueField: "serviceSid",
                        placeholder: "请选择...",
                        dataSource:dataSource,
                        index: 0
                });
            } 
       });
	});

	// 创建图表
	function createChart(data) {
		$("#chart").kendoChart({
			title : {
				text : ""
			},
			legend : {
				position : "bottom"
			},
			chartArea : {
				background : ""
			},
			seriesDefaults : {
				type : "column"
			},
			series : data,
			valueAxis : {
				max : 30,
				line : {
					visible : false
				},
				axisCrossingValue : 0
			},
			categoryAxis : {
				categories : [ "历史申请服务", "当前有效服务" ],
				line : {
					visible : false
				}
			},
			tooltip : {
				visible : true,
				format : "{0}%",
				//		                    template: "#= series.name #: #= value #"
				template : "服务数量: #= value #"
			}
		});
	}
	$(document).ready(createChart);
	$(document).bind("kendo:skinChange", createChart);

	function createGauges(value) {

		$("#gauge_disk").kendoLinearGauge({
			pointer : {
				value : value,
				color : "#007BC3",
				size : 30
			},

			scale : {
				majorUnit : 20,
				minorUnit : 2,
				min : 0,
				max : 100,
				vertical : true,
				ranges : [ {
					from : 0,
					to : 50,
					color : "#489815"
				}, {
					from : 50,
					to : 80,
					color : "#ffc700"
				}, {
					from : 80,
					to : 100,
					color : "#c20000"
				} ]
			}
		});
	}

	$(document).bind("kendo:skinChange", function(e) {
		createGauges();
	});

	//创建grid
	function createGrid(data) {
		$("#serviceInstanceGrid").kendoGrid(
						{
							dataSource : {
								data : data,
								pageSize : 10
							},
							sortable : true,
							pageable : true,
							selectable : "row",
							scrollable : false,
							columns : [
									{
										field : "instanceName",
										title : "服务器名称",
										wdith : 200
									},
									{
										field : "statusName",
										title : "服务状态",
										width : 30
									},
									{
										field : "resInsVmStatusName",
										title : "主机状态",
										width : 30
									},
									{
										field : "osTypeName",
										title : "操作系统"
									},
									{
										field : "healthStatus",
										title : "健康状态",
										width : "72px",
										template : function(dataItem) {
											if (dataItem.resInsVmStatus == "02") {
												return "<img width='20',height='20'; style='margin-top:5px'src='/tscloud-portal/images/console/green.png'/>";
											} else {
												return "<img width='20',height='20'; style='margin-top:5px' src='/tscloud-portal/images/console/silver.png'/>";
											}
										},
										attributes : {
											style : "text-align: center;"
										}
									}, {
										field : "billingTypeName",
										title : "计费类型",
										width : 20
									}, {
										field : "dredgeDate",
										title : "开通时间",
										width : 160
									}, {
										field : "expiringDate",
										title : "到期时间",
										width : 160
									}, {
										command : [ {
											text : "详情",
											click : showDetails
										}, {
											text : "状态",
											click : showMonitorDetails
										} ],
										title : "操作",
										width : 189
									} ],
							change : function(e) {
								var selectedRow = this.select();
								var dataItem = this.dataItem(selectedRow);
								getCurrentNodeMonitorInfo(
										dataItem.monitorNodeId,
										dataItem.resInstanceSid,
										dataItem.allocateIp);

							}
						});
	}
	
	//初始化全局服务视图grid
	function initDataAllGrid(data){
		$("#serviceInstanceGridAll").kendoGrid({
			dataSource : {
				data : data,
				pageSize : 5
			},
			sortable: true,
			pageable:true,
			columns: [ 
			       {field: "tenantName",title: "所属租户"} ,
			       {field: "ownerName",title: "租户名称"} ,
			       {field: "instanceSid",title: "服务实例"} ,
			       {field: "serviceName",title: "开通服务"} ,
		           {field: "statusName",title: "开通状态"} , 
		           {field: "billingTypeName",title: "计费类型"} ,
		           {field: "dredgeDate",title: "开通时间"} ,
		           {field: "expiringDate",title: "到期时间"} ,
		           {field: "",title: "操作",
		        	   template : function(dataItem) {
							if (dataItem.serviceSid == 100) {
								
								var instanceSid = dataItem.instanceSid;
								var resInstanceSid = dataItem.resInstanceSid;
								allocateIpAll = dataItem.allocateIp;
								var operation = '<button class="k-button"  style="width:50px" type="submit" onclick="showAllDetails('+instanceSid+','+ resInstanceSid+')">详情</button>'
								return operation;
							} else {
								return '';
							}
						}
		           }
			 ]
	    });
	}
	
	//初始化全局配额视图grid
	function initDataAllGridQuota(data){
		$("#serviceInstanceGridAllQuota").kendoGrid({
			dataSource : {
				data : data,
				pageSize : 5
			},
			sortable: true,
			pageable:true,
			columns: [ 
			       {field: "tenantName",title: "所属租户"} ,
			       {field: "ownerName",title: "租户名称"} ,
			       {field: "userServiceVmNum",title: "云主机(个)"} ,
			       {field: "userServiceStNum",title: "块存储(个)"} ,
		           {field: "userServiceCpuNum",title: "虚拟内核(核)"} , 
		           {field: "userServiceMemoryNum",title: "内存(MB)"} ,
		           {field: "userServiceStdiskNum",title: "磁盘(GB)"}
			 ]
	    });
	}
	
	//获取当前节点监控信息
	function getCurrentNodeMonitorInfo(monitorNodeId, resInstanceSid,
			allocateIp) {

		//获取当前节点监控信息
		Core.AjaxRequest({
			url : ws_url + "/rest/resourceMonitor/getCurrentNodeInfo?nodeId="
					+ monitorNodeId + "&resInstanceSid=" + resInstanceSid
					+ "&allocateIp=" + allocateIp,
			type : "get",
			callback : function(data) {
				if (data.cpuUsage != "NaN") {
					createGaugeCpu(Math.round(data.cpuUsage));
					createGaugeMemery(Math.round(data.memUsage));
					createGauges(Math.round(data.diskUsage));
				} else {
					createGaugeCpu(0);
					createGaugeMemery(0);
				}

			},
			failure : function(data) {
				createGaugeCpu(0);
				createGaugeMemery(0);
			}
		});

	}

	//获取我的资源池信息
	function getMyPoolServiceInfo() {
		Core.AjaxRequest({
			url : ws_url + "/rest/resourceMonitor/getMyPoolServiceInfo",
			type : "get",
			callback : function(data) {
				createChart(data);
			}
		});
	}

	// 服务实例详情
	function showAllDetails(instanceSid,resInstanceSid) {
		//服务实例详情Window
		var detailsWindow = $("#details")
				.kendoWindow(
						{
							title : "服务器详情",
							modal : true,
							visible : false,
							resizable : false,
							content : ctx
									+ "/pages/console/vm/vm-index-detail.jsp?instanceSid="
									+ instanceSid + "&resInstanceSid="
									+ resInstanceSid + "&allocateIp="
									+ allocateIpAll,
							width : 950,
							height : 523
						}).data("kendoWindow");
		detailsWindow.center().open();
	}
	
	// 服务实例详情
	function showDetails(e) {
		var dataItem = this.dataItem($(e.currentTarget).closest("tr"));

		//服务实例详情Window
		var detailsWindow = $("#details")
				.kendoWindow(
						{
							title : "服务器详情",
							modal : true,
							visible : false,
							resizable : false,
							content : ctx
									+ "/pages/console/vm/vm-index-detail.jsp?monitorNodeId="
									+ dataItem.monitorNodeId + "&instanceSid="
									+ dataItem.instanceSid + "&resInstanceSid="
									+ dataItem.resInstanceSid + "&allocateIp="
									+ dataItem.allocateIp,
							width : 950,
							height : 523
						}).data("kendoWindow");
		detailsWindow.center().open();
	}

	// 服务实例监控
	function showMonitorDetails(e) {
		var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
		var monitor = $("#monitorWindow").kendoWindow(
				{
					title : "云主机监控信息",
					modal : true,
					visible : false,
					iframe : true,
					resizable : false,
					width : 900,
					height : 485,
					content : ctx
							+ "/pages/console/vm/vm-monitor.jsp?monitorNodeId="
							+ dataItem.monitorNodeId + "&instanceSid="
							+ dataItem.instanceSid + "&resInstanceSid="
							+ dataItem.resInstanceSid + "&allocateIp="
							+ dataItem.allocateIp
				}).data("kendoWindow");
		monitor.center().open();
	}

	// 创建圆形监控图
	// cpu
	function createGaugeCpu(value) {
		$("#gauge_cpu").kendoRadialGauge({
			pointer : {
				value : value
			},
			scale : {
				minorUnit : 5,
				startAngle : -30,
				endAngle : 210,
				max : 100,
				labels : {
					position : "inside"
				},
				ranges : [ {
					from : 0,
					to : 50,
					color : "#489815"
				}, {
					from : 50,
					to : 80,
					color : "#ff7a00"
				}, {
					from : 80,
					to : 100,
					color : "#c20000"
				} ]
			}
		});
		$("#cpuUsage").html(value);
	}
	// 内存
	function createGaugeMemery(value) {
		$("#gauge_memery").kendoRadialGauge({
			pointer : {
				value : value
			},
			scale : {
				minorUnit : 5,
				startAngle : -30,
				endAngle : 210,
				max : 100,
				labels : {
					position : "inside"
				},
				ranges : [ {
					from : 0,
					to : 50,
					color : "#489815"
				}, {
					from : 50,
					to : 80,
					color : "#ff7a00"
				}, {
					from : 80,
					to : 100,
					color : "#c20000"
				} ]
			}
		});
		$("#memoryUsage").html(value);
	}
	
	// 查询租户用户所有服务
	function searchTenantUserService(){
		Core.AjaxRequest({
			url : ws_url + "/rest/serviceInstance/getTenantOrderServiceInstancelist",
			params : {
				"ownerId": ($("#tenantUserName").val() =="")? null : $("#tenantUserName").val(),
				"serviceSid": ($("#serviceOwner").val() == "") ? null : $("#serviceOwner").val()
			},
			callback : function (data) {
				 initDataAllGrid(data.serviceInstanceList);
			}
	   });
	}
	
	// 查询租户用户所有服务配额
	function searchTenantUserServiceQuota(){
		Core.AjaxRequest({
			url : ws_url + "/rest/serviceInstance/getTenantOrderServiceInstanceQuotalist",
			params : {
				"ownerId": ($("#tenantUserNameQuota").val() =="")? null : $("#tenantUserNameQuota").val(),
			},
			callback : function (data) {
				initDataAllGridQuota(data.serviceInstanceList);
			}
	   });
	}
	
	// 创建服务视图租户云主机数饼图
	function createTenantVm(data) {
		$("#tenant_vm_count").kendoChart({
            title: {
                position: "top",
                text: "云主机服务数"
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {
                labels: {
                    visible: false,
                    background: "transparent",
                    template: "#= category #: #= value#"
                }
            },
            dataSource: {
                data: data
            },
            series: [{
                type: "pie",
                field: "userServiceNum",
                categoryField: "ownerName",
                explodeField: "explode"
            }],
            tooltip: {
                visible: true,
                format: "{0}个"
            }
        });
		
	}
	
	// 创建服务视图租户块存储数饼图
	function createTenantSt(data) {
		$("#tenant_st_count").kendoChart({
            title: {
                position: "top",
                text: "块存储服务数"
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {
                labels: {
                    visible: false,
                    background: "transparent",
                    template: "#= category #: #= value#"
                }
            },
            dataSource: {
                data: data
            },
            series: [{
                type: "pie",
                field: "userServiceNum",
                categoryField: "ownerName",
                explodeField: "explode"
            }],
            tooltip: {
                visible: true,
                format: "{0}个"
            }
        });
		
	}
	
	// 创建服务视图租户云主机CPU图
	function createTenantVmCpu(data) {
		$("#tenant_vmcpu_count").kendoChart({
            title: {
                position: "top",
                text: "虚拟内核"
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {
                labels: {
                    visible: false,
                    background: "transparent",
                    template: "#= category #: #= value#"
                }
            },
            dataSource: {
                data: data
            },
            series: [{
                type: "pie",
                field: "userServiceNum",
                categoryField: "ownerName",
                explodeField: "explode"
            }],
            tooltip: {
                visible: true,
                format: "{0}核"
            }
        });
		
	}
	
	// 创建服务视图租户云主机内存
	function createTenantVmMemory(data) {
		$("#tenant_vmmemory_count").kendoChart({
            title: {
                position: "top",
                text: "内存"
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {
                labels: {
                    visible: false,
                    background: "transparent",
                    template: "#= category #: #= value#"
                }
            },
            dataSource: {
                data: data
            },
            series: [{
                type: "pie",
                field: "userServiceNum",
                categoryField: "ownerName",
                explodeField: "explode"
            }],
            tooltip: {
                visible: true,
                format: "{0}MB"
            }
        });
		
	}
	
	// 创建服务视图租户块存储磁盘大小数饼图
	function createTenantStDisk(data) {
		$("#tenant_stdisk_count").kendoChart({
            title: {
                position: "top",
                text: "磁盘"
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {
                labels: {
                    visible: false,
                    background: "transparent",
                    template: "#= category #: #= value#"
                }
            },
            dataSource: {
                data: data
            },
            series: [{
                type: "pie",
                field: "userServiceNum",
                categoryField: "ownerName",
                explodeField: "explode"
            }],
            tooltip: {
                visible: true,
                format: "{0}GB"
            }
        });
		
	}
	
	
	
	// 创建配额视图租户云主机数饼图
	function createTenantVmQuota(data) {
		$("#tenant_vm_countQuota").kendoChart({
            title: {
                position: "top",
                text: "云主机配额"
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {
                labels: {
                    visible: false,
                    background: "transparent",
                    template: "#= category #: #= value#"
                }
            },
            dataSource: {
                data: data
            },
            series: [{
                type: "pie",
                field: "percentage",
                categoryField: "source",
                explodeField: "explode"
            }],
            tooltip: {
                visible: true,
                format: "{0}个"
            }
        });
		
	}
	
	// 创建配额视图租户块存储数饼图
	function createTenantStQuota(data) {
		$("#tenant_st_countQuota").kendoChart({
            title: {
                position: "top",
                text: "块存储配额"
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {
                labels: {
                    visible: false,
                    background: "transparent",
                    template: "#= category #: #= value#"
                }
            },
            dataSource: {
                data: data
            },
            series: [{
                type: "pie",
                field: "percentage",
                categoryField: "source",
                explodeField: "explode"
            }],
            tooltip: {
                visible: true,
                format: "{0}个"
            }
        });
		
	}
	
	// 创建配额视图租户云主机CPU图
	function createTenantVmCpuQuota(data) {
		$("#tenant_vmcpu_countQuota").kendoChart({
            title: {
                position: "top",
                text: "虚拟内核配额"
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {
                labels: {
                    visible: false,
                    background: "transparent",
                    template: "#= category #: #= value#"
                }
            },
            dataSource: {
                data: data
            },
            series: [{
                type: "pie",
                field: "percentage",
                categoryField: "source",
                explodeField: "explode"
            }],
            tooltip: {
                visible: true,
                format: "{0}核"
            }
        });
		
	}
	
	// 创建配额视图租户云主机内存
	function createTenantVmMemoryQuota(data) {
		$("#tenant_vmmemory_countQuota").kendoChart({
            title: {
                position: "top",
                text: "内存配额"
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {
                labels: {
                    visible: false,
                    background: "transparent",
                    template: "#= category #: #= value#"
                }
            },
            dataSource: {
                data: data
            },
            series: [{
                type: "pie",
                field: "percentage",
                categoryField: "source",
                explodeField: "explode"
            }],
            tooltip: {
                visible: true,
                format: "{0}MB"
            }
        });
		
	}
	
	// 创建配额视图租户块存储磁盘大小数饼图
	function createTenantStDiskQuota(data) {
		$("#tenant_stdisk_countQuota").kendoChart({
            title: {
                position: "top",
                text: "磁盘配额"
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {
                labels: {
                    visible: false,
                    background: "transparent",
                    template: "#= category #: #= value#"
                }
            },
            dataSource: {
                data: data
            },
            series: [{
                type: "pie",
                field: "percentage",
                categoryField: "source",
                explodeField: "explode"
            }],
            tooltip: {
                visible: true,
                format: "{0}GB"
            }
        });
		
	}
	
</script>