<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	#footer{
			position:relative;
			top:0px;
			width:100%;
			height:200px; 
			background:#21242C; 
			color:#959595; 
			text-align:center;  
	}
	#footer_nav{
			width:670px;
			height:50px; 
			padding:0px;
			margin:0px;
			margin: 0 auto;
			list-style:none; 
			text-align:center;
	}    
	#footer_nav li{   
			height:50px; 
			line-height:50px;  
			float:left;    
			font-size:14px; 
			text-align:center; 
			margin-right:20px;  
			color:white; 
			cursor:pointer;  
	}
	#footer_nav li:last-child{  
		margin:0px; 
	}
	.footer_ul{ 
			width:100%;  
			text-align:center;    
			margin:0px;
			padding:0px; 
			list-style:none;  
	}  
	
	.footer_ul li{  
			width:100%;    
			height:25px; 
			line-height:25px; 
			float:left;   
			font-size:12px; 
			text-align:center;
			margin-right:20px;  
	}
	
	#footer_nav a{
	        color:#fff;
    }

	#footer_nav a:hover{
		    color:#ccc;
	}
	
</style>
<div id="footer">
			<ul id="footer_nav"> 
					<li><a href="${ctx}/pages/index.jsp">首页</a></li>
					<li><a href="${ctx}/pages/product/products.jsp">服务目录</a></li>
					<li><a href="javascript:goLoginPage('/pages/console/console.jsp')">自服务中心</a></li> 
					<li><a href="<fmt:message key="header.operation.url"/>" target="blank">运营管理</a></li>
<%-- 					<li><a href="${ctx}/pages/intros.jsp">平台导航</a></li> --%>
					<li><a href="${ctx}/pages/platform-introduction.jsp">关于平台</a></li>
					<li><a href="${ctx}/pages/feedback.jsp">意见反馈</a></li>    
					<li><a href="http://www8.hp.com/cn/zh/privacy/privacy.html" target="blank">保密声明</a></li>
					<li><a href="http://www8.hp.com/cn/zh/hp-information/index.html" target="blank">关于惠普</a></li>       
			</ul>
			<div  style="width:1000px;height:100px;margin:0 auto;text-align:left; border-bottom:1px solid #000;">         
					<ul class="footer_ul">     
					        <li style="margin-bottom:2px;"><font style="color:#FF9900"><b>免责声明</b>：本平台仅为内部测试目的，非其他商业用途。</font></li>       
					        <li style="margin-bottom:2px;">最佳分辨率1366*768，建议使用Chrome、Firefox、Safari、IE9以上版本浏览器。</li>
							<li style="margin-bottom:2px;"><b>联系方式</b>：<a href="mailto:<fmt:message key="header.email"/>"><img src="${ctx}/images/nav/email.png" border="0" style="margin-bottom: -3px;position:relative;" width="20px" height="20px" />&nbsp;<span style="font-size:12px;color:#959595;"><fmt:message key="header.email"/></span></a></li>
					</ul>  
			</div>
			<div style="width:1000px;height:45px;margin:0 auto;text-align:center;font-size:12px;line-height:35px;border-top: 1px solid #303030;"> 
					<fmt:message key="footer.partners"/>
			</div>   
</div>

<div id="loginWindow">
    <div class="content" style="width:100%;height:200px;">
		<div class="header">
			<span style="font-size:16px"><fmt:message key="login.welcome"/></span>
		</div>
		<div style="width:100%;height:160px">
			<table width="80%" style="margin:0 auto;color:#FFFFFF" height="100%" border="0" cellpadding="0" cellspacing="0">
			 <tr><td>&nbsp;&nbsp;</td></tr>
			  <tr><td><span style="font-size:14px"><fmt:message key="login.account"/></span></td></tr>
			  <tr>
				<td align="center"><input id="account" type="text" style="width:100%;height:20px;" value="" /></td>
			  </tr>
			  <tr><td><fmt:message key="login.password"/></td></tr>
			  <tr>
				<td align="center"><input id="password" type="password" style="width:100%;height:20px;" value="" /></td>
			  </tr>
			  <tr><td>&nbsp;&nbsp;</td></tr>
			  <tr>
				<td align="center">
					<button class="k-button" id="submit" style="width:100%" type="submit"><fmt:message key="button.submit"/></button>
				</td>
			  </tr>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 显示产品服务的详细信息
 	$("#products").click(function(){
		if($("#productsShow").is(":hidden")){
			$("#coordion").html("<fmt:message key='header.title.arrows.up'/>");
			$("#productsShow").show().animate({top:'+=322px'},'50');
			$("#productsShow").animate({top:'-=20px'},'100');
		
		}else{
			$("#coordion").html("<fmt:message key='header.title.arrows.down'/>");
			$("#productsShow").animate({top:'-=302px'},'300',function(){
				$("#productsShow").hide();
			});
		}
	});
	// 展开登陆页面
	function toggleLogin() {
// 		$("#loginWindow").slideToggle("slow"); // 弹出登录框
		goLoginPage();
	}
	
	// 登录按钮绑定事件
	$("#submit").click(function(){
		// 验证用户
		Core.AjaxRequest({
			url : ws_url + "/rest/user/verify",
			params : {
				account : $("#account").val(),
				password : $("#password").val()
			},
			callback : function (data) {
				var user = data.user;
				setCurrentUser(user);
                $("#nav_login").html('<span style="font-size:12px;">' + Core.sayHello()
                	+ user.realName + '&nbsp;|&nbsp;<a href="javascript:logout();" id="logout"><fmt:message key="login.logout"/></a>'
                	+ '</span>');
//                 $("#loginWindow").slideToggle("slow"); // 收回登录框 
            }
		});
	});
 	
	// 注销用户
	function logout() {
		Core.AjaxRequest({
			url : ws_url + "/rest/user/logout",
			params : {
			},  
			callback : function (data) {
                $("#nav_login").html('<span style="font-size:12px;"><a href="javascript:toggleLogin();" id="login" ><fmt:message key="header.login"/></a>' 
                	+ '&nbsp;|&nbsp;<a href="' + ctx + '/pages/register/lost-password.jsp"><fmt:message key="login.forgetPassword"/></a>&nbsp;|&nbsp;<a href="' + ctx + '/pages/register/company-register.jsp"><fmt:message key="header.company.register"/></a>&nbsp;|&nbsp;<a href="' + ctx + '/pages/register/person-register.jsp"><fmt:message key="header.personal.register"/></a>'
                	+ '</span>');
                currentUser = null;
            }
		});
	}
	
</script>
</body>
</html>