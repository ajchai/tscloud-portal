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
			<p style="font-size:24px;font-weight:300;color:#666">个人账号注册</p>
			<img id="img" src="${ctx}/images/register/register_nav1.png"></img>
		</div>
		<div id="register-content">  
			<div class="enter_information" style="margin-bottom:0px;">
				<h3 style="width:100%;height:40px;border-bottom:1px solid #DADADA;margin:0px;text-align:left;line-height:40px;font-weight:300;color:#0099d7">&nbsp;&nbsp;个人信息填写</h3>
				<div id="manager">
						<ul>
			                <li style="margin-top:0px;">   
			                    <label for="account" class="required"><font style="color:red">＊</font>账号:</label>
			                    <input type="text" id="account" name="account" class="k-textbox" pattern="[a-zA-Z][a-zA-Z0-9]{2,15}" onblur="checkDuplicate()"  maxlength="16" style="height:28px" placeholder="" required validationMessage="不能为空！" data-pattern-msg="请输入3~16位英文或数字！" />
			              		<img id="loading" style="position:absolute;left:350px;top:5px;display:none" src="${ctx}/images/register/loading3.gif" />
			              		<img id="success" title="该账号可以使用！" style="position:absolute;left:350px;top:5px;display:none" src="${ctx}/images/register/success.png" />
			              		<img id="fail" title="该账号已被注册！" style="position:absolute;left:350px;top:5px;display:none" src="${ctx}/images/register/fail.png" />
			                </li>
			                <li>
			                    <label for="realName" class="required"><font style="color:red">＊</font>姓名:</label>
			                    <input type="text" id="realName" name="realName" class="k-textbox" maxlength="32" style="height:28px" required validationMessage="不能为空！"/>
			                </li>
			                <li>
			                    <label for="password" class="required"><font style="color:red">＊</font>密码:</label>
			                    <input type="password" id="password" name="password"  class="k-textbox"  minlength="6"  maxlength="32" onchange="checkPasswordSame()" style="height:28px" required validationMessage="不能为空！"/>
			                </li>
			                <li>
			                    <label for="confirmPassword" class="required"><font style="color:red">＊</font>确认密码:</label>
			                    <input type="password" id="confirmPassword"  class="k-textbox"  minlength="6"  maxlength="32"  name="confirmPassword" onchange="checkPasswordSame()" style="height:28px"  required validationMessage="不能为空！"/>
			                </li>
			                <li> 
			                    <label for="sex">性别:</label>
			                    <select name="sex" id="sex"  style="font-size:12px;width:200px;"  style="height:28px">
			                        <option value="0">男</option>
									<option value="1">女</option>
			                    </select>
			                </li>
			                <li>
			                    <label for="mobile" class="required"><font style="color:red">＊</font>电话:</label>
			                    <input type="text" id="mobile" name="mobile" maxlength="64" style="height:28px" pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" class="k-textbox"  required validationMessage="不能为空！" data-pattern-msg="请输入正确的电话号码！"/>
			                </li>
			                <li>
			                    <label for="mgtorEmail" class="required"><font style="color:red">＊</font>邮箱:</label>
			                    <input type="email" id="mgtorEmail" name="Email"  style="height:28px" class="k-textbox"   required validationMessage="不能为空！" data-email-msg="请输入正确的邮箱格式！"/>
			                </li>
			                 <li>
			                    <label for="applyReason" class="required" style="height:50px"><font style="color:red">＊</font>申请理由:</label>
			                    <textarea id="applyReason" class="k-textbox" maxlength="256" style="height:80px;width:350px;resize:none" required validationMessage="不能为空！"></textarea>
			                    <p style="margin:0px;margin-left:150px;font-size:12px;color:green">※请填写申请理由和惠普技术服务部门的推荐人及联系方式。</p>
			                </li>
			            </ul>
				</div>
			</div>
			<div style="width:100%;padding-top:3%;padding-bottom:3%;text-align:center">
					<button class="k-button" id="submit" style="width:100px;margin-right:16px;" type="submit">立即注册</button>
			</div>
		</div>
		<div id="register_tips" style="width:100%;height:300px;display:none;">    
				<table border="0" width="100%" height="100%" >  
					<tr> 
						<td align="center" valign="bottom" height="35%">       
								<img src="${ctx }/images/register/register-success.gif" width="50px" height="50px;"></img>
								<span style="position:relative;bottom:10px;font-size:30px;font-weight:400;color:#770608">感谢注册，您的信息已提交成功!</span> 
						</td>   
					</tr> 
					<tr>
						<td align="center" valign="top" height="65%"> 
								<p style="margin:0px;padding:0px;">我们将尽快为您处理，信息验证完成后我们将为您发送帐号激活邮件，请注册查收！</p> 
						</td> 
					</tr>
   				</table>
		</div>
</div>

<script type="text/javascript">
	var  tenantinfo,managerinfo;

	$("#sex").kendoDropDownList();
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
			//获得管理员信息
			managerinfo = getManagerInfo();
			// 验证输入框内容
			if(!registerTenantInfo.validate()){
				return;
			}
			if($("#fail").is(":visible")){
				return;
			}
			
			if(!checkPasswordSame()){
				  return;
			}
			
			if(registerTenantInfo.validate()){
				// 提交表单
				Core.AjaxRequest({
				url :ws_url + "/rest/user/registerUser", 
				type:"post",
				params : {
					user : managerinfo
				},
				callback : function (data) {
					if(data.status == "success"){
						$("#img").attr("src",ctx+"/images/register/register_nav2.png");
						$("#register-content").hide();
						$("#register_tips").show();
				    }else{
				    	Core.alert({title:"提示",message:"注册失败!"});
				    }
	            } 
	         });
			}
			
		}); 
	
		//初始化组织类型下拉列表框		
		Core.AjaxRequest({
				url :ws_url + "/rest/system/BUSINESS_TYPE", 
				type:"get",
				callback : function (data) {
		            $("#businessType").kendoDropDownList({
		            	    dataTextField: "codeDisplay",
		                    dataValueField: "codeValue",
		                    placeholder: "Select...",
		                    dataSource:data 
		            });
		        } 
		     });
		});
		
		// 检查账号是否重复
		function checkDuplicate(){
			if($("#account").val() == "" || $("#account").val() == null || $("#account").val().length < 3 ||$("#account").val().substring(0,1) > 0){
				$("#loading").css("display","none");
				$("#success").css("display","none");   
				$("#fail").css("display","none");       
				return;
			}else{
					$("#loading").css("display","block");
					$("#success").css("display","none");   
					$("#fail").css("display","none");
					Core.AjaxRequest({
						url :ws_url + "/rest/user/validateUserAccount?account=" + $("#account").val(), 
						type:"get",
						callback : function (data) {
							if(data.status == "success"){ 
								$("#success").css("display","block");
								$("#loading").css("display","none");
						    }
			            },
			            failure : function(data){
			            	$("#fail").css("display","block");
					    	$("#loading").css("display","none");
			            }
		         });
			}
		}
	
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

		// 得到管理员信息
		function getManagerInfo(){
			var user = new Object();
			// 管理员账户
			user.account = $("#account").val();
			// 管理员名称
			user.realName = $("#realName").val();
			// 密码
			user.password = $("#confirmPassword").val();
			// 性别
			user.sex = $("#sex").val();
			// 管理员电话 
			user.mobile = $("#mobile").val();
			// 管理员邮件
			user.email = $("#mgtorEmail").val();
			// 申请liy
			user.applyReason = $("#applyReason").val();
			
			return user;
		}
	
</script>
<%@ include file="/pages/common/footer.jsp"%>