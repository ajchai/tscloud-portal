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
	String userSid = request.getParameter("userSid");
	String tenantSid = request.getParameter("tenantSid");
%>
<div style="min-height: 0px">
	<div class="panel" id="panel" style="margin-bottom: 10px">
		<ul id="monify">
			<li style="margin: 16px 0 20px 0">
		    	<label for="newResInstanceName" style="width:150px;" class="required"><font style="color: red">＊</font>容量(MB)：</label> 
				<input id="volumes" type="number" style="width: 100px; font-size: 12px" required="true" />
			</li>
			<li style="margin: 16px 0 20px 0">
		    	<label for="newResInstanceName" style="width:150px;" class="required"><font style="color: red">＊</font>用户数量(人)：</label> 
				<input id="userLimit" type="number" style="width: 100px; font-size: 12px" required="true" />
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
	var resExInstanceSid;
	var userSid = "<%=userSid%>";
	var tenantSid = "<%=tenantSid%>";
	var modifyName = $("#panel").kendoValidator().data("kendoValidator");
	// 获取当前单个用户最大容量
	Core.AjaxRequest({
		url : ws_url + "/rest/exchanges/details/"+114+"/"+tenantSid+"",
		type : "get",
		async : false,
		callback : function(data) {
			resExInstanceSid = data[0].resInstanceSid;
			
			// 初始化容量
			$("#volumes").kendoNumericTextBox({
				step: 10,
				min:200,
				max:2048,
				value: data[0].singleMailboxCapacity
			});
			// 初始化用户数量
			$("#userLimit").kendoNumericTextBox({
				step: 1,
				min:data[0].userAmount,
				max:200,
				value: data[0].userAmount
			});
			
		}
	});
	
	$("#modifyWindowSave").click(function() {
				if (modifyName.validate()) {
					Core.AjaxRequest({
						url : ws_url + "/rest/exchange/setExchangeQuota",
						type : "post",
						params : {
							userSid : userSid,
							tenantSid:tenantSid,
							resInstanceSid:""+resExInstanceSid+"",
							expandValue : $("#volumes").val(),
							userLimit : $("#userLimit").val()
						},
						callback : function(data) {
							Core.alert({
								title : "提示",
								message : "扩容成功！"
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
		$("#expansionExchange").data("kendoWindow").close();
	});
</script>