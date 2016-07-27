<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<% 
			String orderId = request.getParameter("orderId");
	%>
		<div id="details" style="margin:5px;font-size:14px;"> 
			<table style="height:30px">
				     <tr>
				     		<td  align="right">订单号:</td>
				     		<td  width="180" align="left"><span id="orderId"></span></td>
				     		<td  align="right">订单状态:</td>
				     		<td  width="100px" align="left"><span id="orderStatus"></span></td>
				     		<td  align="right">开通时间:</td>
				     		<td width="150px" align="left"><span id="openDate"></span></td>
				     </tr>
			</table>
			<div id="orderDetailGrid" style="height:378px;"></div> 
		</div>
		
		<div id="serviceInstance" style="font-size:14px;"></div>

	<script type="text/javascript">
				var order = "<%=orderId %>";
				var serviceInstanceWindow;
				var serviceInstacneGrid;
				$(function(){
					// 得到推荐配置数据
					Core.AjaxRequest({
								url : ws_url + "/rest/order/getOrder?orderId="+order,
								type: "get",
								callback : function (data) {
					              		$("#orderId").html(data.orderId);
					              		$("#orderStatus").html(data.statusName);
					              		$("#openDate").html(data.createdDt);
					              		createGrid(data.orderDetail);
					            }
					});
				});
				
				// 创建订单datagrid
				function createGrid(data) {
						$("#orderDetailGrid").kendoGrid({
							  dataSource: {
								  data : data,
								  pageSize : 6
							},
							sortable : true,
							pageable : true,
							selectable : "row",
							scrollable : false,
							columns: [
					                     { field: "serviceName", title:"服务名称", width: "150px" },
					                     { field: "specificationDesc", title:"服务配置" , width:"400px"},
					                     { field: "quantity", title:"数量", width: "50px" },
					                     { field: "purchaseLongTime", title: "时长", width: "50px" },
					                     {
					 						command : [ {
					 							text : "详情",
					 							click : showServiceInstance
					 						}],
					 						title : "操作",
					 						width : "50px"
					 					} 
					          ]
				       });
				}
				
				//页面：服务实例
				function showServiceInstance(e) {
					e.preventDefault();
					var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
					serviceInstanceWindow = $("#serviceInstance").kendoWindow({
						title : "服务实例",
						modal : true,
						visible : false,
						resizable : false,
						width : 600,
						height : 320,
						close : function() {
							setTimeout(function() {
								$('#confirmWindow').kendoWindow('destroy');
							}, 200);
						}
					}).data("kendoWindow");
					var template = kendo.template($("#serviceInstanceTemplate").html());
					serviceInstanceWindow.content(template(dataItem));
					serviceInstanceWindow.center().open();

					Core.AjaxRequest({
						url : ws_url + "/rest/serviceInstance/serviceInstanceByDetailSid/"+ dataItem.detailSid,
						type : "get",
						callback : function(data) {
							serviceInstacneGrid = $("#serviceInstacneGrid").kendoGrid({
								dataSource : {
									data : data,
									pageSize : 4
								},
								sortable : true,
								pageable : true,
								selectable : "row",
								scrollable : false,
								columns : [ {
									field : "instanceName",
									width : 60,
									title : "实例名称"
								} ,{
									field : "statusName",
									width : 40,
									title : "状态"
								},{
									field : "exceptionDesc",
									width : 200,
									title : "描述"
								} ]
							}).data("kendoGrid");
						}
					});
				}
	</script>
	<script type="text/x-kendo-template" id="serviceInstanceTemplate">
				<div id="serviceInstacneGrid" style="height:300px;"></div>
    </script>
</html>