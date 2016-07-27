<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style type="text/css">
		#introduce {
			width: 100%;
			height: 100px;
			border-bottom: 1px solid #DADADA;
			border-left: 1px solid #DADADA;
			border-right: 1px solid #DADADA;
			border-top: 1px solid #DADADA;
			box-shadow: #DADADA 0px 3px 3px;
		}
		
		#introduce h3 {
			margin: 0px;
			padding: 15px;
			color: #1F90CA;
			font-weight: 400;
		}
		
		#introduce p {
			margin: 0px;
			font-size: 14px;
			padding-left: 15px;
		}
		
		.viewTable {
			width: 100%;
		}
		
		.viewTable .leftTd {
			text-align: right;
		/* 	width: 18%; */
		}
		
		.k-grid-toolbar {
		margin:0px;
		padding-left:0px;
		padding-right:0px;
		width:100%;
		}
		.k-menu.k-header,.k-menu .k-item {
			border: 0px ;
		}
		
		.k-state-default {
			margin-left: 1px;
			background-color: #474544 !important;
			color : #fff;
		}
		
		.k-state-disabled .k-link  {
			margin-left: 1px;
			background-color: #999 !important;
		}
	</style>
	<div style="width: 100%; height: 99.9%; margin: 0px; padding: 0px;">
		<div style="width:100%;height:48px;background:#F9F9F9;color:#000; line-height:48px;border-bottom:1px solid #DADADA">
			&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">云主机控制台</font></div>
		<div style="width:99%;margin: 5px 0.5% 5px 0.5%; height: 91%;">
			<div id="introduce">
				<h3>云主机</h3>
				<p>惠普云平台为您提供一种随时获取的、弹性的计算能力，这种计算能力的体现就是云主机服务。云主机就是一台配置好了的服务器，它有您期望的硬件配置、操作系统和网络配置。通常情况下，您的请求可以很短的时间之内完成，所以您完全可以动态地、按需使用计算能力。</p>
			</div>
			<div id="serviceInstanceGrid" style="height: 80%; width: 100%; margin-top: 5px; font-size: 14px;"></div>
		</div>
	</div>
	<div id="details"></div>
	<div id="resInsDetails"></div>
	<div id="modifyResInsVmName"></div>
	<div  id="monitorWindow"  style="margin:0px;padding:0px;overflow:hidden"></div>
	<div  id="snapshotWindow"  style="margin:0px;padding:0px;overflow:hidden"></div>
	<div  id="snapshotAddWindow"  style="margin:0px;padding:0px;overflow:hidden"></div>
	<div  id="versionControl"  style="margin:0px;padding:0px;overflow:hidden"></div>
	<div  id="reconfigVm"  style="margin:0px;padding:0px;overflow:hidden"></div>
	<div  id="deployApplication"  style="margin:0px;padding:0px;overflow:hidden"></div>
	<div  id="vmImageWindow"  style="margin:0px;padding:0px;overflow:hidden"></div>
	<script type="text/x-kendo-template" id="template">
		<div class="toolbar">
			<ul id="menu-images"></ul>
		</div>
    </script>
	<script id="name-template" type="text/x-kendo-template">
 		<input type="checkbox" name="checkboxName" value="#: instanceSid #" onClick="onCheckboxClick(this)"/>
	</script>
	<script type="text/javascript">
		// 服务实例公网ip地址
		var ipAddr = ""; 
	
		$(function() {
			getGridData();
		});

		//创建grid
		function createGrid(data) {
			$("#serviceInstanceGrid").kendoGrid({
				dataSource : {
					data : data,
					pageSize : 10
				},
				sortable : true,
				pageable : true,
				selectable : "multiple",
				scrollable : false,
				columns : [
// 				           {
// 					template:kendo.template($("#name-template").html()),
// 				    width:20,
// 				    attributes: {
// 				        style: "text-align: center;"
// 				      }
// 				}, 
				{
					field : "instanceName",
					title : "云主机名称"
				}, {
					field : "statusName",
					title : "服务状态"
				}, {
					field : "resInsVmStatusName",
					title : "主机状态"
				}, {
					field : "osTypeName",
					title : "操作系统"
				}, {
					field : "healthStatus",
					title : "健康状态",
					width:"72px",
					template: function(dataItem) {
							if(dataItem.resInsVmStatus=="02"){
								 return "<img width='20',height='20'; style='margin-top:5px'src='/tscloud-portal/images/console/green.png'/>";
							}else{
								 return "<img width='20',height='20'; style='margin-top:5px' src='/tscloud-portal/images/console/silver.png'/>";
							}
					    },
					    attributes: {
					        style: "text-align: center;"
					      }
				}, {
					field : "billingTypeName",
					title : "计费类型"
				}, {
					field : "dredgeDate",
					title : "开通时间",
					width : 160
				}, {
					field : "expiringDate",
					title : "到期时间",
					width : 160
				}, {
					command :[{
						text : "详情",
						click : showDetails
					},{
						text : "状态",
						click : showMonitorDetails
					}],
					title : "操作",
					width : 189
				} ],
				toolbar : kendo.template($("#template").html()),
				change : function(e) {
					var selectedRows = this.select();
					var dataItem = this.dataItem(selectedRows);

					//根据主机实例状态控制menu
					setMenuByStatus(dataItem);
				}
			});
			//grid 操作菜单
			$("#menu-images").kendoMenu(
					{
						dataSource : [ {
							text : "刷新",
							imageUrl : ctx + "/images/console/refresh2.png"
						}, {
							text : "启动",
							imageUrl : ctx + "/images/console/button/start.png"
						}, {
							text : "关机",
							imageUrl : ctx + "/images/console/button/shutdown.png"
						}, {
							text : "重启",
							imageUrl : ctx + "/images/console/button/repeat.png"
						}, {
							text : "暂停",
							imageUrl : ctx + "/images/console/button/pause.png"
						},{
							text : "修改",
							imageUrl : ctx + "/images/console/button/edit.png"
						},{
							text : "备份", 
							imageUrl : ctx + "/images/console/button/backup.png"
						},{
							text : "恢复",
							imageUrl : ctx + "/images/console/button/undo.png"
						},{
							text : "更多操作...",
							items : [{
								text : "重置",
								imageUrl : ctx + "/images/console/update.png"
							},{
								text : "调整配置",
								imageUrl : ctx + "/images/console/button/save.png"
							},{
								text : "调整租期",
								imageUrl : ctx + "/images/console/button/timer.png"
							},
// 							{
// 								text : "部署应用",
// 								imageUrl : ctx + "/images/console/button/software.png"
// 							},
							{
								text : "制作成新映像",
								imageUrl : ctx + "/images/console/button/burn.png"
							},{
								text : "加载防火墙规则",
								imageUrl : ctx + "/images/console/button/firewall.png"
							},{
								text : "找回密码",
								imageUrl : ctx + "/images/console/button/findpasswd.png",
								width : "100"
							},{
								text : "退订",
								imageUrl : ctx + "/images/console/trash.png",
								width : "100"
							}]
						} ],
						select : function(e) {
							var operation = $(e.item).children(".k-link").text();
							var rowData = getTableItemSid();
							if (operation == "刷新") {
								getGridData();
							}
							if (operation == "退订") {
								Core.confirm({
									message : "确认退订该云主机吗？",
									confirmCallback : function() {
										releaseServiceInstance(rowData.instanceSid);
									}
								});
							} else if (operation == "启动") {
								Core.confirm({
									message : "确认启动该云主机吗？",
									confirmCallback : function() {
										operationServiceInstance("start",
												rowData.instanceSid);
									}
								});
							} else if (operation == "关机") {
								Core.confirm({
									message : "确认关闭该云主机吗？",
									confirmCallback : function() {
										operationServiceInstance("stop",
												rowData.instanceSid);
									}
								});
							} else if (operation == "重启") {
								Core.confirm({
									message : "确认重启该云主机吗？",
									confirmCallback : function() {
										operationServiceInstance("restart",
												rowData.instanceSid);
									}
								});

							}else if (operation == "暂停") {
								Core.confirm({
									message : "确认暂停该云主机吗？",
									confirmCallback : function() {
										operationServiceInstance("suspend",
												rowData.instanceSid);
									}
								});

							}else if (operation == "修改") {
								modifyResInsVMName(rowData.instanceSid,rowData.resInstanceSid);
							}else if (operation == "备份") {
								createSnapshotWindows(rowData.resInstanceSid);
							}else if (operation == "恢复") {
								snapshotWindows(rowData.resInstanceSid);
							}else if (operation == "制作成新映像") {
								cloneTemplate(rowData.resInstanceSid);
							}else if(operation == "重置"){
								resetVm(rowData.resInstanceSid);
							}else if(operation == "调整配置"){
								reconfigVmWindows(rowData.resInstanceSid);
							}else if(operation == "部署应用"){
// 								deployApplication(rowData.instanceSid);
							}else if(operation == "找回密码"){
								findPassword(rowData.serviceSid,rowData.instanceName,rowData.allocateInstanceId,rowData.osTypeName,rowData.tenantName,rowData.ownerName);
							}
						}
					});
		}

		// 服务实例监控
		function showMonitorDetails(e){
			var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
			var monitor = $("#monitorWindow").kendoWindow({
	             title: "云主机监控信息",
	             modal: true,
	             visible: false,
	             iframe:true,
	             resizable: false, 
	             width:900,
	             height:480,
	             content:ctx+"/pages/console/vm/vm-monitor.jsp?monitorNodeId="+dataItem.monitorNodeId+"&instanceSid="
	            		 +dataItem.instanceSid+"&resInstanceSid="+dataItem.resInstanceSid+"&allocateIp="+dataItem.allocateIp
	         }).data("kendoWindow");
			monitor.center().open();
		}
		
		//获取列表选择项Sid
		function getTableItemSid() {
			var grid = $("#serviceInstanceGrid").data("kendoGrid");
			var row = grid.select();
			var data = grid.dataItem(row);
			return data;
		}

		//服务实例详情
		function showDetails(e) {
			var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
			//服务实例详情Window
			var detailsWindow = $("#details").kendoWindow({
				title : "云主机详情",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/vm/vm-index-detail.jsp?monitorNodeId="+dataItem.monitorNodeId+"&instanceSid="
       		 +dataItem.instanceSid+"&resInstanceSid="+dataItem.resInstanceSid+"&allocateIp="+dataItem.allocateIp,
				width :950,
				height:523

			}).data("kendoWindow");
			detailsWindow.center().open();
		}
		
		
		//调用北向接口操作服务实例
		function operationServiceInstance(action, instanceSid) {
			Core.AjaxRequest({
						url : ws_url+ "/rest/serviceInstance/serviceInstanceOperation",
						params : {
							serviceInstanceSid : instanceSid,
							action : action
						},
						callback : function(data) {
							//刷新列表
							getGridData();
						}
					});
		};

		//调用北向接口销毁服务实例
		function releaseServiceInstance(instanceSid) {
			Core.AjaxRequest({
				url : ws_url + "/rest/serviceInstance/release/" + instanceSid,
				type : "get",
				callback : function(data) {
					//刷新列表
					getGridData();
				}
			});

		};

		//获取列表数据
		function getGridData() {
			//北向接口取得服务实例数据
			Core.AjaxRequest({
				url : ws_url + "/rest/serviceInstance/serviceInstancelistAndCurrentState",
				params : {
					serviceSid : 100,
				},
				callback : function(data) {
					createGrid(data);

					//初始化menu
					initMenu();
				}
			});
		}
		//取得Menu中的Item
		var getItem = function(target) {
			var itemIndexes = target.split(/[.,]/), item = $("#menu-images")
					.data("kendoMenu").element;

			if (itemIndexes[0] !== "") {
				for ( var i = 0, len = itemIndexes.length; i < len; i++) {
					item = item.children("li").eq(itemIndexes[i]);
					if (i < len - 1) {
						item = item.find("ul:first");
					}
				}
			}

			return item;
		};

		//初始化menu
		function initMenu() {
			getItem("0").find("img").attr("src","/tscloud-portal/images/console/refresh2_enable.png");
			$("#menu-images").data("kendoMenu").enable(getItem("1"), false);
			getItem("1").find("img").attr("src","/tscloud-portal/images/console/button/start.png");
			$("#menu-images").data("kendoMenu").enable(getItem("2"), false);
			getItem("2").find("img").attr("src","/tscloud-portal/images/console/button/shutdown.png");
			$("#menu-images").data("kendoMenu").enable(getItem("3"), false);
			getItem("3").find("img").attr("src","/tscloud-portal/images/console/button/repeat.png");
			$("#menu-images").data("kendoMenu").enable(getItem("4"), false);
			getItem("4").find("img").attr("src","/tscloud-portal/images/console/button/pause.png");
			$("#menu-images").data("kendoMenu").enable(getItem("5"), false);
			getItem("5").find("img").attr("src","/tscloud-portal/images/console/button/edit.png");
			$("#menu-images").data("kendoMenu").enable(getItem("6"),false);
			getItem("6").find("img").attr("src","/tscloud-portal/images/console/button/backup.png");
			$("#menu-images").data("kendoMenu").enable(getItem("7"),false);
			getItem("7").find("img").attr("src","/tscloud-portal/images/console/button/undo.png");
// 			$("#menu-images").data("kendoMenu").enable(getItem("7"),false);
// 			getItem("7").find("img").attr("src","/tscloud-portal/images/console/hdd.png");
			$("#menu-images").data("kendoMenu").enable(getItem("8"),false);
			$("#menu-images").data("kendoMenu").enable(getItem("8.0"),false);
			getItem("8.0").find("img").attr("src","/tscloud-portal/images/console/update.png");
			$("#menu-images").data("kendoMenu").enable(getItem("8.1"),false);
			getItem("8.1").find("img").attr("src","/tscloud-portal/images/console/button/save.png");
			$("#menu-images").data("kendoMenu").enable(getItem("8.2"),false);
			getItem("8.2").find("img").attr("src","/tscloud-portal/images/console/button/timer.png");
// 			$("#menu-images").data("kendoMenu").enable(getItem("7.3"),false);
// 			getItem("7.3").find("img").attr("src","/tscloud-portal/images/console/button/software.png");
			
			$("#menu-images").data("kendoMenu").enable(getItem("8.3"),false);
			getItem("8.3").find("img").attr("src","/tscloud-portal/images/console/button/burn.png");
			$("#menu-images").data("kendoMenu").enable(getItem("8.4"),false);
			getItem("8.4").find("img").attr("src","/tscloud-portal/images/console/button/firewall.png");
			$("#menu-images").data("kendoMenu").enable(getItem("8.5"),false);
			getItem("8.5").find("img").attr("src","/tscloud-portal/images/console/button/findpasswd.png");
			$("#menu-images").data("kendoMenu").enable(getItem("8.6"),false);
			getItem("8.6").find("img").attr("src","/tscloud-portal/images/console/trash.png");
		};

		//根据主机资源实例状态控制menu
		function setMenuByStatus(dataItem) {
			
			if (dataItem.resInsVmStatus == "00"
					|| dataItem.resInsVmStatus == "01"
					|| dataItem.resInsVmStatus == "99") {
				initMenu();
			} else if (dataItem.resInsVmStatus == "02") {
				$("#menu-images").data("kendoMenu").enable(getItem("1"), false);
				getItem("1").find("img").attr("src","/tscloud-portal/images/console/button/start.png");
				$("#menu-images").data("kendoMenu").enable(getItem("2"), true);
				getItem("2").find("img").attr("src","/tscloud-portal/images/console/button/shutdown_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("3"), true);
				getItem("3").find("img").attr("src","/tscloud-portal/images/console/button/repeat_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("4"), true);
				getItem("4").find("img").attr("src","/tscloud-portal/images/console/button/pause_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("5"), true);
				getItem("5").find("img").attr("src","/tscloud-portal/images/console/button/edit_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("6"),true);
				getItem("6").find("img").attr("src","/tscloud-portal/images/console/button/backup_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("7"), true);
				getItem("7").find("img").attr("src","/tscloud-portal/images/console/button/undo_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8"), true);
				$("#menu-images").data("kendoMenu").enable(getItem("8.0"),false);
				getItem("8.0").find("img").attr("src","/tscloud-portal/images/console/update.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8.1"),true);
				getItem("8.1").find("img").attr("src","/tscloud-portal/images/console/button/save_enable.png");
// 				$("#menu-images").data("kendoMenu").enable(getItem("7.3"),true);
// 				getItem("7.3").find("img").attr("src","/tscloud-portal/images/console/button/software_enable.png");
				
				$("#menu-images").data("kendoMenu").enable(getItem("8.3"),false);
				getItem("8.3").find("img").attr("src","/tscloud-portal/images/console/button/burn_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8.5"),true);
				getItem("8.5").find("img").attr("src","/tscloud-portal/images/console/button/findpasswd_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8.6"),true);
				getItem("8.6").find("img").attr("src","/tscloud-portal/images/console/trash_enable.png");
			} else if (dataItem.resInsVmStatus == "03") {
				$("#menu-images").data("kendoMenu").enable(getItem("1"), true);
				getItem("1").find("img").attr("src","/tscloud-portal/images/console/button/start_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("2"), false);
				getItem("2").find("img").attr("src","/tscloud-portal/images/console/button/shutdown.png");
				$("#menu-images").data("kendoMenu").enable(getItem("3"), false);
				getItem("3").find("img").attr("src","/tscloud-portal/images/console/button/repeat.png");
				$("#menu-images").data("kendoMenu").enable(getItem("4"), false);
				getItem("4").find("img").attr("src","/tscloud-portal/images/console/button/pause.png");
				$("#menu-images").data("kendoMenu").enable(getItem("5"), true);
				getItem("5").find("img").attr("src","/tscloud-portal/images/console/button/edit_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("6"),true);
				getItem("6").find("img").attr("src","/tscloud-portal/images/console/button/backup_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("7"), true);
				getItem("7").find("img").attr("src","/tscloud-portal/images/console/button/undo_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8"), true);
				$("#menu-images").data("kendoMenu").enable(getItem("8.0"),false);
				getItem("8.0").find("img").attr("src","/tscloud-portal/images/console/update.png");
				
				$("#menu-images").data("kendoMenu").enable(getItem("8.1"),true);
				getItem("8.1").find("img").attr("src","/tscloud-portal/images/console/button/save_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8.3"),false);
				getItem("8.3").find("img").attr("src","/tscloud-portal/images/console/button/burn_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8.5"),true);
				getItem("8.5").find("img").attr("src","/tscloud-portal/images/console/button/findpasswd_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8.6"),true);
				getItem("8.6").find("img").attr("src","/tscloud-portal/images/console/trash_enable.png");
				
			} else if (dataItem.resInsVmStatus == "04") {
				$("#menu-images").data("kendoMenu").enable(getItem("1"), true);
				getItem("1").find("img").attr("src","/tscloud-portal/images/console/button/start_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("2"), true);
				getItem("2").find("img").attr("src","/tscloud-portal/images/console/button/shutdown_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("3"), false);
				getItem("3").find("img").attr("src","/tscloud-portal/images/console/button/repeat.png");
				$("#menu-images").data("kendoMenu").enable(getItem("4"), false);
				getItem("4").find("img").attr("src","/tscloud-portal/images/console/button/pause.png");
				$("#menu-images").data("kendoMenu").enable(getItem("5"), true);
				getItem("5").find("img").attr("src","/tscloud-portal/images/console/button/edit_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("6"),true);
				getItem("6").find("img").attr("src","/tscloud-portal/images/console/button/backup_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("7"), true);
				getItem("7").find("img").attr("src","/tscloud-portal/images/console/button/undo_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8"), true);
				$("#menu-images").data("kendoMenu").enable(getItem("8.0"),false);
				getItem("8.0").find("img").attr("src","/tscloud-portal/images/console/update.png");
				
				$("#menu-images").data("kendoMenu").enable(getItem("8.1"),false);
				getItem("8.1").find("img").attr("src","/tscloud-portal/images/console/button/save.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8.3"),false);
				getItem("8.3").find("img").attr("src","/tscloud-portal/images/console/button/burn_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8.5"),true);
				getItem("8.5").find("img").attr("src","/tscloud-portal/images/console/button/findpasswd_enable.png");
				$("#menu-images").data("kendoMenu").enable(getItem("8.6"),true);
				getItem("8.6").find("img").attr("src","/tscloud-portal/images/console/trash_enable.png");
			}
		}
		
		// 修改服务器名称
		function modifyResInsVMName(instanceSid,resInstanceSid){
			
			//修改资源实例名称Window
			var modifyNameWindow = $("#modifyResInsVmName").kendoWindow({
				title : "编辑云主机信息",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/vm/vm-name-modify.jsp?instanceSid="+instanceSid+"&resInstanceSid="+resInstanceSid,
				width :500,
				height:185

			}).data("kendoWindow");
			modifyNameWindow.center().open();
			
		}
		
		// 部署应用
		function deployApplication(instanceSid){
			
			//修改资源实例名称Window
			var modifyNameWindow = $("#deployApplication").kendoWindow({
				title : "部署应用",
				modal : true,
				visible : false,
				resizable : false,
				iframe : true,
				content : ctx + "/pages/console/vm/vm-deploy-application.jsp?instanceSid="+instanceSid,
				width :500,
				height:135

			}).data("kendoWindow");
			modifyNameWindow.center().open();
			
		}
		
		// 备份
		function createSnapshotWindows(instanceSid){
			
			//修改资源实例名称Window
			var modifyNameWindow = $("#snapshotAddWindow").kendoWindow({
				title : "云主机备份",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/vm/vm-snapshot-add.jsp?instanceSid="+instanceSid,
				width :555,
				height:181

			}).data("kendoWindow");
			modifyNameWindow.center().open();
			
		}
		
		//snapshot列表页面
		function snapshotWindows(resInstanceSid) {
			//snapshot列表Window
			var detailsWindow = $("#snapshotWindow").kendoWindow({
				title : "云主机备份列表",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/vm/vm-snapshot-index.jsp?&resInstanceSid="+resInstanceSid,
				width :700,
				height:300

			}).data("kendoWindow");
			detailsWindow.center().open();
		}
		
		//制作成新镜像
		function cloneTemplate(resInstanceSid){
			//snapshot列表Window
			var detailsWindow = $("#vmImageWindow").kendoWindow({
				title : "创建新镜像",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/vm/vm-image-add.jsp?&resInstanceSid="+resInstanceSid,
				width :500,
				height:126

			}).data("kendoWindow");
			detailsWindow.center().open();
			
		}
		
		//重置虚机
		function resetVm(resInstanceSid){
			//北向接口取得服务实例数据
			Core.AjaxRequest({
				url : ws_url + "/rest/resourceInstance/resetVm?resourceInstanceSid="+resInstanceSid,
				type:"get",
				callback : function(data) {
					Core.alert({
						title:"提示",
						message:"重置成功！",
						confirmCallback:function(){
						}
					});
				},
				failure:function(data){
					Core.alert({title:"提示",message:"重置失败!"});
				}
			});
		}
		
		// 应用版本部署
		function versionOfAppDeployment(instanceSid){
			// 得到服务实例的的公网ip地址
			Core.AjaxRequest({
   				url : ws_url + "/rest/resourceInstance/" + instanceSid,
   				type : "get",
   				callback : function(data) {
   					ipAddr = data.ip;
   				}
   			});
			var verWindow = $("#versionControl").kendoWindow({
				 title: "应用版本部署",
			        modal: true,
			        visible: false,
			        iframe:false,
			        resizable: false,
			        width: "400px",
					height: "300px",
					content: "vm/select-version-control.jsp"   
			    }).data("kendoWindow");
				verWindow.center().open(); 
		}
		
		//重新配置虚机
		function reconfigVmWindows(resInstanceSid) {
			//重新配置虚机Window
			var detailsWindow = $("#reconfigVm").kendoWindow({
				title : "调整配置",
				modal : true,
				visible : false,
				iframe:true,
				resizable : false,
				content : ctx + "/pages/console/vm/vm-edit.jsp?&resInstanceSid="+resInstanceSid,
				width :450,
				height:190

			}).data("kendoWindow");
			detailsWindow.center().open();
		}
		
		//找回密码
		function findPassword(serviceSid,instanceName,allocateInstanceId,osTypeName,tenantName,ownerName) {
			Core.AjaxRequest({
				url : ws_url + "/rest/ticket/addTicket",  
				type : "post",
				params : {
					serviceSid : serviceSid,           
					title : "云主机密码找回",                  
					content : "云主机名称："+instanceName+
								"、云主机编号："+allocateInstanceId+
								"、操作系统："+osTypeName+
								"、所属租户："+tenantName+
								"、所有者："+ownerName,          
					questionType : "03",    
					questionLevel : "03"
				},
				callback : function(data) {
					Core.alert({
						title:"提示",
						message : "云主机密码找回工单已提交成功，请在工单中查看处理进度！",
					});
				},
				failure : function(data) {
					Core.alert({
						message : "对不起，新增工单失败！",
					});
				}
			});

		}
</script>