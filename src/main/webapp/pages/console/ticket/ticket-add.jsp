<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
         #panel ul{  
			 list-style-type: none; 
	         margin: 0; 
	         padding: 0; 
		 }
		 
		 #panel li{ 
		 	position:relative;
	     } 
		 
		 #panel label {
	         display: inline-block;
	         width: 100px;
	         text-align: right;
	         font-size:14px;
	     }
</style>
<div style="min-height: 0px">
	<div class="panel" id="panel" style="margin-bottom:10px;width:100%;height:230px;">
		<ul id="monify">
			<li style="margin: 5px 0 10px 0">
				<label for="title" class="required">标题：</label> 
				<input type="text" id="title" name="title" class="k-textbox"  maxlength="64"  value="" style="height:28px" placeholder=""  required validationMessage="不能为空！" data-pattern-msg="请输入英文或数字！"/>
			</li>
			<li style="margin: 0px 0 10px 0">
				<label for="questionType" class="required">工单分类：</label> 
				<select id="questionType" name="questionType" size="1" style="font-size:12px;width:200px;" placeholder="Select size..."></select>
			</li>
			<li style="margin: 0px 0 10px 0">
				<label for="questionLevel" class="required">工单级别：</label> 
				<select id="questionLevel" name="questionLevel" size="1" style="font-size:12px;width:200px;" placeholder="Select size..."></select>
			</li>
			<li style="margin: 0px 0 10px 0">
				<label for="service" class="required">产品/服务：</label> 
				<select id="service" name="service" size="1" style="font-size:12px;width:200px;" placeholder="Select size..."></select>
			</li>
			<li >
				<label for="description" style="vertical-align:top;">描述：</label> 
				 <textarea id="description" name="description" style="width:450px;height:80px;" rows="4" cols="60" class="k-textbox"></textarea>
			</li>
		</ul>
	</div>
    <div style="width:100%;height:30px;">
		<button class="k-button" id="modifyWindowClose"
			style="width: 70px; height: 32px; float: right; margin-right: 12px;"
			type="submit">关闭</button>
		<button class="k-button" onclick="addTicket()"
			style="width: 70px; height: 32px; float: right; margin-right: 9px;"
			type="submit">保存</button>
	</div>	
</div>

<script type="text/javascript">
	  // 初始化问题分类下拉列表框
	  Core.AjaxRequest({
			url :ws_url + "/rest/system/QUESTION_TYPE", 
			type:"get",
			callback : function (data) {
	            $("#questionType").kendoDropDownList({
	            	    dataTextField: "codeDisplay",
	                    dataValueField: "codeValue",
	                    placeholder: "Select...",
	                    dataSource:data 
	            });
	        } 
	   });
	  
	// 初始化问题级别下拉列表框
	  Core.AjaxRequest({
			url :ws_url + "/rest/system/QUESTION_LEVEL", 
			type:"get",
			callback : function (data) {
	            $("#questionLevel").kendoDropDownList({
	            	    dataTextField: "codeDisplay",
	                    dataValueField: "codeValue",
	                    placeholder: "Select...",
	                    dataSource:data 
	            });
	        } 
	   });
	
	// 初始化产品/服务下拉列表框
	    var serviceScope = "";
		// 判断用户是否已登录
		if(currentUser != null && currentUser !=""){
			if(currentUser.roles[0].roleSid == 104){
				serviceScope = "01"; 
			}else{
				serviceScope = "02"; 
			}
		}else{
			serviceScope = null; 
		}
		 // 取得serviceTree
		Core.AjaxRequest({
			url : ws_url + "/rest/service/findAll",
			async : false,
			params:{
				"serviceScope" : serviceScope,
				"canOrder" : "1",
				"serviceStatus" :"03"
			}, 
			callback : function (data) {
				$("#service").kendoDropDownList({
            	    dataTextField: "serviceName",
                    dataValueField: "serviceSid",
                    placeholder: "Select...",
                    dataSource:data 
                });
			}
		});

	// 初始化容量
	var modifyName = $("#panel").kendoValidator().data("kendoValidator");
	function addTicket(){
			// 检查标题和描述是否为空
			var isok1 = false;
			var isok2 = false;
			if($("#title").val() == null || $("#title").val() == ""){
				$("#title").css("border","1px solid red");
				isok1 = false;
			}else{
				$("#title").css("border","1px solid #DADADA");
				isok1 = true;
			}
			if($("#description").val() == null || $("#description").val() == ""){
				$("#description").css("border","1px solid red");
				isok2 = false;
			}else{
				$("#description").css("border","1px solid #DADADA");
				isok2 = true;
			}
			if(!(isok1 && isok2)){
				return;
			}
		
			Core.AjaxRequest({
				url : ws_url + "/rest/ticket/addTicket",  
				type : "post",
				params : {
					serviceSid : $("#service").val(),
					title : $("#title").val(),
					content : $("#description").val(),
					questionType : $("#questionType").val(),
					questionLevel : $("#questionLevel").val()
				},
				callback : function(data) {
					Core.alert({
						message : "新增工单成功！",
						confirmCallback : function() {
							$("#addTicket").data("kendoWindow").close();
							//刷新列表
							getGridData();
						}
					});
				},
				failure : function(data) {
					Core.alert({
						message : "对不起，新增工单失败！",
						confirmCallback : function() {
							$("#addTicket").data("kendoWindow").close();
						}
					});
				}
			});
	}

	$("#modifyWindowClose").click(function() {
		$("#addTicket").data("kendoWindow").close();
	});
</script>