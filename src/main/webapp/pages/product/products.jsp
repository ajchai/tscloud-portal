<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title.common"/><fmt:message key="header.title.productAndService"/></title>
<link href="<%= request.getContextPath() %>/css/products.css" rel="stylesheet">
<%@ include file="/pages/common/navigat.jsp"%>
<style type="text/css">
	#buttonConfig{
		position:absolute;
		top:15px; 
		right:5px;
		width:120px;
		height:120px; 
		cursor:pointer;
		background:url(../../images/index/order_pic.png) no-repeat;  
		background-position:0px 0px;
	}
	#buttonConfig:hover{ 
		background-position:0px -120px;  
	}
</style>     
<div id="container">
 	 <div id="list_left_nav">
	 </div>
	 
	 <div id="list_middle_content">
			 	<div id="content_header">
					<div style="position:relative;width:100%;height:64px;"> 
						&nbsp;<img id="serviceIcon"  src="" width="64px" height="64px" /> 
						&nbsp;&nbsp;<font id="serviceName"  style="position:absolute;top:16px;font-size:20px;"></font>
						<div id="buttonConfig" onclick="applicationService()"></div>  
					</div>    
					<div id="outline" style="width:600px;height:70px;font-size:14px;"></div>   
				</div> 
				<div id="content_title"> 
					<ul>
						<li class="service_info active">服务详情</li> 
						<li class="service_info">应用场景及案例</li>    
					</ul>
				</div>
				<div class="content_body selected">
						<div class="panel">
								<p style="font-size:16px;font-weight:500;color:#0099d7;margin:0px;">&nbsp;&nbsp;服务说明</p>
								<hr />
								<ul id="desc" style="padding-left:23px;margin:0px;list-style-type:none; list-style-image:url(/tscloud-portal/images/product/dot.png);font-size:14px;font-weight:300;color:#333"></ul>
						</div>
						<div class="panel" >
								<p style="font-size:16px;font-weight:500;margin:0px;color:#0099d7;">&nbsp;&nbsp;平台特点</p>
								<hr />
								<div id="feature" style="padding-left:10px;color:#333"></div>
						</div>
		        </div>
		        
		        <div class="content_body">
						<div class="panel">
								<p style="font-size:14px;font-weight:500;color:#0099d7;margin:0px;">&nbsp;&nbsp;应用场景和案例</p>
								<hr />
								<ul id="sceneAndCase" style="padding-left:10px;list-style-type:none; list-style-image:url(/tscloud-portal/images/product/dot.png); margin:0px 0px 0px 15px;font-size:14px;font-weight:300;color:#666"></ul>
						</div>
						
		        </div>
	 </div>
 </div>

<script type="text/javascript">
   // 接收url传来的产品sid
    var productSid,productParentSid,canOrder,serviceScope;
	// 接收全部服务的详细数据
	var servicedata = new  Object();   
	
	// 获取当前服务sid
	var serviceSid;
	var roleSid = 0;
	// 得到左边导航栏的html
	function getListLeftTree(data,roleSid){
		var str="";
		var index = 0;
		for(var i = 0; i<data.length;i++){
			if(data[i].serviceDefineList == ""){
				continue;
			}else{
				if(index==0){
					str +="<ul class='test'><h2 id="+data[i].catalogSid+" class='h2_current  h2'>&nbsp;&nbsp;&nbsp;"+data[i].catalogName+"</h2>";
				}else{
					str +="<ul class='test'><h2 id="+data[i].catalogSid+" class='h2_current'>&nbsp;&nbsp;&nbsp;"+data[i].catalogName+"</h2>"; 
				}
				
				for(var j=0;j<data[i].serviceDefineList.length;j++){
					if(index == 0){
						initServiceContent = data[i].serviceDefineList[j];
						str +="<li id='servicelist"+data[i].serviceDefineList[j].serviceSid+"' class='servicelist selectedService' onclick='showServiceInfo("+data[i].serviceDefineList[j].parentCatalogSid+",this,"+data[i].serviceDefineList[j].serviceSid+")'>&nbsp;&nbsp;<img src=${ctx}"+data[i].serviceDefineList[j].sImagePath1+" style='position:relative;top:3px;width:25px;height:25px;'/>&nbsp;<span style='position:absolute;top:0px;'>"+data[i].serviceDefineList[j].serviceName+"</span></li>";
						index++;
					}else{
						str +="<li id='servicelist"+data[i].serviceDefineList[j].serviceSid+"' class='servicelist'  onclick='showServiceInfo("+data[i].serviceDefineList[j].parentCatalogSid+",this,"+data[i].serviceDefineList[j].serviceSid+")'>&nbsp;&nbsp;<img src=${ctx}"+data[i].serviceDefineList[j].sImagePath1+" style='position:relative;top:3px;width:25px;height:25px;'/>&nbsp;<span style='position:absolute;top:0px;'>"+data[i].serviceDefineList[j].serviceName+"</span></li>";
						index++;
					} 
				}
				str +="</ul>";
			}
		}
		return str;
	}
     
	$(function(){
	
        // 获得当前用户，验证是否登录
		Core.AjaxRequest({
			url : ws_url + "/rest/user/current",
			type : "GET",
			async : false,
			callback : function (data) {
				var user = data.user;
				if(typeof user != "undefined" && null != user) {
					roleSid = user.roles[0].roleSid;
				}
		    }
		});
        
		// 初始化设置产品服务的左边导航
		Core.AjaxRequest({
			url : ws_url + "/rest/service/serviceTree",
			callback : function (data) {
				servicedata = data;
				$("#list_left_nav").html(getListLeftTree(data,roleSid));
				productParentSid ="${param.productParentSid}";
				productSid = "${param.productSid}";
			    if (null == productSid || productSid == "" || productSid == "undefined" || null == productParentSid || productParentSid == "" || productParentSid == "undefined") {
			    	// 如果是没有通过链接进入产品画面，默认显示第一条信息
			    	setValue(initServiceContent);
		     	} else {
		  	    	$(".selectedService").removeClass("selectedService");
		  	    	$("#servicelist"+productSid+"").addClass("selectedService");
		  	    	$(".h2").removeClass("h2"); 
		  			$("#"+productParentSid+"").addClass("h2");
		 	    	setValue(getCurrentServiceInfo(Number(productSid)));
			    } 
			} 
		}); 
	 });
	
	// 显示服务的基本信息
	function showServiceInfo(parentSid,obj,serviceSid){ 
		$(".h2").removeClass("h2");
		$("#"+parentSid+"").addClass("h2");
		$(".selectedService").removeClass("selectedService");
		$(obj).addClass("selectedService");
		
		// 产品介绍 默认选中 第一个
		$("#content_title .service_info").removeClass("active");
		$("#content_title .service_info").eq(0).addClass("active");
		$(".selected").removeClass("selected");
		$(".content_body").eq(0).addClass("selected");
		
		setValue(getCurrentServiceInfo(serviceSid));
	} 
	
	//得到当前选中的服务的具体内容
	function getCurrentServiceInfo(serviceSid){
       var serviceDetailInfo =new Object();
		for(var i=0;i<servicedata.length;i++){
			if(servicedata[i].serviceDefineList == ""){ 
				continue;
			}else{
				for(var j=0;j<servicedata[i].serviceDefineList.length;j++){
					if(servicedata[i].serviceDefineList[j].serviceSid == serviceSid){
						serviceDetailInfo = servicedata[i].serviceDefineList[j];
						break;
					}
				}
			}
		}
		return serviceDetailInfo;
	}
	
	// 选项卡动画
	$("#content_title .service_info").each(function(index){
		$(this).click(function(){
			$("#content_title .service_info").removeClass("active");
			$(this).addClass("active");
			$(".selected").removeClass("selected");
			$(".content_body").eq(index).addClass("selected");
		});
	}); 

	// 设置服务具体内容
	function setValue(serviceDetailInfo){
		serviceSid = serviceDetailInfo.serviceSid;
		
		if(roleSid == 103 && serviceDetailInfo.serviceScope == 1){
			$("#buttonConfig").css("cursor","auto");
 			$("#buttonConfig").css("background-position","0px -240px");
 			$("#buttonConfig").hover(function(){
				$("#buttonConfig").css("background-position","0px -240px");
			},function(){
				$("#buttonConfig").css("background-position","0px -240px");
			});
		}else if(roleSid == 104 && serviceDetailInfo.serviceScope == 2){  
				$("#buttonConfig").css("cursor","auto");
	 			$("#buttonConfig").css("background-position","0px -240px");
	 			$("#buttonConfig").hover(function(){
					$("#buttonConfig").css("background-position","0px -240px");
				},function(){
					$("#buttonConfig").css("background-position","0px -240px");
				});
			
		}else{
			if(serviceDetailInfo.canOrder == "1"){
				$("#buttonConfig").css("cursor","pointer");
				$("#buttonConfig").css("background-position","0px 0px");
				$("#buttonConfig").hover(function(){
					$("#buttonConfig").css("background-position","0px -120px");
				},function(){
					$("#buttonConfig").css("background-position","0px 0px");
				});
			}else{
				$("#buttonConfig").css("cursor","auto");
	 			$("#buttonConfig").css("background-position","0px -240px");
	 			$("#buttonConfig").hover(function(){
					$("#buttonConfig").css("background-position","0px -240px");
				},function(){
					$("#buttonConfig").css("background-position","0px -240px");
				});
			}
		}
		$("#serviceIcon").attr("src",ctx+serviceDetailInfo.sImagePath1);
		$("#serviceName").html("<b style='color:#0099d7'>"+serviceDetailInfo.serviceName+"</b>");
		$("#outline").html("&nbsp;&nbsp;&nbsp;"+serviceDetailInfo.detailDescription+"");
		 // 产品说明赋值
		$("#desc").html("");
		$("#desc").append(serviceDetailInfo.productDescription); 
	    // 产品特点赋值
	    $("#feature").html("");
	    $("#feature").append(serviceDetailInfo.productFeatures);
	    
	    // 应用场景和案例赋值
	    $("#sceneAndCase").html("");
	    $("#sceneAndCase").append(serviceDetailInfo.productCase);
	}
	
	// 申请服务 产品导购
	function applicationService(){
		
		if($("#buttonConfig").css("background-position") != "0px -240px"){
			window.location.href = ctx+"/pages/order/serviceConfig.jsp?serviceSid="+serviceSid;
		}
	}

</script>
    
<%@ include file="/pages/common/footer.jsp"%>