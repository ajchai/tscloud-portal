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
</style>
<input type="hidden" id="templateSid" />
<br />
<table width="670px" height="100%" border="0" cellpadding="5" cellspacing="0">
	<tr> 
     		<td width="120px" height="60px" align="right" style="font-size:14px">推荐配置：</td>
     		<td> 
    				<div class="content-left"> 
						<ul id="recommended_configuration_relational"></ul>
			    	</div>
     		</td> 
     </tr>
	<tr>
		<td height="80px" width="120px"align="right" valign="top" style="font-size: 14px; padding-top: 10px">最大存储容量：</td>
		<td>
			<div style="width:550px;position:relative;">
				<input id="sliderMailVolume" style="width:400px" /> 
				<span style="position:relative;top:-7px;"><input id="gb" value="1" type="text" maxlength="4" onchange="checkInputValue()" />TB</span>
			</div>
			<div style="position:relative; width: 410px; padding: 0px;border:1px solid white;">
				<span style="position: absolute; left: -5px; top:-5px; font-size: 10px;">1TB</span>
				<span style="position: absolute; left: 60px; top:-5px;font-size: 10px;">100TB</span>
				<span style="position: absolute; left: 180px; top:-5px;font-size: 10px;">250TB</span>
				<span style="position: absolute; right: 0px; top:-5px;font-size: 10px;">500TB</span>
				<p style="margin-top: 20px; margin-bottom: 0px; font-size: 12px;">
					当前选择：<span id="txt" style="color: #D7410B; font-size: 12px;">1</span>TB(以2TB为步长增加)
				</p>
			</div>
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
	<tr>
		<td height="50px"></td>
		<td>
			<button class="k-button" id="save_submit" style="width: 100px"
				type="submit">提交</button>
		</td>
	</tr>
</table>

<script type="text/javascript">
$('.storageVolume tr:odd').css('background',"#D3D3D3");
$('.storageVolume tr:even').css('background','');
$('.flowTable tr:odd').css('background',"#D3D3D3");
$('.flowTable tr:even').css('background','');
	
	//得到服务的配置模板项
	Core.AjaxRequest({
			url : ws_url + "/rest/service/templatelist/104",
			type: "get",
			callback : function (data) {
				$("#recommended_configuration_relational").html("");
	            for(var i =0;i < data.length;i++){
	            	var txt = JSON.stringify(data[i]);
	            	 $("#recommended_configuration_relational").append("<li class='temp' onclick='selectedSpec(this,"+txt+")'>"+data[i].templateName+"</li>");
	            }
	        }
	});
		
	// 得到服务的配置模板项
	Core.AjaxRequest({
		url : ws_url + "/rest/service/templatelist/113",
		type : "get",
		callback : function(data) {
			for ( var i = 0; i < data.length; i++) {
				var txt = JSON.stringify(data[i]);
				$("#recommended_configuration").append(
						"<li class='temp' onclick='selectedSpec(this," + txt
								+ ")'>" + data[i].templateName + "</li>");
			}
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
            var combobox = $("#billingType").data("kendoDropDownList");
            var input = combobox.input;
            $(input).attr("disabled","disabled"); 
        } 
	});

	//根据模板配置设置form数据
	function selectedSpec(obj, data) {
		$(".tempSelected").removeClass("tempSelected");
		$(obj).addClass("tempSelected");
		// 保存templateSid
		$("#templateSid").val(data.templateSid);

		// 模板信息设置 配置画面各项的信息 
		for ( var i = 0; i < data.specifications.length; i++) {
			if (data.specifications[i].name == "OBJECT_STORE_VOLUME") {
				// 判断数据是否为数据盘
				$("#txt").html("" + data.specifications[i].value + "");
				$("#sliderMailVolume").data("kendoSlider").value(
						"" + data.specifications[i].value + "");
				$("#gb").val("" + data.specifications[i].value + "");
			}
		}
	}

	// 将配置信息添加到购物车
	$("#save_submit").click(
		function() {
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
			
			// 判断是否可以重新订购
			if(!checkRepeatOrder()){
				return;
			}

			// 动画
			$("#anamite").show().animate({left : '+=250px',top : '+=400px',height : '-=550px',width : '-=500px'}, 'fast');
			$("#anamite").animate({left : '+=400px',top : '-=250px',height : '+=150px',width : '+=100px'},'fast',function() {
					$("#anamite").hide();
					$("#anamite").css({"top" : "80px","left" : "300px","width" : "550px","height" : "600px"});

			// 订单数据
			var eachMailVolume = $("#sliderMailVolume").val();
			// 购买数量
			var count = $("#currency").val();
			// 购买时长
			var billing = $("#billingType").val(); 	
			// 模板sid
			var tempSid ="";
			
			// 将规格项组合成js对象
			var serviceSpec = new Object();
			serviceSpec.EACH_MAIL_VOLUME = eachMailVolume;
			var specJson = JSON.stringify(serviceSpec);
			
			getBuyServiceCount(1);
			
			if(billing == "Year"){
				var buyTime = $("#billingDateYear").val();
				var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='serviceName"+i+"' value='分布式存储服务'/><input type='hidden' id='serviceSid"+i+"' value='104'/><input type='hidden' id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='20%' align='right'>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>最大存储容量:"+eachMailVolume+"GB</span></td></tr><tr><td align='right'>数量:</td><td  align='left'><input id='count"+i+"' type='number' style='width:100px;font-size:12px' value='"+count+"' min='1' max='2' /></td></tr><tr><td align='right'>时长:</td><td  align='left'><div style='width:100%;height:100%;position:relative;'> <select id='style_time"+i+"' size='1' onchange='switchTime(this)' style='width:60px;font-size:12px;' placeholder='Select size...'><option value='Year'>按年</option><option value='Month'>按月</option></select>&nbsp;&nbsp; <div id='month"+i+"' style='position:absolute;top:0px;left:70px;'><select id='time"+i+"' size='1'  style='width:50px;font-size:12px;' placeholder='Select size...'> <option value='1年'>1年</option><option value='2年'>2年</option><option value='3年'>3年</option></select></div></div></td></tr></table>");
			}else{
				var buyTime = $("#billingDateMonth").val();
				var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='serviceName"+i+"' value='分布式存储服务'/><input type='hidden' id='serviceSid"+i+"' value='104'/><input type='hidden' id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='20%' align='right'>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>最大存储容量:"+eachMailVolume+"GB</span></td></tr><tr><td align='right'>数量:</td><td  align='left'><input id='count"+i+"' type='number' style='width:100px;font-size:12px' value='"+count+"' min='1' max='2' /></td></tr><tr><td align='right'>时长:</td><td  align='left'><div style='width:100%;height:100%;position:relative;'> <select id='style_time"+i+"' size='1' onchange='switchTime(this)' style='width:60px;font-size:12px;' placeholder='Select size...'><option value='Year'>按年</option><option value='Month'>按月</option></select>&nbsp;&nbsp; <div id='month"+i+"' style='position:absolute;top:0px;left:70px;'><select id='time"+i+"' size='1'  style='width:60px;font-size:12px;' placeholder='Select size...'><option value='1月'>1个月</option><option value='2月'>2个月</option><option value='3月'>3个月</option><option value='4月'>4个月</option><option value='5月'>5个月</option><option value='6月'>6个月</option><option value='7月'>7个月</option><option value='8月'>8个月</option><option value='9月'>9个月</option></select></div></div></td></tr></table>");
			}
			
			// 产生订单
			var div = $("<div id='div"+i+"' class='shippingCartContent'></div>");
			// 先不要费用  <tr><td align='right'>费用:</td><td style='color:orange' align='left'>1300元</td></tr>
			var del = $("<a class='del'></a>");
			var count = $("<input type='hidden'  id='buyCount"+i+"' value='"+count+"'/>");
			div.append(del).append(table).append(count);
			$("#shoppingCart").append(div);
			$("#style_time" + i + "").kendoDropDownList();
			$("#time" + i + "").kendoDropDownList();
			$("#count" + i + "").kendoNumericTextBox();
			del.click(function() {
				var delCount = "-" + 1;
				getBuyServiceCount(delCount);
				div.remove();
				del.remove();
				// 判断购物车中是否有值，控制"确定订单"按钮
				monitorShoppingCart();
			});
			
			$("#time"+i+"").data("kendoDropDownList").value(buyTime);
			$("#style_time"+i+"").data("kendoDropDownList").value(billing);
			i++;
			monitorShoppingCart();
		});
	});
	
	// slider初始化
	$("#sliderMailVolume").kendoSlider({
		min : 1,
		max : 500,
		smallStep : 2,
		showButtons : false,
		change : dataDiskUpdateValue
	});

	//系统盘
	function dataDiskUpdateValue() {
		$("#gb").val("" + $("#sliderMailVolume").val() + "");
		$("#txt").html("" + $("#sliderMailVolume").val() + "");
	}

	$("#gb").change(function() {
		$("#txt").html("" + $(this).val() + "");
		$("#sliderMailVolume").data("kendoSlider").value("" + $(this).val() + "");
	});

	//设置数据盘的value
	function checkInputValue() {
		if (!isNaN($("#gb").val())) {
			var val = Number($("#gb").val());
			if (val > 500) {
				$("#gb").val(500);
			} else if (val < 1) {
				$("#gb").val(1);
			} else {
				if (val % 2 == 0) {
					$("#gb").val(val);
				} else {
					$("#gb").val(val + 1);
				}
			}
		} else {
			$("#gb").val("0");
		}
	}
	
	//选择时长 年
	$("#billingDateYear").kendoDropDownList();
	var combobox = $("#billingDateYear").data("kendoDropDownList");
	var input = combobox.input;
	$(input).attr("disabled","disabled"); 
	// 选择时长 月
	$("#billingDateMonth").kendoDropDownList();
	var combobox = $("#billingDateMonth").data("kendoDropDownList");
	var input = combobox.input;
	$(input).attr("disabled","disabled");
	
	// 购买数量
	$("#currency").kendoNumericTextBox({
		step: 1
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
	
	// 判断该服务是否可以重复订购
	function checkRepeatOrder(){
		var isok = false;
		Core.AjaxRequest({
			url : ws_url + "/rest/order/checkRepeatOrder?serviceSid="+104,
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