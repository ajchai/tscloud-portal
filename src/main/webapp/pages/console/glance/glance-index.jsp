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
			&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">镜像服务</font></div>
		<div style="width:99%;margin: 5px 0.5% 5px 0.5%; height: 91%;">
			<div id="introduce">
				<h3>镜像 & 快照</h3>
				<p>镜像是带有操作系统的云主机模板。惠普云平台会提供主流的 Linux、Windows 模板，用户也可以在将自己的云主机制作成镜像。</p>
			</div>
			<div id="serviceInstanceGrid" style="height: 80%; width: 100%; margin-top: 5px; font-size: 14px;"></div>
		</div>
	</div>
	<div id="modifyImagesName"></div>
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
					field : "udImageName",
					title : "名称"
				}, {
					field : "statusName",
					title : "状态"
				}, {
					field : "imageSize",
					title : "容量(GB)"
				}, {
					field : "virtualPlatformType",
					title : "平台"
				}],
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
							imageUrl : ctx + "/images/console/button/edit.png"
						},{
								text : "删除",
								imageUrl : ctx + "/images/console/trash.png",
								width : "100"
						} ],
						select : function(e) {
							var operation = $(e.item).children(".k-link").text();
							var rowData = getTableItemSid();
							if (operation == "刷新") {
								getGridData();
							}
							if (operation == "删除") {
								Core.confirm({
									message : "确认删除该镜像吗？",
									confirmCallback : function() {
										deleteResourceImages(rowData.imageSid);
									}
								});
							}else if (operation == "修改") {
								modifyImagesName(rowData.imageSid,rowData.udImageName,rowData.version);
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

		// 删除image
		function deleteResourceImages(imageSid) {
			Core.AjaxRequest({
				url : ws_url + "/rest/images/deleteImages?imageSid=" + imageSid,
				type : "get",
				callback : function(data) {
					Core.confirm({
						title:"提示",
						message : "删除镜像成功！",
						confirmCallback : function() {
							getGridData();
						}
					});
				},
				failure : function(data){
					Core.confirm({
						title: "提示",
						message : "删除镜像成功！"
					});
				}
			});

		};

		//获取列表数据
		function getGridData() {
			//北向接口取得服务实例数据
			Core.AjaxRequest({
				url : ws_url + "/rest/images/findImages",
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
			getItem("1").find("img").attr("src","/tscloud-portal/images/console/button/edit.png");
			$("#menu-images").data("kendoMenu").enable(getItem("2"), false);
			getItem("2").find("img").attr("src","/tscloud-portal/images/console/trash.png");
		};

		//根据主机资源实例状态控制menu
		function setMenuByStatus(dataItem) {
			getItem("0").find("img").attr("src","/tscloud-portal/images/console/refresh2_enable.png");
			$("#menu-images").data("kendoMenu").enable(getItem("1"), true);
			getItem("1").find("img").attr("src","/tscloud-portal/images/console/button/edit_enable.png");
			$("#menu-images").data("kendoMenu").enable(getItem("2"), true);
			getItem("2").find("img").attr("src","/tscloud-portal/images/console/trash_enable.png");
		}
		
		// 修改
		function modifyImagesName(imageSid,udName,version){
			
			//修改资源实例名称Window
			var modifyImagesName = $("#modifyImagesName").kendoWindow({
				title : "修改镜像名称",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/glance/glance-edit.jsp?imageSid="+imageSid+"&udName="+udName+"&version="+version,
				width :500,
				height:126
			}).data("kendoWindow");
			modifyImagesName.center().open();
			
		}
		
	
</script>