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
				
		     ul{
					 list-style-type: none; 
					 font-size:14px;
			         margin: 0 ; 
			         padding: 0 ; 
				}
				
				label {
			         display: inline-block;
			         width: 110px;
			         text-align: right;
			     }
		</style>
				<div style="width:100%;height:99.9%;margin:0px;padding:0px;">
						<div style="width:100%;height:48px;background:#F9F9F9;color:#000; line-height:48px;border-bottom:1px solid #DADADA">
							&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">账号管理</font>
						</div>
			            <div  style="width:100%;">
					          <div id="tabstrip" style="width:100%;height:100%;border:0px;">
				                    <ul>
				                        <li class="k-state-active">
				                            基本信息
				                        </li>
				                        <li>
				                            修改密码
				                        </li>
				                    </ul>
				                    <div  id="basic_info" style="width:97%;height:100%">
				                    		<ul>
									                <li style="margin: 8px 0 0 0">
									                    <label for="realName" class="required"><font style="color:red">＊</font>姓名:</label>
									                    <input type="text" id="realName" name="realName" class="k-textbox"  maxlength="64" style="width:190px;height:28px" placeholder="" required validationMessage="不能为空！" />
									                </li>
									                <li style="margin: 8px 0 0 0">
									                    <label for="sex" >性别:</label>
									                    <select id="sex"  name="sex"  style="font-size:12px;width:173px" placeholder="请选择...">
													    </select>
									                </li> 
									                <li style="margin: 8px 0 0 0">
									                    <label for="mobile" class="required"><font style="color:red">＊</font>联系电话:</label>
									                    <input type="text" id="mobile"  class="k-textbox" maxlength="64"  pattern="\d{0,32}" name="contactPhone"  style="width:190px;height:28px" validationMessage="请输入数字！" required validationMessage="不能为空！"/>
									                </li>
									                <li style="margin: 8px 0 0 0">
									                    <label for="email" class="required"><font style="color:red">＊</font>电子邮箱:</label>
									                    <input type="email" id="email" name="email" class="k-textbox" style="width:190px;height:28px" required data-email-msg="请输入正确的邮箱格式！"/>
									                </li>
									                 <li style="margin: 8px 0 0 0">
									                    <label for="button" ></label>
									                    <button class="k-button"  id="button"  style="width:50px" type="submit"  onclick="saveCurrentUserInfo()">保存</button>
									                </li>
									         </ul>
				                    </div>
				                    
				                    <div  id="changePassword"  style="width:97%;height:100%">
				                    		 <ul>
				                    		        <li style="margin: 8px 0 0 0">
									                    <label for="password" class="required"><font style="color:red">＊</font>新密码:</label>
									                    <input type="password" id="password" name="password"  maxlength="64"  onchange="checkPasswordSame()" class="k-textbox"  style="width:190px;height:28px" required validationMessage="不能为空！" />
									                </li>
									                <li style="margin: 8px 0 0 0">
									                    <label for="newPassword" class="required"><font style="color:red">＊</font>确定新密码:</label>
									                    <input type="password" id="newPassword" name="newPassword"  maxlength="64"  onchange="checkPasswordSame()" class="k-textbox"  style="width:190px;height:28px" required validationMessage="不能为空！" />
									                </li>
									                <li style="margin: 8px 0 0 0">
									                    <label for="button" ></label>
									                    <button class="k-button"  id="button"  style="width:50px" type="submit"  onclick="changePasswd()">保存</button>
									                </li>
							                </ul>
				                    </div>
                        </div>
			</div> 	
	</div>

	<script type="text/javascript">
	     var userSid;
	     var basic_info = $("#basic_info").kendoValidator().data("kendoValidator");
	     var changePassword = $("#changePassword").kendoValidator().data("kendoValidator");
	
          $("#sex").kendoDropDownList({
        	  dataSource: [
        	               { value: "0", display: "男" },
        	               { value: "1", display: "女" }
        	             ],
              dataTextField: "display",
              dataValueField: "value"
          });
          
		  $(document).ready(function() {
			  // 设置tab选项卡动画
				$("#tabstrip").kendoTabStrip({
					animation:  {
						open: {
							effects: "fadeIn"
						}
					}
				});
			  
			  // 获取当前用户的信息
				Core.AjaxRequest({
					url : ws_url + "/rest/user/current",
					type:"get",
					callback : function (data) {
						userSid = data.user.userSid;
						$("#realName").val(data.user.realName);
						$("#sex").data("kendoDropDownList").value(data.user.sex);
						$("#mobile").val(data.user.mobile);
						$("#email").val(data.user.email);
				    }
				});
         });
		  
		  // 保存用户信息
		  function  saveCurrentUserInfo(){
			  var user = new Object();
			  user.userSid = userSid;
			  user.realName =$("#realName").val();
			  user.sex = $("#sex").data("kendoDropDownList").value();
			  user.mobile = $("#mobile").val();
			  user.email = $("#email").val();
			  
			  if(basic_info.validate()){
				// 获取当前用户的信息
					Core.AjaxRequest({
						url : ws_url + "/rest/user/updateUser",
						type : "post",
						params : user,
						callback : function (data) {
							if(data.status == "success"){
								Core.alert({
									title:"提示",
									message:"更新成功！"
								});
							}else{
								Core.alert({
									title:"提示",
									message:"更新失败！"
								});
							}
					    }
					});
			  }
		  }
		  
		  // 修改用户密码
		  function changePasswd(){
			  if(!checkPasswordSame()){
				  return;
			  }
			  
			  if(changePassword.validate()){
				  Core.AjaxRequest({
						url : ws_url + "/rest/user/modifyPassword",
						params:{
							"userSid":userSid,
							"newPassword":$("#newPassword").val()
						},
						callback : function (data) {
								Core.alert({title:"提示",message:"修改密码成功!"});
								
						},
						failure:function(data){
							Core.alert({title:"提示",message:"修改密码失败!"});
					}
				   });
			  }
		  }
		// 验证密码是否一致
			function checkPasswordSame(){
				var  isOk = false;
				var passwd = $("#password").val();
				var newPasswd = $("#newPassword").val();
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