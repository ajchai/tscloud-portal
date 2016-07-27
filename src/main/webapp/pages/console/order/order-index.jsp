<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<style type="text/css">
			#orderGrid .k-grid-header{
 				width:98.6%;
			}
		</style>
		<div style="width:100%;height:100%;margin:0px;padding:0px;background:#fff"> 
			<div style="width:100%;height:48px;background:#FAFAFA;color:#000; line-height:48px;border-bottom:1px solid #DADADA"> 
				&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">订单管理</font>
			</div>
			<div style="width:99.2%;margin:5px;height:85%;"> 
			 	<table height="30px;" style="font-size:14px;" border="0" cellpadding="3" cellspacing="3"> 
				  <tr>
					<td><span class="k-content"> 订单号:</span></td>
					<td>
						<input type="text" id="orderNumber"  style="font-size:12px ; width:150px"  class="k-textbox" value="" />  
					</td>
					<td><span class="k-content">订单状态:</span></td>
					<td>
						 <select id="tradeStatus"  style="font-size:12px;width:120px"  placeholder="请选择...">
						 </select>
					</td>
					<td><span class="k-content">创建时间:</span></td>
					<td>
						<input id="dateFrom" style="font-size: 12px;width:180px" />
						<span class="k-content">至</span>
						<input id="dateTo" style="font-size: 12px;width:180px" />
					</td>
					<td>
						<button class="k-button" id="confirmOrder" style="width:50px" type="submit" onclick="searchOrder()">查询</button>
					</td>
				  </tr>
				</table>
				<div  style="width:100%;height:99%;font-size:14px;">
						<div id="orderGrid" style="width:100%;height:99%;font-size:14px;"></div>
				</div>
				
			</div>
		</div>
		<div id="orderDetailWindow" style="margin:0px;padding:0px;overflow:hidden"></div>  	
	<!-- datagrid的详细信息 -->
		<script type="text/x-kendo-template" id="template">
                    <div class="orderDetail" style="width:100%;height:100%;margin:0px;padding:0px;"></div>
         </script>
	
	<script type="text/javascript">
		$("#serviceType").kendoDropDownList();
		
		// 设置开始时间
		var start = $("#dateFrom").kendoDateTimePicker({
			format: "yyyy-MM-dd HH:mm",
            change: startChange
        }).data("kendoDateTimePicker");
		// 设置结束时间
		var end = $("#dateTo").kendoDateTimePicker({
			 	format: "yyyy-MM-dd HH:mm",
	            change: endChange
	    }).data("kendoDateTimePicker");
		
		function startChange() {
            var startDate = start.value(),
            endDate = end.value();

            if (startDate) {
                startDate = new Date(startDate);
                startDate.setDate(startDate.getDate());
                end.min(startDate);
            } else if (endDate) {
                start.max(new Date(endDate));
            } else {
                endDate = new Date();
                start.max(endDate);
                end.min(endDate);
            }
        }

        function endChange() {
            var endDate = end.value(),
            startDate = start.value();

            if (endDate) {
                endDate = new Date(endDate);
                endDate.setDate(endDate.getDate());
                start.max(endDate);
            } else if (startDate) {
                end.min(new Date(startDate));
            } else {
                endDate = new Date();
                start.max(endDate);
                end.min(endDate);
            }
        }

        start.max(end.value());
        end.min(start.value());

		// 查询条件
		var paramters= {
				status : null,
				orderId : null,
				startTime : null,
				endTime : null
		};
		
		// 查询所有订单详细数据
		var orderDetailData; 
		Core.AjaxRequest({
			url : ws_url + "/rest/order/orderDetail",
			params : null,
			async : false,
			type : "get",
			callback : function (data) {
				orderDetailData = data;
			}
	   });
		
		$(function(){
			// 初始化订单状态的下拉列表框
			Core.AjaxRequest({
						url :ws_url + "/rest/system/ORDER_STATUS", 
						type:"get",
						callback : function (data) {
							var dataSource= new kendo.data.DataSource({
								data: data,
								schema: {
									model: { id: "codeSid" }
								}
							});
							dataSource.fetch(function() {
								dataSource.insert(0, { "codeDisplay": "全部", "codeValue": "" });
							});
			                $("#tradeStatus").kendoDropDownList({
			                	    dataTextField: "codeDisplay",
			                        dataValueField: "codeValue",
			                        placeholder: "请选择...",
			                        dataSource: dataSource,
			                        index: 0
			                });
			            } 	
			});
			// 初始化数据
		   loadOrderGrid(paramters);
		});
		
		// 加载订单的datagrid数据
	   function loadOrderGrid(params) {
		   Core.AjaxRequest({
				url : ws_url + "/rest/order/orderList",
				params : params,
				async : false,
				callback : function (data) {
					createGrid(data);
				}
		   });
	   }
		// 创建订单datagrid
		function createGrid(data) {
				$("#orderGrid").kendoGrid({
					  dataSource: {
						  data : data
					},
					sortable : true,
					pageable : false,
					scrollable: true,
					detailTemplate: kendo.template($("#template").html()),
                    detailInit: detailInit,
                    dataBound: function() {
                        this.expandRow(this.tbody.find("tr.k-master-row").first()); 
                    },
					columns : [ {	
							field: "orderId",
							width:150,
							title: "订单号"
							
						} , {
							field: "statusName",
							width:100,
							title: "订单状态"
							
						} , {
							field: "createdDt",
							title: "创建时间",  
							width:100,
							format: "{0:MM/dd/yyyy HH:mm}"
						},{  
							command : {
								text : "详情",
								click : showDetails
							},
							title : "操作",
							width : 100
						}
					]
		       });
		}
		// 初始化订单的详细行
		 function detailInit(e) {
			 var detailRow = e.detailRow;
             detailRow.find(".orderDetail").kendoGrid({
                 dataSource: {
                     data : orderDetailData,
                     filter: { field: "orderId", operator: "eq", value: e.data.orderId }
                 },
                 scrollable: false,
                 columns: [
                     { field: "serviceName", title:"服务名称", width: 200 },
                     { field: "specificationDesc", title:"服务配置" },
                     { field: "quantity", title:"数量", width: 110 },
                     { field: "purchaseLongTime", title: "时长", width: 200 }
                 ]
             });
         }
		 
		// 查询订单
		 function searchOrder(){
				var productName = $("#orderNumber").val();
				var productStatus = $("#tradeStatus").val();
				var fromDate = $("#dateFrom").val();
				var toDate = $("#dateTo").val();
				paramters.status = (productStatus == "") ? null:productStatus;
				paramters.orderId = (productName == "") ? null:productName;
				paramters.startTime = (fromDate == "") ? null:fromDate;
				paramters.endTime = (toDate == "") ? null:toDate;
				$("#orderGrid").data("kendoGrid").destroy();
				loadOrderGrid(paramters);
		 }
		
		function showDetails(e){
			e.preventDefault();
			var dataItem = this.dataItem($(e.currentTarget).closest("tr")); 
			var detailWin = $("#orderDetailWindow").kendoWindow({
	               title: "订单详情",
	               modal: true,
	               visible: false,
	               iframe:false,
	               resizable: false,
	               width: "800px",
					height: "420px",
					content: "order/order-detail-index.jsp?orderId=" + dataItem.orderId
	           }).data("kendoWindow");
			
			detailWin.center().open();
			
		};
	</script>
	