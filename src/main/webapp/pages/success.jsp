<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title"/></title>
<style type="text/css">
	html,body{
		width:100%;
		height:100%;
		padding:0px;
		margin:0px;
	}
	a{
		color:#0099d7;
	}
	.pic{
		width:400px;
		height:300px;
		background:url(../images/index/successCloud.png) no-repeat;
		background-size:100% 100%;
		float:left;
	}
	.content{
		width:433px;
		height:300px;
		float:left;
	}
</style>
<%@ include file="/pages/common/navigat.jsp"%>
<%
		String orderId = request.getParameter("orderId");
		String message = request.getParameter("msg");
		String msg = "";
		if(message != null){
			msg = new String(request.getParameter("msg").getBytes("iso-8859-1"),"UTF-8");
		}
%>   
<div id="container" style="width:100%;">
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td height="25%"></td>  
				</tr>
				<tr>
					<td height="50%" align="center">
							<div style="width:900px;height:300px;text-align:left;background:#FFFEF8;box-shadow:9px 9px 30px #999"> 
									<div class="pic"></div>
									<div class="content">
												<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">    
														<tr>
																<td height="25%"></td>
														</tr>
														<tr>
																<td height="65%" align="center">
																		<font id="div_title" style="font-size:30px;font-weight:400;">感谢您订购云服务！</font>  
																		<div id="div" style="width:100%;height:100%">
																			
																		</div>
																		
																</td>
														</tr>	
														<tr>
																<td height="10%"></td>
														</tr>		
												</table>
									</div>
							</div>
					</td>
				</tr>
				<tr>
					<td height="25%"></td>
				</tr>
		</table>
	 
</div>

<!--  <div style="margin:0 auto;width:800px;height:100%;background:gray">   -->
<!-- 	  				<table width="100%" height="100%" border="1" cellpadding="0" cellspacing="0">    -->
<!-- 	  						<tr>   -->
<!-- 	  								<td align="center" valign="bottom" height="40%">      -->
<!-- 	  								     <font  style="font-size:30px;color:#CC0000">订单提交成功！</font>      -->
<!-- 	  								     <p style="margin-top:30px;background:#FFFFEC;border:1px solid #ccc;width:70%;height:40px;line-height:40px;font-size:20px;">您的订单号已生成，请及时到<a href="#">订单管理</a>页面管理服务。</p>  -->
<!-- 	  								</td> -->
<!-- 	  						</tr> -->
<!-- 	  						<tr>  -->
<!-- 	  								<td align="center" valign="top" height="60%">   -->
<!-- 	  								    <br /> -->
<!-- 	  							     	<font style="margin:30px;font-size:16px;color:gray;margin-top:10px"><b>订单号:</b><span id="orderId"></span>&nbsp;&nbsp;</font>         -->
<!-- 	  								</td> -->
<!-- 	  						</tr> -->
<!-- 	  				</table>   -->
<!-- 	  </div>  -->

<%@ include file="/pages/common/footer.jsp"%>
<script type="text/javascript">
		var orderId ="<%=orderId %>";
		var msg = "<%=msg %>";
		// 成功的时候
		if(orderId != "" && msg == ""){
			var t = '<p style="font-size:20px;">您的订单已生成，订单号：<span id="orderId">'+orderId+'</span></p><p style="font-size:18px;">请到用户中心 ＞ <a href="javascript:goConsole();">订单管理</a>页面查看订单开通状态。</p><p style="font-size:18px;">我们将在服务开通后，为您发送通知邮件请注意查收！</p>';
			$("#div_title").css("color","#0099d7");
			$("#div").append(t);
		// 超出配额 
		}else if(orderId != "" && msg != ""){
			var t = '<p style="font-size:18px;">您的订单已生成，订单号：<span id="orderId">'+orderId+'</span></p><p style="font-size:18px;color:E0262A">'+msg+'您可到用户中心 ＞ <a href="javascript:goConsole();">订单管理</a>页面查看订单开通状态。</p>';
			$("#div_title").css("color","#0099d7");
			$("#div").append(t);
		// 失败的时候
		}else if(orderId == "" && msg != ""){
			var t = '<p style="font-size:18px;">尊敬的用户，'+msg+'';
			$("#div_title").css("color","#E0262A");
			$("#div").append(t);
		}
		
		var bodyh = document.documentElement.clientHeight;
		document.getElementById("container").style.height = (parseInt(bodyh) - 105) + 'px';
		// 当浏览器大小改变的时候，触发
		window.onresize = function(){
			var bodyh = document.documentElement.clientHeight;
			document.getElementById("container").style.height = (parseInt(bodyh) - 105) + 'px';
		};
	
		function goConsole(){
			goLoginPage('/pages/console/console.jsp?url='+"/pages/console/order/order-index.jsp&load=" + "order/order-index.jsp");
		};
</script>