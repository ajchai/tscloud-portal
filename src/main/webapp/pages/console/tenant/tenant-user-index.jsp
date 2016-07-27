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
				&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">租户用户管理</font>
			</div>
			 <div>
			 	 <table  height="30px;" style="font-size:14px;margin:5px 0px 5px 5px" border="0" cellpadding="3" cellspacing="0">
					  <tr>
						<td><span class="k-content">用户账号:</span></td>
						<td>
							<input type="text" id="accountLike" style="font-size:12px;width:150px;" maxlength="16" class="k-textbox" value="" />
						</td>
						<td><span class="k-content">用户名称:</span></td>
						<td>
							<input type="text"   id="realNameLike"  style="font-size:12px;width:150px;" maxlength="64" class="k-textbox" value="" />
						</td>
						<td><span class="k-content">用户状态:</span></td>
						<td>
							 <select id="userStatus" size="1" style="font-size:12px;width:120px;" placeholder="请选择"></select>
						</td>
						<td>
							<button class="k-button"  style="width:50px" type="submit"  onclick="searchTenantUser()">查询</button>
						</td>
					  </tr>
				</table>
				<div id="userGrid" style="width:98%;margin-left:0.8%;font-size:14px;"></div>
			 </div>
	</div>
	<script type="text/x-kendo-template" id="template">
                <div class="toolbar">
                       <ul id="menu-images"></ul>
                </div>
    </script>
    <!-- 新增用户 -->
	<div id="addUserWindow" style="position:relative;margin:0px;padding:0px;overflow:hidden;display:none">
				<div id="adduser" >
						 <ul>
				                <li style="margin: 8px 0 0 0">
				                    <label for="account" class="required"><font style="color:red">＊</font>用户账号:</label>
				                    <input type="text" id="account" name="account" class="k-textbox" onchange="checkDuplicate()" maxlength="64" style="width:190px;height:28px" placeholder="" required validationMessage="不能为空！" />
				                </li>
				                <li style="margin: 8px 0 0 0">
				                   <label for="realName" class="required"><font style="color:red">＊</font>用户名称:</label>
				                    <input type="text" id="realName" name="realName" class="k-textbox"  maxlength="64" style="width:190px;height:28px" placeholder="" required validationMessage="不能为空！" />
				                </li> 
				                <li style="margin: 8px 0 0 0">
				                    <label for="password" class="required"><font style="color:red">＊</font>密码:</label>
				                    <input type="password" id="password" name="password"  maxlength="64" class="k-textbox"  style="width:190px;height:28px" required validationMessage="不能为空！" />
				                </li>
				                <li style="margin: 8px 0 0 0">
				                    <label for="mobile" >联系电话:</label>
				                    <input type="text" id="mobile"  class="k-textbox" maxlength="64"  pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"   name="contactPhone"  style="width:190px;height:28px" validationMessage="请输入正确的电话号码！"/>
				                </li>
				                <li style="margin: 8px 0 0 0">
				                    <label for="email"  class="required"><font style="color:red">＊</font>邮箱:</label>
				                    <input type="email" id="email"  name ="email"class="k-textbox"   style="width:190px;height:28px" required validationMessage="不能为空！" data-email-msg="请输入正确的邮箱格式！"/>
				                </li>
				         </ul>
				</div>
				<div style="position:absolute;bottom:0px;width:100%;height:50px;background:#fff;border-top:1px solid #DBDBDE;line-height:45px;text-align:right">
						<button class="k-button" id="confirmOrder" style="width:50px" type="submit" onclick="addUser()">保存</button>
						<button class="k-button" style="width:50px;margin-right:10px;" type="submit" onclick="closeAddWindow()">取消</button>
				</div>
	</div>
	
	<!-- 编辑用户 -->
	<div id="editUserWindow" style="position:relative;margin:0px;padding:0px;overflow:hidden;display:none">
	             <input type="hidden" id="userSid" value=""/> 
				<div id="edituser" >
						 <ul>
				                <li style="margin: 8px 0 0 0">
				                    <label for="account" class="required"><font style="color:red">＊</font>用户账号:</label>
				                    <span id="account"></span>
				                </li>
				                <li style="margin: 8px 0 0 0">
				                   <label for="realName" class="required"><font style="color:red">＊</font>用户名称:</label>
				                    <input type="text" id="realName" name="realName" class="k-textbox"  maxlength="64" style="width:190px;height:28px" placeholder="" required validationMessage="不能为空！" />
				                </li> 
				                <li style="margin: 8px 0 0 0">
				                    <label for="mobile" >联系电话:</label>
				                    <input type="text" id="mobile"  class="k-textbox" maxlength="64"  pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"   name="contactPhone"  style="width:190px;height:28px" validationMessage="请输入正确的电话号码！"/>
				                </li>
				                <li style="margin: 8px 0 0 0">
				                    <label for="email"  class="required"><font style="color:red">＊</font>邮箱:</label>
				                    <input type="email" id="email"  class="k-textbox"  name="sd"  style="width:190px;height:28px" required validationMessage="不能为空！" data-email-msg="请输入正确的邮箱格式！"/>
				                </li>
				         </ul>
				</div>
				<div style="position:absolute;bottom:0px;width:100%;height:50px;background:#fff;border-top:1px solid #DBDBDE;line-height:45px;text-align:right">
						<button class="k-button" style="width:50px" type="submit" onclick="updateUserInfo()">保存</button>
						<button class="k-button" style="width:50px;margin-right:10px;" type="submit" onclick="closeEditWindow()">取消</button>
				</div>
	</div>
	
	<!-- 重置密码 -->
	<div id="resetPasswordWindow" style="position:relative;margin:0px;padding:0px;overflow:hidden;display:none">
	<input type="hidden" id="userSid1" value=""/> 
				<div id="resetPassword" >
						 <ul>
				                <li style="margin: 8px 0 0 0">
				                    <label for="account" class="required"><font style="color:red">＊</font>用户账号:</label>
				                    <span id="account"></span>
				                </li>
				                <li style="margin: 8px 0 0 0">
				                   <label for="password" class="required"><font style="color:red">＊</font>新密码:</label>
				                    <input type="password" id="oldPassword" name="password" class="k-textbox" onchange="checkPasswordSame()" maxlength="64" style="height:28px" placeholder="" required validationMessage="不能为空！" />
				                </li> 
				                <li style="margin: 8px 0 0 0">
				                    <label for="confirmPassword"><font style="color:red">＊</font>确认新密码:</label>
				                    <input type="password" id="confirmPassword" name="confirmPassword"  maxlength="64" onchange="checkPasswordSame()" class="k-textbox" required validationMessage="不能为空！" style="height:28px" />
				                </li>
				         </ul>
				</div>
				<div style="position:absolute;bottom:0px;width:100%;height:50px;background:#fff;border-top:1px solid #DBDBDE;line-height:45px;text-align:right">
						<button class="k-button" id="" style="width:50px" type="submit" onclick="saveNewPassword()">保存</button>
						<button class="k-button" style="width:50px;margin-right:10px;" type="submit" onclick="closeResetPasswordWindow()">取消</button>
				</div>
	</div>
	
	<script type="text/javascript">
		var saveuser = $("#adduser").kendoValidator().data("kendoValidator");
		var edituser = $("#edituser").kendoValidator().data("kendoValidator");
		var resetPasswd = $("#resetPassword").kendoValidator().data("kendoValidator");
		
		// 检查账号是否重复
		function checkDuplicate(){
			if($("#adduser #account").val() == "" || $("#adduser #account").val() == null){
				return;
			}else{
				Core.AjaxRequest({
				url :ws_url + "/rest/user/validateUserAccount?account=" + $("#adduser #account").val(), 
				type:"get",
				callback : function (data) {
					if(data.status == "success"){ 
				    }else{
				    	 Core.alert({title:"提示",message:"该用户名不可用，请重新输入！"});
				    }
	            } 
	         });
			}
		}
		
		$(function(){
			    // 初始化datagrid
				Core.AjaxRequest({
					url : ws_url + "/rest/user/findUsers",
					params : {},
					callback : function (data) {
						 initDataGrid(data);
					}
			   });
			 	//初始化用户状态
				Core.AjaxRequest({
					url :ws_url + "/rest/system/USER_STATUS", 
					type:"get",
					callback : function (data) {
						var dataSource= new kendo.data.DataSource({
							data: data,
							schema: {
								model: { id: "codeSid" }
							}
						});
						dataSource.fetch(function() {
							dataSource.insert(0, { "codeDisplay": "全部", "codeValue": "" });
						});
		                $("#userStatus").kendoDropDownList({
		                	    dataTextField: "codeDisplay",
		                        dataValueField: "codeValue",
		                        placeholder: "请选择...",
		                        dataSource:dataSource,
		                        index: 0
		                });
		            } 
		       });
				
		});
		
		//初始化menu 关闭
		function initCloseMenu() {
			getItem("1").find("img").attr("src","/tscloud-portal/images/console/edit.png");
			$("#menu-images").data("kendoMenu").enable(getItem("1"), false);
			getItem("2").find("img").attr("src","/tscloud-portal/images/console/remove.png");
			$("#menu-images").data("kendoMenu").enable(getItem("2"), false);
			getItem("3").find("img").attr("src","/tscloud-portal/images/console/enable.png");
			$("#menu-images").data("kendoMenu").enable(getItem("3"), false);
			getItem("4").find("img").attr("src","/tscloud-portal/images/console/cancel.png");
			$("#menu-images").data("kendoMenu").enable(getItem("4"),false);
			getItem("5").find("img").attr("src","/tscloud-portal/images/console/changepassword.png");
			$("#menu-images").data("kendoMenu").enable(getItem("5"),false);
		}
		//初始化menu 打开
		function initOpenMenu() {
			getItem("1").find("img").attr("src","/tscloud-portal/images/console/edit_enable.png");
			$("#menu-images").data("kendoMenu").enable(getItem("1"), true);
			getItem("2").find("img").attr("src","/tscloud-portal/images/console/remove_enable.png");
			$("#menu-images").data("kendoMenu").enable(getItem("2"), true);
			getItem("3").find("img").attr("src","/tscloud-portal/images/console/enable_enable.png");
			$("#menu-images").data("kendoMenu").enable(getItem("3"), true);
			getItem("4").find("img").attr("src","/tscloud-portal/images/console/cancel_enable.png");
			$("#menu-images").data("kendoMenu").enable(getItem("4"), true);
			getItem("5").find("img").attr("src","/tscloud-portal/images/console/changepassword_enable.png");
			$("#menu-images").data("kendoMenu").enable(getItem("5"), true);
		}
		
		//取得Menu中的Item
		var getItem = function(target) {
			var itemIndexes = target.split(/[.,]/), item = $("#menu-images")
					.data("kendoMenu").element;

			if (itemIndexes[0] !== "") {
				for ( var i = 0, len = itemIndexes.length; i < len; i++) {
					item = item.children("li").eq(itemIndexes[i]);
					if (i < len - 1) {
						item = item.find("ul:first");
					}
				}
			}

			return item;
		};
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
				           {field: "tenantName",title: "所属租户"} , 
				           {field: "mobile",title: "联系电话"} ,
				           {field: "email",title: "电子邮箱"} ,
				           {field: "statusName",title: "用户状态"}],
				selectable: "single,row",
				change : function(e) {
					var selectedRows = this.select();
					var dataItem = this.dataItem(selectedRows);
					initOpenMenu();
				}
		    });
			
			//grid 操作菜单
			$("#menu-images").kendoMenu(
					{
						dataSource : [ {
							text : "新增",
							imageUrl : ctx + "/images/console/add_enable.png",
							disabled : "disabled"
						}, {
							text : "编辑",
							imageUrl : ctx + "/images/console/edit.png"
						}, {
							text : "删除",
							imageUrl : ctx + "/images/console/remove.png"
						}, {
							text : "启用",
							imageUrl : ctx + "/images/console/enable.png"
						}, {
							text : "禁用",
							imageUrl : ctx + "/images/console/unenable.png"
						}, {
							text : "重置密码",
							imageUrl : ctx + "/images/console/changepassword.png"
						}],
						select : function(e) {
							var operation = $(e.item).children(".k-link")
									.text();
							if (operation == "新增") {
								addUserPage();
							}else if (operation == "编辑") {
								editUser();
							} else if (operation == "删除") {
								removeUser();
							} else if (operation == "启用") {
								enableUser();
							} else if (operation == "禁用") {
								unenbleUser();
							}else if(operation == "重置密码"){
								resetPassword();
							}
						}
			});
			
			initCloseMenu();
		}
		
		// 新增用户页面
		function addUserPage(){
				// 已选择data数据
				var window = $("#addUserWindow").kendoWindow({
		               title: "新增用户",
		               modal: true,
		               visible: false,
		               iframe:false,
		               resizable: true,
		               width: "520px",
						height: "240px",
						content: ""
		           }).data("kendoWindow");
				// window的显示位置
				window.center().open();	
		}
		
		// 新增用户
		function addUser(){
			if(saveuser.validate()){
				var user = new Object();
				user.account = $("#addUserWindow #account").val();
				user.realName = $("#addUserWindow #realName").val();
				user.mobile = $("#addUserWindow #mobile").val();
				user.email = $("#addUserWindow #email").val();
				user.password = $("#addUserWindow #password").val();
				Core.AjaxRequest({
					url : ws_url + "/rest/user/insertUser",
					params : user,
					callback : function (data) {
						if(data.status == "success"){
							$("#addUserWindow").kendoWindow('close');
							Core.AjaxRequest({
								url : ws_url + "/rest/user/findUsers",
								params : {},
								callback : function (data) {
									Core.alert({
										title:"提示",
										message:"新增成功！",
										confirmCallback:function(){
											// 刷新租户用户列表
											 initDataGrid(data);
										} 
									});
									 initDataGrid(data);
								}
						   });
						}else{
							Core.alert({title:"提示",message:"新增失败！"});
						}
				    }
			   });
			}
		}
		
		// 编辑用户
		function editUser(){
			var grid = $("#userGrid").data("kendoGrid");
			var row = grid.select();
			var data = grid.dataItem(row);
			if(data == null){
				initCloseMenu();
				Core.alert({title:"提示",message:"请选择一条数据！"});
			}else {
				$("#editUserWindow #userSid").val(data.userSid);
				$("#editUserWindow #account").html(data.account);
				$("#editUserWindow #realName").val(data.realName);
				$("#editUserWindow #mobile").val(data.mobile);
				$("#editUserWindow #email").val(data.email);
				// 已选择data数据
				var window = $("#editUserWindow").kendoWindow({
		               title: "编辑用户",
		               modal: true,
		               visible: false,
		               iframe:true, 
		               resizable: true,
		               width: "520px",
						height: "203px",
						content: ""
		           }).data("kendoWindow");
				// window的显示位置
				window.center().open();
			}
		}
		
		// 更新用户信息
		function updateUserInfo(){
			var user = new Object();
			user.userSid = $("#editUserWindow #userSid").val();
			user.account = $("#editUserWindow #account").val();
			user.realName = $("#editUserWindow #realName").val();
			user.mobile = $("#editUserWindow #mobile").val();
			user.email = $("#editUserWindow #email").val();
			// 通过验证
			if(edituser.validate()){
				Core.AjaxRequest({
					url : ws_url + "/rest/user/updateUser",
					params : user,
					callback : function (data) {
						 if(data.status == "success"){							
							 //  关闭window
							 $("#editUserWindow").kendoWindow('close');
							 Core.AjaxRequest({
									url : ws_url + "/rest/user/findUsers",
									params : {},
									callback : function (data) {
										Core.alert({
											title:"提示",
											message:"修改成功！",
											confirmCallback:function(){
												// 刷新租户用户列表
												 initDataGrid(data);
											} 
										});
								    }
							   });
						 }else{
							 Core.alert({title:"提示",message:"修改失败！"});
						 }
					}
			   });
			}
		}
		
		// 关闭编辑window
		function closeEditWindow(){
			 $("#editUserWindow").kendoWindow('close');
		}
		// 关闭增加window
		function closeAddWindow(){
			 $("#addUserWindow").kendoWindow('close');
		}
		
		// 删除用户
		function removeUser(){
			var grid = $("#userGrid").data("kendoGrid");
			var row = grid.select();
			var data = grid.dataItem(row);
			if(data == null){
				initCloseMenu();
				Core.alert({title:"提示",message:"请选择一条数据！"});
			}else {
				Core.confirm({
					message:"确定删除该用户吗？",
					confirmCallback:function(){
						
						Core.AjaxRequest({
							url : ws_url + "/rest/user/deleteUser?userSid="+data.userSid,
							type:"get",
							callback : function (data) {
								if(data.status == "success"){
									Core.AjaxRequest({
										url : ws_url + "/rest/user/findUsers",
										params : {},
										callback : function (data) {
											Core.alert({
												title:"提示",
												message:"删除成功!",
												confirmCallback:function(){
													// 刷新租户用户列表
													 initDataGrid(data);
												} 
											});
										}
								   });
								}else{
									Core.alert({title:"提示",message:"删除失败!"});
								}
							}
					   });
					},
					cancelCallback:function(){
						// 对于confirm对话框，选择取消操作
					}
				});
			}
		}
		
		// 启用用户
		function enableUser(){
			var grid = $("#userGrid").data("kendoGrid");
			var row = grid.select();
			var data = grid.dataItem(row);
			if(data == null){
				initCloseMenu();
				Core.alert({title:"提示",message:"请选择一条数据！"});
			}else {
				Core.confirm({
					message:"确定启用该用户吗？",
					confirmCallback:function(){
						if(data.status == "1"){
							Core.alert({title:"提示",message:"该用户已启用！"});
						}else{
							Core.AjaxRequest({
								url : ws_url + "/rest/user/operationUser?userSid="+data.userSid +"&action=1",
								type:"get",
								callback : function (data) {
									if(data.status == "success"){
										Core.AjaxRequest({
											url : ws_url + "/rest/user/findUsers",
											params : {},
											callback : function (data) {
												Core.alert({
													title:"提示",
													message:"启用成功!",
													confirmCallback:function(){
														// 刷新租户用户列表
														 initDataGrid(data);
													} 
											     });
											}
									   });
									}else{
										Core.alert({title:"提示",message:"启用失败!"});
									}
								}
						   });
						}
					}
				});
			}
		}
		
		// 禁用用户
		function unenbleUser(){
			var grid = $("#userGrid").data("kendoGrid");
			var row = grid.select();
			var data = grid.dataItem(row);
			if(data == null){
				initCloseMenu();
				Core.alert({title:"提示",message:"请选择一条数据！"});
			}else {
				Core.confirm({
					message:"确定禁用该用户吗？",
					confirmCallback:function(){
						if(data.status == "0"){
							Core.alert({title:"提示",message:"该用户已禁用！"});
						}else{
							Core.AjaxRequest({
								url : ws_url + "/rest/user/operationUser?userSid="+data.userSid+"&action=0",
								type:"get",
								callback : function (data) {
									if(data.status == "success"){
										Core.AjaxRequest({
											url : ws_url + "/rest/user/findUsers",
											params : {},
											callback : function (data) {
												Core.alert({
													title:"提示",
													message:"禁用成功",
													confirmCallback:function(){
														// 刷新租户用户列表
														 initDataGrid(data);
													} 
												});
											}
									   });
									}else{
										Core.alert({title:"提示",message:"禁用失败"});
									}
								}
						   });
						}
					}
				});
			}
		}
		
		// 重置用户密码
		function resetPassword(){
			var grid = $("#userGrid").data("kendoGrid");
			var row = grid.select();
			var data = grid.dataItem(row);
			if(data == null){
				initCloseMenu();
				Core.alert({title:"提示",message:"请选择一条数据！"});
			}else {
				$("#resetPasswordWindow #account").html(data.account);
				$("#resetPasswordWindow #userSid1").val(data.userSid);
				// 已选择data数据
				var window = $("#resetPasswordWindow").kendoWindow({
		               title: "重置密码",
		               modal: true,
		               visible: false,
		               iframe:true,
		               resizable: true,
		               width: "500px",
					   height: "168px",
					   content: ""
		           }).data("kendoWindow");
				// window的显示位置
				window.center().open();
			}
		}
		
		// 提交新密码
		function saveNewPassword(){
			if(!checkPasswordSame()){
				return;
			}
			if(resetPasswd.validate()){
					Core.AjaxRequest({
						url : ws_url + "/rest/user/modifyPassword",
						params:{
							"userSid":$("#resetPasswordWindow  #userSid1").val(),
							"newPassword":$("#resetPasswordWindow  #password").val()
						},
						callback : function (data) {
							if(data.status == "success"){
								$("#resetPasswordWindow").kendoWindow('close');
								Core.AjaxRequest({
									url : ws_url + "/rest/user/findUsers",
									params : {},
									callback : function (data) {
										Core.alert({title:"提示",message:"修改密码成功!"});
										 initDataGrid(data);
									}
							   });
							}else{
								Core.alert({title:"提示",message:"修改密码失败!"});
							}
						}
				   });
			}
		}
		
		// 关闭修改密码弹出框
		function closeResetPasswordWindow(){
			$("#resetPasswordWindow").kendoWindow('close');
		}
		// 查询租户用户
		function searchTenantUser(){
			Core.AjaxRequest({
				url : ws_url + "/rest/user/findUsers",
				params : {
					"accountLike": ($("#accountLike").val() =="")? null:$("#accountLike").val(),
					"realNameLike": ($("#realNameLike").val() =="")? null : $("#realNameLike").val(),
					"status": ($("#userStatus").val() == "") ? null : $("#userStatus").val()
				},
				callback : function (data) {
					 initDataGrid(data);
				}
		   });
		}
		// 验证密码是否一致
		function checkPasswordSame(){
			var  isOk = false;
			var passwd = $("#oldPassword").val();
			var newPasswd = $("#confirmPassword").val();
			if(passwd == "" || newPasswd == "" || passwd == null || newPasswd == null){
				return;  
			} 
			if(passwd == newPasswd){
				isOk = true;
			}else{
				Core.alert({title:"提示",message:"请输入相同的密码!"});
			}
			
			return isOk;
		}
	</script>