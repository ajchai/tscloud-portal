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
				&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">企业云盘服务</font>
			</div>
			 <div style="width:99%;margin-left:0.5%;height:92%;margin-top:5px;">
			 	<div id="introduce">
					<h3>企业云盘服务 <button class="k-button" style="position:absolute;right:0px;top:10px;width:100px;margin-right:10px;" type="submit" onclick="gotoDisk()">进入云盘</button></h3>
					<p>SharePoint服务为企业用户提供基于微软SharePoint平台的工作流扩展。用户无需编写代码就可以快速、便捷地设计任务表单和业务流程，从而帮助企业用户进一步拓展SharePoint平台的内容管理，内外部协同和企业业务流程管理能力，并可将SharePoint平台和企业其他业务系统进行集成。</p>
				</div>
				<div id="userGrid" style="width:100%; height:80%;font-size:14px;">
						<table width="400px" height="50%" border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td align="right">企业云盘大小：</td>
								<td>10GB</td>
							</tr>
							<tr>
								<td align="right">用户数量：</td>
								<td>5个</td>
							</tr>
							<tr>
								<td align="right">已使用空间：</td>
								<td>2.3GB</td>
							</tr>   
							<tr>
								<td align="right">未使用空间 ：</td> 
								<td>2.7GB</td>
							</tr>
							<tr>
								<td align="right">站点数量：</td>
								<td>23</td>
							</tr>
							<tr>
								<td align="right">站点用户数：</td>
								<td>10</td>
							</tr>
						</table>
				</div>
			 </div>
	</div>
	<script type="text/javascript">
			function gotoDisk(){
				// 跳转到云盘
				window.location.href = ctx +"/pages/cloudDisk/disk-index.jsp"
			}
	</script>