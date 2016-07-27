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
	String tenantSid = request.getParameter("tenantSid");
%>
<div style="min-height: 0px">
	<div class="panel" id="panel" style="margin-bottom: 10px;width:100%;height:180px;">
		<table border="0" cellspacing="10" style="font-size:14px;" cellpadding="0" width="100%">
			 <tr>
			 	  <td width="120px" align="right">邮箱访问地址:</td>
			 	  <td><span id="emailAddress"> mail.parkservice.com.cn</span></td>
			 </tr>
			 <tr>
			 	  <td align="right">Web邮箱访问地址:</td>
			 	  <td><span id="webEmailAddress">https://mail.parkservice.com.cn/owa/</span></td>
			 </tr>
			 <tr>
			 	  <td align="right">邮箱域名:</td>
			 	  <td><span id="emailDomain"></span></td>
			 </tr>
			 <tr>
			 	  <td align="right">单个用户邮箱容量:</td>
			 	  <td><span id="singleUserVolume"></span></td>
			 </tr>
			  <tr>
			 	  <td align="right">用户数量:</td>
			 	  <td><span id="userConunt"></span></td>
			 </tr>
		</table>
	</div>

	<button class="k-button" id="modifyWindowClose"
		style="width: 70px; height: 32px; float: right; margin-right: 12px;"
		type="submit">关闭</button>
	
</div>

<script type="text/javascript">
	
	var tenantSid = "<%=tenantSid%>";
	
	Core.AjaxRequest({
		url : ws_url + "/rest/exchanges/details/"+114+"/"+tenantSid+"",
		type : "get",
		async : false,
		callback : function(data) {
			$("#emailDomain").html(data[0].allocateDomain);
			$("#singleUserVolume").html(data[0].singleMailboxCapacity+"(MB)");
			$("#userConunt").html(data[0].userAmount+"(人)");
		},
		failure : function(data) {
			Core.alert({
				title : "提示",
				message : "对不起，该数据已被更新或删除！"
			});
		}

	});
	
	$("#modifyWindowClose").click(function() {
		$("#showDetailExchange").data("kendoWindow").close();
	});
</script>