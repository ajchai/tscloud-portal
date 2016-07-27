<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<link rel="shortcut icon" type="image/vnd.microsoft.icon" href="${ctx}/images/favicon.ico" />
<link rel="icon" type="image/vnd.microsoft.icon" href="${ctx}/images/favicon.ico" />
<%@ include file="/pages/common/kendo.jsp"%>
<link href="${ctx}/css/index.css" rel="stylesheet">
<script type="text/javascript">
	var ctx = "${ctx}";
	var lang = "${langLocale}";
	kendo.culture("zh-CN");
</script>
<script type="text/javascript" src="${ctx}/script/json2.js"></script>
<script type="text/javascript" src="${ctx}/script/core.js"></script>
<script type="text/javascript" src="${ctx}/script/common.js"></script>