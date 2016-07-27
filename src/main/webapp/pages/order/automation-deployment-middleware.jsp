<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style type="text/css">
		#automation_detail ul{  
			 list-style-type: none; 
	         margin: 0; 
	         padding: 0; 
		 }
		 
		 #automation_detail li{ 
		 	position:relative;
	        margin: 15px 0 0 0; 
	     } 
		 
		 #automation_detail label {
	         display: inline-block;
	         width: 124px;
	         text-align: right;
	         font-size:14px;
	     }
	</style>
			<input type="hidden" id="deploymentType1" name="deploymentType"/>
			<div id="automation_detail">
			     <ul>
		                <li style="margin-top:0px;">
		                    <label for="softwareType1">部署软件类型：</label>
		                    &nbsp;<select id="softwareType1" name="softwareType" size="1" style="width:150px;font-size:12px;" placeholder="Select size..."></select>
		                </li>
		                <li>
		                    <label for="softwareVersion1">部署软件版本：</label>
		                    &nbsp;<select id="softwareVersion1" name="softwareVersion" size="1" style="width:150px;font-size:12px;" placeholder="Select size..."></select>
		                </li>
		                <li>
		                    <label for="OStype1">操作系统：</label>
		                    &nbsp;<select id="OStype1" name="OStype" size="1" style="width:150px;font-size:12px;" placeholder="Select size..."></select>
		                </li>
		                <li>
		                    <label for="targetHost1">目标主机：</label>
		                    &nbsp;<select id="targetHost1" name="targetHost" size="1" style="width:150px;font-size:12px;" placeholder="Select size..."></select><font style="color:green;font-size:12px;">※选择目标主机时，请先登录系统</font>
		                </li>
		                <li>
		                    <label for="domainName">域名称：</label>
		                    &nbsp;<input type="text" id="domainName" name="domainName" maxLength="20"  pattern="^[A-Za-z0-9]+$" style="font-size:12px;width:150px;height:25px;"  class="k-textbox" value="" validationMessage="请输入字母或数字！"/>
		                </li>
			      </ul>
			</div>
			<div style="width:100%;padding-top:3%;padding-bottom:3%;text-align:left;">
					<button class="k-button" id="save_submit1" style="width:100px;margin-left:134px;" type="submit">提交</button>
			</div>
	
<script type="text/javascript">
	$("#softwareType1").kendoDropDownList();
	$("#softwareVersion1").kendoDropDownList();
	// 查询操作系统
	Core.AjaxRequest({
			url :ws_url + "/rest/system/OS_CATEGORY", 
			type:"get",
			callback : function (data) {
                $("#OStype1").kendoDropDownList({
                	    dataTextField: "codeDisplay",
                        dataValueField: "codeValue",
                        placeholder: "Select...",
                        dataSource:data,
                        change:setTargetHost1
                });
            } 
     });
	$("#targetHost1").kendoDropDownList();
	
	var registerMgtor = $("#automation_detail").kendoValidator().data("kendoValidator");
	// 提交配置项
	// 将配置信息添加到购物车
	$("#save_submit1").click(function() {
			// 验证页面信息是否有误
			if(!registerMgtor.validate()){
				return;
			}
			var currentUser = null;
			// 获得当前用户，验证是否登录
			Core.AjaxRequest({
				url : ws_url + "/rest/user/current",
				type : "GET",
				async : false,
				callback : function(data) {
					var user = data.user;
					if (typeof user != "undefined"
							&& null != user) {
						currentUser = user;
					}
				}
			});
			if (typeof currentUser == "undefined"|| null == currentUser) {
				Core.alert({
					title : "提示",
					message : "您还没有登录，是否去登录？",
					confirmCallback : function() {
						goLoginPage('/pages/order/serviceConfig.jsp?serviceSid='+serviceSid,'/pages/order/serviceConfig.jsp?serviceSid='+serviceSid);
					}
				});
				return;
			}
			
			// 目标主机
			var targetHost = $("#targetHost1").data("kendoDropDownList").value();
			if(typeof(targetHost) == "undefined"){
				Core.alert({
					title : "提示",
					message : "对不起，您还没有订购云主机，不能部署该软件！是否去订购？",
					confirmCallback : function() {
						goLoginPage('/pages/order/serviceConfig.jsp?serviceSid=100','/pages/order/serviceConfig.jsp?serviceSid=100');
					}
				});
				return; 
			}else{
			}

			// 动画
			$("#anamite").show().animate({left : '+=250px',top : '+=400px',height : '-=550px',width : '-=500px'}, 'fast');
			$("#anamite").animate({left : '+=400px',top : '-=250px',height : '+=150px',width : '+=100px'},'fast',function() {
					$("#anamite").hide();
					$("#anamite").css({"top" : "80px","left" : "300px","width" : "550px","height" : "600px"});
			// 模板sid
			var tempSid ="";
			// 部署类型
			var softwareType = $("#softwareType1").data("kendoDropDownList").value();
			var softwareTypeText = $("#softwareType1").data("kendoDropDownList").text();
			// 部署软件版本
			var softwareVersion = $("#softwareVersion1").data("kendoDropDownList").value();
			var softwareVersionText = $("#softwareVersion1").data("kendoDropDownList").text();
			// 操作系统
			var OStype = $("#OStype1").data("kendoDropDownList").value();
			var osTypeText = $("#OStype1").data("kendoDropDownList").text();
			// 目标主机Text
			var targetHostText = $("#targetHost1").data("kendoDropDownList").text();
			// 数据库名称
			var domainName = $("#domainName").val();
			
			// 将规格项组合成js对象
			var serviceSpec = new Object();
			serviceSpec.deploymentType =$("#deploymentType1").val(); // 部署类型
			serviceSpec.softwareType = softwareType; // 部署软件类型
			serviceSpec.softwareVersion = softwareVersion; // 软件版本
			serviceSpec.runOsCategory = OStype; // 操作系统
			serviceSpec.runTargetHost = targetHost; // 目标主机
			serviceSpec.domainName = domainName; // 域名称
			serviceSpec.dbName = ""; // 数据库名称
			serviceSpec.dbPassword = ""; // 数据库密码
			serviceSpec.dbMemoryLimit = "-1"; // 数据库内存限制
			var specJson = JSON.stringify(serviceSpec);
			
			getBuyServiceCount(1);
			
			var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='count"+i+"' value='1'/><input type='hidden' id='serviceName"+i+"' value='数据库部署'/><input type='hidden' id='serviceSid"+i+"' value='120'/><input type='hidden' id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='30%' align='right'>选择部署:</td><td align='left'>数据库部署</td></tr><tr align='right'valign='top'><td>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>操作系统类型:"+osTypeText+"、数据库:"+softwareTypeText+"、数据库版本:"+softwareVersionText+"、目标主机:"+targetHostText+"、域名称:"+domainName+"</span></td></tr></table>");
			
			// 产生订单
			var div = $("<div id='div"+i+"' class='shippingCartContent'></div>");
			// 先不要费用  
			var del = $("<a class='del'></a>");
			div.append(del).append(table);
			$("#shoppingCart").append(div);
			del.click(function() {
				var delCount = "-" + 1;
				getBuyServiceCount(delCount);
				div.remove();
				del.remove();
				// 判断购物车中是否有值，控制"确定订单"按钮
				monitorShoppingCart();
			});
			i++;
			monitorShoppingCart();
		});
	});

	// 根据选择的操作系统，列选云主机
	function setTargetHost1(){
		if (typeof currentUser == "undefined" || null == currentUser) {
			Core.alert({
				title:"提示",
				message:"您还没有登录，无法获得您申请的云主机!"
			});
			return;
		}
		// 查询云主机
		Core.AjaxRequest({
			url :ws_url + "/rest/serviceInstance/findTargetHost?OStype=" + $("#OStype1").data("kendoDropDownList").value(), 
			type:"get",
			callback : function (data) {
				$("#targetHost1").data("kendoDropDownList").text("");
	            $("#targetHost1").kendoDropDownList({
	            	    dataTextField: "instanceName",
	                    dataValueField: "instanceSid",
	                    dataSource:data
	            });
	        } 
	    });
	}
	
	function loadMiddleSpec(data) {
		var STtype = data.specifications[0].value;
		$("#deploymentType1").val(STtype);
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
                $("#softwareType1").kendoDropDownList({
                	    dataTextField: "codeDisplay",
                        dataValueField: "codeValue",
                        dataSource:data,
                        change:setSoftWareVersion1
                });
            } 
        });
		// 获得部署软件版本
		Core.AjaxRequest({
			url :ws_url + "/rest/system/getCodeByParams", 
			type:"post",
			params:{
				parentCodeValue: $("#softwareType1").data("kendoDropDownList").value(),
				codeCategory : 'SOFTWARE_VERSION'
			},
			callback : function (data) {
                $("#softwareVersion1").kendoDropDownList({
                	    dataTextField: "codeDisplay",
                        dataValueField: "codeValue",
                        dataSource:data,
                        change:setSoftWareVersion1
                });
            }
        });
	}
	
	function setSoftWareVersion1(){
		// 获得部署软件类型
		Core.AjaxRequest({
			url :ws_url + "/rest/system/getCodeByParams", 
			type:"post",
			params:{
				parentCodeValue: $("#softwareType1").data("kendoDropDownList").value(),
				codeCategory : 'SOFTWARE_VERSION'
			},
			callback : function (data) {
                $("#softwareVersion1").kendoDropDownList({
                	    dataTextField: "codeDisplay",
                        dataValueField: "codeValue",
                        dataSource:data
                });
            } 
        });
	}
</script>
