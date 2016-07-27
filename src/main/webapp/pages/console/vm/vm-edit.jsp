<%@page import="org.apache.catalina.loader.WebappClassLoader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<style type="text/css">
html,body {
	font-family: "微软雅黑", "Microsoft Yahei", Georgia, Serif;
	width: 99.5%;
	height: 100%;
	height: 100%;
	padding: 0px;
	margin: 0px;
}

#monify {
	list-style-type: none;
	margin: 0;
	padding: 0;
	text-align: center;
}

.k-state-disabled {
	background-color: #fff !important;
	color: #fff;
}
</style>
</head>
<%
	String resInstanceSid = request.getParameter("resInstanceSid");
	// 	String volumesType = request.getParameter("volumeType");
%>
<body>
	<div style="min-height: 0px; padding: 0px; margin: 0px; height: 100%">
		<table width="100%" border="0" cellpadding="0" cellspacing="10px">
			<tr>
				<td width="150px" height="30px" align="right">CPU核数：</td>
				<td><input id="cpuCores" style="width: 100px; font-size: 12px;"
					placeholder="请选择..." /> 核 <!-- 			<input type="text" id="cpuCores" -->
					<!-- 						style="font-size: 12px; width: 100px" class="k-textbox" -->
					<!-- 						value="" /> 核</td> -->
			</tr>
			<tr>
				<td width="80px" height="30px" align="right">内存大小：</td>
				<td><input id="memorySize"
					style="width: 100px; font-size: 12px;" placeholder="请选择..." /> MB
					<!-- 					<input type="text" id="memorySize" --> <!-- 						style="font-size: 12px; width: 100px" class="k-textbox" -->
					<!-- 						value="" /> MB --></td>
			</tr>
		</table>

		<div style="text-align: right; height: 50%">
			<button class="k-button" id="reconfigVmSave"
				style="width: 70px; height: 32px; margin-right: 9px; margin-top: 50px;"
				type="submit">保存</button>
			<button class="k-button" id="reconfigVmClose"
				style="width: 70px; height: 32px; margin-right: 12px; margin-top: 50px;"
				type="submit">关闭</button>

		</div>
	</div>

	<script type="text/javascript">
var resInstanceSid = "<%=resInstanceSid%>";

		var cpuCoreListData = [ {
			"value" : "1",
			"text" : "1"
		}, {
			"value" : "2",
			"text" : "2"
		}, {
			"value" : "4",
			"text" : "4"
		}, {
			"value" : "8",
			"text" : "8"
		} ];
		var memoryListData = [ {
			"value" : "512",
			"text" : "512"
		}, {
			"value" : "1024",
			"text" : "1024"
		}, {
			"value" : "2048",
			"text" : "2048"
		}, {
			"value" : "4096",
			"text" : "4096"
		} ];
		$("#cpuCores").kendoDropDownList({
			dataTextField : "text",
			dataValueField : "value",
			dataSource : cpuCoreListData
		});
		$("#memorySize").kendoDropDownList({
			dataTextField : "text",
			dataValueField : "value",
			dataSource : memoryListData
		});
		var dataItem;
		// 查询host
		Core.AjaxRequest({
					url : ws_url
							+ "/rest/resourceInstance/getResInsByResInsSid?resourceInstanceSid="
							+ resInstanceSid + "&resInstanceType=RES-INST-VM",
					type : "get",
					callback : function(data) {
						$("#cpuCores").data("kendoDropDownList").value(
								data.resourceInstanceVm.cpuCores);
						$("#memorySize").data("kendoDropDownList").value(
								data.resourceInstanceVm.memorySize);
					}
				});

		// 关闭window
		$("#reconfigVmClose").click(function() {
			window.parent.$("#reconfigVm").data("kendoWindow").close();
		});

		// 保存提交
		$("#reconfigVmSave").click(
				function() {
					// 得到云主机sid
					// 		alert(dataItem.resInstanceSid); 
// 					Core.confirm({
// 						message : "调整配置需要关闭虚机，请确认您已保存数据？",
// 						confirmCallback : function() {
							// 服务实例sid
							Core.AjaxRequest({
								url : ws_url
										+ "/rest/resourceInstance/reconfigVm",
								params : {
									resInsVmSid : resInstanceSid,
									cpu : $("#cpuCores").data(
											"kendoDropDownList").value(),
									memory : $("#memorySize").data(
											"kendoDropDownList").value()
								},
								callback : function(data) {
									Core.alert({
										title : "提示",
										message : "调整配置成功！"
									});
									window.parent.$("#reconfigVm").data("kendoWindow").close();
									//								 				//刷新列表
									//								 				getGridData();
								},
								failure : function(data) {
									Core.alert({
										title : "提示",
										message : "调整配置失败！"
									});
								}
							});
// 						}
// 					});

				});
	</script>
</body>
</html>