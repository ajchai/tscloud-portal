<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <style type="text/css">
  		#countuser{
  				border: 1px solid #CCCCCC;
				border-radius: 3px;
				box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.102) inset;
				color: #D7410B;
				font-size: 14px;
				height: 16px;
				line-height: 16px;
				margin: -3px 10px 0px;
				padding: 5px 7px;
				text-align: center;
				vertical-align: middle;
				width: 40px;
  		}
  </style>
	<input type="hidden"  id="templateSid" />
	<br />   
	<table width="660px" height="100%" border="0" cellpadding="5" cellspacing="0">  
	      <tr> 
	      		<td width="140px" height="40px" align="right" style="font-size:14px">推荐配置：</td>
	      		<td> 
	      				<div class="content-left"> 
							<ul id="recommended_configuration"></ul>
				    	</div>
	      		</td> 
	      </tr>
		  <tr>
			<td align="right" valign="top" style="font-size:14px" >邮箱域名：</td> 
			<td>
<!-- 				 <input type="text" id="domain" style="height:25px;" style="font-size:12px;width:100px"  class="k-textbox" value="" />   -->
				<input id="diy" type="radio" name="domain" checked="checked"/><font style="font-size:12px">自定义</font>
				<input id="system_default" type="radio" name="domain" /><font style="font-size:12px">系统默认</font>
			</td> 
		  </tr>
		  <tr>
		  	<td></td>
		  	<td>
		  		<div id="div_diy" style="width:100%;height:100%;margin:3px;">
		  				<font style="font-size:12px">请输入邮箱域名：</font><input type="text" id="domain" maxLength="20" data-isok="no" onchange="checkDiyDomainInput(this)" style="font-size:12px;width:150px;height:25px;"  class="k-textbox" value="" />
			  			<p style="font-size:12px;color:green;margin:0px;margin-top:5px;">※如果您选择自定义的域名时，请将域名对应到IP:59.151.24.9</p>
		  		</div>
		  		<div id="div_default" style="width:100%;height:100%;display:none">
		  				<font style="font-size:12px">请输入域名：</font><input type="text" id="system_default_domain" maxLength="20" data-isok="no" style="font-size:12px;width:80px;" onchange="checkDefaultDomainInput(this)" class="k-textbox" value="" /><font id="system_default_domain2" style="font-size:12px;">.hp-service365.com</font>
		  		</div>
		  	</td>
		  </tr>
		  <tr>
			<td height="80px" align="right" valign="top" style="font-size:14px;padding-top:10px">单个用户邮箱容量：</td>
			<td> 
			    <div style="width:510px;position:relative;">
					<input id="sliderMailVolume" style="width:380px"/>
					<span style="position:relative;top:-7px;"><input id="gb" value="200" type="text" maxlength="4" onchange="checkInputValue()"/>MB</span>
				</div>
				 <div style="position:relative;width:410px;padding:0px;border:1px solid white;">
					<span style="position:absolute;left:-10px;top:-5px;font-size:10px;">200MB</span>
					<span style="position:absolute;left:45px;top:-5px;font-size:10px;">500MB</span>
					<span style="position:absolute;left:150px;top:-5px;font-size:10px;">1024MB</span>
					<span style="position:absolute;right:20px;top:-5px;font-size:10px;">2048MB</span>
					<p style="margin-top:20px;margin-bottom:0px;font-size:12px;">当前选择：<span id="txt" style="color:#D7410B;font-size:12px;">200</span>MB(以5MB为步长增加)</p>
				</div>
			</td> 
		  </tr>
		  <tr>
			<td height="80px" align="right" valign="top" style="font-size:14px;padding-top:10px">用户数量：</td>
			<td> 
			    <div style="width:510px;position:relative;">
					<input id="usercount" style="width:380px"/>
					<span style="position:relative;top:-7px;"><input id="countuser" value="5" type="text" maxlength="4" onchange="checkUserCountValue()"/>个</span>
				</div>
				 <div style="position:relative;width:410px;padding:0px;border:1px solid white;">
					<span style="position:absolute;left:-10px;top:-5px;font-size:10px;">5个</span>
					<span style="position:absolute;left:170px;top:-5px;font-size:10px;">100个</span>
					<span style="position:absolute;right:20px;top:-5px;font-size:10px;">200个</span>
					<p style="margin-top:20px;margin-bottom:0px;font-size:12px;">当前选择：<span id="usercounttips" style="color:#D7410B;font-size:12px;">5</span>个(以5个为步长增加)</p>
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
		  
<!-- 				  <tr> -->
<!-- 					<td align="right" valign="top" style="font-size:14px">费用:</td> -->
<!-- 					<td> -->
<!-- 						<p style="font-size:12px;color:#CCCCCC;margin-top:0px;margin-bottom:3px;">根据您所选的以下配置,自动报价:</p> -->
<!-- 						<p style="font-size:14px;margin-top:0px;margin-bottom:3px;">1 核CPU、512MB内存、50G数据盘、1M带宽</p> -->
<!-- 						<p style="font-size:24px;color:#D7410B;margin-top:0px;margin-bottom:3px;">890元</p> -->
<!-- 					</td> -->
<!-- 				  </tr> -->
		  <tr>
		  	<td height="50px"></td>
			<td>
				<button class="k-button" id="save_submit" style="width:100px" type="submit">提交</button>
			</td>
		  </tr>
</table>
<script type="text/javascript">
	//初始化计费类型
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
	
	//得到系统默认domation 即：企业简写
// 	Core.AjaxRequest({
// 		url :ws_url + "/rest/system/BILLING_TYPE_YM", 
// 		type:"get",
// 		callback : function (data) {
// 	        $("#billingType").kendoDropDownList({
// 	        	    dataTextField: "codeDisplay",
// 	                dataValueField: "codeValue",
// 	                placeholder: "Select...", 
// 	                dataSource:data ,
// 	                change: onSelect
// 	        });
// 	    } 
// 	});

	// 得到服务的配置模板项
	Core.AjaxRequest({
				url : ws_url + "/rest/service/templatelist/114",
				type: "get",
				callback : function (data) {
					$("#recommended_configuration_relational").html("");
	                for(var i =0;i < data.length;i++){
	                	var txt = JSON.stringify(data[i]);
	                	 $("#recommended_configuration").append("<li class='temp' onclick='selectedSpec(this,"+txt+")'>"+data[i].templateName+"</li>");
	                }
	            }
	});

	//根据模板配置设置form数据
	function selectedSpec(obj,data){ 
		$(".tempSelected").removeClass("tempSelected");
		$(obj).addClass("tempSelected");
		// 保存templateSid
		$("#templateSid").val(data.templateSid);
		
		// 模板信息设置 配置画面各项的信息 
		for(var i=0;i < data.specifications.length;i++){
			 if(data.specifications[i].name == "EACH_EMAIL_VOLUME"){
				// 判断数据是否为数据盘
				$("#txt").html(""+data.specifications[i].value+"");
				$("#sliderMailVolume").data("kendoSlider").value(""+data.specifications[i].value+"");
				$("#gb").val(""+data.specifications[i].value+"");
			}
		}
	}

	//将配置信息添加到购物车
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
				
				// 判断自定义域名是否输入正确
				if($("#div_diy").is(":visible")){
					if($("#domain").val() == null || $("#domain").val() == ""){
						$("#domain").css("border","1px solid red");
					}
					if($("#domain").attr("data-isok") == "no"){
						return;
					}
						
				}
				// 判断自定义域名是否输入正确
				if($("#div_default").is(":visible")){
					if($("#system_default_domain").val() == null || $("#system_default_domain").val() == ""){
						$("#system_default_domain").css("border","1px solid red");
					}
					if($("#system_default_domain").attr("data-isok") == "no"){
						return;
					}
				}
				
				// 判断是否可以重新订购
				if(!checkRepeatOrder()){
					return;
				}
				
				// 只能提交一个服务
				if($(".shippingCartContent").length > 0){
					return;
				}
				
		        // 动画
				$("#anamite").show().animate({left:'+=250px',top:'+=400px',height:'-=550px',width:'-=500px'},'fast');
				    $("#anamite").animate({left:'+=400px',top:'-=250px',height:'+=150px',width:'+=100px'},'fast',function(){
				$("#anamite").hide();
				$("#anamite").css({"top":"80px","left":"300px","width":"550px","height":"600px"});
				
				if($("#div_diy").is(":visible")){
					// 订单数据
					var domain = $("#domain").val();
				}else{
					// 订单数据
					var domain = $("#system_default_domain").val() + $("#system_default_domain2").html();
				}
			
				var eachMailVolume = $("#sliderMailVolume").val();
				// 购买数量
				var count = $("#currency").val();
				// 购买时长
				var billing = $("#billingType").val(); 	
				// 模板sid
				var tempSid = $("#templateSid").val();
				// 用户数量
				var usercount = $("#usercount").val();
				
				// 统计数量
				getBuyServiceCount(1);
				
				// 将规格项组合成js对象
				var serviceSpec = new Object();
				serviceSpec.DOMAIN = domain;
				serviceSpec.USER_AMOUNT = usercount;
				serviceSpec.EACH_MAIL_VOLUME = eachMailVolume;
				var specJson = JSON.stringify(serviceSpec);
				
				if(billing == "Year"){
					var buyTime = $("#billingDateYear").val();
					var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='serviceName"+i+"' value='邮件服务'/><input type='hidden' id='serviceSid"+i+"' value='114'/><input type='hidden' id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='20%' align='right'>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>邮箱域名:"+domain+"、单个用户邮箱容量:"+eachMailVolume+"MB</span></td></tr><tr><td align='right'>数量:</td><td  align='left'><input id='count"+i+"' type='number' style='width:100px;font-size:12px' value='"+count+"' min='1' max='2' /></td></tr><tr><td align='right'>时长:</td><td  align='left'><div style='width:100%;height:100%;position:relative;'> <select id='style_time"+i+"' size='1' onchange='switchTime(this)' style='width:60px;font-size:12px;' placeholder='Select size...'><option value='Year'>按年</option><option value='Month'>按月</option></select>&nbsp;&nbsp; <div id='month"+i+"' style='position:absolute;top:0px;left:70px;'><select id='time"+i+"' size='1'  style='width:50px;font-size:12px;' placeholder='Select size...'> <option value='1年'>1年</option><option value='2年'>2年</option><option value='3年'>3年</option></select></div></div></td></tr></table>");
				}else{
					var buyTime = $("#billingDateMonth").val();
					var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='serviceName"+i+"' value='邮件服务'/><input type='hidden' id='serviceSid"+i+"' value='114'/><input type='hidden' id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='20%' align='right'>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>邮箱域名:"+domain+"、单个用户邮箱容量:"+eachMailVolume+"MB</span></td></tr><tr><td align='right'>数量:</td><td  align='left'><input id='count"+i+"' type='number' style='width:100px;font-size:12px' value='"+count+"' min='1' max='2' /></td></tr><tr><td align='right'>时长:</td><td  align='left'><div style='width:100%;height:100%;position:relative;'> <select id='style_time"+i+"' size='1' onchange='switchTime(this)' style='width:60px;font-size:12px;' placeholder='Select size...'><option value='Year'>按年</option><option value='Month'>按月</option></select>&nbsp;&nbsp; <div id='month"+i+"' style='position:absolute;top:0px;left:70px;'><select id='time"+i+"' size='1'  style='width:60px;font-size:12px;' placeholder='Select size...'><option value='1月'>1个月</option><option value='2月'>2个月</option><option value='3月'>3个月</option><option value='4月'>4个月</option><option value='5月'>5个月</option><option value='6月'>6个月</option><option value='7月'>7个月</option><option value='8月'>8个月</option><option value='9月'>9个月</option></select></div></div></td></tr></table>");
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
				$("#time"+i+"").data("kendoDropDownList").value(buyTime);
				$("#style_time"+i+"").data("kendoDropDownList").value(billing);
				 i++;
				 monitorShoppingCart();
		});
	});
	
	// slider初始化
	$("#sliderMailVolume").kendoSlider({
	    min: 200,
	    max: 2048, 
	    smallStep:5,
	    showButtons: false,
	    change: dataDiskUpdateValue
	});
	
	// slider初始化
	$("#usercount").kendoSlider({
	    min: 5,
	    max: 200, 
	    smallStep:1,
	    showButtons: false,
	    change: userCountSlider
	});

	//系统盘
	function dataDiskUpdateValue(){
		$("#gb").val(""+$("#sliderMailVolume").val()+"");
		$("#txt").html(""+$("#sliderMailVolume").val()+"");
	}
	
	$("#gb").change(function(){
		$("#txt").html(""+$(this).val()+"");
		$("#sliderMailVolume").data("kendoSlider").value(""+$(this).val()+"");
	});
	
	// 用户数量
	function userCountSlider(){
		$("#countuser").val(""+$("#usercount").val()+"");
		$("#usercounttips").html(""+$("#usercount").val()+"");
	}
	
	$("#countuser").change(function(){
		$("#usercounttips").html(""+$(this).val()+"");
		$("#usercount").data("kendoSlider").value(""+$(this).val()+"");
	});
	//设置数据盘的value
	function checkInputValue(){
		if(!isNaN($("#gb").val())){
			var val = Number($("#gb").val());
			if(val > 2000){
				$("#gb").val(2000);
			}else if(val < 0){
				$("#gb").val(0);
			}else{
				if(val%10 == 0){
					$("#gb").val(val);
				}else{
					$("#gb").val(Math.ceil(val/10)*10);
				}
			}
		}else{
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
	$("#currency").data("kendoNumericTextBox").enable(false);
	
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
	
	// 设置邮箱域名
	$("#diy").click(function(){
		$("#div_diy").show();
		$("#div_default").hide();
		
	});
	$("#system_default").click(function(){
		$("#div_diy").hide();
		$("#div_default").show();
		
	});
	
	// 检查自定义域名
	function checkDiyDomainInput(obj){  
		var reg = /[^\w\.\/]/g; 
		var value = $(obj).val();
		if(value.length <= 4){
			$(obj).css("border","1px solid red");
			Core.alert({title:"提示",message:"请输入正确的域名！<font style='color:green'>如：hp.com</font>"});
		}else{
			var val =value.substring(value.length-4,value.length);
			if(val != ".com"){
				$(obj).css("border","1px solid red");
				Core.alert({title:"提示",message:"请输入正确的域名！<font style='color:green'>如：hp.com</font>"});
				return;
			}else{
				if(val.constructor === String ){
			        var txt = value.substring(0,value.length-4).match(reg);
			        if(!(txt == null || txt == "")){
			        	$(obj).css("border","1px solid red");
			        	Core.alert({title:"提示",message:"域名不能出现汉字或者特殊字符！"});
			        }else{
			        	$(obj).css("border","1px solid #DADADA");
			        	$(obj).attr("data-isok","yes");
			        }
			    }
			}
		}
	}
	
	// 检查系统默认域名
	function checkDefaultDomainInput(obj){
		var val =  $(obj).val();
		var reg = /[^\w\.\/]/g;
		if(val.constructor === String ){
	        var txt = val.match(reg);
	        if(!(txt == null || txt == "")){
	        	$(obj).css("border","1px solid red");
	        	Core.alert({title:"提示",message:"域名不能出现汉字或者特殊字符！"});
	        }else{
	        	$(obj).css("border","1px solid #DADADA");
	        	$(obj).attr("data-isok","yes");
	        	isOk = true;
	        }
		  }
	}
	
	// 检查用户数量的值
	function checkUserCountValue(){
		if(!isNaN($("#countuser").val())){
			var val = Number($("#countuser").val());
			if(val > 200){
				$("#countuser").val(200);
			}else if(val < 0){
				$("#countuser").val(0);
			}else{
				$("#countuser").val(val);  
			}
		}else{
			$("#countuser").val("0");
		}
	}
	
	// 判断该服务是否可以重复订购
	function checkRepeatOrder(){
		var isok = false;
		Core.AjaxRequest({
			url : ws_url + "/rest/order/checkRepeatOrder?serviceSid="+114,
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