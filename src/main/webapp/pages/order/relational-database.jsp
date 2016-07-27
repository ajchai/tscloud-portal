<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
	#input_visits {
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
	      		<td width="120px" height="60px" align="right" style="font-size:14px">推荐配置：</td>
	      		<td> 
      				<div class="content-left"> 
						<ul id="recommended_configuration_relational"></ul>
			    	</div>
	      		</td> 
	      </tr>
		  <tr>
			<td width="120px" height="50px" align="right" style="font-size:14px">数据库类型：</td> 
			<td width="540px"> 
			   <select id="databaseType" size="1"  value="3" style="width:100px;font-size:12px;"></select>
			   <span style="font-size:12px;">版本:</span>
			   <input type="radio" name="version" value="5.1" checked="checked"/><span  style="font-size:12px">MySQL 5.1</span>
			   <input type="radio" name="version"  value="5.5"/><span  style="font-size:12px">MySQL 5.5</span> 
			</td>
		  </tr>
		  <tr>
			<td width="120px" height="80px" align="right" valign="top" style="font-size:14px">存储空间：</td>
			<td valign="top"> 
			    <div style="width:540px;position:relative;">
					<input id="sliderData" style="width:400px"/> 
					<span style="position:relative;top:-7px;"><input id="gb" value="5" type="text" maxlength="4" onchange="checkInputValue()"/>GB</span>
				</div>
				 <div style="position:relative;width:410px;padding:0px;border:1px solid white">
					<span style="position:absolute;left:-5px;top:-5px;font-size:10px;">5GB</span>    
					<span style="position:absolute;left:62px;top:-5px;font-size:10px;">100GB</span>
					<span style="position:absolute;left:180px;top:-5px;font-size:10px;">250GB</span>
					<span style="position:absolute;right:0px;top:-5px;font-size:10px;">500GB</span>
					<p style="margin-top:20px;margin-bottom:0px;font-size:12px;">当前选择：<span id="txt" style="color:#D7410B;font-size:12px;">0</span>GB(以2GB为步长增加)</p>
				</div>
			</td> 
		  </tr>
		  <tr>
			<td width="120px" height="80px" align="right" valign="top" style="font-size:14px">内存：</td> 
			<td valign="top"> 
				<div style="width:540px;position:relative;">
					<input id="visits" style="width:400px"/>
					<span style="position:relative;top:-7px;"><input id="input_visits" value="240" type="text" maxlength="5" onchange="checkInputVisits()"/>MB</span>
				</div>
				 <div style="position:relative;width:410px;padding:0px;border:1px solid white;">
					<span style="position:absolute;left:-5px;top:-5px;font-size:10px;">240MB</span>
					<span style="position:absolute;left:175px;top:-5px;font-size:10px;">12000MB</span>
					<span style="position:absolute;right:0px;top:-5px;font-size:10px;">24000MB</span>
					<p style="margin-top:20px;margin-bottom:0px;font-size:12px;">当前选择：<span id="txt_visits" style="color:#D7410B;font-size:12px;">0</span>MB(以10MB为步长增加)</p>
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
		  	<td height="80px"></td>
			<td>
				<button class="k-button" id="save_submit" style="width:100px" type="submit">提交</button>
			</td>
		  </tr>
</table>
<script type="text/javascript">
	// slider初始化
	$(function(){
		$("#sliderData").kendoSlider({
		    min: 5,
		    max: 500,
		    smallStep:2, 
		    showButtons: false,
		    change: dataDiskUpdateValue
		});
		
		Core.AjaxRequest({
			url :ws_url + "/rest/system/getCodeByParams", 
			type:"post",
			async:false,
			params:{
				codeCategory:'DB_TYPE'
			},
			callback : function (data) {
                $("#databaseType").kendoDropDownList({
                	    dataTextField: "codeDisplay",
                        dataValueField: "codeValue",
                        index : 0,
                        dataSource:data
                });
                var combobox = $("#databaseType").data("kendoDropDownList");
                var input = combobox.input;
                $(input).attr("disabled","disabled");
            } 
    	});
		
		
		$("#visits").kendoSlider({
		    min: 240,
		    max: 24000, 
		    smallStep:10,
		    showButtons: false,
		    change: dataVisitsValue
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
		
		 // 得到服务的配置模板项
		Core.AjaxRequest({
				url : ws_url + "/rest/service/templatelist/106",
				type: "get",
				callback : function (data) {
					$("#recommended_configuration_relational").html("");
	                for(var i =0;i < data.length;i++){
	                	var txt = JSON.stringify(data[i]);
	                	 $("#recommended_configuration_relational").append("<li class='temp' onclick='selectedSpec(this,"+txt+")'>"+data[i].templateName+"</li>");
	                }
	            }
		});
	});

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

	// 存储空间
	function dataDiskUpdateValue(){
		$("#gb").val(""+$("#sliderData").val()+"");
		$("#txt").html(""+$("#sliderData").val()+"");
	}
	$("#gb").change(function(){
		$("#txt").html(""+$(this).val()+"");
		$("#sliderData").data("kendoSlider").value(""+$(this).val()+"");
	});

	// 访问次数
	function dataVisitsValue(){
		$("#input_visits").val(""+$("#visits").val()+"");
		$("#txt_visits").html(""+$("#visits").val()+"");
	}
	$("#input_visits").change(function(){
		$("#txt_visits").html(""+$(this).val()+"");
		$("#visits").data("kendoSlider").value(""+$(this).val()+"");
	});

	//根据模板配置设置form数据
	function selectedSpec(obj,data){ 
		$(".tempSelected").removeClass("tempSelected");
		$(obj).addClass("tempSelected");
		// 保存templateSid
		$("#templateSid").val(data.templateSid);
		
		for(var i=0;i< data.specifications.length;i++){
			if(data.specifications[i].name == "DB_TYPE"){
				$("#databaseType").data("kendoDropDownList").value(data.specifications[i].value);
			}else if(data.specifications[i].name == "DB_VERSION"){
				// 设置mysql版本
				$("#mysql"+data.specifications[i].value+"").attr("checked","checked"); 
			}else if(data.specifications[i].name == "DB_VOLUME"){
				$("#txt").html(""+data.specifications[i].value+"");
				$("#sliderData").data("kendoSlider").value(""+data.specifications[i].value+"");
				$("#gb").val(""+data.specifications[i].value+"");
			}else if(data.specifications[i].name == "DB_VISITS"){
				$("#txt_visits").html(""+data.specifications[i].value+"");
				$("#visits").data("kendoSlider").value(""+data.specifications[i].value+"");
				$("#input_visits").val(""+data.specifications[i].value+"");
			}
		}
	}
	
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
			
        // 动画
		$("#anamite").show().animate({left:'+=250px',top:'+=400px',height:'-=550px',width:'-=500px'},'fast');
		$("#anamite").animate({left:'+=400px',top:'-=250px',height:'+=150px',width:'+=100px'},'fast',function(){
		       $("#anamite").hide();
		       $("#anamite").css({"top":"80px","left":"300px","width":"550px","height":"600px"});
		});
		
		/* 获得订单数据 */
		
		// 数据库类型
		var databaseType = $("#databaseType").data("kendoDropDownList").value();
		// 数据库类型名称
		var databaseTypeName = $("#databaseType").data("kendoDropDownList").text();
		// 数据库版本
		var db_version = $("input[name='version']:checked").val();
		// 模板sid
		var tempSid = $("#templateSid").val();
		// 存储空间
		var sliderData  = $("#sliderData").val();
		// 访问次数
		var vitits  = $("#visits").val();
		// 购买数量
		var count = $("#currency").val();
		// 购买时长
		var billing = $("#billingType").val(); 	
		
		// 将规格项组合成js对象
		var serviceSpec = new Object();
		serviceSpec.DB_TYPE = databaseType;
		serviceSpec.DB_VOLUME = sliderData;
		serviceSpec.DB_VISITS = vitits;
		serviceSpec.DB_VERSION = db_version;
		var specJson = JSON.stringify(serviceSpec);
		
		getBuyServiceCount(1);
		
		if(billing == "Year"){
			var buyTime = $("#billingDateYear").val();
			var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='serviceName"+i+"' value='关系数据库服务'/><input type='hidden' id='serviceSid"+i+"' value='106'/><input type='hidden' id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='20%' align='right'>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>数据库类型:"+databaseTypeName+" 、存储空间:"+sliderData+"GB、访问次数:"+vitits+"次数</span></td></tr><tr><td align='right'>数量:</td><td  align='left'><input id='count"+i+"' type='number' style='width:100px;font-size:12px' value='"+count+"' min='1' max='2' /></td></tr><tr><td align='right'>时长:</td><td  align='left'><div style='width:100%;height:100%;position:relative;'> <select id='style_time"+i+"' size='1' onchange='switchTime(this)' style='width:60px;font-size:12px;' placeholder='Select size...'><option value='Year'>按年</option><option value='Month'>按月</option></select>&nbsp;&nbsp; <div id='month"+i+"' style='position:absolute;top:0px;left:70px;'><select id='time"+i+"' size='1'  style='width:50px;font-size:12px;' placeholder='Select size...'> <option value='1年'>1年</option><option value='2年'>2年</option><option value='3年'>3年</option></select></div></div></td></tr></table>");
		}else{
			var buyTime = $("#billingDateMonth").val();
			var table = $("<input type='hidden' id='specJson"+i+"' value='"+specJson+"'/><input type='hidden' id='serviceName"+i+"' value='关系数据库服务'/><input type='hidden' id='serviceSid"+i+"' value='106'/><input type='hidden' id='tempSid"+i+"' value='"+tempSid+"'/><table width='100%' height='100%' border='0' cellspacing='0' cellpadding='3'><tr><td width='20%' align='right'>配置:</td><td width='80%' style='padding-right:18px;' align='left'><span id='spec"+i+"'>数据库类型:"+databaseTypeName+" 、存储空间:"+sliderData+"GB、访问次数:"+vitits+"</span></td></tr><tr><td align='right'>数量:</td><td  align='left'><input id='count"+i+"' type='number' style='width:100px;font-size:12px' value='"+count+"' min='1' max='2' /></td></tr><tr><td align='right'>时长:</td><td  align='left'><div style='width:100%;height:100%;position:relative;'> <select id='style_time"+i+"' size='1' onchange='switchTime(this)' style='width:60px;font-size:12px;' placeholder='Select size...'><option value='Year'>按年</option><option value='Month'>按月</option></select>&nbsp;&nbsp; <div id='month"+i+"' style='position:absolute;top:0px;left:70px;'><select id='time"+i+"' size='1'  style='width:60px;font-size:12px;' placeholder='Select size...'><option value='1月'>1个月</option><option value='2月'>2个月</option><option value='3月'>3个月</option><option value='4月'>4个月</option><option value='5月'>5个月</option><option value='6月'>6个月</option><option value='7月'>7个月</option><option value='8月'>8个月</option><option value='9月'>9个月</option></select></div></div></td></tr></table>");
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

	// 设置存储空间的value 步长:2
	function checkInputValue(){
		if(!isNaN($("#gb").val())){
			var val = Number($("#gb").val());
			if(val > 500){
				$("#gb").val(500);
			}else if(val < 0){
				$("#gb").val(0);
			}else{
				if(val%2 == 0){
					$("#gb").val(val); 
				}else{
					$("#gb").val(val + 1); 
				}
			}
		}else{
			$("#gb").val("0");
		}
	}
	
	// 设置访问次数的value
	function checkInputVisits(){
		if(!isNaN($("#input_visits").val())){
			var val = Number($("#input_visits").val());
			if(val > 24000){
				$("#input_visits").val(24000);
			}else if(val < 0){
				$("#input_visits").val(0);
			}else{
				if(val%10 == 0){
					$("#input_visits").val(val);
				}else{
					$("#input_visits").val(Math.ceil(val/10)*10);
				}
			}
		}else{
			$("#input_visits").val("0");
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
	
	// 判断该服务是否可以重复订购
	function checkRepeatOrder(){
		var isok = false;
		Core.AjaxRequest({
			url : ws_url + "/rest/order/checkRepeatOrder?serviceSid="+106,
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