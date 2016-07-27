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
	String resInstanceSid =request.getParameter("resInstanceSid");
%>
<div style="min-height: 0px">
	<div class="panel" id="panel" style="margin-bottom: 10px">
	<table width="100%" style="text-align: center;">
		<tr>
			<td style="text-align: right;">
			<label><font style="color: red">＊</font>云主机名称：</label>
			</td>
			<td style="text-align: left;">
			<input type="text" id="newResInstanceName" class="k-textbox"
				name="newResInstanceName" required style="width:300px"
				validationMessage="不能为空！" />
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">
			<label for="description"
				class="required">描述：</label>
			</td>
			<td style="text-align: left;">
			<textarea id="description" class="k-textbox"
				name="description" style="width:300px" rows="3" cols="40"></textarea>
			</td>
		</tr>
	</table>
	</div>

	<button class="k-button" id="modifyWindowClose"
		style="width: 70px; height: 32px; float: right; margin-right: 12px;" type="submit">关闭</button>
	<button class="k-button" id="modifyWindowSave"
		style="width: 70px; height: 32px; float: right; margin-right: 9px;"
		type="submit">保存</button>
</div>

<script type="text/javascript">
var instanceSid = "<%=instanceSid%>";
var resInstanceSid = "<%=resInstanceSid%>";
var modifyName = $("#panel").kendoValidator().data("kendoValidator");
	Core.AjaxRequest({
		url : ws_url+ "/rest/resourceInstance/getResInsByResInsSid?resourceInstanceSid="+resInstanceSid+"&resInstanceType=RES-INST-VM",
		type:"get",
		callback : function(data) {
			$("#newResInstanceName").val(data.resInstanceName);
			$("#description").val(data.description);
		}
	});
	$("#modifyWindowSave").click(function() {
						if(modifyName.validate()){
						Core.AjaxRequest({
									url : ws_url+ "/rest/resourceInstance/modifyResInsAndSerInsName",
									type : "post",
									params : {
										instanceSid : instanceSid,
										resInsVmName : $("#newResInstanceName").val(),
										resDescription : $("#description").val()
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

	$("#modifyWindowClose").click(function() {
		$("#modifyResInsVmName").data("kendoWindow").close();
	});
</script>