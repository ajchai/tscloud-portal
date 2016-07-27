<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title"/></title>
<%@ include file="/pages/common/navigat.jsp"%>
<%
	String sid = request.getParameter("userSid");
	String key = request.getParameter("securityKey");
%>
<style type="text/css">
	 #container{
 		width:800px;
 		margin:0 auto;
 		border:1px solid white;
	 }
</style>

<div id="container">
		<div id="nav-list" >
			<p style="font-size:24px;font-weight:300;color:#666">注册完成</p>
			<img id="img" src="${ctx}/images/register/register_nav3.png"></img>
		</div>
		<div style="width:100%;height:300px;">    
				<table border="0" width="100%" height="100%" >  
					<tr> 
						<td align="center" valign="bottom" height="50%">       
								<img id="img_result" src="" width="50px" height="50px;"></img>
								<span id="title" style="position:relative;bottom:10px;font-size:30px;font-weight:400;color:#770608"></span> 
						</td>   
					</tr> 
					<tr>
						<td align="center" valign="top" height="50%"> 
								<br />
								<p id="relogin" style="margin:0px;padding:0px;"></p> 
						</td> 
					</tr>
   				</table>
		</div>
</div>
<script type="text/javascript">
	// 设置验证的页面的高度
	var bodyh = document.documentElement.clientHeight;
	$("#container").css("min-height",""+(parseInt(bodyh) - 262)+"px");
	
	window.onresize = function(){
		var bodyh = document.documentElement.clientHeight;
		$("#container").css("min-height",""+(parseInt(bodyh) - 262)+"px");
	};
	
	$("#img_result").attr("src",ctx+"/images/register/register-fail.gif");
	$("#title").html("");
	$("#title").html("对不起，您的账号激活失败！");
	$("#relogin").html("");
	$("#relogin").html("可能该账号已被激活或已被删除！");
	
	var userSid = '<%=sid %>';
	var key = '<%=key %>';
	
	Core.AjaxRequest({
		url :ws_url + "/rest/user/testUser?userSid="+userSid+"&passWord="+key, 
		type:"get",
		callback : function (data) {
			$("#img_result").attr("src",ctx+"/images/register/register-success.gif");
			$("#title").html("");
			$("#title").html("恭喜，您的账号已激活成功!");
			$("#relogin").html("");
			$("#relogin").html("<a href="+ctx+"'/pages/login.jsp' style='color:#0099d7'>点此登录惠普云服务平台</a>");
        },
        failure : function(data){
        	$("#img_result").attr("src",ctx+"/images/register/register-fail.gif");
        	$("#title").html("");
			$("#title").html("对不起，您的账号激活失败！");
			$("#relogin").html("");
			$("#relogin").html("可能该账号已被激活或已被删除！");
        }
    });
	</script>	
<%@ include file="/pages/common/footer.jsp"%>