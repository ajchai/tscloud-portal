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
	 
	 #container ul{  
		 list-style-type: none; 
         margin: 0; 
         padding: 0; 
	 }
	 
	 #container li{ 
		position:relative;
        margin: 20px 0 0 0; 
     } 
	 
	 #container label {
         display: inline-block;
         width: 140px;
         text-align: right;
     }
	 
	 #nav-list{ 
 		position:relative;
 	    wdith:800px;
 	    height:120px;
	 }

	 #register-content{
	 	position:relative;
	 	top:0px;
	 	left:0px;
	 	width:100%;
	 }
	 
	 #register-content .enter_information{
	 	width:100%;
	 }
	 
	 .enter_information h3{
	 	margin:0px;
	 }
	 
	 #company {
	 	width:100%;
	 	padding:10px 0px 10px 150px;
	 }
	 #manager{ 
	 	width:100%;
	 	padding:10px 0px 10px 150px;
	 }
</style>

<div id="container">
		<div id="nav-list" >
			<p style="font-size:24px;font-weight:300;color:#666">找回密码</p>
			<img id="img" src="${ctx}/images/register/forgot_password_step2.png"></img>
		</div>
		<div id="register-content">  
			<div class="enter_information" style="margin-bottom:0px;">
				<h3 style="width:100%;height:40px;border-bottom:1px solid #DADADA;margin:0px;text-align:left;line-height:40px;font-weight:300;color:#0099d7">&nbsp;&nbsp;填写新密码</h3>
				<div id="manager">
					<br />
					<br />
						<ul>
			                <li style="margin-top:0px;">   
			                    <label for="account" class="required"><font style="color:red">＊</font>注册账号:</label>
			                    <span id="account"></span>
			                </li> 
			                <li>
			                    <label for="password" class="required"><font style="color:red">＊</font>新密码:</label>
			                    <input type="password" id="password" name="password"  class="k-textbox"  minlength="6"  maxlength="32" onchange="checkPasswordSame()" style="height:28px" required validationMessage="不能为空！"/>
			                </li>
			                <li>
			                    <label for="confirmPassword" class="required"><font style="color:red">＊</font>确认新密码:</label>
			                    <input type="password" id="confirmPassword"  class="k-textbox"  minlength="6"  maxlength="32"  name="confirmPassword" onchange="checkPasswordSame()" style="height:28px"  required validationMessage="不能为空！"/>
			                </li>
			            </ul>
				</div>
			</div>
			<div style="width:100%;padding-top:3%;padding-bottom:3%;text-align:center">
					<button class="k-button" id="submit" style="width:100px;margin-right:16px;" type="submit">提交</button>
			</div>
		</div>
		<div id="register_tips_success" style="width:100%;height:300px;display:none;">    
				<table border="0" width="100%" height="100%" >  
					<tr> 
						<td align="center" valign="bottom" height="35%">       
								 <img id="img_result" src="${ctx }/images/register/register-success.gif" width="50px" height="50px;"></img>
								<span style="position:relative;bottom:10px;font-size:30px;font-weight:400;color:#770608">您的账号密码已经重置成功!</span> 
						</td>   
					</tr>    
					<tr>
						<td align="center" valign="top" height="65%"> 
								<p style="margin:0px;padding:0px;">请点击<a href="${ctx}/pages/login.jsp" style="color:#0099d7">登录</a>按钮前去登录！</p> 
						</td> 
					</tr>
   				</table>
		</div>
		<div id="register_tips_fail" style="width:100%;height:300px;display:none;">    
				<table border="0" width="100%" height="100%" >  
					<tr> 
						<td align="center" valign="bottom" height="40%">       
								 <img id="img_result" src="${ctx }/images/register/register-fail.gif" width="50px" height="50px;"></img>
								<span style="position:relative;bottom:10px;font-size:30px;font-weight:400;color:#770608">对不起，操作失败!</span> 
						</td>   
					</tr>    
					<tr>
						<td align="center" valign="top" height="60%"> 
								<p style="margin:0px;padding:0px;">该链接已经失效，点击<a href="${ctx}/pages/index.jsp" style="color:#0099d7">首页</a>回到首页</p> 
						</td> 
					</tr>
   				</table>
		</div>
</div>

<script type="text/javascript">
	var sid = '<%=sid  %>';
	var key = '<%=key  %>';
	var user = null;
	
	// 验证用户是否存在
	Core.AjaxRequest({
	    url :ws_url + "/rest/user/testUserAtEmail?userSid=" + sid +"&passWord="+key, 
	    type:"get",
	    callback : function (data) {
	    	user = data;
	    	$("#account").html(user.account);
        },
        failure : function(data) {
        	$("#register-content").hide();
			$("#register_tips_success").hide();
			$("#register_tips_fail").show();
        }
     });

	// 设置验证的页面的高度
	var bodyh = document.documentElement.clientHeight;
	$("#container").css("min-height",""+(parseInt(bodyh) - 262)+"px");
	window.onresize = function(){
		var bodyh = document.documentElement.clientHeight;
		$("#container").css("min-height",""+(parseInt(bodyh) - 262)+"px");
	};
	
	$(function(){
	  
	   var registerTenantInfo = $("#manager").kendoValidator().data("kendoValidator");
	   
		$("#submit").click(function(){
			// 验证输入框内容
			if(!registerTenantInfo.validate()){
				return;
			}
			
			// 判断是否通过验证
			if(registerTenantInfo.validate()){
				// 提交表单
				Core.AjaxRequest({
				url :ws_url + "/rest/user/modifyPwdAtFindLostPwd", 
				type:"post",
				params : {
					userSid:sid,
					account:user.account,
					newPassword:$("#confirmPassword").val(),
					oldPassword:key
				},
				callback : function (data) {
						$("#img").attr("src",ctx+"/images/register/register_nav3.png");
						$("#register-content").hide();
						$("#register_tips_success").show();
						$("#register_tips_fail").hide();
				    },
		            failure : function(data) {
		            	Core.alert({title:"提示",message:"重置密码失败！"});
		            }
	         });
			}
		}); 
	
		// 验证密码是否一致
		function checkPasswordSame(){
			var  isOk = false;
			var passwd = $("#password").val();
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
	});
	
</script>
<%@ include file="/pages/common/footer.jsp"%>