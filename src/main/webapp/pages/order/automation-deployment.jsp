<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style type="text/css">
		.storageVolume{
		  width: 525px;
		  border-right:1px solid #ADAAAA;
		  border-bottom:1px solid #ADAAAA
		}
		.storageVolume  thead{
			font-size:15px;
		 	font-weight: bold;
		}
		.storageVolume  tbody{
			font-size:12px;
		}
		
		.storageVolume td{
			border-left:1px solid #ADAAAA;
			border-top:1px solid #ADAAAA
		}
		.flowTable{
		  width: 525px;
		  border-right:1px solid #ADAAAA;
		  border-bottom:1px solid #ADAAAA
		}
		.flowTable  thead{
			font-size:15px;
		 	font-weight: bold;
		}
		
		.flowTable  tbody td{
			font-size:12px;
		}
		 .flowTable td{ 
			border-left:1px solid #ADAAAA;
			border-top:1px solid #ADAAAA
		} 
		.k-slider-horizontal .k-tick { 
			background-image:none;
		}
		.k-label{
			display:none;
		}
		.mysqlOption{
			display:none;
		}
	</style>
<input type="hidden" id="templateSid" />
<br />
<table width="670px" height="100%" border="0" cellpadding="5" cellspacing="0">
	<tr> 
     		<td width="120px" height="60px" align="right" style="font-size:14px">部署类型：</td>
     		<td> 
   				<div class="content-left"> 
					<ul id="recommended_configuration_relational"></ul>
		    	</div>
     		</td> 
    </tr>
    <tr>
    	<td colspan="2" style="padding:0px;">
    		<div id="automation" style="width:100%;padding:0px;margin:0px;">
    		
    		</div> 
    	</td>
    </tr> 
</table>

<script type="text/javascript">
	// 动态加载配置页面
	$("#automation").load("automation-deployment-DB.jsp", function(){
		// 得到服务的配置模板项
		Core.AjaxRequest({
			url : ws_url + "/rest/service/templatelist/120",
			type : "get",
			callback : function(data) {
				for ( var i = 0; i < data.length; i++) {
					if(i == 0){
						var txt = JSON.stringify(data[i]);
						$("#recommended_configuration_relational").append("<li class='temp tempSelected' onclick='selectedSpec(this," + txt + ")'>" + data[i].templateName + "</li>");
						// 保存templateSid
						$("#templateSid").val(data[i].templateSid);
						var STtype = data[i].specifications[0].value;
						$("#deploymentType").val(STtype);
						// 获得部署软件类型
						Core.AjaxRequest({
							url :ws_url + "/rest/system/getCodeByParams", 
							type:"post",
							async:false,
							params:{
								parentCodeValue: STtype,
								codeCategory : 'SOFTWARE_TYPE'
							},
							callback : function (data) {
				                $("#softwareType").kendoDropDownList({
				                	    dataTextField: "codeDisplay",
				                        dataValueField: "codeValue",
				                        dataSource:data,
				                        change:setSoftWareVersion
				                });
				            } 
				        });
						// 获得部署软件版本
						Core.AjaxRequest({
							url :ws_url + "/rest/system/getCodeByParams", 
							type:"post",
							params:{
								parentCodeValue: $("#softwareType").data("kendoDropDownList").value(),
								codeCategory : 'SOFTWARE_VERSION'
							},
							callback : function (data) {
				                $("#softwareVersion").kendoDropDownList({
				                	    dataTextField: "codeDisplay",
				                        dataValueField: "codeValue",
				                        dataSource:data,
				                        change:setSoftWareVersion
				                });
				            } 
				        });
					}else{
						var txt = JSON.stringify(data[i]);
						$("#recommended_configuration_relational").append("<li class='temp' onclick='selectedSpec(this," + txt + ")'>" + data[i].templateName + "</li>");
					}
					
				}
			}
		});
	});
	
	function selectedSpec(obj,data){
		if (data.templateSid == 1093) {
			$("#automation").load("automation-deployment-DB.jsp",function(){
				loadSpec(data);
			});
		} else if (data.templateSid == 1094) {
			$("#automation").load("automation-deployment-middleware.jsp", function(){
				loadMiddleSpec(data);
			});
		}else if(data.templateSid == 1095){
			window.location.href = ctx + "/pages/order/serviceConfig.jsp";
		}
		$(".tempSelected").removeClass("tempSelected");
		$(obj).addClass("tempSelected");
		// 保存templateSid
		$("#templateSid").val(data.templateSid);
		
// 		// 查询云主机
// 		Core.AjaxRequest({
// 			url :ws_url + "/rest/serviceInstance/findTargetHost?OStype=" + $("#OStype").data("kendoDropDownList").value(), 
// 			type:"get",
// 			callback : function (data) {
// 				$("#targetHost").data("kendoDropDownList").text("");
//                 $("#targetHost").kendoDropDownList({
//                 	    dataTextField: "instanceName",
//                         dataValueField: "instanceSid",
//                         dataSource:data
//                 });
//             } 
//         });
	}	
	
	function setSoftWareVersion(){
		// 获得部署软件类型
		Core.AjaxRequest({
			url :ws_url + "/rest/system/getCodeByParams", 
			type:"post",
			params:{
				parentCodeValue: $("#softwareType").data("kendoDropDownList").value(),
				codeCategory : 'SOFTWARE_VERSION'
			},
			callback : function (data) {
                $("#softwareVersion").kendoDropDownList({
                	    dataTextField: "codeDisplay",
                        dataValueField: "codeValue",
                        dataSource:data
                });
            } 
        });
	}
	
	
	// 判断该服务是否可以重复订购
	function checkRepeatOrder(){
		var isok = false;
		Core.AjaxRequest({
			url : ws_url + "/rest/order/checkRepeatOrder?serviceSid="+120,
			type : "GET",
			async : false,
			callback : function (data) {
				isok = true;
		    },
		    failure : function(data) {
		    	isok = false;
		    	Core.alert({
					title:"提示",
					message:"对不起，该服务不能重复订购！"
				});
		    }
		});
		return isok;
	}
	
</script>