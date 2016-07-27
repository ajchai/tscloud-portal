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
	String userSid = request.getParameter("userSid");
	String tenantSid = request.getParameter("tenantSid");
	String totalVolumes = request.getParameter("totalVolumes");
%>
<div style="min-height: 0px">
	<div class="panel" id="panel" style="margin-bottom: 10px">
		<ul id="monify">
			<li style="margin: 16px 0 20px 0">
		    	<label for="newResInstanceName" class="required"><font style="color: red">＊</font>容量(MB)：</label> 
				<input id="volumes" type="number" style="width: 100px; font-size: 12px" value="<%=totalVolumes %>" required="true" />
			</li>
		</ul>
	</div>

	<button class="k-button" id="modifyWindowClose"
		style="width: 70px; height: 32px; float: right; margin-right: 12px;"
		type="submit">关闭</button>
	<button class="k-button" id="modifyWindowSave"
		style="width: 70px; height: 32px; float: right; margin-right: 9px;"
		type="submit">保存</button>
</div>

<script type="text/javascript">
	// 初始化容量
	$("#volumes").kendoNumericTextBox({
		step: 10,
		min:'<%=totalVolumes %>'
	});

	var userSid = "<%=userSid%>";
	var tenantSid = "<%=tenantSid%>";
	var modifyName = $("#panel").kendoValidator().data("kendoValidator");
	$("#modifyWindowSave").click(
			function() {
				if (modifyName.validate()) {
					Core.AjaxRequest({
						url : ws_url + "/rest/sharepoint/setSharepointQuota",
						type : "post",
						params : {
							userSid : userSid,
							tenantSid:tenantSid,
							expandValue : $("#volumes").val()
						},
						callback : function(data) {
							Core.alert({
								title : "提示",
								message : "扩容成功！",
								confirmCallback:function(){
									$("#expansionSharePoint").data("kendoWindow").close();
								}
							});
						},
						failure : function(data) {
							Core.alert({
								title : "提示",
								message : "扩容失败，该数据已被更新或删除！"
							});
						}

					});
				}
			});

	$("#modifyWindowClose").click(function() {
		$("#expansionSharePoint").data("kendoWindow").close();
	});
</script>