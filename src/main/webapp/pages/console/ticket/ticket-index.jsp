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
			&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">工单服务</font></div>
		<div style="width:99%;margin: 5px 0.5% 5px 0.5%; height: 91%;">
			<div id="introduce">
				<h3>工单</h3>
				<p>工单系统是惠普云平台与您交流最直接有效的平台，有任何问题都可以通过工单系统来咨询，我们会第一时间为您解决。同时我们也欢迎您提交建议或意见。</p>
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
					field : "title",
					title : "标题",
					template: function(dataItem) {
						return "<a href='#' onclick='replyTicket("+dataItem.ticketSid+")' style='color:blue'>"+dataItem.title+"</a>";
				    }
				}, {
					field : "content",
					title : "描述"
				}, {
					field : "questionTypeName",
					title : "问题类型",
					width : 50
				}, {
					field : "questionLevelName",
					title : "问题级别",
					width : 70
				},{
					field : "statusName",
					title : "状态",
					width : 70
				}, {
					field : "createdDt",
					title : "创建时间",
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
							text : "新增工单",
							imageUrl : ctx + "/images/console/add_enable.png"
						}],
						select : function(e) {
							var operation = $(e.item).children(".k-link").text();
							var rowData = getTableItemSid();
							if (operation == "新增工单") {
								addWorkOrders();
							}
						}
					});
		}
		
		function addWorkOrders(){
			//修改资源实例名称Window
			var addTicket = $("#addTicket").kendoWindow({
				title : "新增工单",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/ticket/ticket-add.jsp",
				width :600,
				height:300
			}).data("kendoWindow");
			addTicket.center().open();
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
				url : ws_url + "/rest/ticket/findTickets",
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
		
		// 回复工单
		function replyTicket(sid){
			//回复工单Window
			var replyWindow = $("#replyWindow").kendoWindow({
				title : "回复详细",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/ticket/ticket-reply.jsp?ticketSid="+sid,
				width :700,
				height:600
			}).data("kendoWindow");
			replyWindow.center().open();
		}
		
		// 关闭工单
		function shutdownTicket(){
			alert("关闭工单");
		}
</script>