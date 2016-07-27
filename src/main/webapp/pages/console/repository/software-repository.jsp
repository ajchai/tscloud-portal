<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style type="text/css">
		#introduce {
			width: 100%;
			border-bottom: 1px solid #DADADA;
			border-left: 1px solid #DADADA;
			border-right: 1px solid #DADADA;
			border-top: 1px solid #DADADA;
			box-shadow: #DADADA 0px 3px 3px;
		}
		#introduce h3 {
			margin: 0px;
			padding: 15px;
			color: #1F90CA;
			font-weight: 400;
		}
		
		#introduce p {
			margin: 0px;
			font-size: 14px;
			padding-left: 15px;
		}
		.version-content{
			width:100%;
			height:100%;
			display:none;
			font-size:12px;
			border:1px solid #DADADA;
		}
		.version-content-show{
			display:block;
		}
		
		#select-version-content ul{
			width:100%;
			height:100%;
			margin:0px;
			padding:0px;
			list-style:none;
		}
		#select-version-content li{
			position:relative;
			height:30px;
			border:1px solid #f2f2f2;
			border-left:0px;
			border-right:0px;
			border-top:0px;
			text-align:left;
			font-size:12px;
			cursor:pointer;
		}
		
		.selectedDeployment{
			background:#0099d7;
			color:white;
		}
		
	</style>
	<div id="versionControl" style="width: 100%; height: 99.9%; margin: 0px; padding: 0px;">
		<div style="width:100%;height:48px;background:#F9F9F9;color:#000; line-height:48px;border-bottom:1px solid #DADADA">
			&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">软件仓库</font></div>
		<div style="width:99%;margin: 5px 0.5% 5px 0.5%; height:91%;">
			<div id="introduce">
				<h3>软件仓库</h3>
				<p>惠普云管理平台软件仓库通过深度集成版本管理软件,实现对操作系统镜像、软件包及其版本的集中统一管理。通过软件仓库,用户可以以自助的方式获取指定的工程和版本,快速的部署和更新开发测试环境。</p>
			</div>
			<div style="height: 80%; width: 100%; margin-top: 15px; font-size: 14px;">
				<table width="100%" border="0" cellpadding="0" cellspacing="10px">
					<tr>
						<td width="150px" height="30px" align="right">主机信息(选择主机)：</td>
						<td><input id="host"  required  style="width:250px;font-size:12px;" placeholder="请选择..." /></td>
					</tr>
					<tr>
						<td width="80px" height="30px" align="right">应用工程：</td>
						<td><input id="project"  required  style="width:250px;font-size:12px;" placeholder="请选择..." /></td>
					</tr>
					<tr>
						<td width="80px" height="30px" align="right">部署方式：</td>
						<td>
							<input id="branch_version" type="radio" name="deployment"  value="1">按分支(branch)
							<input id="tags_version" type="radio" name="deployment" checked="checked" value="2">按标签(tags)
						</td>
					</tr>
					<tr>
						<td width="80px" height="30px" align="right"></td>
						<td>
							<div id="select-version-content" style="width:400px;min-height:150px;max-height:186px;overflow-x:hidden;overflow-y:auto;border:1px solid #DADADA">
								<div id="div_tags" class="version-content version-content-show">
									<ul id="tags"></ul>
								</div>
								<div id="div_branch" class="version-content">
									<ul id="branch"></ul>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td width="80px" height="50px" align="right"></td>
						<td align="left">
							<button class="k-button" id="save_select_version" style="width:70px; height:32px;" type="submit">部署</button>
						</td>
					</tr>
				</table>
			</div>
	     </div>
	</div>
	
	<script type="text/javascript">
	// 内网ip地址
	var idAddr ="";
	$(function(){
			// 取得所有tags
				Core.AjaxRequest({
				url : ws_url +"/rest/verControl/gitRemoteAllTag",
				type:"get",
				callback : function (data) {
					$("#tags").html("");
					var str = "";
					for(var i=0;i<data.length;i++){
						str +="<li onclick='selectedBranchorTags(this)'><img src='../../images/console/version-selected.png' /><font style='position:absolute;top:8px;left:30px;'>"+data[i]+"</font></li>";
					}
					$("#tags").html(str);
	            },
				failure : function(data){
					Core.alert({title:"提示",message:"获取标签失败！"});
				}
			});
		
			// 取得所有的分支
   			Core.AjaxRequest({
				url : ws_url + "/rest/verControl/gitRemoteAllBranch",
				type:"get",
				callback : function (data) {
					$("#branch").html("");
					var str = "";
					for(var i=0;i<data.length;i++){
						str +="<li onclick='selectedBranchorTags(this)'><img src='../../images/console/version-selected.png' /><font style='position:absolute;top:8px;left:30px;'>"+data[i]+"</font></li>";
					}
					$("#branch").html(str);
	            },
				failure : function(data){
					Core.alert({title:"提示",message:"获取分支失败！"});
				}
			});
			
			$("#branch_version").click(function(){
				$("#div_branch").show();
				$("#div_tags").hide();
			});
			$("#tags_version").click(function(){
				$("#div_tags").show();
				$("#div_branch").hide();
			});
		
	});
	
	Core.AjaxRequest({
		url : ws_url + "/rest/serviceInstance/serviceInstancelist",
		type:"post",
		params:{
			serviceSid : 100,
		},
		callback : function (data) {
            $("#host").kendoDropDownList({
            	    dataTextField: "instanceName",
                    dataValueField: "instanceSid",
                    dataSource:data
            });
        } 
	});
	
	 $("#project").kendoDropDownList({
		 dataTextField: "name",
		 dataValueField: "id",
		 dataSource: [
		        { name: "VersionControlProject", id: 1 }
		 ]
 	 });
	 
	 function selectedBranchorTags(obj){
			$(".selectedDeployment").removeClass("selectedDeployment");
			$(obj).addClass("selectedDeployment");
	 }
	 
	// 部署版本
		$("#save_select_version").click(function(){
			
			if($( $("#host").data("kendoDropDownList").value() == null || "#host").data("kendoDropDownList").value() == ""){
				Core.alert({title:"提示",message:"请选择主机信息！"});
				return;
			}
			var version = $(".selectedDeployment").find("font").html();
			if(version == "undefined" || version == "" || version == null){
				Core.alert({title:"提示",message:"请选择部署分支或标签！"});
				return;
			}
			
			Core.AjaxRequest({
				url : ws_url + "/rest/resourceInstance/" + $("#host").data("kendoDropDownList").value(),
				type : "get",
				async : false,
				callback : function(data) {
					idAddr = data.ip;
				}
			});
			
			Core.AjaxRequest({
				url : ws_url +"/rest/verControl/uploadRemoteProject?serverIp=" + idAddr + "&versionName=" + version,
				type:"get",
				callback : function (data) {
					if(data.status == "success"){
						Core.alert({
							title:"提示",
							message:"应用部署成功！",
							confirmCallback:function(){
								$("#selectWindow").data("kendoWindow").close();
							}
						});
					}
	            },
				failure : function(data){
					Core.alert({title:"提示",message:"该应用版本部署失败！"});
				}
			});
		});
	 
	</script>
	
