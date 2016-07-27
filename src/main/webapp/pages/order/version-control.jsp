<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">

</style>
<!-- 	<ul class="order_style">   -->
<!-- 		<li class="configStyle configStyleSelected">包年包月</li>  -->
<!-- <!-- 	<li class="configStyle">按量付费</li> --> 
<!--     </ul> -->
	<input type="hidden"  id="templateSid" />   
	<input type="hidden"  id="osType" />
	<input type="hidden"  id="systemText" />
	<br />
	<table width="666px" height="100%" border="0" cellpadding="5" cellspacing="0">  
	      <tr> 
	      		<td width="120px" height="20px" align="right" style="font-size:14px">应用版本：</td>
	      		<td> 
	      			<a id="selectedVersion" index="0" href="javascript:selectVersion()" style="font-size:12px;">点击选择应用版本</a>
	      		</td> 
	      </tr> 
		  <tr>
			<td width="120px" height="50px" align="right" style="font-size:14px">CPU：</td>   
			<td width="540px"> 
			    <div id="cpu">
					<a href="javascript:void(0);" id="1" class="select-button select-button-selected">1核</a>
					<a href="javascript:void(0);" id="2" class="select-button">2核</a>
					<a href="javascript:void(0);" id="4" class="select-button-disable">4核</a>
					<a href="javascript:void(0);" id="8" class="select-button-disable">8核</a>
				</div>
			</td>
		  </tr>
		  <tr>
			<td height="60px" align="right" valign="top" style="font-size:14px">内存：</td>
			<td>
			    <div id="memery">
				     <div id="no0"  class="memery_selected memery_show">
						<a href="javascript:void(0);"  class="select-button select-button-selected 1GB">1GB</a>
						<a href="javascript:void(0);"  class="select-button 1.5GB">1.5GB</a>
						<a href="javascript:void(0);"  class="select-button 2GB">2GB</a>
						<a href="javascript:void(0);"  class="select-button 4GB">4GB</a>
					</div>
					 <div id="no1"  class="memery_selected">   
						<a href="javascript:void(0);"  class="select-button select-button-selected 1.5GB">1.5GB</a>
						<a href="javascript:void(0);"  class="select-button 2GB">2GB</a>
						<a href="javascript:void(0);"  class="select-button 2.5GB">2.5GB</a>
						<a href="javascript:void(0);"  class="select-button 4GB">4GB</a>
<!-- 						<a href="javascript:void(0);"  class="select-button 8GB">8GB</a> -->
					</div>
					 <div id="no2"  class="memery_selected">
						<a href="javascript:void(0);"  class="select-button select-button-selected  4GB">4GB</a>
						<a href="javascript:void(0);"  class="select-button  8GB">8GB</a>
						<a href="javascript:void(0);"  class="select-button 12GB">12GB</a>
						<a href="javascript:void(0);"  class="select-button  16GB">16GB</a>
					</div>
					 <div id="no3"  class="memery_selected">
						<a href="javascript:void(0);"   class="select-button select-button-selected 8GB">8GB</a>
						<a href="javascript:void(0);"   class="select-button 12GB">12GB</a>
						<a href="javascript:void(0);"   class="select-button 16GB">16GB</a>
						<a href="javascript:void(0);"   class="select-button 24GB">24GB</a>
						<a href="javascript:void(0);"   class="select-button 32GB">32GB</a>
					</div>
				</div>
				<p style="margin:0px;margin-top:7px;font-size:12px;color:green">※由于资源有限，暂不能为您提供高性能配置云主机，敬请谅解</p>
			</td> 
		  </tr>
		  <tr>
			<td width="120px" height="75px" align="right" valign="top" style="font-size:14px">数据盘：</td>
			<td> 
			    <div style="width:540px;position:relative;">
					<input id="sliderData"  value="0" style="width:400px"/>
					<span style="position:relative;top:-7px;"><input id="gb" value="0" type="text" maxlength="4" onchange="checkInputValue()"/>GB</span>
				</div>
				 <div style="position:relative;left:0px;width:410px;padding:0px;border:1px solid white;">
					<span style="position:absolute;left:-5px;top:-5px;font-size:10px;">0GB</span>
					<span style="position:absolute;left:183px;top:-5px;font-size:10px;">10GB</span>
					<span style="position:absolute;right:0px;top:-5px;font-size:10px;">20GB</span>
					<p style="margin-top:20px;margin-bottom:0px;font-size:12px;">当前选择：<span id="txt" style="color:#D7410B;font-size:12px;">0</span>GB(以2GB为步长增加)</p>
				</div>
			</td> 
		  </tr>
		  <tr>
			<td align="right" height="60px" valign="top" style="font-size:14px" >资源池级别：</td> 
			<td valign="top">
				 <div id="div_perf" style="width:250px;"> 
				 	<input id="perf"  required  style="width:250px;font-size:12px;" placeholder="请选择..." />
				 </div>
				 <div style="width:100%;">
					 <p id="desc" style="font-size:12px;margin:0px;margin-top:2px;color:green;"></p>     
				 </div>
			</td> 
		  </tr>
<!-- 		  <tr> -->
<!-- 			<td height="60px" align="right" valign="top" style="font-size:14px" >资源分配策略：</td>  -->
<!-- 			<td valign="top"> -->
<!-- 				<div> -->
<!-- 				 	<select id="resource_allocation_strategies" size="1" style="width:250px;font-size:12px;" placeholder="请选择..."> </select> -->
<!-- 				</div>     -->
<!-- 				 <div style="width:100%;"> -->
<!-- 				 	<p id="allocation_strategies_desc" style="font-size:12px;margin:0px;margin-top:2px;color:green;"></p> -->
<!-- 				 </div> -->
<!-- 			</td> -->
<!-- 		  </tr> -->
		  <tr>
			<td height="40px" align="right" style="font-size:14px" >公网IP：</td>
			<td>
				<input type="radio"  name="needWan"  value="1" /><span  style="font-size:12px">需要</span>
				<input type="radio"  name="needWan"  value="0"  checked="checked"/><span  style="font-size:12px">不需要</span> 
			</td>
		  </tr>
		  <tr>
			<td height="40px" align="right" style="font-size:14px" >购买数量：</td>
			<td>
				<input id="currency"  type="number"  style="width:100px;font-size:12px"  value="1"  min="1"  onchange="setBuyCount()"  required="true"  max="2" />
			</td>
		  </tr>
		  <tr>
			<td height="40px" align="right" style="font-size:14px">购买时长：</td>
			<td>
				 <select id="billingType" size="1" style="width:100px;font-size:12px;" placeholder="Select size...">
				 </select>&nbsp;&nbsp;
				 <span id="dateYear">
					  <select id="billingDateYear" size="1"  value="3" style="width:100px;font-size:12px;" placeholder="Select size...">
					        <option value="1年">1年</option>
							<option value="2年">2年</option>
							<option value="3年">3年</option>
					 </select>
				 </span>
				 <span id="dateMonth" style="display:none">
					 <select id="billingDateMonth" size="1"  value="3" style="width:100px;font-size:12px;">
					        <option value="1月">1个月</option>
							<option value="2月">2个月</option>
							<option value="3月">3个月</option>
							<option value="4月">4个月</option>
							<option value="5月">5个月</option>
							<option value="6月">6个月</option>
							<option value="7月">7个月</option>
							<option value="8月">8个月</option>
							<option value="9月">9个月</option>
					 </select>
				 </span>
			</td>
		  </tr>
<!-- 				  <tr> -->
<!-- 					<td align="right" valign="top" style="font-size:14px">费用:</td> -->
<!-- 					<td> -->
<!-- 						<p style="font-size:12px;color:#CCCCCC;margin-top:0px;margin-bottom:3px;">根据您所选的以下配置,自动报价:</p> -->
<!-- 						<p style="font-size:14px;margin-top:0px;margin-bottom:3px;">1 核CPU、512MB内存、50G数据盘、1M带宽</p> -->
<!-- 						<p style="font-size:24px;color:#D7410B;margin-top:0px;margin-bottom:3px;">890元</p> -->
<!-- 					</td> -->
<!-- 				  </tr> -->
		  <tr>
		  	<td height="60px"></td>
			<td>
				<button class="k-button" id="save_submit" style="width:100px" type="submit">提交</button>
			</td>
		  </tr>
</table>

<div id="selectWindow" style="margin:0px;padding:0px;overflow:hidden"></div>
			
<script type="text/javascript">
var versionIndex;
$(document).ready(function() {
		// 将应用版本的index存储起来
		versionIndex = $("#selectedVersion").attr("index");
		// 初始化性能等级
		Core.AjaxRequest({
			url :ws_url + "/rest/system/getCodeByParams", 
			type:"post",
			async:false,
			params:{
				codeCategory:'PERF_LEVEL'
			},
			callback : function (data) {
                $("#perf").kendoDropDownList({
                	    dataTextField: "codeDisplay",
                        dataValueField: "codeValue",
                        dataSource:data,
                        change: setOSComboxData
                });
                var allocationComboBox = $("#perf").data("kendoDropDownList");
	          	var allocationDataSource = allocationComboBox.dataSource;  
	          	var allocationDataItem = allocationDataSource.data()[0];
	          	$("#desc").html("※" + allocationDataItem.attribute1);
            } 
    	});
		
		// 初始化资源分配策略
// 		Core.AjaxRequest({
// 			url :ws_url + "/rest/system/ALLOCATION_POLICY", 
// 			type:"get",
// 			callback : function (data) {  
//               $("#resource_allocation_strategies").kendoDropDownList({
//                 	    dataTextField: "codeDisplay",
//                         dataValueField: "codeValue", 
//                         placeholder: "请选择...",
//                         dataSource:data,
//                         index:"3",
//                         change: setDescription
//                 });
              
// 	            var allocationComboBox = $("#resource_allocation_strategies").data("kendoDropDownList");
// 	          	var allocationDataSource = allocationComboBox.dataSource;  
// 	          	var allocationDataItem = allocationDataSource.data()[0];
// 	          	$("#allocation_strategies_desc").html("※" + allocationDataItem.attribute1);
//             } 
//     	});
		
		// 初始化计费类型
		Core.AjaxRequest({
			url :ws_url + "/rest/system/BILLING_TYPE_YM", 
			type:"get",
			callback : function (data) {
                $("#billingType").kendoDropDownList({
                	    dataTextField: "codeDisplay",
                        dataValueField: "codeValue",
                        placeholder: "Select...",
                        dataSource:data ,
                        change: onSelect
                });
            } 
    	});
		
		$("#billingDateYear").kendoDropDownList();
		var combobox = $("#billingDateYear").data("kendoDropDownList");
        var input = combobox.input;
        $(input).attr("disabled","disabled");
        
		$("#billingDateMonth").kendoDropDownList();
		var combobox = $("#billingDateMonth").data("kendoDropDownList");
        var input = combobox.input;
        $(input).attr("disabled","disabled");

		 // 监控右侧购物车的值，及时更新购物车的值
		 monitorShoppingCart();
		 
		 // slider初始化
		 $("#sliderData").kendoSlider({
             min: 0,
             max: 20, 
             smallStep:2,
             showButtons: false,
             change: dataDiskUpdateValue
         });
		 
//			 var perfComboBox = $("#perf").data("kendoComboBox");
//	     		var dataSource = perfComboBox.dataSource;
//	     		var dataItem = dataSource.data()[perfComboBox.select()];
//	     		alert(dataItem.attribute3);
//	     		$("#desc").html(dataItem.attribute3);
});

// 根据  性能 设置 操作系统 的值
function setOSComboxData(e){
	// 给虚拟化类型添加描述
	var perfComboBox = $("#perf").data("kendoDropDownList");
	var dataSource = perfComboBox.dataSource;
	var dataItem = dataSource.data()[perfComboBox.select()];
	$("#desc").html("※" + dataItem.attribute1);
	
	// 设置资源分配策略值   
	if($("#perf").data("kendoDropDownList").value() == "High"){
	//	$("#resource_allocation_strategies").data("kendoDropDownList").value("HA-Aware");
	}else if($("#perf").data("kendoDropDownList").value() == "Standard"){
	//	$("#resource_allocation_strategies").data("kendoDropDownList").value("Striping");
	}else if($("#perf").data("kendoDropDownList").value() == "Basic"){
	//	$("#resource_allocation_strategies").data("kendoDropDownList").value("Packing");   
	}  
	
	// 给资源分配策略添加描述 
// 	var allocationComboBox = $("#resource_allocation_strategies").data("kendoDropDownList");
// 	var allocationDataSource = allocationComboBox.dataSource;  
// 	var allocationDataItem = allocationDataSource.data()[allocationComboBox.select()];
// 	$("#allocation_strategies_desc").html("※" + allocationDataItem.attribute1);
}

// spliter
$("#currency").kendoNumericTextBox({
	step: 1
});

//系统盘
function dataDiskUpdateValue(){
	$("#gb").val(""+$("#sliderData").val()+"");
	$("#txt").html(""+$("#sliderData").val()+"");
}

$("#gb").change(function(){
	$("#txt").html(""+$(this).val()+"");
	$("#sliderData").data("kendoSlider").value(""+$(this).val()+"");
});

// 选择服务配置类型
$(".configStyle").each(function(index){
	$(this).click(function(){
		$(".configStyleSelected").removeClass("configStyleSelected");
		$(this).addClass("configStyleSelected");
	});
});

// CPU类型
$("#cpu .select-button").each(function(index){
	$(this).click(function(){
		$("#cpu .select-button-selected").removeClass("select-button-selected");
		$(this).addClass("select-button-selected");
		$("#memery .memery_show").removeClass("memery_show");
		$("#memery .memery_selected").eq(index).addClass("memery_show");
		$("#memery  .select-button-selected").removeClass("select-button-selected");
		$("#no"+index+" .select-button").eq(0).addClass("select-button-selected");
		 
	});
});

// 内存类型
$("#memery .select-button").each(function(index){
	$(this).click(function(){
		$("#memery .select-button-selected").removeClass("select-button-selected");
		$(this).addClass("select-button-selected");
	});
});

// 将配置信息添加到购物车
$("#save_submit").click(function(){
			// 判断是否选择了应用版本
			if($("#osType").val() == null || $("#osType").val() == ""){
				Core.alert({title:"提示",message:"请选择应用版本！"});
				return;
			}
	        var currentUser = null;
	        // 获得当前用户，验证是否登录
			Core.AjaxRequest({
				url : ws_url + "/rest/user/current",
				type : "GET",
				async : false,
				callback : function (data) {
					var user = data.user;
					if(typeof user != "undefined" && null != user) {
						currentUser = user;
					}
			    }
			});
			if (typeof currentUser == "undefined" || null == currentUser) {
				Core.alert({
					title:"提示",
					message:"您还没有登录，是否去登录？",
					confirmCallback:function(){
						goLoginPage('/pages/order/serviceConfig.jsp?serviceSid='+serviceSid,'/pages/order/serviceConfig.jsp?serviceSid='+serviceSid);
					}
				});
				return;
			}
			
			// 判断虚拟化类型和操作系统是否都已经填写
		    if(!checkRequired()){
		    	return;
		    }
			
	        // 动画
			$("#anamite").show().animate({left:'+=250px',top:'+=400px',height:'-=550px',width:'-=500px'},'fast');
			$("#anamite").animate({left:'+=400px',top:'-=250px',height:'+=150px',width:'+=100px'},'fast',function(){
			$("#anamite").hide();
			$("#anamite").css({"top":"80px","left":"300px","width":"550px","height":"600px"});
	
			// 订单数据
			var cpu = $("#cpu .select-button-selected").attr("id");
			var memry =  $("#memery .select-button-selected").html();
			var disk = $("#sliderData").val();
			var system = $("#systemText").val();
			var os = $("#osType").val();
			var needWan = $("input[name='needWan']:checked").val();
			var needWanText = (needWan == "0")? "不需要":"需要";
			var count = $("#currency").val();
			var tempSid = $("#templateSid").val();
			var perfValue = $("#perf").val();
			var perfText = $("#perf").data("kendoDropDownList").text(); 
			var billing = $("#billingType").val(); 
			// 统计数量
			getBuyServiceCount(1);
			
			// 将规格项组合成js对象
			var serviceSpec = new Object();
			serviceSpec.CPU = cpu;
			serviceSpec.MEMORY = memry.substring(0,memry.length-2);
			serviceSpec.DATA_DISK = disk;
			serviceSpec.OS = os;
			serviceSpec.NEED_WAN = needWan;
			serviceSpec.PERF_LEVEL = perfValue;
			var specJson = JSON.stringify(serviceSpec);
			
			if(billing == "Year"){
				var buyTime = $("#billingDateYear").val();
				var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='serviceName"+i+"' value='云主机服务器'/><input type='hidden' id='serviceSid"+i+"' value='100'/><input type='hidden'  id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='20%' align='right'>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>CPU:"+cpu+"核 、数据盘:"+disk+"GB、内存:"+memry+"、应用版本:"+system+"、虚拟化类型:"+perfText+"、公网IP:"+needWanText+"</span></td></tr><tr><td align='right'>数量:</td><td  align='left'><input id='count"+i+"' type='number' style='width:100px;font-size:12px' value='"+count+"' min='1' max='2' /></td></tr><tr><td align='right'>时长:</td><td  align='left'><div style='width:100%;height:100%;position:relative;'> <select id='style_time"+i+"' size='1' onchange='switchTime(this)' style='width:60px;font-size:12px;' placeholder='Select size...'><option value='Year'>按年</option><option value='Month'>按月</option></select>&nbsp;&nbsp; <div id='month"+i+"' style='position:absolute;top:0px;left:70px;'><select id='time"+i+"' size='1'  style='width:50px;font-size:12px;' placeholder='Select size...'> <option value='1年'>1年</option><option value='2年'>2年</option><option value='3年'>3年</option></select></div></div></td></tr></table>");
			}else{
				var buyTime = $("#billingDateMonth").val();
				var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='serviceName"+i+"' value='云主机服务器'/><input type='hidden' id='serviceSid"+i+"' value='100'/><input type='hidden'  id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='20%' align='right'>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>CPU:"+cpu+"核 、数据盘:"+disk+"GB、内存:"+memry+" 应用版本:"+system+"、虚拟化类型:"+perfText+"、公网IP:"+needWanText+"</span></td></tr><tr><td align='right'>数量:</td><td  align='left'><input id='count"+i+"' type='number' style='width:100px;font-size:12px' value='"+count+"' min='1' max='2' /></td></tr><tr><td align='right'>时长:</td><td  align='left'><div style='width:100%;height:100%;position:relative;'> <select id='style_time"+i+"' size='1' onchange='switchTime(this)' style='width:60px;font-size:12px;' placeholder='Select size...'><option value='Year'>按年</option><option value='Month'>按月</option></select>&nbsp;&nbsp; <div id='month"+i+"' style='position:absolute;top:0px;left:70px;'><select id='time"+i+"' size='1'  style='width:60px;font-size:12px;' placeholder='Select size...'><option value='1月'>1个月</option><option value='2月'>2个月</option><option value='3月'>3个月</option><option value='4月'>4个月</option><option value='5月'>5个月</option><option value='6月'>6个月</option><option value='7月'>7个月</option><option value='8月'>8个月</option><option value='9月'>9个月</option></select></div></div></td></tr></table>");
			}
			// 产生订单
			var div = $("<div id='div"+i+"' class='shippingCartContent'></div>"); 
			// 先不要费用  <tr><td align='right'>费用:</td><td style='color:orange' align='left'>1300元</td></tr>
			var del = $("<a class='del'></a>");
			var count =  $("<input type='hidden'  id='buyCount"+i+"' value='"+count+"'/>");
			div.append(del).append(table).append(count);
			$("#shoppingCart").append(div);
			$("#style_time"+i+"").kendoDropDownList();
			$("#time"+i+"").kendoDropDownList();
			$("#count"+i+"").kendoNumericTextBox();
			del.click(function(){
				var delCount = "-"+1;
				getBuyServiceCount(delCount);
				div.remove();
				del.remove();
				// 判断购物车中是否有值，控制"确定订单"按钮
				monitorShoppingCart();
			 });
			// 设置时长
			$("#time"+i+"").data("kendoDropDownList").value(buyTime);
			$("#style_time"+i+"").data("kendoDropDownList").value(billing);
			 i++;
			 monitorShoppingCart();
	});
});

// 切换购买类型，设置购买时长
function onSelect(){
	if($("#billingType").val() == "Month"){
		$("#dateYear").hide();
		$("#dateMonth").show();
	}else{
		$("#dateMonth").hide();
		$("#dateYear").show();
	}
}

// 判断必须项
function checkRequired(){
	
	var isOkPerf = false;
	// 验证虚拟化类型
	if($("#perf").data("kendoDropDownList").value() == "" || $("#perf").data("kendoDropDownList").value() == null){
		$("#div_perf").css("border","1px solid red");
		isOkPerf = false;
	}else{
		$("#div_perf").css("border","0px");
		isOkPerf = true;
	}
	
	return isOkPerf ;
}

// 设置数据盘的value
function checkInputValue(){
	if(!isNaN($("#gb").val())){
		var val = Number($("#gb").val());
		if(val > 20){
			$("#gb").val(20);
		}else if(val < 0){
			$("#gb").val(0);
		}
		else{
			if(val%2 == 0){
				$("#gb").val(val);
			}else{
				$("#gb").val(Math.ceil(val/2)+1);
			}
		}
	}else{
		$("#gb").val("0");
	}
}
function setBuyCount(){
	$("#currency").val(Math.ceil(Number($("#currency").val())));
}

function switchTime(obj){
	var index = $(obj).attr("id").substring(10);
	var t = "<select id='time"+index+"' size='1'  style='width:70px;font-size:12px;' placeholder='Select size...'><option value='1年'>1年</option><option value='2年'>2年</option><option value='3年'>3年</option></select>";
	var tt = "<select id='time"+index+"' size='1'  style='width:70px;font-size:12px;' placeholder='Select size...'><option value='1月'>1个月</option><option value='2月'>2个月</option><option value='3月'>3个月</option><option value='4月'>4个月</option><option value='5月'>5个月</option><option value='6月'>6个月</option><option value='7月'>7个月</option><option value='8月'>8个月</option><option value='9月'>9个月</option></select>";
	if($(obj).val() == "Month"){
		$("#month"+index+"").html("");
		$("#month"+index+"").html(tt);
	}else{
		$("#month"+index+"").html("");
		$("#month"+index+"").html(t);
	}
	
	$("#time"+index+"").kendoDropDownList();
	
}

// 设置资源分配策略的描述
// function setDescription(){
// 	var allocationComboBox = $("#resource_allocation_strategies").data("kendoDropDownList");
// 	var allocationDataSource = allocationComboBox.dataSource;  
// 	var allocationDataItem = allocationDataSource.data()[allocationComboBox.select()];
// 	$("#allocation_strategies_desc").html("※" + allocationDataItem.attribute1);
// }

// 选择应用版本
function selectVersion(){
	
	var detailWin = $("#selectWindow").kendoWindow({
        title: "应用版本选择",
        modal: true,
        visible: false,
        iframe:false,
        resizable: false,
        width: "800px",
		height: "412px",
		content: "select-version-control.jsp"   
    }).data("kendoWindow");
	detailWin.center().open();
}
// 设置选中的值
function setSelectedVersion(versionValue,versionText){
	$("#selectedVersion").html(versionText);
	$("#osType").val(versionValue);
	$("#systemText").val(versionText);
}
</script>