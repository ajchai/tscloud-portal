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
	String imageSid = request.getParameter("imageSid");
	String udName = request.getParameter("udName");
	String version = request.getParameter("version");
%>
<div style="min-height: 0px">
	<div class="panel" id="panel" style="margin-bottom: 10px">
		<ul id="monify">
			<li style="margin: 16px 0 20px 0">
				<label for="udName" class="required"><font style="color: red">＊</font>镜像名称：</label> 
				<input type="text" id="udName" name="udName" class="k-textbox"  maxlength="64"  value="<%=udName %>" style="height:28px" placeholder=""  required validationMessage="不能为空！" data-pattern-msg="请输入英文或数字！"/>
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

	var imageSid = "<%=imageSid %>";
	var version = "<%=version %>";
	var modifyName = $("#panel").kendoValidator().data("kendoValidator");
	$("#modifyWindowSave").click(
			function() {
				if (modifyName.validate()) {
					Core.AjaxRequest({
						url : ws_url + "/rest/images/updateImages",  
						type : "post",
						params : {
							imageSid : imageSid,
							udImageName : $("#udName").val(),
							version : version
						},
						callback : function(data) {
							Core.alert({
								message : "修改镜像名称成功！",
								confirmCallback : function() {
									$("#modifyImagesName").data("kendoWindow").close();
									//刷新列表
									getGridData();
								}
							});
						},
						failure : function(data) {
							Core.alert({
								message : "镜像名称修改失败，该数据已被更新或删除！",
								confirmCallback : function() {
									$("#modifyImagesName").data("kendoWindow").close();
								}
							});
						}
					});
				}
			});

	$("#modifyWindowClose").click(function() {
		$("#modifyImagesName").data("kendoWindow").close();
	});
</script>