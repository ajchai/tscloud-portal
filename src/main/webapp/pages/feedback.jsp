<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title"/></title>
<%@ include file="/pages/common/navigat.jsp"%>
<style type="text/css">
	#container {
			width:800px;
			margin:0 auto;
	}
	#formfeedback ul{  
		 list-style-type: none; 
         margin: 0; 
         padding: 0; 
	 }
	 
	#formfeedback li{ 
		width:85%;
		margin:20px 0px 0px 15%; 
		position:relative;
     } 
	 
	#formfeedback label {  
         display: inline-block;
         width: 140px;
         text-align: right;
     }
</style>
<div id="container">
		<div id="feedback_div" style="margin:2%;width:96%;height:96%;border:1px solid #DADADA;box-shadow: #DADADA 0px 3px 3px;">
				<div style="width:100%;height:40px;background:#F9F9F9;border-bottom:1px solid #DADADA;line-height:40px;text-align:center"> 
						请您对我们的产品提出宝贵意见和建议，您留下的每个意见都是我们产品改进的动力！
				</div>
				<div id="formfeedback" style="height:90%;"> 
				<br />
					<ul>	
						<li>  
		                     <label for="realName" class="required"><font style="color:red">＊</font>问题类型：</label>
		                     <input type="text" id="questionType" name="realName"  class="k-textbox" maxlength="32" style="height:28px" required validationMessage="不能为空！"/>
		                </li>
		                <li>
			                 <label for="email"  class="required"><font style="color:red">＊</font>您的邮箱：</label>
				             <input type="email" id="email" name ="email"class="k-textbox" style="width:200px;height:28px" readonly="readonly" required validationMessage="不能为空！" data-email-msg="请输入正确的邮箱格式！"/>
			            </li>
			             <li>
		                    <label for="applyReason" class="required" style="height:50px"><font style="color:red">＊</font>问题反馈：</label>
		                    <textarea id="questionContent" class="k-textbox" maxlength="256" style="height:100px;width:350px;resize:none" required validationMessage="不能为空！"></textarea>
		                </li>  
					</ul> 
					<div style="width:100%;height:60px;line-height:60px;text-align:center">
							<button class="k-button" id="submit" style="width:80px" type="submit">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</div>
		</div>
		<div id="result_div" style="margin:2%;width:96%;height:96%;border:1px solid #DADADA;box-shadow: #DADADA 0px 3px 3px;display:none">
				<table border="0" width="100%" height="100%" >  
					<tr> 
						<td align="center" valign="bottom" height="50%">       
								<img src="${ctx }/images/index/registerSuccess.png" width="50px" height="50px;"></img>
								<span id="title_success" style="font-size:30px;font-weight:400;color:#770608"></span> 
						</td>   
					</tr> 
					<tr>
						<td align="center" valign="top" height="50%"> 
								<br />
								<p id="tips" style="margin:0px;padding:0px;"></p> 
						</td> 
					</tr>
   				</table>
		</div> 
</div> 
<script type="text/javascript"> 
		var feedback = $("#formfeedback").kendoValidator().data("kendoValidator");
		var currentUser = null;
        //  获得当前用户
		Core.AjaxRequest({
			url : ws_url + "/rest/user/current",
			type : "GET",
			async : false,
			callback : function (data) {
				var user = data.user;
				if(typeof user != "undefined" && null != user) {
					currentUser = user;
					$("#email").val(currentUser.email);
				}
		    }
		});
		$(function(){
			var bodyh = document.documentElement.clientHeight; 
			document.getElementById("container").style.height = (parseInt(bodyh) - 280) + 'px'; 
			
			$("#submit").click(function(){
				if (typeof currentUser == "undefined" || null == currentUser) {
					Core.alert({
						title:"提示",
						message:"您还没有登录，是否去登录？",
						confirmCallback:function(){
							goLoginPage();
						}
					});
					return;
				}
				
				if(!feedback.validate()){
					return;
				}
				
				var quesType = $("#questionType").val();
				var email = $("#email").val();
				var questionContent = $("#questionContent").val();
				
				// 初始化操作系统数据
				Core.AjaxRequest({
					url :ws_url + "/rest/email/feedback", 
					type:"post",
					params:{
						type : quesType,
						email : email,
						content : questionContent
					},
					callback : function (data) {
						$("#feedback_div").css("display","none");
						$("#result_div").css("display","block");
						$("#title_success").html("");
						$("#title_success").html("提交成功，感谢您为我们提出宝贵的意见!");
		            },
		            failure : function(data){
		            	$("#feedback_div").css("display","none");
		            	$("#result_div").css("display","block");
		            	$("#title_success").html("");
						$("#title_success").html("提交失败，请重新输入反馈意见。谢谢！");
		            }
				});
			});
		});
		//当浏览器屏幕大小变化时,修改div的高度  
		window.onresize = function(){
			var bodyh = document.documentElement.clientHeight;
			document.getElementById("container").style.height = (parseInt(bodyh) - 280) + 'px';
		};
		
</script>
<%@ include file="/pages/common/footer.jsp"%>