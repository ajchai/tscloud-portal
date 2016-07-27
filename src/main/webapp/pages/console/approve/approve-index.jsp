<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="width:100%; height: 100%; margin: 0px; padding: 0px;">
	<div style="width: 100%; height: 48px; background: #FAFAFA; color: #000; line-height: 48px; border-bottom: 1px solid #DADADA">
		&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">审核管理</font></div>

	<div id="tabstrip" style="height:91%;width:99.9%;">
		<ul>
			<li class="k-state-active">未审核</li>
			<li>已审核</li> 
		</ul>
		<div style="height:90%;width:97%;">
			<div style="width:100%;">
				<table style="font-size: 14px;" cellpadding="3" cellspacing="3">
					<tr>
						<td>审核对象:</td>
						<td><input type="text" id="disapproveText"
							style="font-size: 12px; width: 150px" class="k-textbox" value="" /></td>
						<td>流程类型:</td>
						<td><select id="disapproveCombox" size="1"
							style="font-size: 12px; width: 120px">
						</select></td>
						<td>审核时间:</td>
						<td><input id="disapproveDateFrom"
							style="font-size: 12px; width: 180px" /> 至 <input
							id="disapproveDateTo" style="font-size: 12px; width: 180px" />
						<td>
							<button class="k-button" id="disapproveSearch"
								style="width: 50px" type="submit" onclick="disapproveSearch()">查询</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="disapproveGrid" style="width: 100%; height:90%; font-size: 14px;"></div>
		</div>
		<div style="height: 90%">
			<div>
				<table style="font-size: 14px;" cellpadding="3" cellspacing="3">
					<tr>
						<td>审核对象:</td>
						<td><input type="text" id="approveText"
							style="font-size: 12px; width: 150px" class="k-textbox" value="" /></td>
						<td>流程类型:</td>
						<td><select id="approveCombox" size="1"
							style="font-size: 12px; width: 120px">
						</select></td>
						<td>审核时间:</td>
						<td><input id="approveDateFrom"
							style="font-size: 12px; width: 180px" /> 至 <input
							id="approveDateTo" style="font-size: 12px; width: 180px" /></td>
						<td>
							<button class="k-button" id="approveSearch" style="width: 50px"
								type="submit" onclick="approveSearch()">查询</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="approveGrid" style="width: 100%;height:90%; font-size: 14px;"></div>
		</div>
	</div>
</div>


<div id="details"></div>
<div id="orderDetailWindow" style="margin: 0px; padding: 0px; overflow: hidden"></div>
<div id="approveHistory"></div>
<div id="approveService"></div>

<script type="text/javascript">
	$("#disapproveCombox").kendoDropDownList();
	$("#approveCombox").kendoDropDownList();
	$("#disapproveDateFrom").kendoDateTimePicker({
		format : "yyyy-MM-dd HH:mm"
	});
	$("#disapproveDateTo").kendoDateTimePicker({
		format : "yyyy-MM-dd HH:mm"
	});
	$("#approveDateFrom").kendoDateTimePicker({
		format : "yyyy-MM-dd HH:mm"
	});
	$("#approveDateTo").kendoDateTimePicker({
		format : "yyyy-MM-dd HH:mm"
	});

	//全局变量：子页面
	var approveWindow, approveHistoryWindow, approveServiceWindow, approveGrid, disapproveGrid;

	//方法：初始化
	$(document).ready(function() {
		// 设置table的切换效果
		$("#tabstrip").kendoTabStrip({
			animation : {
				open : {
					effects : "fadeIn"
				}
			}
		});
		approveSearch();
		disapproveSearch();
	});

	//数据：加载已审批数据
	function createApproveGrid(parameters) {
		// 初始化订单状态的下拉列表框
		Core.AjaxRequest({
			url : ws_url + "/rest/system/PROCESS_TYPE",
			type : "get",
			callback : function(data) {
				var dataSource= new kendo.data.DataSource({
					data: data,
					schema: {
						model: { id: "codeSid" }
					}
				});
				dataSource.fetch(function() {
					dataSource.insert(0, { "codeDisplay": "全部", "codeValue": "" });
				});
				$("#approveCombox").kendoDropDownList({
					dataTextField : "codeDisplay",
					dataValueField : "codeValue",
					placeholder : "请选择...",
					dataSource : dataSource,
					index: 0
				});
			}
		});

		Core.AjaxRequest({
			url : ws_url + "/rest/approve/getApproveByType",
			params : parameters,
			callback : function(data) {
				approveGrid = $("#approveGrid").kendoGrid({
					dataSource : {
						data : data,
						pageSize : 10
					},
					sortable : true,
					pageable : true,
					selectable : "row",
					scrollable : false,
					columns : [ {
						field : "approveObject",
						width : 200,
						title : "审核对象"
					}, {
						field : "processTypeName",
						width : 100,
						title : "流程类型"
					}, {
						field : "serviceName",
						width : 150,
						title : "服务名称"
					}, {
						field : "approvorId",
						width : 100,
						title : "申请人"
					}, {
						field : "approveStatusName",
						width : 100,
						title : "审核状态"
					}, {
						field : "approveDate",
						width : 160,
						title : "审核时间"
					}, {
						command : [ {
							text : "详情",
							click : showOrderDetails
						}, {
							text : "审核历史",
							click : showApproveHistory
						} ],
						title : "操作",
						width : 170
					} ]
				}).data("kendoGrid");
			}
		});
	}

	//数据：加载未审批数据
	function createDisapproveGrid(parameters) {
		// 初始化订单状态的下拉列表框
		Core.AjaxRequest({
			url : ws_url + "/rest/system/PROCESS_TYPE",
			type : "get",
			callback : function(data) {
				var dataSource= new kendo.data.DataSource({
					data: data,
					schema: {
						model: { id: "codeSid" }
					}
				});
				dataSource.fetch(function() {
					dataSource.insert(0, { "codeDisplay": "全部", "codeValue": "" });
				});
				$("#disapproveCombox").kendoDropDownList({
					dataTextField : "codeDisplay",
					dataValueField : "codeValue",
					placeholder : "请选择...",
					dataSource : dataSource,
					index: 0
				});
			}
		});

		Core.AjaxRequest({
			url : ws_url + "/rest/approve/getApproveByType",
			params : parameters,
			callback : function(data) {
				disapproveGrid = $("#disapproveGrid").kendoGrid({
					dataSource : {
						data : data,
						pageSize : 10
					},
					sortable : true,
					pageable : true,
					selectable : "row",
					scrollable : false,
					columns : [ {
						field : "approveObject",
						width : 200,
						title : "审核对象"
					}, {
						field : "processTypeName",
						width : 100,
						title : "流程类型"
					}, {
						field : "serviceName",
						width : 150,
						title : "服务名称"
					}, {
						field : "createdBy",
						width : 100,
						title : "申请人"
					}, {
						field : "createdDt",
						width : 160,
						title : "申请时间"
					}, {
						command : [ {
							text : "详情",
							click : showOrderDetails
						}, {
							text : "审核",
							click : showDetails
						} ],
						title : "操作",
						width : 100
					} ]
				}).data("kendoGrid");
			}
		});
	}

	//页面：订单页面
	function showOrderDetails(e) {
		e.preventDefault();
		var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
		if ("01" == dataItem.processType) {
			var detailWin = $("#orderDetailWindow")
					.kendoWindow(
							{
								title : "订单详情",
								modal : true,
								visible : false,
								iframe : false,
								resizable : true,
								width : "800px",
								height : "420px",
								close : function() {
									setTimeout(function() {
										$('#confirmWindow').kendoWindow(
												'destroy');
									}, 200);
								},
								content : ctx
										+ "/pages/console/order/order-detail-index.jsp?orderId="
										+ dataItem.target
							}).data("kendoWindow");

			detailWin.center().open();
		} else if ("02" == dataItem.processType) {
			approveServiceWindow = $("#approveService").kendoWindow({
				title : "服务详情",
				modal : true,
				visible : false,
				resizable : false,
				width : 800,
				height : 420,
				close : function() {
					setTimeout(function() {
						$('#confirmWindow').kendoWindow('destroy');
					}, 200);
				}
			}).data("kendoWindow");

			var template = kendo.template($("#approveServiceTemplate").html());
			approveServiceWindow.content(template(dataItem));
			approveServiceWindow.center().open();

			Core.AjaxRequest({
				url : ws_url + "/rest/serviceInstance/" + dataItem.target,
				type : "get",
				callback : function(data) {
					$("#instanceName").html(data.instanceName);
					$("#billingTypeName").html(data.billingTypeName);
					$("#ownerName").html(data.ownerName);
					$("#statusName").html(data.statusName);
					$("#tenantName").html(data.tenantName);
					$("#description").html(data.description);

					$("#specGrid").kendoGrid({
						dataSource : {
							data : data.serviceInstanceSpec,
							pageSize : 5
						},
						selectable : true,
						sortable : true,
						pageable : true,
						columns : [ {
							field : "name",
							width : 100,
							title : "规格名称"
						}, {
							field : "description",
							width : 100,
							title : "规格说明"
						}, {
							field : "value",
							width : 200,
							title : "数值"
						}, {
							field : "unit",
							width : 50,
							title : "单位"
						} ]
					}).data("kendoGrid");
				}
			});
		}
	}

	//页面：审核历史页面
	function showApproveHistory(e) {
		e.preventDefault();
		var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
		approveHistoryWindow = $("#approveHistory").kendoWindow({
			title : "审核历史",
			modal : true,
			visible : false,
			resizable : true,
			width : 800,
			height : 420,
			close : function() {
				setTimeout(function() {
					$('#confirmWindow').kendoWindow('destroy');
				}, 200);
			}
		}).data("kendoWindow");
		var template = kendo.template($("#approveHistoryTemplate").html());
		approveHistoryWindow.content(template(dataItem));
		approveHistoryWindow.center().open();

		Core.AjaxRequest({
			url : ws_url + "/rest/approve/getApproveHistoryRecords/"
					+ dataItem.processInstanceId,
			type : "get",
			callback : function(data) {
				$("#approveHistoryGrid").kendoGrid({
					dataSource : {
						data : data,
						pageSize : 10
					},
					selectable : true,
					sortable : true,
					pageable : true,
					columns : [ {
						field : "processInstanceId",
						width : 100,
						title : "流程实例编号"
					}, {
						field : "processTypeName",
						width : 80,
						title : "流程类型"
					}, {
						field : "approvorId",
						width : 80,
						title : "审核人"
					}, {
						field : "approvorActionName",
						width : 120,
						title : "审核操作"
					}, {
						field : "approveStatusName",
						width : 80,
						title : "审核状态"
					}, {
						field : "approveOpinion",
						width : 150,
						title : "审核意见"
					}, {
						field : "approveDate",
						width : 150,
						title : "审核时间"
					} ]
				}).data("kendoGrid");
			}
		});
	}

	//页面：审核页面
	function showDetails(e) {
		e.preventDefault();
		var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
		approveWindow = $("#details").kendoWindow({
			title : "审核",
			modal : true,
			visible : false,
			resizable : false,
			width : 600,
			height : 300,
			close : function() {
				setTimeout(function() {
					$('#confirmWindow').kendoWindow('destroy');
				}, 200);
			}
		}).data("kendoWindow");

		var template = kendo.template($("#approveTemplate").html());
		approveWindow.content(template(dataItem));
		approveWindow.center().open();
		$("#approveStatus").kendoDropDownList();
		// 初始化订单状态的下拉列表框
		Core.AjaxRequest({
			url : ws_url + "/rest/system/APPROVE_STATUS",
			type : "get",
			callback : function(data) {
				$("#approveStatus").kendoDropDownList({
					dataTextField : "codeDisplay",
					dataValueField : "codeValue",
					placeholder : "请选择...",
					dataSource : data,
					index : 0
				});
			}
		});
	}

	//按钮：审核提交
	function confirm() {
		var parameters = {
			checkStatus : $("#approveStatus").val(),
			checkcomments : $("#approveInfo").val(),
			processInstanceId : $("#processInstanceIdConfirm").val(),
			approvorAction : $("#approvorActionConfirm").val(),
			processType : $("#processTypeConfirm").val()
		};
		Core.AjaxRequest({
			url : ws_url + "/rest/order/approveOrder",
			params : parameters,
			callback : function(data) {
				if ("success" == data.status) {
					approveClose();
					window.location.reload();
				} else {
					alert("失败！");
				}
			}
		});
	}

	//按钮：审批关闭
	function approveClose() {
		approveWindow.close();
	}
	//按钮：审批历史关闭
	function approveHistoryClose() {
		approveHistoryWindow.close();
	}

	//按钮：已审批查询
	function approveSearch() {
		if (null != approveGrid) {
			approveGrid.destroy();
		}
		var approveParameters = {
			approveType : "02",
			processInstanceId : $("#approveText").val(),
			processType : $("#approveCombox").val()
		};
		createApproveGrid(approveParameters);
	}

	//按钮：未审批查询
	function disapproveSearch() {
		if (null != disapproveGrid) {
			disapproveGrid.destroy();
		}
		var disapproveParameters = {
			approveType : "01",
			processInstanceId : $("#disapproveText").val(),
			processType : $("#disapproveCombox").val()
		};
		createDisapproveGrid(disapproveParameters);
	}
</script>
<script type="text/x-kendo-template" id="approveTemplate">
				<div>
					<input type="hidden" id="processTypeConfirm" value="#= processType #"/>
					<input type="hidden" id="approvorActionConfirm" value="#= approvorAction #"/>
					<input type="hidden" id="processInstanceIdConfirm" value="#= processInstanceId #"/>
				</div>
                <div id="details-container">
				
				<table style="width:90%;font-size: 14px;" cellpadding="5" cellspacing="0" align="center">
						<tr>
							<td width="20%" align="right">流程实例编号:</td>
							<td width="30%">#= processInstanceId #</td>
							<td width="20%" align="right">流程类型:</td>
							<td width="30%">#= processTypeName #</td>
						</tr>
						<tr>
							<td align="right">审核对象:</td>
							<td>#= approveObject #</td>
							<td align="right">服务名称:</td>
							<td>#= serviceName #</td>
						</tr>
						<tr>
							<td align="right">租户:</td>
							<td>#= tenantName #</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td align="right">审核状态:</td>
							<td colspan="3">
								<select id="approveStatus" size="1" style="font-size: 12px; width: 120px">
								</select>
							</td>
						</tr>
						<tr>
							<td align="right">审核批注:</td>
							<td colspan="3">
								<textarea id="approveInfo" rows="3" style="width: 100%;resize: none" class="k-textbox" ></textarea>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="4">
								<button class="k-button" id="approveOk" style="width: 50px"
									type="submit" onclick="confirm()">确定</button>
								<button class="k-button" id="approveClose" style="width: 50px"
									type="submit" onclick="approveClose()">关闭</button></td>
						</tr>
					</table>
                </div>
    </script>
<script type="text/x-kendo-template" id="approveHistoryTemplate">
				<div>
					<div id="approveHistoryGrid" style="font-size: 14px; max-height: 91%;"></div>
				</div>
    </script>
<script type="text/x-kendo-template" id="approveServiceTemplate">
				<div>
					<input type="hidden" id="processTypeConfirm" value="#= processType #"/>
					<input type="hidden" id="approvorActionConfirm" value="#= approvorAction #"/>
					<input type="hidden" id="processInstanceIdConfirm" value="#= processInstanceId #"/>
				</div>
                <div id="details-container">
				
				<table style="width:90%;font-size: 14px;" cellpadding="5" cellspacing="0" align="center">
						<tr>
							<td width="20%" align="right">服务实例:</td>
							<td width="30%"><span id="instanceName"/></td>
							<td width="20%" align="right">资费方式:</td>
							<td width="30%"><span id="billingTypeName"/></td>
						</tr>
						<tr>
							<td align="right">服务名称:</td>
							<td>#= serviceName #</td>
							<td align="right">所有者:</td>
							<td><span id="ownerName"/></td>
						</tr>
						<tr>
							<td align="right">状态:</td>
							<td><span id="statusName"/></td>
							<td align="right">租户:</td>
							<td><span id="tenantName"/></td>
						</tr>
						<tr>
							<td align="right">描述:</td>
							<td colspan="3">
								<span id="description"/>
							</td>
						</tr>
					</table>
                </div>
				<div id="specGrid" style="font-size: 14px; max-height: 91%;">
    </script>