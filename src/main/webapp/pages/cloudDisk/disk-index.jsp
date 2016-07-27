<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title.common"/><fmt:message key="header.title.console"/></title>
<link href="${ctx}/css/user.css" rel="stylesheet">
<script src="${ctx}/script/anychart/AnyChart.js"></script>
<style type="text/css">
	#container div.container-nav-left{
	    width:15%;
	    height:100%;
	    background:#0099d7;
	    float:left;
	}
	
	#container div.container-content-middle{    
		width:60%;
	    height:100%;  
	    float:left; 
	}
	
	#container div.container-info-right{
		width:25%;  
	    height:100%;
	    float:left;
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
			<div style="position:absolute;left:230px;top:10px;width:250px;height:45px;">   
					<img style="margin-top:5px;" src="${ctx }/images/nav/service/storage_distribution_white_64.png" width="30px;" height="30px"  border="0"/>  
					<span style="position:absolute;left:35px;top:10px; color:#FFFFFF;font-size:16px;color:#FFF;"><i>企业网盘</i></span>  
			</div>      
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
	<div id="container" style="">   
		   <div class="container-nav-left"></div>  
		   <div class="container-content-middle"></div>
		   <div class="container-info-right"></div>
	</div>
</body>
<script type="text/javascript">
		var bodyh = document.documentElement.clientHeight;
		document.getElementById("container").style.height = (parseInt(bodyh) - 61) + 'px'; 
		// 当浏览器屏幕大小变化时,修改div的高度
		window.onresize = function(){
			var bodyh = document.documentElement.clientHeight;
			document.getElementById("container").style.height = (parseInt(bodyh) - 61) + 'px';
		}
</script>
</html>