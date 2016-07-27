<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title.common"/><fmt:message key="header.title.serviceConfig"/></title>
<link href="${ctx}/css/serviceConfig.css"  rel="stylesheet">
<%@ include file="/pages/common/navigat.jsp"%>
<% 
	String serviceSid = request.getParameter("serviceSid");
%>
<style type="text/css">
	.k-slider-horizontal .k-tick { 
		background-image:none;
	}
	.k-label{
		display:none;
	}
</style>
<div id="configContainer"> 
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left" colspan="3">
					<div style="position:relative;width:777px;height:50px;margin-bottom:0px;margin-top:10px;border: 1px solid #C1C1C1;line-height:50px;">   
				         <img style="position:absolute;top:10px;left:30px;" src="${ctx}/images/index/service_select.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				         <span style="font-size:18px; font-weight:800;">服务选购</span><span style="color:#FF9900;font-size:14px;">（本平台暂为测试系统，您申请的服务只能保留一天，敬请谅解）</span> 
				    </div>   
				</td>  
			</tr>
			<tr>
				<td width="108px" valign="top">
						<div class="test" id="serviceStyle" >    
							<ul id="serviceChoose"></ul>   
				    </div>  
				</td>
				<td width="668px" valign="top">
					
							<div  id="content-main" class="test content-main">
					<!-- 			添加不同服务的配置画面 -->
							</div>
				</td>
				<td width="220px" valign="top">
						<div class="test content-right">
							<div id="container">
								<div style="background:#0099d7;height: 35px;width:100%;"><div id="header"></div></div>
								<div id="body">
									<div id="shoppingCart"></div>
									<div style="width:100%;height:100px;">
											<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"> 
											  <tr>
												<td align="center" style="font-size:14px">
												        <img src="${ctx}/images/index/shoppingCart.png"></img>您共选择了<span id="buyServiceCount" style="color:#D7410B;">0</span>个服务
												</td>
											  </tr>
				<!-- 							  <tr> -->
				<!-- 								<td align="center" style="font-size:14px">总费用:&nbsp;<span style="color:#D7410B;font-size:20px;">0</span>&nbsp;元</td> -->
				<!-- 							  </tr> -->
											  <tr>
												<td align="center"><button class="k-button" id="confirmOrder"  style="width:100px" >确定订单</button></td> 
											  </tr> 
											</table>
									</div>
								</div>
							</div>
						</div>
				</td>
			</tr>
		</table>			
</div>
 
<div id="anamite" style=""></div>
<div id="confirmOrderWindow" style=""></div>
<script type="text/javascript">  
    var i = 1;
    // 得到购物车中的配置数据
    var configData = "";
    // 得到服务sid
    var serviceSid =(<%=serviceSid %> == null)?"100":"<%=serviceSid %>"; 

<%-- 	var serviceSid = '<%=serviceSid %>'; --%>
	// 判断用户是否有购买邮件服务和Sharepoint服务的权限
	var currentUser = null;
    //  获得当前用户
	Core.AjaxRequest({
		url : ws_url + "/rest/user/current",
		type : "GET",
		async : false,
		callback : function (data) {
			var user = data.user;
			if(typeof user != "undefined" && null != user) {
				currentUser = user;
			}
	    }
	});
    
    // 设置服务选购页面
    function setServiceChooseValue(data){
    	var str = "";
    	for(var i=0;i<data.length;i++){
    		if(data[i].serviceSid == 100){
    			str += "<li id="+data[i].serviceSid+" class='pick_service  pick_service_selected' onclick='javascript:loadServiceConfigPage("+data[i].serviceSid+")'><img style='position:absolute;top:5px;left:18px;' src='"+ctx+""+data[i].sImagePath2+"' width='70px' height='70px' /><font style='position:absolute;top:76px;left:30px;color:white;font-size:16px;font-weight:bold'>云主机</font></li>";
    		}else if(data[i].serviceSid == 101){
    			str += "<li id="+data[i].serviceSid+" class='pick_service' onclick='javascript:loadServiceConfigPage("+data[i].serviceSid+")'><img style='position:absolute;top:5px;left:18px;' src='"+ctx+""+data[i].sImagePath2+"' width='70px' height='70px' /><font style='position:absolute;top:78px;left:23px;color:white;font-size:16px;font-weight:bold'>数据分析</font></li>";
    		}else if(data[i].serviceSid == 104){
    			str += "<li id="+data[i].serviceSid+" class='pick_service' onclick='javascript:loadServiceConfigPage("+data[i].serviceSid+")'><img style='position:absolute;top:5px;left:18px;' src='"+ctx+""+data[i].sImagePath2+"' width='70px' height='70px' /><font style='position:absolute;top:78px;left:23px;color:white;font-size:16px;font-weight:bold'>企业网盘</font></li>";
    		}else if(data[i].serviceSid == 105){
    			str += "<li id="+data[i].serviceSid+" class='pick_service' onclick='javascript:loadServiceConfigPage("+data[i].serviceSid+")'><img style='position:absolute;top:5px;left:18px;' src='"+ctx+""+data[i].sImagePath2+"' width='70px' height='70px' /><font style='position:absolute;top:78px;left:30px;color:white;font-size:16px;font-weight:bold'>块存储</font></li>";
    		}else if(data[i].serviceSid == 106){
    			str += "<li id="+data[i].serviceSid+" class='pick_service' onclick='javascript:loadServiceConfigPage("+data[i].serviceSid+")'><img style='position:absolute;top:5px;left:18px;' src='"+ctx+""+data[i].sImagePath2+"' width='70px' height='70px' /><font style='position:absolute;top:78px;left:15px;color:white;font-size:16px;font-weight:bold'>关系数据库</font></li>";
    		}else if(data[i].serviceSid == 114){
    			str += "<li id="+data[i].serviceSid+" class='pick_service' onclick='javascript:loadServiceConfigPage("+data[i].serviceSid+")'><img style='position:absolute;top:5px;left:18px;' src='"+ctx+""+data[i].sImagePath2+"' width='70px' height='70px' /><font style='position:absolute;top:78px;left:23px;color:white;font-size:16px;font-weight:bold'>邮件服务</font></li>";
    		}else if(data[i].serviceSid == 115){
    			str += "<li id="+data[i].serviceSid+" class='pick_service' onclick='javascript:loadServiceConfigPage("+data[i].serviceSid+")'><img style='position:absolute;top:5px;left:18px;' src='"+ctx+""+data[i].sImagePath2+"' width='70px' height='70px' /><font style='position:absolute;top:78px;left:9px;color:white;font-size:16px;font-weight:bold'>SharePoint</font></li>";
    		}else if(data[i].serviceSid == 120){
    			str += "<li id="+data[i].serviceSid+" class='pick_service' onclick='javascript:loadServiceConfigPage("+data[i].serviceSid+")'><img style='position:absolute;top:5px;left:18px;' src='"+ctx+""+data[i].sImagePath2+"' width='70px' height='70px' /><font style='position:absolute;top:78px;left:15px;color:white;font-size:16px;font-weight:bold'>自动化部署</font></li>";
    		}
    	}
    	return str;
    }
    
	$(function(){
		var serviceScope = "";
		 monitorShoppingCart();  
		// 判断用户是否已登录
		if(currentUser != null && currentUser !=""){
			if(currentUser.roles[0].roleSid == 104){
				serviceScope = "01"; 
			}else{
				serviceScope = "02"; 
			}
		}else{
			serviceScope = null; 
		}
		 // 取得serviceTree
		Core.AjaxRequest({
			url : ws_url + "/rest/service/findAll",
			async : false,
			params:{
				"serviceScope" : serviceScope,
				"canOrder" : "1",
				"serviceStatus" :"03"
			}, 
			callback : function (data) {
				$("#serviceChoose").html(setServiceChooseValue(data));
				loadServiceConfigPage(serviceSid);
			}
		});
		  
		 
	});
	
	//点击购物车确认订单时，弹出window
	$("#confirmOrder").click(function(){ 
			var currentUser = null;
	        //  获得当前用户
			Core.AjaxRequest({
				url : ws_url + "/rest/user/current",
				type : "GET",
				async : false,
				callback : function (data) {
					var user = data.user;
					if(typeof user != "undefined" && null != user) {
						currentUser = user;
					}
			    }
			});
			if (typeof currentUser == "undefined" || null == currentUser) {
				Core.alert({
					title:"提示",
					message:"您还没有登录，是否去登录？",
					confirmCallback:function(){
						goLoginPage('/pages/order/serviceConfig.jsp');
					}
				});
				return;
			}
		   // 初始化购物车数据
		   var attrdiv = new Array();
		   for(var index=0;index<i;index++){
			   if($("#div"+index+"").length>0){
				   var obj = new Object();
				   obj.uuid = "No"+index;
				   obj.serviceSid = $("#serviceSid"+index+"").val();
				   obj.templateSid = $("#tempSid"+index+"").val();
				   obj.serviceName = $("#serviceName"+index+"").val();
				   obj.config = $("#spec"+index+"").html();
				   obj.count = typeof($("#count"+index+"").val()) == "undefined"?"":$("#count"+index+"").val();
				   if($("#time"+index+"").val() == "99年"){
					   obj.time = "永久";
				   }else{
					   obj.time = typeof($("#time"+index+"").val()) == "undefined"?"":$("#time"+index+"").val();
				   }
				   obj.billingType = $("#style_time"+index+"").val();
				   obj.pref = $("#dataPrefValue"+index+"").val();
				   // 服务的配置
				   obj.specJson = $("#specJson"+index+"").val();
				   attrdiv.push(obj);
			   }else{
				   continue;
			   }
		   }
		   configData = JSON.stringify(attrdiv);
		    $("#confirmOrderWindow").kendoWindow({
				width: "900px",
				height: "412px",
				modal: true,
				 visible: false,
				title: "确认订单",
				actions: ["Pin", "Maximize", "Close"],
				content: "firmorder.jsp",
				close: function() {
					    setTimeout(function(){
					      $('#confirmWindow').kendoWindow('destroy');
					    }, 200);
				}
	       });
		   $("#confirmOrderWindow").data("kendoWindow").center();
		   $("#confirmOrderWindow").data("kendoWindow").open();
	});
	
	// 选择不同服务的动画，如：云主机，关系数据库，分布式对象存储
	
	function loadServiceConfigPage(sid){
		if($("#"+sid+"").length <= 0){
			Core.alert({
				title:"提示",
				message:"对不起,您不能订购该服务！",
				confirmCallback:function(){ 
					window.location.href = ctx + "/pages/order/serviceConfig.jsp";
				}
			});
		}

		if(sid == 100){
			serviceSid = sid;
			$("#content-main").html("");
			$("#content-main").load(ctx+"/pages/order/cloud-host.jsp");
		}else if(sid == 101){
			serviceSid = sid;
			$("#content-main").html("");
			$("#content-main").load(ctx+"/pages/order/distributed-calculate.jsp");
		}else if(sid == 105){
			serviceSid = sid;
			$("#content-main").html("");
			$("#content-main").load(ctx+"/pages/order/block-storage.jsp");
		}else if(sid == 106){
			serviceSid = sid;
			$("#content-main").html("");
			$("#content-main").load(ctx+"/pages/order/relational-database.jsp");
		}else if(sid == 104){
			serviceSid = sid;
			$("#content-main").html("");
			$("#content-main").load(ctx+"/pages/order/storage-config.jsp");
		}else if(sid == 114){
			serviceSid = sid;
			$("#content-main").html("");
			$("#content-main").load(ctx+"/pages/order/exchange-config.jsp");
		}else if(sid == 115){
			serviceSid = sid;
			$("#content-main").html("");
			$("#content-main").load(ctx+"/pages/order/sharepoint-config.jsp");
		}else if(sid == 120){
			serviceSid = sid;
			$("#content-main").html("");
			$("#content-main").load(ctx+"/pages/order/automation-deployment.jsp");
		}
		$(".pick_service_selected").removeClass("pick_service_selected");  
		$("#"+sid+"").addClass("pick_service_selected");
	}
	
	// 用于将配置数据传入到确定订单弹出框
	function getOrderInfo(){
		return configData;
	}
	
	// 监控购物车内容是否为空
	function  monitorShoppingCart(){
		if($("#shoppingCart").html() == "" || $("#shoppingCart").html() == null) {
			$("#confirmOrder").attr("disabled","true");
		}else{
			$("#confirmOrder").removeAttr("disabled");
		}
	}
	
	// 计算购买服务器的数量
	function getBuyServiceCount(count){
		var currentCount  = Number($("#buyServiceCount").html());
		$("#buyServiceCount").html(""+(currentCount + Number(count))+"");
	}
</script>
<%@ include file="/pages/common/footer.jsp"%>