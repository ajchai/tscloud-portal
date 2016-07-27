<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<style type="text/css">
			 	html,body{
					margin: 0px;
					padding: 0px;
					font-family:"微软雅黑","Microsoft Yahei",Georgia,Serif;
					visibility: visible;
					width:100%;
					height:100%; 
				}
				.blackButton{
					margin:0px;
					width:100px;
				}
				#introduce {
					width: 100%;
					height: 100px;
					margin-bottom:7px;
					border-bottom: 1px solid #DADADA;
					border-left: 1px solid #DADADA;
					border-right: 1px solid #DADADA;
					border-top: 1px solid #DADADA;
					box-shadow: #DADADA 0px 3px 3px;
				}
				
				#introduce h3 {
					position:relative;
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
				label {
			         display: inline-block;
			         width: 110px;
			         text-align: right;
			     }

			     .k-grid-toolbar{
			     	margin:0px;
			   		padding-left:0px;
			   		padding-right:0px;
			     	width:100%;
			     }

				.k-menu.k-header,.k-menu .k-item {
					border: 0px ;
				}
		
				.k-state-default {
					margin-left:1px;
					background-color: #474544 !important;
					color : #fff;
				}
				
				.k-state-disabled .k-link  {
					margin-left:1px;
					background-color: #999 !important;
				}
				
				.k-dropdown-wrap.k-state-default  {
					background-color: #fff !important;
				}
		</style>
	     <div style="width:100%;height:100%;margin:0px;padding:0px;">
			<div style="width:100%;height:48px;background:#F9F9F9;color:#000; line-height:48px;border-bottom:1px solid #DADADA">
				&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">企业邮箱服务</font>
			</div>
			 <div style="width:99%;margin-left:0.5%;height:92%;margin-top:5px;">
			 	<div id="introduce">
					<h3>SharePoint服务 
						<button id="destroyButton" class="k-button" style="position:absolute;right:110px;top:10px;width:100px;margin-right:10px;" type="submit" onclick="expansionVolumes()">扩容</button>
						<button id="destroyButton" class="k-button" style="position:absolute;right:0px;top:10px;width:100px;margin-right:10px;" type="submit" onclick="destroysharepoint()">退订</button>
					</h3>
					<p>SharePoint服务为企业用户提供基于微软SharePoint平台的工作流扩展。用户无需编写代码就可以快速、便捷地设计任务表单和业务流程，从而帮助企业用户进一步拓展SharePoint平台的内容管理，内外部协同和企业业务流程管理能力，并可将SharePoint平台和企业其他业务系统进行集成。</p>
				</div>
				<div id="userGrid" style="width:100%; height:80%;font-size:14px;">
						<table width="500px" height="50%" border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td align="right">SharePoint地址：</td>
								<td><font id="spAddress"></font></td>
							</tr>
							<tr>
								<td align="right">存储容量：</td>
								<td><font id="volume"></font></td>
							</tr>
							<tr>
								<td align="right">已使用空间 ：</td>
								<td><font id="usedVolume"></font></td>
							</tr>
							<tr>
								<td align="right">未使用空间 ：</td>
								<td><font id="unUsedVolume"></font></td>
							</tr>
							<tr>
								<td align="right">站点数量：</td>
								<td><font id="webs"></font></td>
							</tr>
							<tr>
								<td align="right">站点用户数：</td>
								<td><font id="websUser"></font></td>
							</tr>
						</table>
				</div>
			 </div>
	</div>
	<div id="expansionSharePoint"></div>
	
	<script type="text/javascript">
     	var  totalVolumes;
		$(function(){
			// 查询sharepoint地址
			Core.AjaxRequest({
				url :ws_url + "/rest/sharepoint/getSPAddress", 
				type:"get",
				callback : function (data) {
				   $("#spAddress").html(data.allocateSharepointAddress);	
	            }
			});
			
			// 查询详细信息
			Core.AjaxRequest({
				url :ws_url + "/rest/sharepoint/findTenantSharePointService", 
				type:"get",
				callback : function (data) {
					var usedV,unUsedV;
					for(var i=0;i<data.length;i++){
						if(data[i].name == "usedspace"){
							// 已使用存储空间
							$("#usedVolume").html(data[i].instances[0].value + " MB");
							usedV = data[i].instances[0].value;
						}else if(data[i].name == "unusedspace"){
							// 未使用存储空间
							$("#unUsedVolume").html(data[i].instances[0].value + " MB");
							unUsedV = data[i].instances[0].value;
						}else if(data[i].name == "webs"){
							// 站点数量
							$("#webs").html(data[i].instances[0].value +" 个");
						}else if(data[i].name == "users"){
							// 站点用户数
							$("#websUser").html(data[i].instances[0].value + " 人");
						}
					}
					$("#volume").html(Number(usedV) + Number(unUsedV) + "MB");
					totalVolumes = Number(usedV) + Number(unUsedV);
	            } 
	         });
		});	
		
		// 退订exchange服务
		function destroysharepoint(){
			Core.AjaxRequest({
				url : ws_url + "/rest/sharepoint/destroySharepoint",
				type : "get",
				callback : function (data) {
					Core.alert({title:"提示",message:"SharePoint退订成功 ! "});
				},
				failure : function (data) {
					Core.alert({title:"提示",message:"SharePoint退订失败 ! "});
				}
		   });
		}
		
		// 扩容
		function expansionVolumes(){
			//修改资源实例名称Window
			var expansionSharePoint = $("#expansionSharePoint").kendoWindow({
				title : "扩容",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/sharepoint/sharepoint-expansion.jsp?userSid="+currentUser.userSid+"&tenantSid="+currentUser.tenantSid+"&totalVolumes="+totalVolumes,
				width :500,
				height:126
			}).data("kendoWindow");
			expansionSharePoint.center().open();
		}
	</script>
	