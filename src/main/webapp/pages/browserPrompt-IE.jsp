<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品导航</title>
<meta name="description" content="" />
<link href="${ctx}/css/fashionfoucs.css" rel="stylesheet" />
<script src="${ctx}/script/newNav/jquery.plugin.min.js" type="text/javascript"></script>
</head>
<body>

<div id="banner">
	<ul id="banner_img"></ul>
	
	<div id="banner_ctr">
		<div id="drag_ctr"></div>
		<ul id="menu"></ul>
		<div id="drag_arrow"></div>
	</div>
	
</div>
	


<!--[if IE 6]>
<script src="js/DDPngMin.js"></script>
<script>DD_belatedPNG.fix('.ad_img img,#banner_ctr ul');</script>
<![endif]--> 
<script type="text/javascript">
    var imgAddr = ["/images/navIE/20120905092323647.png","/images/navIE/20120830015430148.png","/images/navIE/20120830015446637.png","/images/navIE/20120830015615324.png","/images/navIE/20120830015631560.png","/images/navIE/20120830015651273.png","/images/navIE/20120830015711808.png","/images/navIE/20120830015726137.png"];
	$(function(){
		Core.AjaxRequest({
			url : ws_url + "/rest/service/findAll",
			async : false,
			params:{
				"canOrder" : "1",
				"serviceStatus" :"03"
			}, 
			callback : function (data) {
				setServiceValue(data);
				addJS(ctx + "/script/newNav/fashionfoucs.js");
			}
		});
	});
	
	 function setServiceValue(data){
	    	var strDiv = "";
	    	var strUrl = "";
	    	for(var i=0;i<data.length;i++){
	    		strDiv +="<li class='item"+(i+1)+"'><div class='wrapper'><div class='ad_txt'><h2>"+data[i].serviceName+"</h2><p>"+data[i].description+"</p><a href='#'>了解详细&gt;</a></div><div class='ad_img'><img src='"+ctx+imgAddr[i]+"' width='506' height='404' alt="+data[i].serviceName+"></div></div></li>";
	    		strUrl +="<li>"+data[i].serviceName+"</li>";
	    	}
	    	$("#banner_img").html(strDiv);
	    	$("#menu").append("<li class=first-item>网站建设</li>").append(strUrl).append("<li class=last-item>网站设计</li>");
	    }
</script>
<%-- <script type="text/javascript" src="${ctx}/script/newNav/fashionfoucs.js"></script> --%>
</body>
</html>