<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	fieldset{
		-moz-border-radius-topleft: 5px;
		 -moz-border-radius-topright:5px; 
		-moz-border-radius-bottomleft:5px;
		 -moz-border-radius-bottomright:5px; 
		-webkit-border-top-left-radius:5px;
		 -webkit-border-top-right-radius:5px; 
		-webkit-border-bottom-left-radius:5px;
		-webkit-border-bottom-right-radius:5px;
		border-top-left-radius:5px;
		 border-top-right-radius:5px;
		border-bottom-left-radius:5px;
		border-bottom-right-radius:5px;
}
</style>

<div id="grid"></div>
		<script type="text/x-kendo-template" id="template">
                 <div class="tabstrip">
                          <div id="serviceInstance" style="width:70%;mix-height:40px;"></div>
                  </div>
        </script>
 <div style="width:100%;height:40px;line-height:47px;text-align:right;">
 		<button class="k-button" id="confirmOrder" style="width:100px;height:32px;" type="submit" onclick="submitOrder()">确定订单</button>&nbsp;&nbsp;
		<button class="k-button" id="cancel" style="width:70px;height:32px;" type="submit">取消</button>
 </div>
	<script type="text/javascript">
			// 得到从配置页面传入的数据
			var data = JSON.parse(getOrderInfo());
			// 初始化datagrid
			var element = $("#grid").kendoGrid({
				dataSource : data,
				height:350,
				sortable: true,
				detailTemplate: kendo.template($("#template").html()),
				detailInit: detailInit,
				dataBound: function() {
					this.expandRow(this.tbody.find("tr.k-master-row"));
				},
				columns: [
				    {
						field: "serviceName",
						title: "服务名称",
						width: "100px"
					},
					{
						field: "config",
						title: "配置",
						width: "300px"
					},
					{
						field: "count",
						title: "数量",
						width: "120px"
					},
					{
						field: "time",
						title: "时长",
						width: "120px"
					}
// 					,
// 					{
// 						field: "price",
// 						title: "价格",
// 						width: "120px"
// 					}
				]
		});
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		 $(".datepicker").kendoDatePicker({
			 min: new Date(year, (month-1), day),
			 format:"yyyy-MM-dd",
			 value : year+"-"+month+"-"+day,
		});

		
		
		// 初始化详细列内容
		 function detailInit(e) {
			var detailRow = e.detailRow;
			var str="";
			for(var i=0;i<e.data.count;i++){
				var form = "<div style='font-size:10px;' ><fieldset id="+e.data.uuid+i+"><legend><b>实例<"+(i+1)+"></b></legend>&nbsp;<font style='color:red'>＊</font>名称：<input class='input' type='text' maxlength='32'/>&nbsp;&nbsp;<font style='color:red'>＊</font>开通时间：<input class='datepicker date' style='width:150px;' /></fieldset></div>";
				str+= form;
			}
			detailRow.find("#serviceInstance").html(str);
		 }
		
		// 关闭window
		$("#cancel").click(function(){
			$("#confirmOrderWindow").data("kendoWindow").close(); 
		});
		
		// 组合上传的数据
		function getData(){
			var attr = new Array();
			
			for(var i = 0; i<data.length;i++){
				var t = new Object();
				t.serviceSid = data[i].serviceSid;
				t.templateSid =data[i].templateSid;
				t.quantity = data[i].count;
				t.specificationDesc = data[i].config;
				
				t.instanceList = new Array();
				for(var j =0;j<data[i].count;j++){
					var f = new Object();
					f.instanceName=$("#"+data[i].uuid+j+" :input").eq(0).val();
					f.expectedTime =$("#"+data[i].uuid+j+" :input").eq(1).val();
					t.instanceList.push(f);
				}
				
				t.specifications = new Object();
				t.specifications = JSON.parse(data[i].specJson);
				// 计费类型
				t.billingType = data[i].billingType;
				
				var buyTime = data[i].time;
				if(buyTime == "永久"){
					t.buyLength ="99";
				}else{
					t.buyLength = buyTime.substring(0,buyTime.length-1);
				}

				attr.push(t);
			}
			return attr;
		}
		
		// 提交表单
		function submitOrder() {
			var json = getData();
			var isOk = true;
			for(var i=0;i < $(".input").size();i++){
				if($(".input").eq(i).val() == "" || $(".input").eq(i).val() == null){
					isOk = false;
					$(".input").eq(i).css("border","1px solid red");
				}else{
					$(".input").eq(i).css("border","1px solid #ABADB3");
				}
			}
			
			if(!isOk){
				return;
			}
			
			Core.AjaxRequest({
					url :  ws_url +"/rest/order/save",
					params :json,
					callback : function (data) {
						if(typeof(data) =="undefined" || data == null){
								alert("提交失败！");
						}else{
							   window.location.href ="../success.jsp?orderId="+data.orderId+"&msg="+data.checkQuotaMsg;  
						}
		            },
					failure : function(data){
						window.location.href ="../success.jsp?orderId="+data.orderId+"&msg="+data.checkQuotaMsg;
					}
			});
		}
		
		
	</script>
