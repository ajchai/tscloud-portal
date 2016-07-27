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
				.blackButton:first-child { 
				} 
				#adduser {
					width:100%;
					height:260px;	
				}
				#adduser ul{
					 list-style-type: none; 
			         margin: 0 ; 
			         padding: 0 ; 
				}
				#edituser {
					width:100%;
					height:260px;	
				}
				#edituser ul{
					 list-style-type: none; 
			         margin: 0 ; 
			         padding: 0 ; 
				}
				#resetPassword {
					width:100%;
					height:260px;	
				}
				#resetPassword ul{
					 list-style-type: none; 
			         margin: 0 ; 
			         padding: 0 ; 
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
				&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">服务实例管理</font>
			</div>
			 <div>
			 	 <table  height="30px;" style="font-size:14px;margin:5px 0px 5px 5px" border="0" cellpadding="3" cellspacing="0">
					  <tr>
						<td><span class="k-content">实例名称:</span></td>
						<td>
							<input type="text" id="instanceNameLike" style="font-size:12px;width:150px;" maxlength="16" class="k-textbox" value="" />
						</td>
<!-- 						<td><span class="k-content">:</span></td> -->
<!-- 						<td> -->
<!-- 							<input type="text"   id="realNameLike"  style="font-size:12px;width:150px;" maxlength="64" class="k-textbox" value="" /> -->
<!-- 						</td> -->
						<td><span class="k-content">所属服务:</span></td>
						<td>
							 <select id="serviceOwner" size="1" style="font-size:12px;width:180px;" placeholder="请选择"></select>
						</td>
						<td>
							<button class="k-button"  style="width:50px" type="submit"  onclick="searchTenantUser()">查询</button>
						</td>
					  </tr>
				</table>
				<div id="userGrid" style="width:98%;margin-left:0.8%;font-size:14px;"></div>
			 </div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			    // 初始化datagrid
				Core.AjaxRequest({
					url : ws_url + "/rest/serviceInstance/serviceInstancelist",
					params : {},
					callback : function (data) {
						 initDataGrid(data);
					}
			    });
			 	//初始化所属服务
				Core.AjaxRequest({
					url : ws_url + "/rest/service/findAll",
					params:{
						"canOrder" : "1",
						"serviceStatus" :"03"
					}, 
					callback : function (data) {
						var dataSource= new kendo.data.DataSource({
							data: data,
							schema: {
								model: { id: "serviceSid" }
							}
						});
						dataSource.fetch(function() {
							dataSource.insert(0, { "serviceName": "全部", "serviceSid": "" });
						});
		                $("#serviceOwner").kendoDropDownList({
		                	    dataTextField: "serviceName",
		                        dataValueField: "serviceSid",
		                        placeholder: "请选择...",
		                        dataSource:dataSource,
		                        index: 0
		                });
		            } 
		       });
		});
		
		// 初始化datagrid
		function initDataGrid(data){
			$("#userGrid").kendoGrid({
				dataSource: data,
				sortable: true,
				pageable:true,
				columns: [ 
			           {field: "instanceName",title: "实例名称"} ,
			           {field: "serviceName",title: "所属服务"} ,
			           {field: "statusName",title: "实例状态"} , 
			           {field: "billingTypeName",title: "计费类型"} ,
			           {field: "creationDateBegin",title: "开通时间"} ,
			           {field: "creationDateEnd",title: "到期时间"} ,
			           {command :[{text : "退订",click :unsubscribeService }],title : "操作"} 
				 ]
		    });
		}
		// 查询租户用户
		function searchTenantUser(){
			Core.AjaxRequest({
				url : ws_url + "/rest/serviceInstance/serviceInstancelist",
				params : {
					"instanceNameLike": ($("#instanceNameLike").val() =="")? null : $("#instanceNameLike").val(),
					"serviceSid": ($("#serviceOwner").val() == "") ? null : $("#serviceOwner").val()
				},
				callback : function (data) {
					 initDataGrid(data);
				}
		   });
		}
		
		// 退订服务
		function unsubscribeService(e){
			var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
			Core.alert({
				title:"提示",
				message:"确定要退订该服务吗？",
				confirmCallback:function(){
					Core.AjaxRequest({
						url : ws_url + "/rest/serviceInstance/release/"+dataItem.instanceSid,
						type:"get",
						callback : function (data) {
							Core.alert({
								title:"提示",
								message:"退订成功！",
								confirmCallback:function(){
									// 初始化datagrid
									Core.AjaxRequest({
										url : ws_url + "/rest/serviceInstance/serviceInstancelist",
										params : {},
										callback : function (data) {
											 initDataGrid(data);
										}
								    });
								}
							});
						},
						failure : function(){
							Core.alert({
								title:"提示",
								message:"退订失败！",
								confirmCallback:function(){
									// 初始化datagrid
									Core.AjaxRequest({
										url : ws_url + "/rest/serviceInstance/serviceInstancelist",
										params : {},
										callback : function (data) {
											 initDataGrid(data);
										}
								    });
								}
							});
						}
				   });
				}
			});
		}
	</script>