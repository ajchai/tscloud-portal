<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#monify {
	list-style-type: none;
	margin: 0;
	padding: 0;
	text-align: center;
}
</style>
<%
	String instanceSid = request.getParameter("instanceSid");
	String instanceName =new String(request.getParameter("instanceName").getBytes("ISO-8859-1"),"UTF-8");
%>
<div style="min-height: 0px">
	<div class="panel" id="panel" style="margin-bottom: 10px">
		<ul id="monify">
			<li style="margin: 16px 0 20px 0"><label for="newResInstanceName"
				class="required"><font style="color: red">＊</font>资源实例名称：</label>
				<input type="text" id="newResInstanceName" class="k-textbox"
				name="newResInstanceName" value="<%=instanceName %>" required
				validationMessage="不能为空！" /></li>
		</ul>
	</div>

	<button class="k-button" id="modifyStoWindowClose"
		style="width: 70px; height: 32px; float: right; margin-right: 12px;" type="submit">关闭</button>
	<button class="k-button" id="modifyStoWindowSave"
		style="width: 70px; height: 32px; float: right; margin-right: 9px;"
		type="submit">保存</button>
</div>

<script type="text/javascript">
var resInstanceSid = "<%=instanceSid%>";
var modifyName = $("#panel").kendoValidator().data("kendoValidator");
	$("#modifyStoWindowSave").click(function() {
						if(modifyName.validate()){
						Core.AjaxRequest({
									url : ws_url+ "/rest/resourceInstance/modifyResInstanceName",
									type : "post",
									params : {
										resInstanceSid : resInstanceSid,
										resInsVmName : $("#newResInstanceName").val()
									},
									callback : function(data) {
										if (data.status == "success") {
											Core.alert({
														message : "修改成功！",
														confirmCallback : function() {
															$("#modifyResInsVmName").data("kendoWindow").close();
															//刷新列表
															getGridData();
														}
													});

										} else {
											Core.alert({
														message : "修改失败，该数据已被更新或删除！",
														confirmCallback : function() {
															$("#modifyResInsVmName").data("kendoWindow").close();
														}
													});
										}

									}
								});
						}
					});

	$("#modifyStoWindowClose").click(function() {
		$("#modifyResInsVmName").data("kendoWindow").close();
	});
</script>