<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String ticketSid = request.getParameter("ticketSid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String createdDt = request.getParameter("createdDt");
	%>
<style type="text/css">
     #comments{
     	font-size:12px;
     	width:100%;
     	height:100%;
     	overflow:hidden;
     }
     .userName{
     	width:50px;
     	height:50px;
     }
     .userComments{
     	width:550px;
     	margin-bottom:20px;
     }
     .userComments2{
     	width:550px;
     	margin-bottom:20px;
     	color:#0099d7;
     }
     .avatar{
     	background-size: contain;
		background-repeat: no-repeat;
		display: block;
		width: 50px;
		height: 50px;
/* 		-webkit-border-radius: 40px; */
/* 		-moz-border-radius: 40px; */
/* 		border-radius: 40px; */
		border: 2px solid #eee;
     }
     #reply_table tr{
     	margin-bottom:10px;
     }
 </style>
<div id="comments">

    <div style="position:relative;border-bottom:1px solid #eee">
		<h3 id="titleName" style="font-size:16px;margin:0px 0px 5px 0px"></h3>
		<p id="ticketTime" style="margin:0px;padding:0px;"></p>
		<p id="questionContent" title=""></p>
	</div>	
	
	<div id="content" style="height:350px;overflow-y:auto;">
	   <table id="reply_table" style="width:100%;max-height:350px;" border="0" cellpadding="10" cellspacing="0"></table>
	</div>
	<div id="reply" style="width:100%;height:120px;margin-top:10px;border-top:1px solid gray;display:none;">
			<table border="0" width="100%" height="100%" cellpadding="10" cellspacing="0">
				<tr>
					<td width="70" align="center" valign="top">
						<a class="avatar" href="#" style="background-image: url('/tscloud-portal/images/console/reply/customer.jpg')"></a>
						<p style='margin:0px' id="userName"></p>
					</td>
					<td valign="top" style="margin:0px;padding-bottom:0px;">
					    <label for="replyContent" class="required"></label>
						<textarea id="replyContent" name="replyContent" style="width:400px;height:80px;" maxlength="256" rows="4" cols="60" class="k-textbox" required validationMessage="不能为空！"></textarea>	
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="left" style="margin:0px;padding-bottom:0px;padding-top:5px;">
						<button class="k-button" onclick="replyTheContent()" style="width:70px; height:32px;" type="submit">回复</button>
						&nbsp;&nbsp;
						<button class="k-button" id="closeReply" style="width:70px; height:32px;display:none" type="submit">关闭工单</button>
					</td>
				</tr>
			</table>
	</div>
</div>

<script type="text/javascript">
	var ticketSid = '<%=ticketSid %>';
	$("#userName").html(currentUser.account);
	var replyMgtor = $("#reply").kendoValidator().data("kendoValidator");
	// 给标题、时间、内容赋值
	Core.AjaxRequest({
		url : ws_url + "/rest/ticket/findTicketsBySid?ticketSid=" + ticketSid,
		type:"get",
		callback : function(data) {
			// 给标题、时间、内容赋值
			var txt;
			$("#titleName").html(data.title);
			$("#ticketTime").html(data.createdDt);
			if(data.content.length > 53){
				txt = data.content.substring(0,50)+"...";
				$("#questionContent").attr("title",data.content);
			}else{
				txt = data.content;
			}
			$("#questionContent").html("<b>描述</b>："+txt);
			if(data.status == "04" || data.status == "99"){
				// 隐藏回复框
				$("#reply").hide();
				// 隐藏按钮
				$("#closeReply").hide();
				$("#content").css("height","485px");
				$("#content").attr("border-bottom","1px solid #eee");
			}else{
				// 隐藏回复框
				$("#reply").show();
				// 隐藏按钮
				$("#closeReply").show();
				$("#content").css("height","350px");
				$("#content").css("border-bottom","0px");
			}
		}
	});
	
	Core.AjaxRequest({
		url : ws_url + "/rest/ticket/findAllReply?ticketSid=" + ticketSid,
		type:"get",
		callback : function(data) {
			// 动态赋值
			setReplyValue(data);
		}
	});
	
	// 回复消息
	function replyTheContent(){
	    if(!replyMgtor.validate()){
			return;
		}
		
		Core.AjaxRequest({
			url : ws_url + "/rest/ticket/addreply",
			type:"post",
			async : false,
			params:{
				"ticketSid": ticketSid,
				"operate" :"01",
				"operateContent":$("#replyContent").val()
			}, 
			callback : function(data) {
				// 清空原来的输入数据
				Core.AjaxRequest({
					url : ws_url + "/rest/ticket/findAllReply?ticketSid=" + ticketSid,
					type:"get",
					callback : function(data) {
						// 动态赋值
						setReplyValue(data);
						$("#replyContent").html("");
					}
				});
			}
		});
	}
	
	// 关闭回复
	$("#closeReply").click(function(){
		Core.alert({
			message : "确定要关闭该工单吗？",
			confirmCallback : function() {
				Core.AjaxRequest({
					url : ws_url + "/rest/ticket/closeReply?ticketSid=" + ticketSid,
					type:"get",
					callback : function(data) {
						// 隐藏回复框
						$("#reply").hide();
						// 隐藏按钮
						$("#closeReply").hide();
						$("#content").css("height","460px");
						// 刷新列表
						getGridData();
					}
				});
			}
		});
	});
	
	// 赋值
	function setReplyValue(data){
		var str="";
		for(var i=0;i<data.length;i++){
			if(data[i].operator == currentUser.account){
				str += "<tr>"+
				"<td width='70' height='70' align='center' valign='top'>"+
				    "<div class='userName'>"+
				       "<a class='avatar' href='#' style='background-image: url("+ctx+"/images/console/reply/customer.jpg)'></a>"+
				    "<p style='margin-top:0px'>"+data[i].operator+"</p></div></td>" + 
				"<td><div class='userComments2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data[i].operateContent+"</div></td>"+    
				"</tr>";
			}else{
				str += "<tr>"+
				"<td width='70' height='70' align='center' valign='top'>"+
				    "<div class='userName'>"+
				       "<a class='avatar' href='#' style='background-image: url("+ctx+"/images/console/reply/customerService.jpg)'></a>"+
				    "<p style='margin-top:0px'>"+data[i].operator+"</p></div></td>" + 
				"<td><div class='userComments'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data[i].operateContent+"</div></td>"+    
				"</tr>";
			}
		}
		$("#reply_table").html(str);
	}
</script>