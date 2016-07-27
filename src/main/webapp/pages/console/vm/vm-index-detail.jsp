<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#content_div {
	width: 100%;
}

#content_div .panel {
	width: 98%;
	border-bottom: 1px solid #DADADA;
	border-left: 1px solid #DADADA;
	border-right: 1px solid #DADADA;
	border-top: 1px solid #DADADA;
	box-shadow: #DADADA 0px 3px 3px;
	position: relative;
	padding: 1%;
}

#content_div .viewTable {
	width: 100%;
}

#content_div .viewTable .leftTd {
	text-align: right;
}
</style>
<%
	String instanceSid = request.getParameter("instanceSid");
	String monitorNodeId = request.getParameter("monitorNodeId");
	String resInstanceSid = request.getParameter("resInstanceSid");
	String allocateIp = request.getParameter("allocateIp");
%>
<div id="content_div">
	<div class="panel" style="margin-bottom: 10px">
		<p
			style="font-size: 16px; font-weight: 500; color: #0099d7; margin: auto;">
			<span id="box">基本信息</span>
		</p>
		<hr />
		<table class="viewTable" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="leftTd">云主机名称：</td>
				<td id="instanceName"></td>
				<td class="leftTd">服务状态：</td>
				<td id="statusName"></td>
				<td class="leftTd">所属订单：</td>
				<td id="orderId"></td>
			</tr>
			<tr>
				<td class="leftTd">计费类型：</td>
				<td id="billingTypeName"></td>
				<td class="leftTd">购买时长：</td>
				<td id="buyLength"></td>
			</tr>
			<tr>
				<td class="leftTd">开通时间：</td>
				<td id="dredgeDate"></td>
				<td class="leftTd">到期时间：</td>
				<td id="expiringDate"></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td class="leftTd">应用名称：</td> -->
<!-- 				<td id="serDescription" colspan="3"></td> -->
				
<!-- 			</tr> -->
		</table>
	</div>
	<div style="margin: 0px; padding: 0px">
		<div class="panel"
			style="margin-bottom: 10px; margin-right: 10px; width: 47.2%; float: left; display: inline; height: 130px;">
			<p
				style="font-size: 16px; font-weight: 500; color: #0099d7; margin: auto;">
				<span id="box">配置信息</span>
			</p>
			<hr />
			<table class="viewTable" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="leftTd">资源池级别：</td>
					<td id="perfLevelName"></td>
				</tr>
				<tr>
					<td class="leftTd">操作系统：</td>
					<td id="osTypeName"></td>
				</tr>
				<tr>
					<td class="leftTd">CPU核数：</td>
					<td><span id="cpuCores"></span>&nbsp;核</td>
				</tr>
				<tr>
					<td class="leftTd">内存大小：</td>
					<td><span id="memorySize"></span>&nbsp;GB</td>
				</tr>
			</table>
		</div>
		<div class="panel"
			style="margin-bottom: 10px; width: 47.3%; float: left; display: inline; height: 130px;">
			<p
				style="font-size: 16px; font-weight: 500; color: #0099d7; margin: auto;">
				<span id="box">硬盘信息</span>
			</p>
			<hr />
			<div id="vDiskGrid"
				style="height: 70%; width: 100%; margin-top: 5px; font-size: 14px;"></div>
		</div>
	</div>
	<div id="vmDivDetail" class="panel"
		style="margin-bottom: 10px; clear: both">
		<p
			style="font-size: 16px; font-weight: 500; color: #0099d7; margin: auto;">
			<span id="box">管理信息</span>
		</p>
		<hr />
		<table class="viewTable" cellpadding="0" cellspacing="0">
			<tr>
				<td class="leftTd">主机管理账号：</td>
				<td id="managementAccount"></td>
				<td class="leftTd">主机管理密码：</td>
				<td id="managementPassword"></td>
				<td class="leftTd">是否需要公网IP：</td>
				<td id="needWan"></td>
			</tr>
			<tr>
				<td class="leftTd">内网IP地址：</td>
				<td id="ip"></td>
				<td class="leftTd">公网IP地址：</td>
				<td id="publicIp"></td>
			</tr>
		</table>
		<p style="font-size: 14px; margin: 0px; margin-top: 5px; color: green;">
			※Linux使用SSH工具连接公网IP地址时，端口号选择公网IP地址后面的第一个端口号；Widnows使用远程桌面连接公网IP地址时，端口号选择公网IP地址后面的第二个端口号。
		</p>
	</div>
	<button class="k-button" id="serWindowClose"
		style="width: 70px; height: 32px; float: right;" type="submit">关闭</button>
</div>

<script type="text/javascript">
var instanceSid = "<%=instanceSid%>";
<%-- var monitorNodeId = "<%=monitorNodeId%>"; --%>
var resInstanceSid = '<%=resInstanceSid%>';
var allocateIp = '<%=allocateIp%>';
	$(function() {
		getServiceInstanceInfo(instanceSid);
		getResInstances(instanceSid);
// 		getNodeMonitorInfo(monitorNodeId, resInstanceSid, allocateIp);
		getResStorages(resInstanceSid);
	});

	//获取当前节点监控信息
	function getNodeMonitorInfo(monitorNodeId) {

		//获取当前节点监控信息
		Core.AjaxRequest({
			url : ws_url + "/rest/resourceMonitor/getCurrentNodeInfo?nodeId="
					+ monitorNodeId + "&resInstanceSid=" + resInstanceSid
					+ "&allocateIp=" + allocateIp,
			type : "get",
			callback : function(data) {
				if (data.cpuUsage != "NaN") {
					$("#viewCpuUsage").html(Math.round(data.cpuUsage) + "%");
					$("#memUsage").html(Math.round(data.memUsage) + "%");
					$("#diskUsage").html(Math.round(data.diskUsage) + "%");
				} else {
					$("#viewCpuUsage").html("0 %");
					$("#memUsage").html("0 %");
					$("#diskUsage").html("0 %");
				}

			},
			failure : function(data) {
				$("#viewCpuUsage").html("0 %");
				$("#memUsage").html("0 %");
				$("#diskUsage").html("0 %");
			}
		});

	}

	//获取服务实例基本信息
	function getServiceInstanceInfo(instanceSid) {
		Core.AjaxRequest({
			url : ws_url + "/rest/serviceInstance/" + instanceSid,
			type : "get",
			callback : function(data) {
				$("#instanceName").html(data.instanceName);
				$("#billingTypeName").html(data.billingTypeName);
				$("#orderId").html(data.orderId);
				$("#statusName").html(data.statusName);
				$("#dredgeDate").html(data.dredgeDate);
				$("#expiringDate").html(data.expiringDate);
				$("#buyLength").html(data.buyLength + data.billingTypeUnit);
// 				$("#serDescription").html(data.description);
			}
		});
	}

	//获取服务实例下资源实例列表信息
	function getResInstances(instanceSid) {
		Core.AjaxRequest({
			url : ws_url + "/rest/resourceInstance/" + instanceSid,
			type : "get",
			callback : function(data) {
				$("#resInstanceName").html(data.resInstanceName);
				$("#managementAccount").html(data.managementAccount);
				$("#managementPassword").html(data.managementPassword);
				$("#perfLevelName").html(data.perfLevelName);
				$("#osTypeName").html(data.osTypeName);
				$("#cpuCores").html(data.cpuCores);
				$("#memorySize").html((data.memorySize / 1024).toFixed(1));
				$("#dataDisk").html(data.dataDisk);
				if (data.needWan == "0") {
					$("#needWan").html("不需要");
				} else if (data.needWan == "1") {
					$("#needWan").html("需要");
				}
				if (data.publicIp != "" || data.publicIp == null) {
					$("#publicIp").html(data.publicIp);
				} else {
					$("#publicIp").html("无");
				}
				$("#ip").html(data.ip);
				$("#storageName").html(data.storageName);
			}
		});
	}

	$("#serWindowClose").click(function() {
		$("#details").data("kendoWindow").close();
	});

	//创建grid
	function createGrid(data) {
		$("#vDiskGrid").kendoGrid({
			dataSource : {
				data : data
			},
			sortable : true,
			pageable : false,
			selectable : false,
			scrollable : true,
			columns : [ {
				field : "resInstanceName",
				title : "存储名称"
			}, {
				field : "storagePurposeName",
				title : "存储用途"
			}, {
				field : "allocateDiskSize",
				title : "存储大小"
			} ]
		});
	}

	//调用北向接口查询该主机所挂存储
	function getResStorages(resInstanceSid) {
		Core.AjaxRequest({
			url : ws_url + "/rest/resourceInstance/getResStorages",
			params : {
				resInstanceHostSid : resInstanceSid
			},
			callback : function(data) {
				createGrid(data);
			}
		});

	};
</script>