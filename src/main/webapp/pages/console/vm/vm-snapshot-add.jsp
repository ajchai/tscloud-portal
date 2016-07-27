<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#monify {
	list-style-type: none;
	margin: 0;
	padding: 0;
	text-align: left;
}
</style>
<%
	String instanceSid = request.getParameter("instanceSid");
%>
<div style="min-height: 8px">
	<div class="panel" id="panel" style="margin-bottom: 0px">
		<ul id="monify">
			<li style="margin: 8px 0 0 16px"><label for="snapshotName"
				class="required"><font style="color: red">＊</font>备份名称：</label>
				<input type="text" id="snapshotName" class="k-textbox" style="width:300px"
				name="snapshotName" required
				validationMessage="不能为空！" /></li>
				<li style="margin: 8px 0 8px 16px"><label for="snapshotName"
				class="required"><font style="color: white">＊</font>备份描述：</label>
				<textarea id="snapshotDes" class="k-textbox" maxlength="256" style="height:80px;width:300px;resize:none"></textarea></li>
		</ul>
	</div>

	<button class="k-button" id="snapshotAddWindowClose"
		style="width: 70px; height: 32px; float: right; margin-right: 8px;" type="submit">关闭</button>
	<button class="k-button" id="snapshotAddWindowSave"
		style="width: 70px; height: 32px; float: right; margin-right: 8px;"
		type="submit">确定</button>
</div>

<script type="text/javascript">
var instanceSid = "<%=instanceSid%>";
var monify = $("#panel").kendoValidator().data("kendoValidator");
$("#snapshotAddWindowSave").click(function(){
	if(monify.validate()){
		createSnapshot(instanceSid);
	}
});

//备份
function createSnapshot(resInstanceSid){
	
	var snapshotName=$("#snapshotName").val();
	var snapshotDes=$("#snapshotDes").val();
	//北向接口取得服务实例数据
	Core.AjaxRequest({
		url : ws_url + "/rest/resourceInstance/createSnapshot",
		params:{
			resourceInstanceSid:resInstanceSid,
			snapshotName:snapshotName,
			snapshotDes:snapshotDes
		},
		callback : function(data) {
			Core.alert({
				title:"提示",
				message:"备份成功！",
				confirmCallback:function(){
					$("#snapshotAddWindow").data("kendoWindow").close();
				}
			});
		},
		failure:function(data){
			Core.alert({title:"提示",message:"备份失败!"});
		}
	
	});
	
}

	$("#snapshotAddWindowClose").click(function() {
		$("#snapshotAddWindow").data("kendoWindow").close();
	});
</script>