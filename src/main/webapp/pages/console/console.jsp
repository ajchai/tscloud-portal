<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title.common"/><fmt:message key="header.title.console"/></title>
<link href="${ctx}/css/user.css" rel="stylesheet">
<script src="${ctx}/script/anychart/AnyChart.js"></script>
<style type="text/css">
	.content_nav_list a{
		color:#999;
	}
	.k-tooltip{
			padding:0px;
	}
	.username{
			color:#0099d7;
	}
	.template_user_operation { 
			width:100%;
			height:80px; 
			margin:0px;
			padding:0px;
			list-style:none;
	}
	.operation_li {
			width:100%;
			height:25px;
			border-top:1px solid gray; 
			font-size:12px;
			line-height:25px;
			text-align:left;
			cursor:pointer;
	}
	.operation_li:hover{
			background:#0099d7;
	}
</style>
</head>
<body>
 	<div id="nav">
		<div class="logo">
			<a href="${ctx}/pages/index.jsp">
			  &nbsp;&nbsp;&nbsp;<img style="margin-top:5px;" src="${ctx }/images/index/hp-logo.png" width="50px;" height="50px"  border="0"/>
			  <span style="position:absolute;left:75px;top:17px; color:#FFFFFF;font-size:20px;color:#FFF;"><b><fmt:message key="header.title"/></b></span>
			</a>
		</div>
		<div class="user">
			<table border="0" width="100%" height="100%" cellpadding="0"  cellpadding="0"> 
				<tr>  
					<td width="33%" align="center">
						<a href="${ctx}/pages/index.jsp"><img src="${ctx}/images/console/nav/home-pic.png" width="32px" alt="首页" title="首页" height="32px" border="0"></a>
					</td>
<!-- 					<td width="50%"> -->
<%-- 						<img src="${ctx}/images/index/help-pic.png" width="32px" height="32px"> --%> 
<!-- 					</td> -->
					<td width="34%" align="center"> 
					   <a href="${ctx}/pages/order/serviceConfig.jsp" style="cursor:pointer"><img src="${ctx}/images/console/nav/shoping_cart.png" title="产品选购" width="32px" height="32px" alt="产品选购" border="0"></a>  
					</td>
					<td width="33%" align="center"> 
					   <a id="userDetails" style="cursor:pointer"><img src="${ctx}/images/console/nav/user-pic.png" width="32px" title="用户中心" height="32px" border="0"></a>  
					</td>
				</tr>
			</table>
		</div>
    </div>
	<div id="container">
		<div id="panel_content_nav"> 
			<div style="width:100%;height:50px;">
				<h1 style="font-size: 1.5rem;font-weight: 200;font-size:18px;height: 40px;margin: 0px;padding: 8px 0px 0px 0px;line-height:35px; text-align:center;border-bottom:1px solid #DADADA">
					<font style="color:#0099d7;font-weight:bold">自服务中心</font>&nbsp;&nbsp;  
				</h1>
			</div>
			<div style="width:100%;margin:0px;padding:0px;" id="content_nav"></div>
		</div> 
		<div id="panel_content_detail">
				<div id="div" style="width:100%;height:99.5%;"></div>   
		</div>
	</div>
</body>
 
<script id="template" type="text/x-kendo-template">  
               <div style="width:100%;height:57px;margin:0px;padding:0px;"> 
						<ul class="template_user_operation">
								<a><li class="operation_li" onclick="accountMgt()">&nbsp;&nbsp;&nbsp;&nbsp;账号管理</li></a> 
								<a onclick="logout()"><li class="operation_li">&nbsp;&nbsp;&nbsp;&nbsp;退出</li></a> 
						</ul>
               </div>
</script>

<script type="text/javascript">  
var url = "${param.url}";
var loadurl = "${param.load}";
	// 设置第二个div的高度 
	$(function(){ 
		
		var bodyh = document.documentElement.clientHeight;
		document.getElementById("container").style.height = (parseInt(bodyh) - 61) + 'px'; 
		// 用户未登陆跳转至登陆
		if(typeof currentUser == "undefined" || null == currentUser) {
			goLoginPage();
		} else {
			// 加载菜单
			Core.AjaxRequest({
				url : ws_url + "/rest/user/previlege/" + currentUser.userSid,
				type : "GET",
				callback : function (data) {
					var obj = data;
					setConsoleMenu(obj);
			    }
			});
		} 
		
		// 更多的用户操作 
		 $("#userDetails").kendoTooltip({
			 autoHide:false,
             showOn: "click",
             position: "bottom",
             width: 150,
             height:55,
             content:kendo.template($("#template").html()) 
         }).data("kendoTooltip");
	});
	
	// 当浏览器屏幕大小变化时,修改div的高度
	window.onresize = function(){
		var bodyh = document.documentElement.clientHeight;
		document.getElementById("container").style.height = (parseInt(bodyh) - 61) + 'px';
	}
	
	/** 根据module数据生成菜单 */
	function setConsoleMenu(obj) {
		var html = '';
		for (var i = 0; i < obj.length; i++) {
			// 判断是不是父菜单
			if (null == obj[i].parentSid) {
				html = html 
				+ '<div class="content_nav_list">'
				+ '<ul><p style="color:#000;margin:0px;font-weight:200;font-size:16px;height:40px; line-height:40px;background:#EDEEF0;background: linear-gradient(to right, #EDEEF0 95%, #DADADA 100%) transparent;">'
				+ '<span style="margin-left:20px;font-weight:bold">'+obj[i].moduleName +'</span>' 
				+ '</p>';  
				for (var j = 0; j < obj.length; j++) {  
					// 判断是不是该父菜单的子菜单 
					if (obj[j].parentSid == obj[i].moduleSid) {
						//alert(obj[j].moduleSid);
						if(obj[j].moduleSid == 11400){
							if(!checkExchangeAndSharepointShow(115)){
								var str = obj[j].moduleUrl; 
								html = html 
								+ '<li id="" class="user_operation" url="'+str+'" onclick="focusMenu(this)">' 
								+ '<img src="${ctx}'+obj[j].moduleIconUrl+'" style="position:absolute;top:7px;" width="24px" height="24px"></img>'
								+ '<font style="position:absolute;left:40%;font-size:14px;">'+obj[j].moduleName +'</font>'
								+ '</li>';
							}
						}else if(obj[j].moduleSid == 11500){
							if(!checkExchangeAndSharepointShow(114)){
								var str = obj[j].moduleUrl; 
								html = html 
								+ '<li id="" class="user_operation" url="'+str+'" onclick="focusMenu(this)">' 
								+ '<img src="${ctx}'+obj[j].moduleIconUrl+'" style="position:absolute;top:7px;" width="24px" height="24px"></img>'
								+ '<font style="position:absolute;left:40%;font-size:14px;">'+obj[j].moduleName +'</font>'
								+ '</li>';
							}
						}else{
							var str = obj[j].moduleUrl; 
							html = html 
							+ '<li id="" class="user_operation" url="'+str+'" onclick="focusMenu(this)">' 
							+ '<img src="${ctx}'+obj[j].moduleIconUrl+'" style="position:absolute;top:7px;" width="24px" height="24px"></img>'
							+ '<font style="position:absolute;left:40%;font-size:14px;">'+obj[j].moduleName +'</font>'
							+ '</li>';
						}
					}
				}
				html = html 
				+ '</ul>' 
				+ '</div>';
			}
		}
		// 设置第一个为选中项
		html = html.replace(/user_operation?/, "user_operation selected");
		// 展示菜单
		$("#content_nav").html(html); 
		
		// 当从订单成功画面返回控制台，默认选择订单管理
		if(url != "" && loadurl != ""){
			$("#panel_content_nav .selected").removeClass("selected");
			$("#panel_content_nav li[url='"+url+"']").addClass("selected");
			$("#div").load(loadurl);
		}else{
			// 加载iframe框架
			$("#div").load("dashboard/user-dashboard.jsp");
		}
	}   
	
	/** 选中菜单 */  
	function focusMenu(obj){
		var url = $(obj).attr("url").substring(15);
// 		$(".k-list-container").remove();
// 		$(".k-calendar-container").remove(); 
// 		$(".k-calendar").remove();
// 		$(".k-animation-container").remove();
		$(".k-window").remove();

		$("#div").html("");
		$("#div").load(url); 
		
		$("#panel_content_nav .selected").removeClass("selected");
		$(obj).addClass("selected");
	}
	
	function logout(){
		Core.AjaxRequest({
			url : ws_url + "/rest/user/logout",
			type : "POST",
			callback : function (data) {
				if(data.resultStatus == "true"){
						window.location.href = ctx +"/pages/index.jsp";
				}
		    }
		});
	}
	// 编辑用户
	function accountMgt(){
		$("#panel_content_nav .selected").removeClass("selected");
		$("#panel_content_nav li[url='/pages/console/account/account-index.jsp']").addClass("selected");
		$("#div").load("account/account-index.jsp");
	}
	
	// 判断Exchange和SharePoint是否可以显示出来
	function checkExchangeAndSharepointShow(sid){
		var isok = false;
		Core.AjaxRequest({
			url : ws_url + "/rest/order/checkRepeatOrder?serviceSid=" + sid,
			type : "GET",
			async : false,
			callback : function (data) {
				if(data.status == null){
					isok = true;
				}else{
					isok = false;
				}
		    },
		    failure : function(data) {
		    	isok = false;
		    }
		});
		return isok;
	}
</script>
</html>