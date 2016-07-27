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
		
		#grid .k-grid-toolbar {
		margin:0px;
		padding-left:0px;
		padding-right:0px;
		width:100%;
		}
		#grid .k-menu.k-header,.k-menu .k-item {
			border: 0px ;
		}
		
		#grid .k-state-default {
			margin-left: 1px;
			background-color: #474544 !important;
			color : #fff;
		}
		
		#grid .k-state-disabled .k-link  {
			margin-left: 1px;
			background-color: #999 !important;
		}
	</style>
	<div id="grid" style="width: 100%; height: 99.9%; margin: 0px; padding: 0px;">
		<div style="width:100%;height:48px;background:#F9F9F9;color:#000; line-height:48px;border-bottom:1px solid #DADADA">
			&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">自动化部署服务</font></div>
		<div style="width:99%;margin: 5px 0.5% 5px 0.5%; height: 91%;">
			<div id="introduce">
				<h3>自动化部署</h3>
				<p>自动化部署包括软件的安装、配置，以及为软件分配硬件资源等，本功能能查询自动化部署的详细信息和进展状态。</p>
			</div>
			<div id="serviceInstanceGrid" style="height: 80%; width: 100%; margin-top: 5px; font-size: 14px;"></div>
		</div>
	</div>
	<div id="addTicket"></div>
	<div id="replyWindow"></div>
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
				selectable : "single",
				scrollable : false,
				columns : [
				{
					field : "softwareTypeName",
					title : "部署软件类型",
					width : 280
				}, {
					field : "softwareVersionName",
					title : "部署软件版本",
					width : 50
				}, {
					field : "runOsCategory",
					title : "操作系统",
					width : 70
					
				},{
					field : "runTargetHostName",
					title : "目标主机名称",
					width : 70
				},{
					field : "deploymentStatusName",
					title : "部署状态",
					width : 70
				}, {
					field : "deploymentTime",
					title : "申请时间",
					width : 180
//  				},
// 				{
// 					command :[{
// 						text : "回复",
// 						click : replyTicket
// 					},{
// 						text : "关闭",
// 						click : shutdownTicket
// 					}],
// 					title : "操作",
// 					width : 155
				}
				],
				toolbar : kendo.template($("#template").html()),
				change : function(e) {
					var selectedRows = this.select();
					var dataItem = this.dataItem(selectedRows);
				}
			});
			
			//grid 操作菜单
			$("#menu-images").kendoMenu(
					{
						dataSource : [ {
							text : "刷新",
							imageUrl : ctx + "/images/console/refresh2_enable.png"
						} ],
						select : function(e) {
							var operation = $(e.item).children(".k-link").text();
							var rowData = getTableItemSid();
							if (operation == "刷新") {
								getGridData();
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

		//获取列表数据
		function getGridData() {
			//北向接口取得服务实例数据
			Core.AjaxRequest({
				url : ws_url + "/rest/resourceInstance/findDeployments",
				type:"get",
				callback : function(data) {
					createGrid(data);
				}
			});
		}
		//取得Menu中的Item
		var getItem = function(target) {
			var itemIndexes = target.split(/[.,]/), item = $("#menu-images").data("kendoMenu").element;

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
</script>