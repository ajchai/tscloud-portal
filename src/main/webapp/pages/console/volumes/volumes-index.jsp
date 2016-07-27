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
		.k-menu.k-header.k-menu .k-item {
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
			&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">块存储服务</font></div>
		<div style="width:99%;margin: 5px 0.5% 5px 0.5%; height: 91%;">
			<div id="introduce">
				<h3>块存储</h3>
				<p>块存储是专为云主机设计的数据持久存储服务，用户可在块存储上驻留自己的文件系统，或者直接作为卷设备使用。</p>
			</div>
			<div id="serviceInstanceGrid" style="height: 79%; width: 100%; margin-top: 5px; font-size: 14px;"></div>
		</div>
	</div>
	<div id="modifyResInsVmName"></div>
	<div id="loadVolumeHost" style="padding:0px;margin:0px;overflow:hidden;"></div>
	<div id="expansionVolumeHost"></div>
	<script type="text/x-kendo-template" id="template">
		<div class="toolbar">
			<ul id="menu-images"></ul>
		</div>
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
					pageSize : 9
				},
				sortable : true,
				pageable : true,
				selectable : "multiple",
				scrollable : false,
				columns : [
				{
					field : "resInstanceName",
					title : "名称"
				}, {
					field : "volumeTypeName",
					title : "类型"
				}, {
					field : "allocateDiskSize",
					title : "容量(GB)"
				}, {
					field : "resVmInsName",
					title : "应用主机"
				}, {
					field : "statusName",
					title : "状态"
				}, {
					field : "dredgeDate",
					title : "开通时间",
					width : 160
				}, {
					field : "expiringDate",
					title : "到期时间",
					width : 160
				}
// 				, {
// 					command :[{
// 						text : "详情",
// 						click : showDetails
// 					}],
// 					title : "操作",
// 					width : 189
// 				} 
				
				],
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
							text : "修改",
							imageUrl : ctx + "/images/console/button/edit_enable.png"
						}, {
							text : "加载到主机",
							imageUrl : ctx + "/images/console/earth_enable.png"
							
						},{
							text : "卸载硬盘",
							imageUrl : ctx + "/images/console/button/save_enable.png"
						},{
							text : "更多操作...",
							items : [{
								text : "扩容",
								imageUrl : ctx + "/images/console/button/backup_enable.png"
							},{
								text : "退订",
								imageUrl : ctx + "/images/console/trash_enable.png"
							}]
						} ],
						select : function(e) {
							var operation = $(e.item).children(".k-link").text();
							var rowData = getTableItemSid();
							if (operation == "刷新") {
								refreshVolumeStorage();
							}else if (operation == "修改") {
								editVolumeStorage(rowData.resInstanceSid,rowData.resInstanceName);
							} else if (operation == "退订") {
								removeVolumeStorage(rowData.resInstanceSid);
							} else if (operation == "加载到主机") {
								volumeLoadtoHost(rowData.volumeType,rowData.resInstanceSid,rowData.instanceSid);
							} else if (operation == "扩容") {
								expansionVolumeStorage(rowData.resInstanceSid,rowData.allocateDiskSize);
							}else if (operation == "卸载硬盘") {
								uninstallStorage(rowData.instanceSid,rowData.resInstanceHostSid);
							}
						}
					});
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
				height:480

			}).data("kendoWindow");
			detailsWindow.center().open();
		}

		//获取列表数据
		function getGridData() {
			//北向接口取得服务实例数据
			Core.AjaxRequest({
				url : ws_url + "/rest/serviceInstance/findVolume",
				type:"get",
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
			getItem("1").find("img").attr("src","/tscloud-portal/images/console/button/edit.png");
			$("#menu-images").data("kendoMenu").enable(getItem("2"), false);
			getItem("2").find("img").attr("src","/tscloud-portal/images/console/button/loadinghost.png");
			$("#menu-images").data("kendoMenu").enable(getItem("3"),false);
			getItem("3").find("img").attr("src","/tscloud-portal/images/console/button/save.png");
			$("#menu-images").data("kendoMenu").enable(getItem("4"),false);
			getItem("4").find("img").attr("src","/tscloud-portal/images/console/button/save.png");
			$("#menu-images").data("kendoMenu").enable(getItem("4.0"),false);
			getItem("4.0").find("img").attr("src","/tscloud-portal/images/console/hdd.png");
			$("#menu-images").data("kendoMenu").enable(getItem("4.1"),false);
			getItem("4.1").find("img").attr("src","/tscloud-portal/images/console/trash.png");
		};
		
		// 刷新块存储datagrid
		function refreshVolumeStorage(){
			getGridData();
		}
		
		// 编辑块存储
		function editVolumeStorage(resInstanceSid,reInstanceName){
				//修改资源实例名称Window
				var modifyNameWindow = $("#modifyResInsVmName").kendoWindow({
					title : "编辑资源实例名称",
					modal : true,
					visible : false,
					resizable : false,
					content : ctx + "/pages/console/volumes/volumes-name-modify.jsp?instanceSid="+resInstanceSid+"&instanceName="+reInstanceName,
					width :500,
					height:126
				}).data("kendoWindow");
				modifyNameWindow.center().open();
		}
		
		// 退订块存储
		function removeVolumeStorage(resInstanceSid){
			 Core.confirm({
					title : "请选择",
					message : "您确定要退订该块存储吗？",
					confirmCallback : function() {
						// 传入action和serviceInstanceSid
						Core.AjaxRequest({
							url : ws_url+ "/rest/resourceInstanceStorage/destroyVDisk?resStoInsSid="+resInstanceSid,
							type:"get",
							callback : function(data) {
								//刷新列表
								getGridData();
							},
							failure : function(data){
								Core.alert({
									title:"提示",
									message:"对不起，硬退订块存储失败！"
								});
							}
						});
					}
				});
		}
		
		// 打开加载到主机window
		function volumeLoadtoHost(volumeType,resInstanceSid,instanceSid){
			//打开加载主机window
			var modifyNameWindow = $("#loadVolumeHost").kendoWindow({
				title : "选择加载主机",
				modal : true,
				visible : false,
				iframe : true,
				resizable : false,
				content : ctx + "/pages/console/volumes/volumes-load-host.jsp?resInstanceSid="+resInstanceSid+"&volumeType="+volumeType+"&instanceSid="+instanceSid,
				width :500,
				height:150
			}).data("kendoWindow");
			modifyNameWindow.center().open();
		}
		
		// 扩容
		function expansionVolumeStorage(resInstanceSid,allocateDiskSize){
			//修改资源实例名称Window
			var expansionVolumeHost = $("#expansionVolumeHost").kendoWindow({
				title : "扩容",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/volumes/volumes-expansion.jsp?resInstanceSid="+resInstanceSid+"&allocateDiskSize="+allocateDiskSize,
				width :500,
				height:126
			}).data("kendoWindow");
			expansionVolumeHost.center().open();
		}
		
		// 卸载硬盘
		function uninstallStorage(instanceSid,resInstanceHostSid){
		   // 是否卸载confirm弹出框
		   Core.confirm({
					title : "请选择",
					message : "您确定要卸载硬盘吗？",
					confirmCallback : function() {
						// 传入action和serviceInstanceSid
						Core.AjaxRequest({
							url : ws_url+ "/rest/serviceInstance/serviceInstanceOperation",
							params : {
								serviceInstanceSid : instanceSid,
								action : "detach",
								resVmSid :resInstanceHostSid
							},
							callback : function(data) {
								//刷新列表
								getGridData();
							},
							failure : function(data){
								Core.alert({
									title:"提示",
									message:"对不起，卸载硬盘失败！"
								});
							}
						});
					}
				});
		   
		   // 成功失败处理
		}
	
		// 控制操作按钮
        function setMenuByStatus(dataItem) {
			 if(dataItem.resStatus=="02"){
				// 加载到主机
				$("#menu-images").data("kendoMenu").enable(getItem("2"), true);
				getItem("2").find("img").attr("src","/tscloud-portal/images/console/button/loadinghost_enable.png");
				// 刷新
				getItem("0").find("img").attr("src","/tscloud-portal/images/console/refresh2_enable.png");
				// 编辑
				$("#menu-images").data("kendoMenu").enable(getItem("1"), true);
				getItem("1").find("img").attr("src","/tscloud-portal/images/console/button/edit_enable.png");
				// 卸载硬盘
				$("#menu-images").data("kendoMenu").enable(getItem("3"),false);
				getItem("3").find("img").attr("src","/tscloud-portal/images/console/button/save.png");
				// 更多操作
				$("#menu-images").data("kendoMenu").enable(getItem("4"),true);
				getItem("4").find("img").attr("src","/tscloud-portal/images/console/button/save_enable.png");
				// 扩容
				$("#menu-images").data("kendoMenu").enable(getItem("4.0"),true);
				getItem("4.0").find("img").attr("src","/tscloud-portal/images/console/hdd_enable.png");
				
				// 退订
				$("#menu-images").data("kendoMenu").enable(getItem("4.1"),true);
				getItem("4.1").find("img").attr("src","/tscloud-portal/images/console/trash_enable.png");
			}else if(dataItem.resStatus=="03"){
				// 加载到主机
				$("#menu-images").data("kendoMenu").enable(getItem("2"), false);
				getItem("2").find("img").attr("src","/tscloud-portal/images/console/button/loadinghost.png");
				// 刷新
				getItem("0").find("img").attr("src","/tscloud-portal/images/console/refresh2_enable.png");
				// 编辑
				$("#menu-images").data("kendoMenu").enable(getItem("1"), true);
				getItem("1").find("img").attr("src","/tscloud-portal/images/console/button/edit_enable.png");
				// 卸载硬盘
				$("#menu-images").data("kendoMenu").enable(getItem("3"),true);
				getItem("3").find("img").attr("src","/tscloud-portal/images/console/button/save_enable.png");
				// 更多操作
				$("#menu-images").data("kendoMenu").enable(getItem("4"),true);
				getItem("4").find("img").attr("src","/tscloud-portal/images/console/button/save_enable.png");
				// 扩容
				$("#menu-images").data("kendoMenu").enable(getItem("4.0"),true);
				getItem("4.0").find("img").attr("src","/tscloud-portal/images/console/hdd_enable.png");
				// 退订
				$("#menu-images").data("kendoMenu").enable(getItem("4.1"),false);
				getItem("4.1").find("img").attr("src","/tscloud-portal/images/console/trash.png");
			}else {
				initMenu();
			}
			
			
		}
</script>