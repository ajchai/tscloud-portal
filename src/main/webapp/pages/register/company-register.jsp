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
			<p style="font-size:24px;font-weight:300;color:#666">组织账号注册</p>
			<img id="img" src="${ctx}/images/register/register_nav1.png"></img>
		</div>
		<div id="register-content">  
			<div class="enter_information">
				<h3 style="width:100%;height:40px;border-bottom:1px solid #DADADA;margin:0px;text-align:left;line-height:40px;font-weight:300;color:#0099d7">&nbsp;&nbsp;组织信息填写</h3>
				<div id="company">
						<ul>
			                <li style="margin-top:0px;">
			                    <label for="tenantName" class="required"><font style="color:red">＊</font>组织名称:</label>
			                    <input type="text" id="tenantName" name="tenantName" class="k-textbox"  maxlength="64" style="height:28px" placeholder="" required validationMessage="不能为空！" />
			                </li>
			                <li>
			                    <label for="tenantShortName" class="required"><font style="color:red">＊</font>组织简写:</label>
			                    <input type="text" id="tenantShortName" name="tenantShortName" class="k-textbox"  maxlength="64" pattern="\w*" style="height:28px" placeholder=""  required validationMessage="不能为空！" data-pattern-msg="请输入英文或数字！"/>
			                </li>
			                <li> 
			                    <label for="businessType" >组织类型:</label>
  								<select id="businessType" name="businessType" size="1" style="font-size:12px;width:200px;" placeholder="Select size...">
								</select>
			                </li>
			                <li>
			                    <label for="contact">联系人:</label>
			                    <input type="text" id="contact" name="contact"  maxlength="64" class="k-textbox"  style="height:28px" />
			                </li>
			                <li>
			                    <label for="contactPhone" >联系人电话:</label>
			                    <input type="text" id="contactPhone"  class="k-textbox" maxlength="64"  pattern="\d{0,64}"   name="contactPhone"  style="height:28px" validationMessage="请输入数字！"/>
			                </li>
			                <li> 
			                    <label for="contactPosition">联系人职位:</label>
			                     <input type="text" id="contactPosition"  class="k-textbox" maxlength="64"   name="contactPosition"  style="height:28px" />
			                </li>
			                <li>
			                    <label for="email" class="required"><font style="color:red;">＊</font>联系人邮箱:</label>
			                    <input type="email" id="email" name="Email"  style="height:28px" class="k-textbox"   required validationMessage="不能为空！"  data-email-msg="请输入正确的邮箱格式！"/>
			                </li>
			            </ul>
				</div>
			</div>	
			<div class="enter_information" style="margin-bottom:0px;">
				<h3 style="width:100%;height:40px;border-bottom:1px solid #DADADA;margin:0px;text-align:left;line-height:40px;font-weight:300;color:#0099d7">&nbsp;&nbsp;管理员信息填写</h3>
				<div id="manager">
						<ul>
			                <li style="margin-top:0px">
			                    <label for="account" class="required"><font style="color:red">＊</font>账号:</label>
			                    <input type="text" id="account" name="account" class="k-textbox" pattern="[a-zA-Z][a-zA-Z0-9]{2,15}" onblur="checkDuplicate()"  maxlength="16" style="height:28px" placeholder="" required validationMessage="不能为空！" data-pattern-msg="请输入3~16位英文或数字！" />
			                	<img id="loading" style="position:absolute;left:350px;top:5px;display:none" src="${ctx}/images/register/loading3.gif" />
			              		<img id="success" title="该账号可以使用！" style="position:absolute;left:350px;top:5px;display:none" src="${ctx}/images/register/success.png" />
			              		<img id="fail" title="该账号已被注册！" style="position:absolute;left:350px;top:5px;display:none" src="${ctx}/images/register/fail.png" />
			                </li>
			                <li>
			                    <label for="realName" class="required"><font style="color:red">＊</font>姓名:</label>
			                    <input type="text" id="realName" name="realName" class="k-textbox"  style="height:28px" required validationMessage="不能为空！"/>
			                </li>
			                <li>
			                    <label for="password" class="required"><font style="color:red">＊</font>密码:</label>
			                    <input type="password" id="password" name="password"  class="k-textbox"  minlength="6" onchange="checkPasswordSame()" maxlength="32"  style="height:28px" required validationMessage="不能为空！"/>
			                </li>
			                <li>
			                    <label for="confirmPassword" class="required"><font style="color:red">＊</font>确认密码:</label>
			                    <input type="password" id="confirmPassword"  class="k-textbox"  minlength="6"  maxlength="32" onchange="checkPasswordSame()" name="confirmPassword"  style="height:28px"  required validationMessage="不能为空！"/>
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
			                    <input type="text" id="mobile" name="mobile"  maxlength="64" style="height:28px" class="k-textbox"  pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"   required validationMessage="不能为空！" data-pattern-msg="请输入正确的电话号码！"/>
			                </li>
			                <li>
			                    <label for="mgtorEmail" class="required"><font style="color:red">＊</font>邮箱:</label>
			                    <input type="email" id="mgtorEmail" name="Email"  style="height:28px" class="k-textbox"   required validationMessage="不能为空！" data-email-msg="请输入正确的邮箱格式！"/>
			                </li>
			                <li>
			                    <label for="applyReason" class="required" style="height:50px"><font style="color:red">＊</font>申请理由:</label>
			                    <textarea id="applyReason" class="k-textbox" maxlength="256" style="height:80px;width:350px;resize:none" required validationMessage="不能为空！"></textarea>
			                    <p style="margin:0px;margin-left:150px;font-size:12px;color:green">※请填写申请理由和国税服务部门的推荐人及联系方式。</p>
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
	   var registerMgtor = $("#company").kendoValidator().data("kendoValidator");
	   var registerTenantInfo = $("#manager").kendoValidator().data("kendoValidator");
		
		$("#submit").click(function(){
			// 获得组织信息
			tenantinfo = getTenantInfo(); 
			//获得管理员信息
			managerinfo = getManagerInfo();
			
			// 验证输入框内容
			if(!registerMgtor.validate()){
				return;
			}
			if(!registerTenantInfo.validate()){
				return;
			}
			if($("#fail").is(":visible")){
				return;
			}
			
			if(!checkPasswordSame()){
				  return;
			}
			
			if(registerMgtor.validate() && registerTenantInfo.validate()){
				// 提交表单
				Core.AjaxRequest({
				url :ws_url + "/rest/tenants/register", 
				type:"post",
				params : {
					tenant : tenantinfo,
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
	
		//初始化租户类型下拉列表框
		Core.AjaxRequest({
			url :ws_url + "/rest/system/TENANT_TYPE", 
			type:"get",
			callback : function (data) {
	            $("#tenantType").kendoDropDownList({
	            	    dataTextField: "codeDisplay",
	                    dataValueField: "codeValue",
	                    placeholder: "Select...",
	                    dataSource:data 
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

		// 得到租户基本信息
		function getTenantInfo(){
			var tenant = new Object();
			// 组织名称
			tenant.tenantName =$("#tenantName").val();
			// 组织简写
			tenant.tenantShortName = $("#tenantShortName").val();
		//		// 组织类型
		//		tenant.tenantType = $("#tenantType").val();
			// 联系人
			tenant.contact = $("#contact").val();
			// 联系人电话
			tenant.contactPhone = $("#contactPhone").val();
			// 联系人职位
			tenant.contactPosition = $("#contactPosition").val();
			// 邮箱
			tenant.email = $("#email").val();
			// 是否供应商
		//	tenant.isIsv = $("#isIsv").val();
			// 组织类型
			tenant.businessType = $("#businessType").val();
			// 员工数
		//	tenant.staffsNumber = $("#staffsNumber").val();
			// 域名
		//	tenant.domainName = $("#domainName").val();
			// 邮编
		//	tenant.postCode = $("#postCode").val();
			// 国家
		//		tenant.country = $("#country").val();
			// 组织类型
			tenant.applyReason = $("#applyReason").val();
			
			return tenant;
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
			// 组织类型
			user.applyReason = $("#applyReason").val();
			
			return user;
		}
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
	
</script>
<%@ include file="/pages/common/footer.jsp"%>