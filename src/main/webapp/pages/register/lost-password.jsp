<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title"/></title>
<%@ include file="/pages/common/navigat.jsp"%>
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
			<img id="img" src="${ctx}/images/register/forgot_password_step1.png"></img>
		</div>
		<div id="register-content">  
			<div class="enter_information" style="margin-bottom:0px;">
				<h3 style="width:100%;height:40px;border-bottom:1px solid #DADADA;margin:0px;text-align:left;line-height:40px;font-weight:300;color:#0099d7">&nbsp;&nbsp;输入必要信息</h3>
				<div id="manager">
					<br />
					<br />
						<ul>
			                <li style="margin-top:0px;">   
			                    <label for="account" class="required"><font style="color:red">＊</font>账号:</label>
			                    <input type="text" id="account" name="account" class="k-textbox" pattern="[a-zA-Z][a-zA-Z0-9]{2,15}" onblur="checkDuplicate()"  maxlength="16" style="height:28px" placeholder="" required validationMessage="不能为空！" data-pattern-msg="请输入3~16位英文或数字！" />
			              		
			                </li> 
			                <li>
			                    <label for="mgtorEmail" class="required"><font style="color:red">＊</font>邮箱:</label>
			                    <input type="email" id="mgtorEmail" name="Email"  style="height:28px" class="k-textbox"   required validationMessage="不能为空！" data-email-msg="请输入正确的邮箱格式！"/>
			                </li>
			            </ul>
				</div>
			</div>
			<div style="width:100%;padding-top:3%;padding-bottom:3%;text-align:center">
					<button class="k-button" id="submit" style="width:100px;margin-right:16px;" type="submit">立即找回</button>
			</div>
		</div>
		<div id="register_tips" style="width:100%;height:300px;display:none;">    
				<table border="0" width="100%" height="100%" >  
					<tr> 
						<td align="center" valign="bottom" height="35%">       
								 <img src="${ctx }/images/register/register-success.gif" width="50px" height="50px;"></img>
								<span style="position:relative;bottom:10px;font-size:30px;font-weight:400;color:#770608">账号信息验证成功！</span> 
						</td>   
					</tr>    
					<tr>
						<td align="center" valign="top" height="65%"> 
								<p style="margin:0px;padding:0px;">我们已将重置账号密码邮件发送到您的注册邮件中，请查收！</p> 
						</td> 
					</tr>
   				</table>
		</div>
</div>

<script type="text/javascript">
	var managerinfo;

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
			
			// 管理员账户
			var account = $("#account").val();
			// 管理员邮件
			var email = $("#mgtorEmail").val();
			
			if(registerTenantInfo.validate()){
				// 提交表单
			  Core.AjaxRequest({
				url :ws_url + "/rest/user/testUserAtFindLostPwd?account=" + account+"&email="+email, 
				type:"get",
				callback : function (data) {
					$("#img").attr("src",ctx+"/images/register/forgot_password_step1.png");
					$("#register-content").hide();
					$("#register_tips").show();
	            },
	            failure : function(data) {
	            	Core.alert({title:"提示",message:"请输入正确的账号和邮箱！"});
	            }
	          });
			}
			
		}); 
		
	});
</script>
<%@ include file="/pages/common/footer.jsp"%>