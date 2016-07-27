<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<style type="text/css">
		#details .select-version-list{
			width:100%;
			height:30px;
			background:#eee;
			border:1px solid #DADADA;
			border-bottom:0px;
		}
		#details .select-version-content{
			width:100%;
			height:210px;
		}
		#select-version-list ul{   
			width:100%;
			height:100%;
			margin:0px;
			padding:0px;
			list-style:none;   
		}
		#select-version-list li{ 
			height:25px;
			border:0px;
			text-align:center;
			line-height:24px;
			font-size:14px;
			padding:3px 5px 3px 5px;
			cursor:pointer;
			float:left;
		}
		.version_show{
			background:#fff;
			color:#000;
			border-right:1px solid #DADADA;
		}
		.version-content{
			width:100%;
			height:100%;
			display:none;
			font-size:12px;
			border:1px solid #DADADA;
		}
		.version-content-show{
			display:block;
		}
		#select-version-content ul{
			width:100%;
			height:100%;
			margin:0px;
			padding:0px;
			list-style:none;
		}
		#select-version-content li{
			position:relative;
			height:30px;
			border:1px solid #f2f2f2;
			border-left:0px;
			border-right:0px;
			border-top:0px;
			text-align:left;
			font-size:12px;
			cursor:pointer;
		}
		.selectedDeployment{
			background:#0099d7;
			color:white;
		}
		
	</style>  
   <div id="details" style="width:380px;height:240px;padding:10px;">     
		<div id="select-version-list" class="select-version-list">
			<ul>
				<li class="version version_show"  value="TEMP-Windows-Ent7-64">从分支(branch)部署</li>
				<li class="version"  value="TEMP-Windows-Srv2008R2-64">从标签(tag)部署</li> 
			</ul>
		</div>
		<div id="select-version-content" class="select-version-content">
				<div class="version-content version-content-show">
					<ul id="branch">
					</ul>
				</div>
				<div class="version-content">
					<ul id="tags">
						
					</ul>
				</div>
		</div>
   </div>
   <div style="width:380px;margin-left:10px;theight:35px;text-align:right;">
   		<button class="k-button" id="save_select_version" style="width:70px; height:32px;" type="submit">部署</button>
   </div>

   <script type="text/javascript">    
   		$(function(){
   			// 取得所有tags
   			Core.AjaxRequest({
				url :  ws_url +"/rest/verControl/gitAllTag",
				type:"get",
				callback : function (data) {
					$("#tags").html("");
					var str = "";
					for(var i=0;i<data.length;i++){
						str +="<li onclick='selectedBranchorTags(this)'><img src='../../images/console/version-selected.png' /><font style='position:absolute;top:8px;left:30px;'>"+data[i]+"</font></li>";
					}
					$("#tags").html(str);
	            },
				failure : function(data){
					alert("获取失败");
				}
			});   	
   			// 取得所有的分支
   			Core.AjaxRequest({
				url :  ws_url +"/rest/verControl/gitAllBranch",
				type:"get",
				callback : function (data) {
					$("#branch").html("");
					var str = "";
					for(var i=0;i<data.length;i++){
						str +="<li onclick='selectedBranchorTags(this)'><img src='../../images/console/version-selected.png' /><font style='position:absolute;top:8px;left:30px;'>"+data[i]+"</font></li>";
					}
					$("#branch").html(str);
	            },
				failure : function(data){
					alert("获取失败");
				}
			});
   		});
   
		$(".version").each(function(index){
			$(this).click(function(){
				$(".version_show").removeClass("version_show");
				$(this).addClass("version_show");
				$(".version-content-show").removeClass("version-content-show");
				$(".version-content").eq(index).addClass("version-content-show");
			});
			
		});
		
		// 部署版本
		$("#save_select_version").click(function(){
			Core.AjaxRequest({
				url : ws_url +"/rest/verControl/uploadProject?serverIp=192.168.8.150"+"&versionName=" + $(".selectedDeployment").find("font").html(),
				type:"get",
				callback : function (data) {
					if(data.status == "success"){
						Core.alert({
							title:"提示",
							message:"部署成功！",
							confirmCallback:function(){
								$("#selectWindow").data("kendoWindow").close();
							}
						});
					}
	            },
				failure : function(data){
					alert("获取失败");
				}
			});
		});
		
		
		function selectedBranchorTags(obj){
			$(".selectedDeployment").removeClass("selectedDeployment");
			$(obj).addClass("selectedDeployment");
		}
		
   </script>   