<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">

</style>
<!-- 	<ul class="order_style">   -->
<!-- 		<li class="configStyle configStyleSelected">包年包月</li>  -->
<!-- <!-- 	<li class="configStyle">按量付费</li> --> 
<!--     </ul> -->
	<input type="hidden"  id="templateSid" />   
	<br />
	<table width="666px" height="100%" border="0" cellpadding="5" cellspacing="0">  
	      <tr> 
	      		<td width="120px" height="60px" align="right" style="font-size:14px">推荐配置：</td>
	      		<td> 
	      				<div class="content-left"> 
							<ul id="recommended_configuration"></ul>
				    	</div>
	      		</td> 
	      </tr> 
		  <tr>
			<td width="120px" height="50px" align="right" style="font-size:14px">CPU：</td> 
			<td width="540px"> 
			    <div id="cpu">
					<a href="javascript:void(0);" id="1" class="select-button select-button-selected">1核</a>
					<a href="javascript:void(0);" id="2" class="select-button">2核</a>
					<a href="javascript:void(0);" id="4" class="select-button">4核</a>
					<a href="javascript:void(0);" id="8" class="select-button">8核</a>
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
			<td width="120px" align="right" valign="top" style="font-size:14px">系统盘：</td>
			<td> 
			    <font style="font-size:12px;">免费赠送（Linux 送10GB，Windows送30GB）</font>
			</td>
		  </tr>
		  <tr>
			<td width="120px" height="40px" align="right" valign="top" style="font-size:14px">数据盘：</td>
			<td style="padding-left:0px;" valign="top"> 
				<div id="diskContainer" style="width:540px;">
					
				</div>
				<div id="div_adddisk"><font id="adddiskbtn" style="font-size:14px;cursor:pointer;color:#0099d7;margin:0px;" onclick="dynamicAddDisk()">+增加一块</font><font style="font-size:12px">您还可选配<span id="diskcount">4</span>块，总容量20GB，还剩余<span id="restDisk">20</span>GB容量可以添加</font></div>
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
		  <tr>
			<td height="60px" align="right" valign="top" style="font-size:14px" >资源分配策略：</td> 
			<td valign="top">
				<div>
				 	<select id="resource_allocation_strategies" size="1" style="width:250px;font-size:12px;" placeholder="请选择..."> </select>
				</div>    
				 <div style="width:100%;">
				 	<p id="allocation_strategies_desc" style="font-size:12px;margin:0px;margin-top:2px;color:green;"></p>
				 </div>
			</td>
		  </tr>
		  <tr>
			<td height="40px" align="right" valign="middle" style="font-size:14px">操作系统：</td>
			<td>	
				<select id="osTypeCustom" size="1" style="width:100px;font-size:12px;" placeholder="Select size..."></select>
				<span id="div_system" style="width:300px;">
					   <select id="system" size="1" style="width:300px;font-size:12px;" placeholder="请选择..."></select>
				</span>		   
				<span id="div_ud_system" style="width:300px;display: none">
					   <select id="udSystem" size="1" style="width:300px;font-size:12px;" placeholder="请选择..."></select>
				</span>		   
			</td>
		  </tr>
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
							<option value="99年">永久</option>
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


			
<script type="text/javascript">
var addDiskIndex=0,diskindex=0;
var diskVolume = 20;
var customData;
$(document).ready(function() {
		// 判断用户是否登录
		if(currentUser == null){
			// 设置自定义操作系统
			customData = [
			    {name:"系统",value:"2"}
			];
		}else{
			customData = [
			  			    {name:"系统镜像",value:"2"},
			  			    {name:"自定义镜像",value:"1"}
			  			];
		}
		
		$("#osTypeCustom").kendoDropDownList({
     	     dataTextField: "name",
             dataValueField: "value",
             dataSource:customData,
             change:setOSTypeData
     	});
		
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
		Core.AjaxRequest({
			url :ws_url + "/rest/system/ALLOCATION_POLICY", 
			type:"get",
			callback : function (data) {  
              $("#resource_allocation_strategies").kendoDropDownList({
                	    dataTextField: "codeDisplay",
                        dataValueField: "codeValue", 
                        placeholder: "请选择...",
                        dataSource:data,
                        change: setDescription
                });
              
	            var allocationComboBox = $("#resource_allocation_strategies").data("kendoDropDownList");
	          	var allocationDataSource = allocationComboBox.dataSource;  
	          	var allocationDataItem = allocationDataSource.data()[3];
	          	allocationComboBox.select(allocationComboBox.ul.children().eq(3));
	          	$("#allocation_strategies_desc").html("※" + allocationDataItem.attribute1);
            } 
    	});
		
		// 初始化操作系统数据
		Core.AjaxRequest({
					url :ws_url + "/rest/system/getCodeByParams", 
					type:"post",
					params:{
						attribute3 : $("#perf").data("kendoDropDownList").value(),
						codeCategory : 'OS_TYPE'
					},
					callback : function (data) {
		                $("#system").kendoDropDownList({
		                	    dataTextField: "codeDisplay",
		                        dataValueField: "codeValue",
		                        dataSource:data
		                });
		            } 
		});
		
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
		
		 // 得到服务的配置模板项
		Core.AjaxRequest({
					url : ws_url + "/rest/service/templatelist/100",
					type: "get",
					callback : function (data) {
						$("#recommended_configuration").html("");
		                for(var i =0;i < data.length;i++){
		                	var txt = JSON.stringify(data[i]);
		                	 $("#recommended_configuration").append("<li class='temp' onclick='selectedSpec(this,"+txt+")'>"+data[i].templateName+"</li>");
		                }
		            }
		});
		 // 监控右侧购物车的值，及时更新购物车的值
		 monitorShoppingCart();
		 
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
		$("#resource_allocation_strategies").data("kendoDropDownList").value("HA-Aware");
	}else if($("#perf").data("kendoDropDownList").value() == "Standard"){
		$("#resource_allocation_strategies").data("kendoDropDownList").value("Striping");
	}else if($("#perf").data("kendoDropDownList").value() == "Basic"){
		$("#resource_allocation_strategies").data("kendoDropDownList").value("Packing");   
	}  
	
	// 给资源分配策略添加描述 
	var allocationComboBox = $("#resource_allocation_strategies").data("kendoDropDownList");
	var allocationDataSource = allocationComboBox.dataSource;  
	var allocationDataItem = allocationDataSource.data()[allocationComboBox.select()];
	$("#allocation_strategies_desc").html("※" + allocationDataItem.attribute1);
	 
	// 清除操作系统combobox的值
	$("#system").data("kendoDropDownList").text("");
	// 初始化操作系统数据
	Core.AjaxRequest({
				url :ws_url + "/rest/system/getCodeByParams", 
				type:"post",
				params:{
					attribute3 : $("#perf").data("kendoDropDownList").value(),
					codeCategory : 'OS_TYPE'
				},
				callback : function (data) {
					$("#system").data("kendoDropDownList").setDataSource(data);
	            } 
	});
}

// spliter
$("#currency").kendoNumericTextBox({
	step: 1
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

// 根据模板配置设置form数据
function selectedSpec(obj,data){ 
	$(".tempSelected").removeClass("tempSelected");
	$(obj).addClass("tempSelected");
	// 保存templateSid
	$("#templateSid").val(data.templateSid);
	
	// 模板信息设置 配置画面各项的信息 
	for(var i=0;i < data.specifications.length;i++){
		// 根据服务的配置数据，给各项配置赋值
		if(data.specifications[i].name == "CPU"){
			// 判断数据是否为CPU，设置CPU的值
			$("#cpu .select-button-selected").removeClass("select-button-selected");
			$("#"+data.specifications[i].value +"").addClass("select-button-selected");
		}else if(data.specifications[i].name == "MEMORY"){
			    // 判断数据是否为MEMORY，设置CPU的值
 				$("#memery .memery_show").removeClass("memery_show");
 				$("#memery .select-button-selected").removeClass("select-button-selected");
			    if(Number(data.specifications[i].value) <= 4){
			    	$("#no0").addClass("memery_show");
        			$("#no0 ."+data.specifications[i].value+"GB").addClass("select-button-selected");
			    }else  if(4< Number(data.specifications[i].value) && Number(data.specifications[i].value) <=8){
			    	$("#no1").addClass("memery_show");
			    	$("#no1 ."+data.specifications[i].value+"GB").addClass("select-button-selected");
			    }else if(8 < Number(data.specifications[i].value) && Number(data.specifications[i].value)< 16){
			    	$("#no2").addClass("memery_show");
			    	$("#no2 ."+data.specifications[i].value+"GB").addClass("select-button-selected");
			    }else if(16 <= Number(data.specifications[i].value) && Number(data.specifications[i].value)<=32){
			    	$("#no3").addClass("memery_show");
			    	$("#no3 ."+data.specifications[i].value+"GB").addClass("select-button-selected");
			    }				
		}else if(data.specifications[i].name == "OS"){
			// 判断数据是否为操作系统,并赋值
			$("#system").data("kendoDropDownList").value(data.specifications[i].value);
		}
// 		else if(data.specifications[i].name == "DATA_DISK"){
// 			// 判断数据是否为数据盘
// 			$("#txt").html(""+data.specifications[i].value+"");
// 			$("#sliderData").data("kendoSlider").value(""+data.specifications[i].value+"");
// 			$("#gb").val(""+data.specifications[i].value+"");
// 		}
// 		else if(data.specifications[i].name == "PERF_LEVEL"){
// 			$("#perf").data("kendoComboBox").value(data.specifications[i].value);
// 			setOSComboxData(); 
// 		}
//			else if(data.specifications[i].name == "NEED_WAN"){
//				// 判断数据是否需要公网,并赋值
//				$("input[name='needWan'][checked]").attr("checked",false);
//				$("input[name='needWan'][value="+data.specifications[i].value+"]").attr("checked","checked");   
//			}
	}
}

// 将配置信息添加到购物车
$("#save_submit").click(function(){
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
			// 判断是否可以重新订购
			if(!checkRepeatOrder()){
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
			
			var systemComboBox = $("#system").data("kendoDropDownList");
			var systemDataSource = systemComboBox.dataSource;  
			var systemDataItem = systemDataSource.data()[systemComboBox.select()];
			
			// 订单数据
			var cpu = $("#cpu .select-button-selected").attr("id");
			var memry =  $("#memery .select-button-selected").html();
			var system;
			if($("#div_ud_system").is(":visible")){
				system = $("#udSystem").data("kendoDropDownList").text();
			}else{
				system = $("#system").data("kendoDropDownList").text();
			};
			var systemData = systemDataItem.attribute5;
			var os;
			if($("#div_ud_system").is(":visible")){
				os = $("#udSystem").val();
			}else{
				os = $("#system").val();
			}
			var needWan = $("input[name='needWan']:checked").val();
			var needWanText = (needWan == "0")? "不需要":"需要";
			var count = $("#currency").val();
			var tempSid = $("#templateSid").val();
			var perfValue = $("#perf").val();
			var perfText = $("#perf").data("kendoDropDownList").text(); 
			var billing = $("#billingType").val(); 
			
			// 系统盘信息
			var dataDetail = "";
			// 将规格项组合成js对象
			var serviceSpec = new Object();
			serviceSpec.DATA_DISK = new Array();
			
			// 获取数据盘数据
			var sliderLen = $("#diskContainer .slider_div").length;
			// 添加数据盘信息
			for(var j=0;j<sliderLen;j++){
				if(Number($("input.sliderData").eq(j).val()) == 0){
					continue;
				}
				var Disk = new Object();
				dataDetail += $("input.sliderData").eq(j).val()+"GB、";
				Disk.diskSize = Number($("input.sliderData").eq(j).val());
				Disk.diskName = $("#sliderName"+j+"").val();
				Disk.storagePurpose = "02";
				serviceSpec.DATA_DISK.push(Disk);
			}
			
			// 添加系统盘信息
			var Disk1 = new Object();
			Disk1.diskSize = systemData;
			Disk1.diskName = "系统盘";
			Disk1.storagePurpose = "01";
			serviceSpec.DATA_DISK.push(Disk1);
			
			serviceSpec.CPU = cpu;
			serviceSpec.MEMORY = memry.substring(0,memry.length-2);
			serviceSpec.OS = os;
			serviceSpec.NEED_WAN = needWan;
			serviceSpec.PERF_LEVEL = perfValue;
			var specJson = JSON.stringify(serviceSpec);
			// 统计订购服务数量
			getBuyServiceCount(count);
			
			dataDetail = (dataDetail == "")?"无":dataDetail.substring(0,dataDetail.length - 1);
			
			if(billing == "Year"){
				var buyTime = $("#billingDateYear").val();
				var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='serviceName"+i+"' value='云主机服务器'/><input type='hidden' id='serviceSid"+i+"' value='100'/><input type='hidden'  id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='20%' align='right'>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>CPU:"+cpu+"核 、数据盘:"+dataDetail+"、内存:"+memry+"、操作系统:"+system+"、虚拟化类型:"+perfText+"、公网IP:"+needWanText+"</span></td></tr><tr><td align='right'>数量:</td><td  align='left'><input id='count"+i+"' type='number' style='width:100px;font-size:12px' value='"+count+"' min='1' max='2' /></td></tr><tr><td align='right'>时长:</td><td  align='left'><div style='width:100%;height:100%;position:relative;'> <select id='style_time"+i+"' size='1' onchange='switchTime(this)' style='width:60px;font-size:12px;' placeholder='Select size...'><option value='Year'>按年</option><option value='Month'>按月</option></select>&nbsp;&nbsp; <div id='month"+i+"' style='position:absolute;top:0px;left:70px;'><select id='time"+i+"' size='1'  style='width:60px;font-size:12px;' placeholder='Select size...'> <option value='1年'>1年</option><option value='2年'>2年</option><option value='3年'>3年</option><option value='99年'>永久</option></select></div></div></td></tr></table>");
			}else{
				var buyTime = $("#billingDateMonth").val();
				var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='serviceName"+i+"' value='云主机服务器'/><input type='hidden' id='serviceSid"+i+"' value='100'/><input type='hidden'  id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='20%' align='right'>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>CPU:"+cpu+"核 、数据盘:"+dataDetail+"、内存:"+memry+"、操作系统:"+system+"、虚拟化类型:"+perfText+"、公网IP:"+needWanText+"</span></td></tr><tr><td align='right'>数量:</td><td  align='left'><input id='count"+i+"' type='number' style='width:100px;font-size:12px' value='"+count+"' min='1' max='2' /></td></tr><tr><td align='right'>时长:</td><td  align='left'><div style='width:100%;height:100%;position:relative;'> <select id='style_time"+i+"' size='1' onchange='switchTime(this)' style='width:60px;font-size:12px;' placeholder='Select size...'><option value='Year'>按年</option><option value='Month'>按月</option></select>&nbsp;&nbsp; <div id='month"+i+"' style='position:absolute;top:0px;left:70px;'><select id='time"+i+"' size='1'  style='width:60px;font-size:12px;' placeholder='Select size...'><option value='1月'>1个月</option><option value='2月'>2个月</option><option value='3月'>3个月</option><option value='4月'>4个月</option><option value='5月'>5个月</option><option value='6月'>6个月</option><option value='7月'>7个月</option><option value='8月'>8个月</option><option value='9月'>9个月</option></select></div></div></td></tr></table>");
			}
			// 产生订单
			var div = $("<div id='div"+i+"' index='"+i+"' class='shippingCartContent'></div>"); 
			// 先不要费用  <tr><td align='right'>费用:</td><td style='color:orange' align='left'>1300元</td></tr>
			var del = $("<a class='del' index='"+i+"'></a>");
			var count =  $("<input type='hidden'  id='buyCount"+i+"' value='"+count+"'/>");
			div.append(del).append(table).append(count);
			$("#shoppingCart").append(div);
			$("#style_time"+i+"").kendoDropDownList();
			$("#time"+i+"").kendoDropDownList();
			$("#count"+i+"").kendoNumericTextBox({
				spin: countChange
			});
			
			del.click(function(){
				var index = $(this).attr("index");
				var count1 = $("#count"+index+"").val();
				var delCount = "-"+ count1;
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

// 当购物车中的数量发生改变时，修改总共选择数量
function countChange(){
	var index = $(".shippingCartContent").length;
	var count = 0;
	for(var j=0;j<index;j++){
		var i =$(".shippingCartContent").eq(j).attr("index");
		console.log(Number($("#count"+i+"").val()));
		count += Number($("#count"+i+"").val());
	}
	$("#buyServiceCount").html(""+(count)+"");
}

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
	var isOkSystem = false;
	// 验证虚拟化类型
	if($("#perf").data("kendoDropDownList").value() == "" || $("#perf").data("kendoDropDownList").value() == null){
		$("#div_perf").css("border","1px solid red");
		isOkPerf = false;
	}else{
		$("#div_perf").css("border","0px");
		isOkPerf = true;
	}
	if( $("#div_ud_system").css("display")=="block"){
		
		// 验证操作系统是否选择
		if($("#udSystem").data("kendoDropDownList").value() == "" || $("#udSystem").data("kendoDropDownList").value() == null){
			$("#div_ud_system").css("border","1px solid red");
			isOkSystem = false;
		}else{
			isOkSystem = true; 
			$("#div_ud_system").css("border","0px");
		}
	}else{
		// 验证操作系统是否选择
		if($("#system").data("kendoDropDownList").value() == "" || $("#system").data("kendoDropDownList").value() == null){
			$("#div_system").css("border","1px solid red");
			isOkSystem = false;
		}else{
			isOkSystem = true; 
			$("#div_system").css("border","0px");
		}
	}
	return isOkSystem && isOkPerf ;
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
	var t = "<select id='time"+index+"' size='1'  style='width:60px;font-size:12px;' placeholder='Select size...'><option value='1年'>1年</option><option value='2年'>2年</option><option value='3年'>3年</option><option value='99年'>永久</option></select>";
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
function setDescription(){
	var allocationComboBox = $("#resource_allocation_strategies").data("kendoDropDownList");
	var allocationDataSource = allocationComboBox.dataSource;  
	var allocationDataItem = allocationDataSource.data()[allocationComboBox.select()];
	$("#allocation_strategies_desc").html("※" + allocationDataItem.attribute1);
}

// 判断该服务是否可以重复订购
function checkRepeatOrder(){
	var isok = false;
	Core.AjaxRequest({
		url : ws_url + "/rest/order/checkRepeatOrder?serviceSid="+100,
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

// 动态新增数据盘，最多只能新增4个
function dynamicAddDisk(){
	if(diskindex == 4){
		return;
	} 
	var str = "<div class='slider_div' style='width:540px;position:relative;'><input id='sliderData"+addDiskIndex+"' class='sliderData' value='0' style='width:300px'/><span style='position:relative;top:-7px;'><input id='diskValue"+addDiskIndex+"' class='gb' style='height:10px;' value='0' type='text' onchange='setSliderValue(this,"+addDiskIndex+")' maxlength='4'/></span><span style='position:relative;top:-7px;'><font style='font-size:12px;'>名称：</font><input id='sliderName"+addDiskIndex+"' style='height:10px;margin-left:0px;' class='gb' type='text'/></span><font style='position:absolute;right:35px;top:5px;font-size:8px;color:#0099d7;cursor:pointer;' onclick='remove1(this,"+addDiskIndex+")'>删除</font></div>";
	$("#diskContainer").append(str);
	$("#sliderData"+addDiskIndex+"").kendoSlider({
        min: 0,
        max: 20, 
        smallStep:1,
        showButtons: false,
        change: getDataDiskValue
    });
	$("#diskcount").html(""+(3-diskindex)+"");  
	addDiskIndex++;
	diskindex++;
}
// 删除数据盘
function remove1(obj,index){ 
	$(obj).parent().remove();
	--diskindex;
	$("#diskcount").html(""+(4-diskindex)+"");
	// 判断是否该隐藏掉新增slider
	var len = $("input.sliderData").length;
	var total = 0;
	for(var i=0;i<len;i++){
		total += Number($("input.sliderData").eq(i).val());
	}
	if(total == 20){
		$("#div_adddisk").hide();
	}else{
		$("#div_adddisk").show();
	}
	// 提示可以选择的容量
	$("#restDisk").html(""+(20-total)+"");
}

// 取得所有数据盘的值，判断值是否超过20GB
function getDataDiskValue(e){
	// slider的个数
	var len = $("input.sliderData").length;
	// 初始值为0
	var diskVal = 0;
	// 获得当前操作的slider
	var indexx = this.element.context.id.substring(10);
	// 给输入框赋值
	$("#diskValue"+indexx+"").val(""+e.value+"");
	// 获得所有slider的值
	for(var i=0;i<len;i++){
		diskVal += Number($("input.sliderData").eq(i).val());
	}
	
	// 判断值是否超出
	if((diskVolume-diskVal) < 0){
		var gtval = diskVolume-diskVal;
		// 当前slider减掉超出的值
		var sliderval = Number($("#sliderData"+indexx+"").val()) + gtval;
		// 设置剩余空间为0
		$("#restDisk").html("0");
		// 弹出提示消息
		Core.alert({
			title:"提示",
			message:"对不起，你的硬盘总量不能超过20GB！",
			confirmCallback:function(){
				// 隐藏掉新增slider
				$("#div_adddisk").hide();
				// 给当前slider赋值
				$("#sliderData"+indexx+"").data("kendoSlider").value(""+sliderval+"");
				// 获得超出的值
				$("#diskValue"+indexx+"").val(""+$("#sliderData"+indexx+"").val()+"");
			}
		});
	}else if((diskVolume-diskVal) == 0){
		$("#div_adddisk").hide();
	}else{
		// 显示新增slider
		$("#div_adddisk").show();
		$("#restDisk").html(diskVolume-diskVal);
	}
}

   // 当值改变的时候
   function setSliderValue(obj,index){
	   $("#sliderData"+index+"").data("kendoSlider").value(""+$(obj).val()+"");
   }

   //当选择自定义时，更改操作系统为用户自定义的模板
   function setOSTypeData(){
		if($("#osTypeCustom").val() == "1"){
			// 用户自己的系统镜像
			Core.AjaxRequest({
				url :ws_url + "/rest/images/findImages", 
				type:"post",
				async:false,
				callback : function (data) {
	                  $("#udSystem").kendoDropDownList({
	                	    dataTextField: "udImageName",
	                        dataValueField: "udImageId",
	                        dataSource:data
	                  });
	            } ,
				failure:function(){
				}
			});
			$("#div_system").hide();
			$("#div_ud_system").show();
		}else{
			$("#div_system").show();
			$("#div_ud_system").hide();
		}
   }
</script>