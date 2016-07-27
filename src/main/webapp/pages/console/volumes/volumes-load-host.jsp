<%@page import="org.apache.catalina.loader.WebappClassLoader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<style type="text/css">
html,body{
   font-family:"微软雅黑","Microsoft Yahei",Georgia,Serif;
   width:99.5%;
   height:100% !important;
   height:auto;
   padding:0px;
   margin:0px;
}
#monify {
	list-style-type: none;
	margin: 0;
	padding: 0;
	text-align: center;
}
.k-content-frame{
	height:auto;
	overflow:hidden;
}

</style>
</head>
<%
	String resInstanceSid = request.getParameter("resInstanceSid");
	String volumesType = request.getParameter("volumeType");
	String instanceSid = request.getParameter("instanceSid");
%>
<body>
<div style="width:100%;height:100%; padding: 0px; margin: 0px;overflow:hidden;">
	<table width="100%" height="55%"border="0" cellpadding="0" >
		<tr>
			<td width="150px" height="30px" align="right">挂载主机：</td>
			<td>
				<input id="attahHost" style="width:250px; font-size: 12px;" placeholder="请选择..." />
			</td>
		</tr>
		<tr id="deviceNameDiv" style="display:none" >
			<td height="30px" align="right">设备名称：</td>
			<td><input type="text" id="deviceName"
						style="font-size: 12px; width: 250px" class="k-textbox" 
 						value="/dev/vdb" /></td>
		</tr>
	</table>
	<br />
	<div style="text-align: right;">
		<button class="k-button" id="loadHostSave"
			style="width: 70px; height: 32px; margin-right: 9px; margin-bottom:18px" type="submit">保存</button>
		<button class="k-button" id="loadHostClose"
			style="width: 70px; height: 32px; margin-right: 12px;margin-bottom:18px"
			type="submit">关闭</button>

	</div>
</div>

<script type="text/javascript">
var resInstanceSid = "<%=resInstanceSid%>";
var volumesType = "<%=volumesType%>";
var instanceSid = "<%=instanceSid%>";

// 	if (volumesType != "KVM") {
// 		$("#deviceNameDiv").css("display", "none"); 
// 	}
	var dataItem;
	// 查询host
	Core.AjaxRequest({
		url : ws_url + "/rest/resourceInstanceStorage/selectVmByResStoSid?resInsStoSid="+resInstanceSid,
		type:"get",
		callback : function(data) {
			$("#attahHost").kendoDropDownList({
				dataTextField : "resVmName",
				dataValueField : "allocateInstanceId",
				dataSource : data
			});
		},
		failure : function(data) {
		}
	});
	

	// 关闭window
	$("#loadHostClose").click(function() {
		window.parent.$("#loadVolumeHost").data("kendoWindow").close();
	});

	// 保存提交
	$("#loadHostSave").click(function() {
		// 得到云主机sid
		// 		alert(dataItem.resInstanceSid); 
		// 服务实例sid
		Core.AjaxRequest({
			url : ws_url + "/rest/serviceInstance/serviceInstanceOperation",
			params : {
				serviceInstanceSid : instanceSid,
				action : "attach",
				resVmSid : $("#attahHost").data("kendoDropDownList").value(),
				deviceName : $("#deviceName").val()
			},
			callback : function(data) {
				Core.alert({
					title : "提示",
					message : "加载磁盘成功！"
				});
				window.parent.$("#loadVolumeHost").data("kendoWindow").close();
				//刷新列表
				window.parent.getGridData();
			},
			failure : function(data) {
				Core.alert({
					title : "提示",
					message : "对不起，加载磁盘失败！"
				});
			}
		});
	});
</script>
</body>
</html>