<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String resInstanceSid = request.getParameter("resInstanceSid");
	%>
	<div style="width: 100%; height: 99.9%; margin: 0px; padding: 0px;">
			<div id="snapshotGrid" style="height: 96%; width: 98.3%; margin: 5px; font-size: 14px;"></div>
	</div>
	<script type="text/javascript">
	var resInstanceSid = '<%=resInstanceSid %>';
		$(function() {
			getSnapshotGridData(resInstanceSid);
		});

		//创建grid
		function createGrid(data) {
			$("#snapshotGrid").kendoGrid({
				dataSource : {
					data : data,
					pageSize : 5
				},
				sortable : true,
				pageable : true,
				selectable : "row",
				scrollable : false,
				columns : [
				{
					field : "name",
					title : "名称"
				}, {
					field : "description",
					title : "描述"
				}, {
					field : "createTimeFomat",
					title : "创建时间",
					width:"159px"
				}, {
					command :[{
						text : "恢复",
						click : restore
					}],
					title : "操作",
					width:88
				} ]
			});
		}
		
		//获取列表数据
		function getSnapshotGridData(resInstanceSid) {
			//北向接口取得服务实例数据
			Core.AjaxRequest({
				url : ws_url + "/rest/resourceInstance/getSnapshotList?resInstanceSid="+resInstanceSid,
				type:"get",
				callback : function(data) {
					createGrid(data);
				}
			});
		}
		
		//恢复
		function restore(e){
			var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
			//北向接口取得服务实例数据
			Core.AjaxRequest({
				url : ws_url + "/rest/resourceInstance/revertVmBySnapshot",
						params:{
							resInstanceSid:resInstanceSid,
							snapshotName:dataItem.name
						},
				callback : function(data) {
					Core.alert({
						title:"提示",
						message:"恢复成功！",
						confirmCallback:function(){
						} 
					});
				},
				failure:function(data){
					Core.alert({title:"提示",message:"恢复失败!"});
				}
			});
		}
		//获取列表选择项Sid
		function getTableItemSid() {
			var grid = $("#serviceInstanceGrid").data("kendoGrid");
			var row = grid.select();
			var data = grid.dataItem(row);
			return data;
		}
		
		//调用北向接口操作服务实例
		function operationServiceInstance(action, instanceSid) {
			Core.AjaxRequest({
						url : ws_url+ "/rest/serviceInstance/serviceInstanceOperation",
						params : {
							serviceInstanceSid : instanceSid,
							action : action
						},
						callback : function(data) {
							//刷新列表
							getGridData();
						}
					});
		};
</script>