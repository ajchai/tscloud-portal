<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
		<title><fmt:message key="header.title.console"/></title>
		<link href="${ctx}/css/user.css" rel="stylesheet">
		<style type="text/css">
			 	html,body{
					margin: 0px;
					padding: 0px;
					font-family:"微软雅黑","Microsoft Yahei",Georgia,Serif;
					visibility: visible;
					width:100%;
					height:100%;
				}
		</style>
	</head>
	<body>
		<div style="width:100%;height:100%;margin:0px;padding:0px;">
			<div style="width:100%;height:48px;background:#F9F9F9;color:#000; line-height:48px;border-bottom:1px solid #DADADA">
				&nbsp;&nbsp;<font style="color:#0099d7;font-weight:bold">账单管理</font>
			</div>
			 <div>
				 	<table height="30px;" style="font-size:14px;margin:5px 0px 5px 5px" border="0" cellpadding="3" cellspacing="0">
					  <tr>
						<td>账单月份:</td>
						<td>
							<input id="billDate" value="10/10/2011" style="width:180px" />
						</td>
						<td>
							<button class="k-button" id="confirmOrder" style="width:50px" type="submit">查询</button>
						</td>
					  </tr>
					</table>
					<div id="billGrid1" style="width:98%;margin-left:0.8%;font-size:14px;"></div>
					<div style="width:300px;height:40px;line-height:40px;"><span style="font-size:18px">&nbsp;&nbsp;账单明细</span></div>
					<div id="billGrid2" style="width:98%;margin-left:0.8%;font-size:14px;"></div>
			 </div>
	  </div>

	<script type="text/javascript">
		$("#billDate").kendoDatePicker({
            start: "year",
            depth: "year",
            format: "yyyy-MM"
		});
	
		$("#billGrid1").kendoGrid({
			dataSource: {
				data: [
					{FirstName:" ",LastName:" ",City:" ",Title:" ",Age:" "}
					
				],
				pageSize: 5
			},
			sortable: true,
			pageable: true,
			columns: [ {
					field: "FirstName",
					title: "账期"
				} , {
					field: "LastName",
					title: "计费起始时间"
				} , {
					field: "City",
					title: "计费截止时间"
				} , {
					field: "Title",
					title: "天数"
				} , {
					field: "Age",
					title: "金额"
				}, {
					field: "test",
					title: "出账时间"
				}, {
					field: "test1",
					title: "缴费截止时间"
				}, {
					field: "test2",
					title: "账单状态"
				}
			]
	});
	
	$("#billGrid2").kendoGrid({
		dataSource: {
			data: [
				{FirstName:"HP_Clound_Service",LastName:"惠普",City:"购买",Title:"testServic@hp.com",Age:"已创建"},
				{FirstName:"HP_Clound_Service",LastName:"惠普",City:"租用",Title:"testServic@hp.com",Age:"已创建"},
				{FirstName:"HP_Clound_Service",LastName:"惠普",City:"租用",Title:"testServic@hp.com",Age:"已创建"},
				{FirstName:"HP_Clound_Service",LastName:"惠普",City:"租用",Title:"testServic@hp.com",Age:"已创建"},
			],
			pageSize: 5
		},
		sortable: true,
		pageable: true,
		columns: [ {
				field: "FirstName",
				title: "用户账号"
			} , {
				field: "LastName",
				title: "用户名称"
			} , {
				field: "City",
				title: "用户角色"
			} , {
				field: "Title",
				title: "Email"
			} , {
				field: "Age",
				title: "用户状态"
			}
		]
	});
	</script>
	</body>	 	
</html>