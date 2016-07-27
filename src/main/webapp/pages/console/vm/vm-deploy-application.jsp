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
	String instanceSid = request.getParameter("instanceSid");
%>
<body>
<div style="width:100%;height:90%; padding: 0px; margin: 0px;overflow:hidden;">
	<table width="100%" height="70%" border="0" cellpadding="0" >
		<tr>
			<td width="150px" height="30px" align="right">应用列表：</td>
			<td>
				<input id="appList" style="width:250px; font-size: 12px;" placeholder="请选择..." />
			</td>
		</tr>
	</table>
	<div style="text-align: right;">
		<button class="k-button" id="deployAppSave"
			style="width: 70px; height: 32px; margin-right: 9px; margin-bottom:18px" type="submit">部署</button>
		<button class="k-button" id="deployAppClose"
			style="width: 70px; height: 32px; margin-right: 12px;margin-bottom:18px"
			type="submit">关闭</button>

	</div>
</div>

<script type="text/javascript">
var instanceSid = "<%=instanceSid%>";
$(document).ready(function(){
	$("#appList").kendoDropDownList({
		dataTextField : "appName",
		dataValueField : "appId",
		dataSource : [{'appName':'电子商务','appId':'电子商务'},{'appName':'OA系统','appId':'OA系统'},{'appName':'CRM系统','appId':'CRM系统'}]
	});
});

	var dataItem;
	

	// 关闭window
	$("#deployAppClose").click(function() {
		window.parent.$("#deployApplication").data("kendoWindow").close();
	});

	// 保存提交
	$("#deployAppSave").click(function() {
		// 得到云主机sid
		// 		alert(dataItem.resInstanceSid); 
		// 服务实例sid
		Core.AjaxRequest({
			url : ws_url + "/rest/serviceInstance/updateServiceInstance",
			params : {
				instanceSid : instanceSid,
				description : $("#appList").data("kendoDropDownList").value(),
			},
			callback : function(data) {
				Core.alert({
					title : "提示",
					message : "加载磁盘成功！"
				});
				window.parent.$("#deployApplication").data("kendoWindow").close();
				//刷新列表
				//window.parent.getGridData();
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