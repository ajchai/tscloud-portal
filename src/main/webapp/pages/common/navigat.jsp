<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<body>

<div id="div_nav">
 	<table width="1000px" height="100%"  style="margin:0 auto;" border="0" cellpadding="0" cellspacing="0">
	  <tr>
	  <td width="29%" align="left" style="padding-top:5px;">
			<div style="width:100%;height:100%;position:relative;">
				<a href="${ctx}/pages/index.jsp">
			 	   <img src="${ctx}/images/index/gs-logo.png" width="50px" height="50px"  border="0"/>
			       <font style="color:#FFFFFF;font-size:20px; position:absolute;top:13px;">&nbsp;&nbsp;<b><fmt:message key="header.title"/></b></font>
			    </a> 
			</div> 
		</td> 
		<td width="71%"> 
			<div id="nav_operation">   
				<nav class="nav">   
					<a href="${ctx}/pages/index.jsp"><fmt:message key="header.title.homePage"/></a>
					<a href="#" id="products"><fmt:message key="header.title.productAndService"/><span id="coordion" style="font-size:12px;cursor:pointer"><fmt:message key="header.title.arrows.down"/></span></a>
<%-- 					<a href="#"><fmt:message key="header.title.help"/></a> --%>
					<a href="javascript:goLoginPage('/pages/console/console.jsp');"><fmt:message key="header.title.console"/></a>
					<a href="#" onclick="javascript:goPlatformURL();"><fmt:message key="header.title.operation"/></a>
<%-- 					<a href="${ctx}/pages/intros.jsp"><fmt:message key="header.title.intros"/></a> --%>
					<a href="${ctx}/pages/platform-introduction.jsp"><fmt:message key="header.title.platformIntroduction"/></a> 
				</nav>
				<div id="nav_login">
					<span style="font-size:12px;">  
						<script type="text/javascript">    
							// 用户登录显示用户信息
							if (currentUser != null && currentUser != '' && currentUser != "") {
								if(currentUser.serviceLimitQuantity != null && currentUser.serviceLimitQuantity > 0){
									document.write(Core.sayHello() + currentUser.realName + '（<span style="color:#ff9900">您暂时最多能选购'+currentUser.serviceLimitQuantity+'个云服务</span>）');
								}else{
									document.write(Core.sayHello() + currentUser.realName + '');
								}
								
							} else {
								document.write('<a href="javascript:toggleLogin();" id="login" ><fmt:message key="header.login"/></a>');
								document.write('&nbsp;|&nbsp;<a href="' + ctx + '/pages/register/lost-password.jsp"><fmt:message key="login.forgetPassword"/></a>');
							}
						</script>
						|
						<script type="text/javascript">
							// 用户登录显示注销信息   
							if (currentUser != null && currentUser != '' && currentUser != "") {
								document.write('<a href="javascript:logout();" id="logout"><fmt:message key="login.logout"/></a>');
							} else {
								document.write('<a href="' + ctx + '/pages/register/company-register.jsp"><fmt:message key="header.company.register"/></a>');
								//document.write('&nbsp;|&nbsp;<a href="' + ctx + '/pages/register/person-register.jsp"><fmt:message key="header.personal.register"/></a>');
							}
						</script>
					
					</span>
				</div>
			</div>	
		</td>
	  </tr>
	</table>
 </div>

<!-- 产品的详细信息 -->
 <div id="productsShow">
    <br />
    <div id="products_content">
	    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr id="trContainer">
				
			</tr>
		</table>
	</div>
	<div id="contacts">
		<div style="width:940px;height:100%;margin: 0px auto;overflow: hidden;text-align: left;">
			<table width="80%" height="100%" border="0" style="margin:0 auto" cellpadding="0" cellspacing="0">
			  <tr>
				<td width="37px"><a href="mailto:<fmt:message key="header.email"/>"><img src="${ctx}/images/index/call_us.png" border="0"/></a></td>
				<td width="140px">
					<ul>
						<li style="font-size:20px;"><a href="mailto:<fmt:message key="header.email"/>" style="color:white;">&nbsp;&nbsp;<fmt:message key="header.linkUs"/></a></li>
					</ul>
				</td> 
				<td> 
					<table width="100%" height="60%" border="0" style="color:#FFFFFF;font-size:12px" cellpadding="0" cellspacing="0">  
					  <tr>
						<td align="left"><a href="mailto:<fmt:message key="header.email"/>"><img src="${ctx}/images/nav/email.png" border="0" style="position:relative;top:3px;width: 25px;height: 25px;"/>&nbsp;<span style="font-size:14px;position:relative;top:-2px;color:white;"><fmt:message key="header.email"/></span></a></td>
					  </tr>
					</table>  
				</td>
				<td width="37px"><img src="${ctx}/images/index/account.png" /></td> 
				<td width="130px">
					<ul>
						<li style="font-size:20px;">&nbsp;&nbsp;<a href="${ctx}/pages/product/products.jsp" style="color:white"><fmt:message key="header.title.productAndService"/></a></li> 
					</ul>
				</td>
			  </tr>
			</table>
		</div>
	</div>
 </div>
 
<div id="feedback" style="position:fixed;top:35%;right:10px;width:30px;height:90px;text-align:center;background:#ff9900;color:white;cursor:pointer;z-index:999999999">
	意<br/>见<br/>反<br/>馈
</div>
 
 <script type="text/javascript">
 		var color =["#9B02A8","#2E71EA","#EC7511","#068F1D"];
 		$(function(){
 			Core.AjaxRequest({
 				url : ws_url + "/rest/service/serviceTree",
 				callback : function (data) {
 					// 生成服务目录表
 					createTopNavServiceList(data);
 				} 
 			});
 		});
 		
 		function createTopNavServiceList(data){
 			var index = 1;
 			var colIndex = 0;
 			var str = "";
			 for(var i=0;i<data.length;i++){
				 if(data[i].serviceDefineList == "" && data[i].catalogSid == 100){
				 }else{
					 str +="<td>"; 
					 str +="<div id='number"+index+"' class='number'>";
					 str +="<div id='number"+index+"_content' class='number_content'style='background:url(${ctx}"+data[i].bgImagePath+") no-repeat'>";
					 str +="<h3 style='width:100%;height:32px; font-size:16px; line-height:37px; font-weight:700;margin:0px;padding:0px;''>"+data[i].catalogName+"</h3>";   
					 str +="<ul style='text-align:left;font-size:14px;margin:0px;padding:0px;list-style:none'>";  
					 if(data[i].serviceDefineList == ""){  
						 str +="<li style='width:100%;height:100px;'><br/><br/><font style='margin-top:50px;margin-left:85px;'>暂未开放</font></li>";     
					 }else{ 
						 for(var j=0;j<data[i].serviceDefineList.length;j++){ 
							str +="<li class='li' onclick='viewServiceDetailInfo("+data[i].serviceDefineList[j].serviceSid+","+data[i].serviceDefineList[j].parentCatalogSid+")''>&nbsp;&nbsp;<img src='${ctx}"+data[i].serviceDefineList[j].sImagePath2+"' width='25px' height='25px' style='padding:3px;'><span style='position:absolute;left:45px;top:5px;'>"+data[i].serviceDefineList[j].serviceName+"</span></li>";
							if(j == 5){
								break;
							}
						 }
					 }
					 str+="</div><div id='bgc"+index+"' class='bgc'  style='background:"+color[colIndex]+";''><img src='${ctx}"+data[i].imagePath+"' width='230' height='230' onclick='mouseover("+index+")'/></div>";
					 str+="</div></td>";
					 index ++;
					 colIndex ++; 
				 }
			 }
			 $("#trContainer").append(str);
 		}
 		
 		// 查看服务的详细信息&productParentSid="+data[i].serviceDefineList[j].parentCatalogSid+"
 		function viewServiceDetailInfo(serviceSid,parentSid){
 			window.location="${ctx}/pages/product/products.jsp?productSid="+serviceSid+"&productParentSid="+parentSid;
 		}
 		   
 		$("#feedback").click(function(){
 			window.location.href = ctx + "/pages/feedback.jsp";
 		});
 		var preIndex;
 		function mouseover(index){
			if(navigator.userAgent.indexOf("MSIE")<=0) {
 				return;
 			}
			$("#bgc"+index+"").animate({top:"-240px"},"fast",function(){
				$("#bgc"+preIndex+"").animate({top:"0px"},"fast");
				preIndex =index;
			});
 		}
 </script>