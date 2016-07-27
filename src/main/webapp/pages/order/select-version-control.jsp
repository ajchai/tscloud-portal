<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<style type="text/css">
		#details .select-version-list{
			width:150px;
			height:350px;
			border:1px solid #DADADA;
			float:left;
		}
		#details .select-version-content{
			width:625px;
			height:350px;
			border:1px solid #DADADA;
			border-left:0px;  
			float:left;
		}
		.select-version-list ul{   
			height:100%;
			margin:0px;
			padding:0px;
			list-style:none;   
		}
		.select-version-list li{
			width:100%;
			height:25px;
			border-bottom:1px solid #DADADA;
			text-align:center;
			line-height:25px;
			font-size:12px;
			cursor:pointer;
		}
		.version_show{
			background:#0099d7;
			color:#fff;
		}
		.version-content{
			width:100%;
			height:100%;
			display:none;
			font-size:12px;
		}
		.version-content-show{
			display:block;
		}
		
		#details table th{
			font-weight:200;
			text-align:left;
			border:1px solid #D2D2D2;
			background:#f7f7f7;
		}
		#details table td {
			position:relative;
			height:25px;
			border:0px;
			font-size:10px;
			border-bottom:1px solid #f2f2f2;
			border-right:1px solid #f2f2f2;  
		}
		#details table td:last-child{
			border-right:0px;
		}
		#details .img_floder{
			background:url("../../images/index/coloricons-sprite.png")
		}
		#details .sub1_file{
			display:none;
		}
		#details .sub2_file{
			display:none;
		}
		#details .sub3_file{
			display:none;			
		}
		#details a{
			cursor:pointer;
			color:#888;
		}
		#details a:hover{
			color:#0099d7;
			text-decoration: underline;
		}

	</style>  
   <div id="details" style="width:780px;height:350px;padding:10px;">     
		<div class="select-version-list">
			<ul>
				<li style="background:#eee">已存在版本</li> 
				<li class="version" index="0" value="TEMP-Windows-Ent7-64">V1.10</li>
				<li class="version" index="1" value="TEMP-Windows-Srv2008R2-64">V1.20</li> 
				<li class="version" index="2" value="TEMP-Windows-Ent7-64">V1.30</li>
			</ul>
		</div>
		<div class="select-version-content">
			<div class="version-content version-content-show">
			    <div style="width:100%;height:23px;line-height:23px;">
			   		 &nbsp;&nbsp;
			   		 <span class="nav_version0" style="font-size:10px;">全部文件</span>
			   		 <span class="nav_version1" style="font-size:10px;display:none"><a href="javascript:goback(0)">全部文件</a> ＞<a href="javascript:goback(1)"> VersionTestProject </a></span>
			   	     <span class="nav_version2" style="font-size:10px;display:none"><a href="javascript:goback(0)">全部文件</a> ＞<a href="javascript:goback(1)"> VersionTestProject </a> ＞<a href="javascript:goback(2)"> webapp </a></span>
			   	     <span class="nav_version3" style="font-size:10px;display:none"><a href="javascript:goback(0)">全部文件</a> ＞<a href="javascript:goback(1)"> VersionTestProject </a> ＞<a href="javascript:goback(2)"> webapp </a> ＞WEB_INF</span>
			    </div>
				<table width="98%" style="margin-left:1%;" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="50%" height="25px" style="color:#888888;">&nbsp;&nbsp;文件名</th>
						<th width="25%" style="color:#888888;border-left:0px;">&nbsp;&nbsp;大小</th>
						<th width="25%" style="color:#888888;border-left:0px;">&nbsp;&nbsp;修改日期</th>
					</tr>
					<tr class="parent_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="parent_file_name" href="javascript:test(1)">VersionControlProject</a></td>
						<td>-</td>
						<td>2013-11-12 09:12:45</td>
					</tr>
					<tr class="sub1_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;src</td>
						<td>-</td>
						<td>2013-11-13 10:34:32</td>
					</tr>
					<tr class="sub1_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:test(2)">webapp</a></td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;page</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:test(3)">WEB_INF</a></td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;META_INF</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -48px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;index.jsp</td>
						<td>12kb</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub3_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lib</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub3_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -48px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;web.xml</td>
						<td>12kb</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
				</table>
			</div>
			<div class="version-content">
				<div style="width:100%;height:23px;line-height:23px;">
			   		 &nbsp;&nbsp;
			   		 <span class="nav_version0" style="font-size:10px;">全部文件</span>
			   		 <span class="nav_version1" style="font-size:10px;display:none"><a href="javascript:goback(0)">全部文件</a> ＞<a href="javascript:goback(1)"> VersionTestProject </a></span>
			   	     <span class="nav_version2" style="font-size:10px;display:none"><a href="javascript:goback(0)">全部文件</a> ＞<a href="javascript:goback(1)"> VersionTestProject </a> ＞<a href="javascript:goback(2)"> webapp </a></span>
			   	     <span class="nav_version3" style="font-size:10px;display:none"><a href="javascript:goback(0)">全部文件</a> ＞<a href="javascript:goback(1)"> VersionTestProject </a> ＞<a href="javascript:goback(2)"> webapp </a> ＞WEB_INF</span>
			    </div>
				<table width="98%" style="margin-left:1%;" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="50%" height="25px" style="color:#888888;">&nbsp;&nbsp;文件名</th>
						<th width="25%" style="color:#888888;border-left:0px;">&nbsp;&nbsp;大小</th>
						<th width="25%" style="color:#888888;border-left:0px;">&nbsp;&nbsp;修改日期</th>
					</tr>
					<tr class="parent_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="parent_file_name" href="javascript:test(1)">VersionControlProject</a></td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub1_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;src</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub1_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:test(2)">webapp</a></td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;page</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:test(3)">WEB_INF</a></td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;META_INF</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -48px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;index.jsp</td>
						<td>23kb</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub3_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lib</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub3_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -48px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;web.xml</td>
						<td>3kb</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
				</table>
			</div>
			<div class="version-content">
				<div style="width:100%;height:23px;line-height:23px;">
			   		 &nbsp;&nbsp;
			   		 <span class="nav_version0" style="font-size:10px;">全部文件</span>
			   		 <span class="nav_version1" style="font-size:10px;display:none"><a href="javascript:goback(0)">全部文件</a> ＞<a href="javascript:goback(1)"> VersionTestProject </a></span>
			   	     <span class="nav_version2" style="font-size:10px;display:none"><a href="javascript:goback(0)">全部文件</a> ＞<a href="javascript:goback(1)"> VersionTestProject </a> ＞<a href="javascript:goback(2)"> webapp </a></span>
			   	     <span class="nav_version3" style="font-size:10px;display:none"><a href="javascript:goback(0)">全部文件</a> ＞<a href="javascript:goback(1)"> VersionTestProject </a> ＞<a href="javascript:goback(2)"> webapp </a> ＞WEB_INF</span>
			    </div>
				<table width="98%" style="margin-left:1%;" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th width="50%" height="25px" style="color:#888888;">&nbsp;&nbsp;文件名</th>
						<th width="25%" style="color:#888888;border-left:0px;">&nbsp;&nbsp;大小</th>
						<th width="25%" style="color:#888888;border-left:0px;">&nbsp;&nbsp;修改日期</th>
					</tr>
					<tr class="parent_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="parent_file_name" href="javascript:test(1)">VersionControlProject</a></td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub1_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;src</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub1_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:test(2)">webapp</a></td>
						<td></td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;page</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:test(3)">WEB_INF</a></td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;META_INF</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub2_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -48px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;index.jsp</td>
						<td>32kb</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub3_file">
						<td ><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -16px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lib</td>
						<td>-</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
					<tr class="sub3_file">
						<td><div class="img_floder" style="position:absolute;width:16px;height:16px;background-position: 0px -48px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;web.xml</td>
						<td>6kb</td>
						<td>2013-11-11 12:09:47</td>
					</tr>
				</table>
			</div>
		</div>
   </div>
   <div style="width:99.8%;height:35px;text-align:right;">
   		<button class="k-button" id="save_select_version" style="width:70px; height:32px;" type="submit">确定</button>
   		&nbsp;
   </div>

   <script type="text/javascript">    
	    if(versionIndex == "0"){
		}else{
			$(".version_show").removeClass("version_show");
			$(".version").eq(Number(versionIndex)).addClass("version_show");
			$(".version-content-show").removeClass("version-content-show");
			$(".version-content").eq(versionIndex).addClass("version-content-show");
			test(1);
			goback(0);
		}
		$(".version").each(function(index){
			$(this).click(function(){
				$(".version_show").removeClass("version_show");
				$(this).addClass("version_show");
				$(".version-content-show").removeClass("version-content-show");
				$(".version-content").eq(index).addClass("version-content-show");
				test(1);
				goback(0);
			});
			
		});
		
		$("#save_select_version").click(function(){
			var show = $(".version_show");
			if(show.length){
				var val = $(".version_show").attr("value");
				var txt = $(".version_show").html();
				versionIndex = $(".version_show").attr("index");
				setSelectedVersion(val,txt);
			}
			$("#selectWindow").data("kendoWindow").close();
		});
		// 版本跳转
		function test(index){
			if(index == 1){
				$(".sub1_file").show();
				$(".parent_file").hide();
				$(".nav_version1").show();
				$(".nav_version0").hide();
			}else if(index == 2){
				$(".sub1_file").hide();
				$(".sub2_file").show();
				$(".nav_version2").show();
				$(".nav_version1").hide();
			}else if(index == 3){
				$(".sub2_file").hide();
				$(".sub3_file").show();
				$(".nav_version3").show();
				$(".nav_version2").hide();
			}
			
		}
		
		function goback(index){
			if(index == 0){
				$(".parent_file").show();
				$(".sub1_file").hide();
				$(".sub2_file").hide();
				$(".sub3_file").hide();
				
				$(".nav_version0").show();
				$(".nav_version1").hide();
				$(".nav_version2").hide();
				$(".nav_version3").hide();
			}if(index == 1){
				$(".parent_file").hide();
				$(".sub1_file").show();
				$(".sub2_file").hide();
				$(".sub3_file").hide();
				
				$(".nav_version0").hide();
				$(".nav_version1").show();
				$(".nav_version2").hide();
				$(".nav_version3").hide();
			}else if(index == 2){
				$(".parent_file").hide();
				$(".sub1_file").hide();
				$(".sub2_file").show();
				$(".sub3_file").hide();
				
				$(".nav_version0").hide();
				$(".nav_version1").hide();
				$(".nav_version2").show();
				$(".nav_version3").hide();
			}else if(index == 3){
				$(".parent_file").hide();
				$(".sub1_file").hide();
				$(".sub2_file").hide();
				$(".sub3_file").show();
				
				$(".nav_version0").hide();
				$(".nav_version1").hide();
				$(".nav_version2").hide();
				$(".nav_version3").show();
			}
		}
   </script>   