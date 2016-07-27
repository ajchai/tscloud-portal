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
	String resInstanceSid =request.getParameter("resInstanceSid");
%>
<div style="min-height: 0px;height:58%">
	<div class="panel" id="panel" style="margin-bottom: 10px;height:100%">
	<table width="100%" height="100%"style="text-align: center; ">
		<tr>
			<td style="text-align: right;">
			<label><font style="color: red">＊</font>镜像名称：</label>
			</td>
			<td style="text-align: left;">
			<input type="text" id="imageName" class="k-textbox"
				name="imageName" required style="width:200px"
				validationMessage="不能为空！" />
			</td>
		</tr>
	</table>
	</div>

	<button class="k-button" id="vmImageWindowClose"
		style="width: 70px; height: 32px; float: right; margin-right: 12px;" type="submit">关闭</button>
	<button class="k-button" id="vmImageWindowSave"
		style="width: 70px; height: 32px; float: right; margin-right: 9px;"
		type="submit">保存</button>
</div>

<script type="text/javascript">
var resInstanceSid = "<%=resInstanceSid%>";
var modifyName = $("#panel").kendoValidator().data("kendoValidator");
$("#vmImageWindowSave").click(function() {
	if(modifyName.validate()){
		//北向接口取得服务实例数据
		var imageName=$("#imageName").val();
		Core.AjaxRequest({
			url : ws_url + "/rest/resourceInstance/cloneTemplate?resourceInstanceSid="+resInstanceSid+"&imageName="+imageName,
			type:"get",
			callback : function(data) {
				Core.alert({
					title:"提示",
					message:"制作新镜像成功！",
					confirmCallback:function(){
						$("#vmImageWindow").data("kendoWindow").close();
					}
				});
			},
			failure:function(data){
				Core.alert({title:"提示",message:"制作新镜像失败!"});
			}
		});
	}
});

	$("#vmImageWindowClose").click(function() {
		$("#vmImageWindow").data("kendoWindow").close();
	});
</script>