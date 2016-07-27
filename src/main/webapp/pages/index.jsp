<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ include file="/pages/common/header.jsp"%>
<% 
// String cookieName = "user_first_access";
// boolean user_first_access = true;
// // 取得Cookie
// Cookie[] allCookie = request.getCookies();
// if (allCookie != null) {
// 	for(int i=0;i<allCookie.length;i++){
// 	  if(cookieName.equals(allCookie[i].getName())){
// 		  user_first_access = false;
// 		  break;
// 	    }
// 	}
// }
// Cookie cookie=new Cookie(cookieName, "false"); 
// cookie.setMaxAge(30*60);
// response.addCookie(cookie);
%>
<title><fmt:message key="header.title.prev"/><fmt:message key="header.title"/></title>
<script type="text/javascript" src="${ctx}/script/banner.js"></script>
<link href="${ctx}/css/slider.css" rel="stylesheet">
<%@ include file="/pages/common/navigat.jsp"%>
<div style="width:100%;height:300px;">
		<header>
	<div class="header-content home">
		<div class="parallax-bg" id="slider-wrap">
		<div class="slider parallax-bg" id="slider"> 
			<div class="slider-sections"> 
		         <section class="first"> 
				      	<img alt="基础设施云" src="${ctx}/images/index/computing_service.png"/> 
		         	    <div class="text"> 
			         	   
			         	     <h2 >基础设施服务</h2> 
								<ul class="copy"> 
								  <li>云主机服务，基于虚拟化和自动化技术，可以即需即供，灵活定制扩展的服务器资源服务；</li> 
								  <li>分布式对象存储服务，可以横向扩展，以灵活的扩展性和低廉的价格实现PB级数据的存储；</li> 
								  <li>块存储服务，专为云主机设计的数据持久存储服务；</li> 
								  <li>分布式计算服务，基于分布式计算技术，搭建弹性可横向扩展的计算资源池。</li> 
								</ul>
								<br />
							 <p class="button"><a href="${ctx}/pages/product/products.jsp?productSid=100&productParentSid=101" style="text-decoration:none;">查看详情</a></p>
		         	    </div> 
		         </section>

				<section id="slide-2">
				<!--
					<img src="${ctx}/images/index/protal_service.png" alt="平台云服务" /> 
					<div class="text">
					   <h2>平台云服务</h2> 
					   <ul class="copy">
					   	<li>关系型数据库服务，建立在关系数据库模型基础上的数据库；</li> 
						<li>数据交换平台服务，提供了一个统一的开放的数据交换平台；</li> 
			            <li>开发测试云，专门提供的从硬件基础设施到各类开发测试环境和管理工具在内的研发资源服务；</li>
			          </ul>
					  <br />
					   <p class="button"><a href="${ctx}/pages/product/products.jsp?productSid=106&productParentSid=104" class="blackButton" style="text-decoration:none;">查看详情</a></p>
					</div>
				-->
				</section>
				<section id="slide-3">
				<!--
					<img src="${ctx}/images/index/storage_service.png" alt="行业应用云" /> 
					<div class="text"> 
						<h2>行业应用云</h2> 
						 <ul class="copy">
				            <li>教育云平台，可以建立一个售卖教育应用、服务和内容的在线市场;</li>
				            <li>IDC运营服务，面向新一代IDC同时管理IDC传统业务和云计算服务;</li>
							<li>邮件服务，体验多种方式收发邮件，体现您公司的规范形象与实力;</li>
							<li>SharePoint服务，提供基于微软SharePoint平台的工作流扩展。</li>
				         </ul>
				         <br />
					   <p class="button"><a href="${ctx}/pages/product/products.jsp?productSid=112&productParentSid=105" class="blackButton" style="text-decoration:none;">查看详情</a></p>
					</div>
				-->
				</section>
				<section id="slide-4">
				<!--
					<img src="${ctx}/images/index/enterprise_service.png" alt="应用市场" /> 
					<div class="text"> 
						<h2>应用市场</h2> 
						 <ul class="copy">
		                    <li>暂未开放</li>
		                </ul>
		                <br />
					</div>
				-->
				</section>
			</div> 
		</div> 
			<a class="slider-prev" href="javascript: void(0)">?</a> <a class="slider-next" href="javascript: void(0)">?</a>
	</div>
  </div>
</header>

</div>

<!-- 服务名称 -->
<div id="services" > 
		<div id="tapDiv">
		</div> 
		<div id="serviceContent" style="width:1000px;margin:0 auto"> 
		</div>
</div>

<%-- 
<div id="nieceWindow">
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="50px">
					<h4 style="text-align:center">惠普云管理平台进入内测阶段</h4>
				</td>  
			</tr>  
			<tr> 
				<td style="font-size:14px;line-height:20px;" align="left" valign="top">    
					<span style="line-height:30px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在此内测期间，希望您能通过屏幕右边的意见反馈框，提供您宝贵的建议或意见。截止到本月底，提出合理建议最多的账户将会给予奖品(iPad)。</span>
					<p style="line-height:30px;margin:0px;margin-bottom:5px;color:#FF9900">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前提交合理建议或问题最多的人是：娄翔，欢迎大家挑战！</p>
				</td> 
			</tr> 
			<tr> 
				<td style="font-size:12px;height:50px;" align="right" valign="middle">    
					联系人：刘洋  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   邮箱：yang.liu27@hp.com 
				</td>
			</tr>
	</table>  
</div>
--%>
<script type="text/javascript">
        <%-- // 设置cookie
        <%
        	//if (user_first_access == true) {
        %>
	    /*	var nieceWin = $("#nieceWindow").kendoWindow({    
			    title: "内测提示",   
			    modal: true,    
			    visible: true,    
			    iframe:false,
			    resizable: false, 
			    width: "500px", 
				height: "230px"
			}).data("kendoWindow");
			nieceWin.center().open(); */
		<% //} else { %>
        	//$("#nieceWindow").css("display","none");
        <% //} %>
   		--%>
   		
		Core.AjaxRequest({
			url : ws_url + "/rest/service/serviceTree",
			callback : function (data) {
				// 生成服务目录表
				setServiceCatalogContent(data);
				setServiceContent(data); 
			}
		}); 
		
		// 设置服务的目录
		function setServiceCatalogContent(data){
			var index = 0;
			var str="<ul>";
			 for(var i=0;i<data.length;i++){
				 if(data[i].serviceDefineList == ""){
				 }else{
					 if(index == 0){
						 str += "<li class='tab_label l_show' onclick='javascript:switchServiceCatalog("+index+",this)'>"+data[i].catalogName+"</li>";
						 index++;
					 }else{
						 str += "<li class='tab_label' onclick='javascript:switchServiceCatalog("+index+",this)'>"+data[i].catalogName+"</li>";
						 index++;
					 } 
				 }
			 }
			 str+="</ul>";
			 $("#tapDiv").append(str);
		}
		
		// 设置服务的内容
		function setServiceContent(data){
			var index = 0;
			var div1 = "<div class='text_content show'>";
			var div = "<div class='text_content'>";
			var str = "";
			for(var i=0;i<data.length;i++) {
				if(data[i].serviceDefineList == ""){	  
				}else{ 
					// 判断是否是第一项 
					 if(index == 0){
						 str+=div1;
						 // 判断ul的高度
						 var height;
						 if(data[i].serviceDefineList.length%3 == 0){
							 height = (data[i].serviceDefineList.length/3)*332;
						 }else{ 
							 height = (Math.floor(data[i].serviceDefineList.length/3)+1)*332;
						 }
						 str+="<ul class='serviceContent' style='height:"+(height+10)+"px; '>";
						 for(var j=0;j<data[i].serviceDefineList.length;j++){
							 str+="<li>";
							 str+="<div class='service_details_content' >"; 
							 str+="<div class='pic'>"; 
							 str+="<a href='${ctx}/pages/product/products.jsp?productSid="+data[i].serviceDefineList[j].serviceSid+"&productParentSid="+data[i].serviceDefineList[j].parentCatalogSid+"'><img src=${ctx}"+data[i].serviceDefineList[j].bImagePath+" /></a></div>";
							 str+="<div class='service_name'>"+data[i].serviceDefineList[j].serviceName+"</div>";
							 str+="<div class='service_details'><span style='font-size:14px;'  title="+data[i].serviceDefineList[j].description+">"+interceptionString(data[i].serviceDefineList[j].description,55)+"</span></div>";
							 str+="<div class='service_botton'><a href='${ctx}/pages/product/products.jsp?productSid="+data[i].serviceDefineList[j].serviceSid+"&productParentSid="+data[i].serviceDefineList[j].parentCatalogSid+"' class='blackButton'>查看详情</a></li>";
							 index++;
						 };
					 }else{
						 str+=div; 
						 var height;
						 if(data[i].serviceDefineList.length%3 == 0){
							 height = (data[i].serviceDefineList.length/3)*332;
						 }else{
							 height = (Math.floor(data[i].serviceDefineList.length/3)+1)*332;
						 }
						 str+="<ul class='serviceContent' style='height:"+(height+10)+"px; '>";
						 for(var j=0;j<data[i].serviceDefineList.length;j++){
							 str+="<li>";
							 str+="<div class='service_details_content' >";
							 str+="<div class='pic'>";  
							 str+="<a href='${ctx}/pages/product/products.jsp?productSid="+data[i].serviceDefineList[j].serviceSid+"&productParentSid="+data[i].serviceDefineList[j].parentCatalogSid+"'><img src=${ctx}"+data[i].serviceDefineList[j].bImagePath+" /></a></div>";
							 str+="<div class='service_name'>"+data[i].serviceDefineList[j].serviceName+"</div>";  
							 str+="<div class='service_details'><span style='font-size:14px;' title="+data[i].serviceDefineList[j].description+">"+interceptionString(data[i].serviceDefineList[j].description,57)+"</span></div>";
							 str+="<div class='service_botton'><a href='${ctx}/pages/product/products.jsp?productSid="+data[i].serviceDefineList[j].serviceSid+"&productParentSid="+data[i].serviceDefineList[j].parentCatalogSid+"' class='blackButton'>查看详情</a></li>";
							 index++;
						 }
					 }
					 str+="</ul></div>";
				}
			} 
			$("#serviceContent").append(str);
		}
		
		// 切换服务目录 
		function switchServiceCatalog(index,obj){
			$(".l_show").removeClass("l_show");
			$(obj).addClass("l_show");
			$(".text_content").hide();
 			$(".text_content").eq(index).show();
		}
</script>
<script type="text/javascript">
	unComment(['slide-2','slide-3','slide-4']);

	$(window).load(function () {
	    addJS(ctx + "/script/slider.js");
	});
</script>
<%@ include file="/pages/common/footer.jsp"%>