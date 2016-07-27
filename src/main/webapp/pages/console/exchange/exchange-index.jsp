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
					<h3>Exchange邮件服务 
					    <button class="k-button" style="position:absolute;right:220px;top:10px;width:100px;margin-right:10px;" type="submit" onclick="expandCapacity()">扩容</button>
					    <button class="k-button" style="position:absolute;right:110px;top:10px;width:100px;margin-right:10px;" type="submit" onclick="exchangeDetail()">详情</button>
						<button class="k-button" style="position:absolute;right:0px;top:10px;width:100px;margin-right:10px;" type="submit" onclick="destroyexchange()">退订</button>
					</h3>
					<p>邮件服务为企业提供一流的企业邮局运营，最专业的服务品质保障。选择模块化的邮箱配置方案，享受企业邮局强大功能，体验多种方式收发邮件，体现您公司的规范形象与实力。</p>
				</div>
				<div> 
					<div id="userGrid" style="width:100%;font-size:14px;"></div>				
				</div>
			 </div>
	</div>
	<script type="text/x-kendo-template" id="template">
                <div class="toolbar">
                       <ul id="menu-images"></ul>
                </div>
    </script>
    <!-- 新增用户邮箱 -->
	<div id="addUserWindow" style="position:relative;margin:0px;padding:0px;overflow:hidden;display:none">
				<div id="adduser" style="width:790px;margin-left:4px;height:340px;margin-top:3px">
						 
				</div>
				<div style="position:absolute;bottom:0px;width:100%;height:50px;background:#fff;border-top:1px solid #DBDBDE;line-height:45px;text-align:right">
						<button class="k-button" id="confirmOrder" style="width:50px" type="submit" onclick="addAllocatedEmail()">添加</button>
						<button class="k-button" style="width:50px;margin-right:10px;" type="submit" onclick="closeAddWindow()">取消</button>
				</div>
	</div>
	<div id="expansionExchange"></div>
	<div id="showDetailExchange"></div>
	
	<script type="text/javascript">
	    var userLimitCount,currentCount;
		$(function(){
			
			    // 初始化datagrid
				Core.AjaxRequest({
					url : ws_url + "/rest/exchange/getAllocatedUser?serviceSid="+114+"&tenantSid="+currentUser.tenantSid,
					type : "get",
					async : false,
					callback : function (data) {
						 initDataGrid(data);
					}
			   });
				 // 初始化未分配邮箱的用户datagrid
				Core.AjaxRequest({
					url : ws_url + "/rest/exchange/getUnallocatedUser?tenantSid="+currentUser.tenantSid,
					type : "get",
					callback : function (data) {
						initUnUserDataGrid(data);
					}
			   });
				 
				Core.AjaxRequest({
					url : ws_url + "/rest/exchanges/details/"+114+"/"+currentUser.tenantSid+"",
					type : "get",
					async : false,
					callback : function(data) {
						// 最多分配用户数量
						userLimitCount = data[0].userAmount;
					},
					failure : function(data) {
					}

				});
		});
		// 初始化datagrid
		function initUnUserDataGrid(data){
			var index = 0;
			$("#adduser").kendoGrid({
				dataSource : {
					data : data,
					pageSize : 7
				},
				sortable : true,
				pageable : true,
				selectable : "single,row",
				scrollable : false,
				columns : [ 
				{
					field : "",
					title : "",
					width:"72px",
					template: function(dataItem) {
						return ++index;
					 },
				    attributes: {
				        style: "text-align: center;"
				    }
				},
				{
					field : "account",
					title : "用户账号"
				}, {
					field : "realName",
					title : "用户姓名"
				}, {
					field : "tenantName",
					title : "所属租户"
				}],
				change : function(e) {
					var selectedRows = this.select();
					var dataItem = this.dataItem(selectedRows);
				}
			});
		}
		// 初始化datagrid
		function initDataGrid(data){
			$("#userGrid").kendoGrid({
				dataSource : {
					data : data,
					pageSize : 10
				},
				sortable: true,
				pageable:true,
				toolbar: kendo.template($("#template").html()),
				columns: [ 
				           {field: "account",title: "用户账号"} ,
				           {field: "realName",title: "用户名称"} ,
				           {field: "alloctedEmailAccount",title: "分配邮箱账号"},
				           {command : [{text : "取消",click : removeUserEmail}],title : "操作",width : 189}
				],
				selectable: "single,row",
				change : function(e) {
					var selectedRows = this.select();
					var dataItem = this.dataItem(selectedRows);
				}
		    });
			
			//grid 操作菜单
			$("#menu-images").kendoMenu(
					{
						dataSource : [ {
							text : "新增用户邮箱",
							imageUrl : ctx + "/images/console/add_enable.png",
							disabled : "disabled"
						}],
						select : function(e) {
							var operation = $(e.item).children(".k-link")
									.text();
							if (operation == "新增用户邮箱") {
								addUserPage();
							}
						}
			});
			
		}
		
		// 删除用户邮箱
		function removeUserEmail(e){
			var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
			
			Core.alert({
				title:"提示",
				message:"您确定要删除该用户的企业邮箱吗？",
				confirmCallback:function(){
					Core.AjaxRequest({
						url : ws_url + "/rest/exchange/deleteUserExEmail?userSid=" + dataItem.userSid,
						type:"get",
						callback : function (data) {
							Core.alert({
								title:"提示",
								message:"删除成功!",
								confirmCallback:function(){
									 // 初始化datagrid
									Core.AjaxRequest({
										url : ws_url + "/rest/exchange/getAllocatedUser?serviceSid="+114+"&tenantSid="+currentUser.tenantSid,
										type : "get",
										async : false,
										callback : function (data) {
											 initDataGrid(data);
										}
									});
									
									 // 初始化未分配邮箱的用户datagrid
									Core.AjaxRequest({
										url : ws_url + "/rest/exchange/getUnallocatedUser?tenantSid="+currentUser.tenantSid,
										type : "get",
										async : false,
										callback : function (data) {
											initUnUserDataGrid(data);
										}
								   });
								$("#addUserWindow").kendoWindow('close');
							}
						  })
						},
						failure : function(data){
							Core.alert({title:"提示",message:"对不起，删除失败!"},function(){
								
							});
						}
				   });
				}
			});
			
			
		}
		
		// 新增用户邮箱页面
		function addUserPage(){
			 	// 判断添加邮箱用户的数量是否超过了限制数量
				Core.AjaxRequest({
					url : ws_url + "/rest/exchange/getAllocatedUser?serviceSid="+114+"&tenantSid="+currentUser.tenantSid,
					type : "get",
					async : false,
					callback : function (data) {
						currentCount = data.length;
					}
			   });
				 if(currentCount >= userLimitCount){
					 Core.alert({title:"提示",message:"对不起，已达到最大用户限制!"},function(){
							return;
					 });
				 }else{
					// 已选择data数据
						var window = $("#addUserWindow").kendoWindow({
				               title: "新增用户邮箱",
				               modal: true,
				               visible: false,
				               iframe:false,
				               resizable: true,
				               width: "800px",
								height: "400px",
								content: ""
				           }).data("kendoWindow");
						// window的显示位置
						window.center().open();	
				 }
		}
		
		// 新增用户邮箱
		function addAllocatedEmail(){
			
			var json =new Object();
			json.tenantSid = currentUser.tenantSid;
			
			var grid = $("#adduser").data("kendoGrid");
			var row = grid.select();
			var data = grid.dataItem(row);
			
			json.user = new Array();
			var att = new Object();
			att.userSid = data.userSid;
			json.user.push(att);
			
			Core.AjaxRequest({
				url : ws_url + "/rest/exchange/addExchangeUsers",
				params : json,
				callback : function (data) {
					Core.alert({
						title:"提示",
						message:"添加成功!",
						confirmCallback:function(){
							 // 初始化datagrid
							Core.AjaxRequest({
								url : ws_url + "/rest/exchange/getAllocatedUser?serviceSid="+114+"&tenantSid="+currentUser.tenantSid,
								type : "get",
								async : false,
								callback : function (data) {
									 initDataGrid(data);
								}
							})
						$("#addUserWindow").kendoWindow('close');
					}
				  })	
				},
				failure : function(data){
					Core.alert({title:"提示",message:"对不起，添加失败!"},function(){
						$("#addUserWindow").kendoWindow('close');
					});
				}
		   });
		}
		// 关闭window
		function closeAddWindow(){
			$("#addUserWindow").kendoWindow('close');
		}
	
		// 查询租户用户
		function searchTenantUser(){
			Core.AjaxRequest({
				url : ws_url + "/rest/user/findUsers",
				params : {
					"account": ($("#accountLike").val() =="")? null:$("#accountLike").val(),
					"realNameLike": ($("#realNameLike").val() =="")? null : $("#realNameLike").val(),
					"status": ($("#userStatus").val() == "") ? null : $("#userStatus").val()
				},
				callback : function (data) {
					 initDataGrid(data);
				}
		   });
		}
		
		// 退订exchange服务
		function destroyexchange(){
			Core.confirm({
				title:"请选择",
				message:"退订后您的邮箱数据将全部丢失，您确定要退订该企业邮箱服务吗？",
				confirmCallback:function(){
					Core.AjaxRequest({
						url : ws_url + "/rest/exchange/destroyExchange",
						type : "get",
						callback : function (data) {
							Core.alert({
								title:"提示",
								message:"Exchange退订成功 ! ",
								confirmCallback:function(){
									// 成功就跳转到自服务中心默认页面
									window.location.href = ctx+"pages/console/console.jsp";
								}
							});
						},
						failure : function (data) {
							Core.alert({title:"提示",message:"Exchange退订失败 ! "});
						}
				   });
					
				 }
		    });
		}
		
		// 查看exchange服务的详情
		function exchangeDetail(){
			// 查看Exchange详细信息
			var detailExchange = $("#showDetailExchange").kendoWindow({
				title : "Exchange详情",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/exchange/exchange-detail.jsp?&tenantSid="+currentUser.tenantSid,
				width :500,
				height:250
			}).data("kendoWindow");
			detailExchange.center().open();
		}
		
		// exchange扩容操作
		function expandCapacity(){
			//修改资源实例名称Window
			var expansionExchange = $("#expansionExchange").kendoWindow({
				title : "扩容",
				modal : true,
				visible : false,
				resizable : false,
				content : ctx + "/pages/console/exchange/exchange-expansion.jsp?userSid="+currentUser.userSid+"&tenantSid="+currentUser.tenantSid,
				width :420,
				height:175
			}).data("kendoWindow");
			expansionExchange.center().open();
		}
	</script>