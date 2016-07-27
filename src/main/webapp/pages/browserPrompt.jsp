<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title.prev"/><fmt:message key="header.title"/></title>
<script type="text/javascript">
		if(Core.browser()){
			window.location.href = ctx+"/pages/intros.jsp";
		}
</script>
<%@ include file="/pages/common/navigat.jsp"%>
<style type="text/css">
	html,body{
		margin:0px;
		padding:0px;
	}
</style>
<body>
<div style="position:absolute;top:0px;left:0px;width:100%;height:100%;z-index:999999999;opacity: 0;filter:alpha(opacity=0); background:black;margin:0px;padding:0px;"></div> 
<div id="container" style="width:100%;background:#F3F3F3;margin:0px;padding:0px;">
		<table border="0"  width="100%"  height="100%"  cellpadding="0"  cellspacing="0">
					<tr>
							<td height="25%">&nbsp;</td>   
					</tr>
					<tr>  
							<td height="30%">
									<table width="60%"  style="margin:0 auto" height="100%" border="0" cellpadding="0" cellspacing="0"> 
										    <tr>
												<td style="font-size:20px;font-weight:bold" align="center" valign="top" colspan="4" height="30px"><span style="color:#0099d7">惠普云管理平台</span>目前只支持以下浏览器</td> 
											</tr>
											<tr>
												<td align="center" valign="top" colspan="4" height="70px"><span style="font-size:14px">（对于IE8等老版本浏览器的支持，将后续增加）</span></td> 
											</tr>
											<tr>
													<td align="center">
															<img src="${ctx }/images/index/chrome.png"></img> 
															<p>Chrome</p> 
													</td>
													<td  align="center">
															<img src="${ctx }/images/index/firefox.png"></img>
															<p>FireFox</p> 
													</td>
													<td  align="center">
															<img src="${ctx }/images/index/safi.png"></img> 
															<p>Safari</p> 
													</td>
													<td  align="center"> 
															<img src="${ctx }/images/index/ie.png"></img> 
															<p>IE(9.0及以上)</p> 
													</td>
											</tr>
									</table>
							</td>
					</tr>
					<tr>
							<td height="50%">&nbsp;</td>
					</tr>
		</table>
</div>
<%@ include file="/pages/common/footer.jsp"%>
<script type="text/javascript">
		var bodyh = document.documentElement.clientHeight;
		document.getElementById("container").style.height = (parseInt(bodyh) - 263) + 'px';
		$(function(){
			var bodyh = document.documentElement.clientHeight;
			document.getElementById("container").style.height = (parseInt(bodyh) - 263) + 'px';
		});
		// 当浏览器大小改变的时候，触发
		window.onresize = function(){
			var bodyh = document.documentElement.clientHeight;
			document.getElementById("container").style.height = (parseInt(bodyh) - 263) + 'px';
		};
</script>
