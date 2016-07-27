<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title"/></title>
<%@ include file="/pages/common/navigat.jsp"%>
<style type="text/css">
	#container {
		width:800px;
		padding:10px;
		margin-bottom:20px; 
		margin-left:180px; 
		border:1px solid #DADADA;    
	}
	#container .modual{
		margin-bottom:20px;  
		box-shadow: #DADADA 0px 3px 3px; 
	}
	#container .modual:last-child{
		margin-bottom:0px;
	}
	#container .modual h3{
		background:#F9F9F9;
	}
	
	#tech_feature{
		list-style:none;
	
	}
	#tech_feature li{
		font-size:14px;
		margin-bottom:12px;
	}
	dl{
		margin-top:0px;
		padding:0px;    
	}
	dt{
		margin-top:15px; 
		margin-left:20px;    
		font-size:16px;
		font-weight:bold;
	}
	dd{   
		cursor:pointer;      
		font-size:14px;        
		margin-top:12px;       
		margin-left:45px;
	}
	.scrollbar{     
		color:#333;   
	}
	.scrollbar:hover{   
		color:#0099d7; 
		text-decoration:underline;   
	} 
</style>
<h2 style="text-align:center;font-weight:500;color:#0099f7">国税计算存储云平台</h2>         
<div style="position:relative;width:1000px;margin:0 auto;">         
<div id="menuSctroll" style="position:absolute;top:0px;left:00px;width:180px;height:210px;margin-bottom:10px;border:1px solid #DADADA;border-right:0px;">    
		 <div style="width:100%;height:210px;">                 
		 	 <dl>        
				<dt>关于平台</dt>
				<dd style="margin-top:10px;">•&nbsp;&nbsp;<font id="overview" class="scrollbar">平台概述</font></dd>
				<dd>•&nbsp;&nbsp;<font id="cloud_compute" class="scrollbar" >云计算</font></dd>     
				<dd>•&nbsp;&nbsp;<font id="architecture" class="scrollbar">功能架构</font></dd>           
				<dd>•&nbsp;&nbsp;<font id="feature" class="scrollbar">技术特点</font></dd>  
				<dd>•&nbsp;&nbsp;<font id="whyuse" class="scrollbar" >为什么需要云平台</font></dd>
			 </dl>	
		 </div>	  
</div>   
<div id="container">
	<div class="modual" style="width:100%;border:1px solid #DADADA;">    
			<h3 style="width:100%;height:40px;border-bottom:1px solid #DADADA;margin:0px;text-align:left;line-height:40px;font-weight:300;color:#0099d7">&nbsp;&nbsp;平台概述</h3>
			<div style="width:98%;padding:1%;margin:0px;font-size:14px;color:#333;line-height:200%;">
				 <p style="margin:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;惠普云管理平台是中国惠普技术服务部门依托其强大的技术实力、产品与服务优势，研发的企业云计算管理平台系统。该平台基于开放架构设计，融合了虚拟化技术、分布式技术和自动化技术，可以为企业云数据中心内IaaS/PaaS/SaaS平台的搭建提供全面的方案。通过云平台的运营管理中心可以实现云数据中心内云资源和服务的中央管理控制， 以简洁的管理界面，统一管理数据中心内所有的物理资源和虚拟资源，不仅能提高管理员的管控能力、简化日常例行工作，更可降低IT 环境的复杂度和管理成本。</p>
				 <p style="margin-top:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;惠普云管理平台作为惠普融合云家族的重量级产品，具有异构环境适应能力，快速部署，人机交互简易，可定制化等特点，能快速让企业从传统IT资源使用模式升级到云管理模式，为企业提供灵活、高效、高可用的基础资源服务和系统平台服务。惠普云管理平台包括了自服务门户、运营门户、服务生命周期、租户用户管理、业务流程变更、计费计量、资源管理，以及各类适配处理器组件。其中资源管理模块作为一个统一的虚拟化资源管理总线，支持通过适配处理器整合大多数主流的虚拟化平台、以及网络和存储设备，实现对统一资源全方位的供应调度、监控和配置管理。</p>
			</div>	
	</div>  
	<div class="modual" style="width:100%;border:1px solid #DADADA;">  
		<h3 style="width:100%;height:40px;border-bottom:1px solid #DADADA;margin:0px;text-align:left;line-height:40px;font-weight:300;color:#0099d7">&nbsp;&nbsp;云计算</h3>
		<div style="width:98%;padding:1%;margin:0px;font-size:14px;color:#333;line-height:200%;">
			<p style="margin:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基于云计算的新技术和应用正在重塑和颠覆传统的产业，同时云计算技术也在通过软件重新定义传统的IT系统，如服务器，存储，网络，数据中心等。在云计算环境下，企业IT架构的构建已经从传统的应用+应用的构建模式向应用+平台的模式进行演进，从而使新应用的开发、上线更加灵活、快捷和最大化资源共享。而这个平台正在随着云计算技术的不断成熟从IaaS层向PaaS由薄到厚持续发展，如下图所示。</p>
		</div>
		<img src="${ctx}/images/introduce/platform_upgrade.png" style="margin-top:20px;margin-left:50px;"></img> 
		<div style="width:98%;padding:1%;margin:0px;font-size:14px;color:#333;line-height:200%;">
			<p style="margin:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在云数据中心内，传统小型机加集中存储的部署模式，正在被X86服务器集群加云计算软件（虚拟化，分布式等开源技术）的组合进行重构和变革，如下图所示。</p>
		</div>
		<img src="${ctx}/images/introduce/service_clusters.jpg" style="margin-top:20px;margin-left:50px;"></img>
		<div style="width:98%;padding:1%;margin:0px;font-size:14px;color:#333;line-height:200%;">
		<p style="margin:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新的软件定义的数据中心能够用独立于底层硬件的软件来定义和重构服务器，存储，网络等数据中心资源服务，并让应用根据重要性与时效性不管物理资源在哪里，都能在最恰当的资源上运行。自助服务IT——用户只需要点击几次鼠标就能发布和管理他们自己的应用与数据中心资源。</p>
		</div>
	</div>
	<div class="modual" style="width:100%;border:1px solid #DADADA;">
		<h3 style="width:100%;height:40px;border-bottom:1px solid #DADADA;margin:0px;text-align:left;line-height:40px;font-weight:300;color:#0099d7">&nbsp;&nbsp;功能架构</h3>
		<img src="${ctx}/images/introduce/functional-arch.png" style="margin-top:20px;margin-left:50px;"></img>
	</div>	
	<div class="modual" style="width:100%;border:1px solid #DADADA;">
		<h3 style="width:100%;height:40px;border-bottom:1px solid #DADADA;margin:0px;text-align:left;line-height:40px;font-weight:300;color:#0099d7">&nbsp;&nbsp;技术特点</h3>
		<ul id="tech_feature">
			<li>1、图形化界面，易于管理、部署，且基于开放架构设计，客户定制和集成灵活；</li>
			<li>2、支持自动化运维管理和图形化操作，支持批量、自动部署软件（数据库、中间件等）；</li>
			<li>3、支持大部分主流的X86和小型机虚拟化技术，并且可统管物理资源，实现统一调度管理，便于利旧和搭建分级的资源池；</li>
			<li>4、支持分布式存储，分布式对象存储基于X86集群搭建而成，用于海量静态数据：视频、图片、邮件、云主机镜像等的长期保存。可满足最佳性价比和大容量存储的需求。去中心化的分布式架构，通过软件容错，降低整体系统对硬件的依赖，实现整体存储服务的高可靠性；</li>
			<li>5、灵活的业务流程引擎，支持快速流程变更，可适应多变的业务需求；</li>
			<li>6、内置多种调度策略（均分、填满、高可用、节能优先等），在资源池内考虑节能优先、低负载优先等资源使用需求智能调度和部署云主机；</li>
			<li>7、针对集团用户，惠普云服务管理平台支持多级虚拟数据中心的管理，即每个子企业只能看到本单位所分配的虚拟数据中心资源，而集团层面可以看到整个虚拟数据中心资源。</li>
		</ul>
	</div>
	<div class="modual" style="width:100%;border:1px solid #DADADA;">
		<h3 style="width:100%;height:40px;border-bottom:1px solid #DADADA;margin:0px;text-align:left;line-height:40px;font-weight:300;color:#0099d7">&nbsp;&nbsp;为什么需要云平台</h3>
		<div style="width:98%;padding:1%;margin:0px;font-size:14px;color:#333;line-height:200%;">
			<p style="margin:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	云计算的几个主要特点是：自服务和即需即供，弹性扩展，多租户。这些特点的达成是需要综合技术的组合，服务器虚拟化技术仅是将服务器资源进行了抽象和资源细颗粒化管理。除服务器虚拟化技术之外，云计算技术里面发展较快的还有分布式技术，软件定义的网络和自动化技术等。</p>
			<p style="margin:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业可通过使用云计算来：</p>
			<ul style="width:90%;padding-left:10%;margin:5px;font-siZe:12px;"> 
				<li>随用户需求而快速应变，快速响应业务需求；</li>     
				<li>搭建灵活、弹性的IT系统，支撑业务的快速、动态发展；</li>    
				<li>驱动新的业务模式去获取新的客户、市场和增加营收；</li>   
				<li>降低IT的总体成本（资源的池化和新技术的使用）；</li>
			</ul>    
			<p style="margin:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	为达成这些云计算带来的收益，企业需要使用云计算平台来在虚拟化技术之上，进行服务目录管理，用户自服务管理，多租户隔离，横向弹性扩展和使用分布式等新的技术来对传统的IT技术进行优化和变革。</p>
		</div> 
	</div>			
</div> 
</div>
<script type="text/javascript"> 
		$(function(){ 
			$(window).scroll(function(){        
				// 滚动条的高度   
				var stroll = $(window).scrollTop();            
				var H = stroll - 132;      
				if(H < 0){  
					$("#menuSctroll").css("top","0px");   
				}else{   
					$("#menuSctroll").css("top",""+H+"px");
				}
			});
			$("#overview").click(function(){      
				$("html,body").animate({scrollTop:140 }, 500);                
			}); 
			$("#cloud_compute").click(function(){
				$("html,body").animate({scrollTop:510 }, 500);                
			});       
			$("#architecture").click(function(){ 
				$("html,body").animate({scrollTop:1580}, 500);                
			});
			$("#feature").click(function(){
				$("html,body").animate({scrollTop:2223 }, 500);         
			});
			$("#whyuse").click(function(){    
				$("html,body").animate({scrollTop:2765 }, 500);     
			});  
		});
</script>
<%@ include file="/pages/common/footer.jsp"%>