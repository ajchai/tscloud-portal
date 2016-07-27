<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
	<title><fmt:message key="header.title.common"/><fmt:message key="header.title.intros"/></title>
	<link href="${ctx}/css/nav_common.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="${ctx}/script/serviceProductsList.js"></script>
	<style>
	   body {
		   	background:#21242C;
	   } 
	   #coverDiv{
	   		position:absolute;
			left:149px;
			top:0px;
			border-top-left-radius:53px;
			border-bottom-left-radius:53px;
			width:130px;
			height:53px;
			background:#21242C;
	   }
	   #index_content{
	   		position:absolute;
			right:50px;
			top:0px;
			width:55px;
			height:100%;
	   }
	   #enterTips{
	   		position:absolute;
			left:185px;
			top:0px;
/*			width:225px;*/
			height:47px;
			border:3px solid #fff;
			border-right:0px;
			color:#FFFFFF;
			line-height:47px;
			text-align:center;
			border-top-left-radius:47px;
			border-bottom-left-radius:47px;
			display:none;
	   }
	</style>
	<script type="text/javascript">
	    var currentClickIndex = -1;
		var isDone = true;
		
		var productsArr = new Array(0,12,4,17,0,15,5,16,6,2,10);
		var productArr = new Array(0,115,104,114,100,112,105,113,106,108,110);
		var productParentArr = new Array(0,105,101,105,101,105,101,105,104,104,104);
		window.onload=function (){
		    // 将要展示图片的个数
			var M=11;
			//用于装需要展示的图片
			var oDiv=document.getElementById('div1');
			var aDiv=oDiv.getElementsByClassName('hid');
			var x=-10;
			var y=0;
			
			var speedX=1;
			var speedY=20;
			
			var isRotate = false;
			
			
			for(var i=1;i<=M;i++){
				var oNewDiv=document.createElement('div');
				oNewDiv.className='hid';
				// 添加图片
				(function (oNewDiv,i){
					setTimeout(function (){
						oNewDiv.style.WebkitTransform='rotateY('+(360*(i-1)/M)+'deg) translateZ(400px)';
						oNewDiv.style.MozTransform='rotateY('+(360*(i-1)/M)+'deg) translateZ(400px)';
						oNewDiv.style.msTransform='rotateY('+(360*(i-1)/M)+'deg) translateZ(400px)';
						oNewDiv.style.OTransform='rotateY('+(360*(i-1)/M)+'deg) translateZ(400px)';
						oNewDiv.style.transform='rotateY('+(360*(i-1)/M)+'deg) translateZ(400px)';
				
						setTimeout(function (){
							if(i==M)fixAll();
							
							setTimeout(function (){
								
								oNewDiv.style.WebkitTransition='none';
								oNewDiv.style.MozTransition='none';
								oNewDiv.style.msTransition='none';
								oNewDiv.style.OTransition='none';
								oNewDiv.style.transition='none';
								
							},1000);
						}, 3000);
					}, (M+3-i)*200);
				})(oNewDiv,i);
				
				oNewDiv.degY=360*(i-1)/M;
				
				oNewDiv.innerHTML='<div class="img" onclick="showDetailInfo('+i+')"><span class="over"><span class="shadow"></span></span></div>';
				oNewDiv=oNewDiv.getElementsByClassName('img')[0];
				
				oNewDiv.style.background='url(${ctx}/images/index/intros/'+i+'.png)';
				
				oNewDiv.getElementsByClassName('shadow')[0].style.background='-webkit-linear-gradient(rgba(33,36,44,1) 40%, rgba(255,255,255,0)), url(${ctx}/images/index/intros/'+i+'.png)';
				oNewDiv.getElementsByClassName('shadow')[0].style.background='-moz-linear-gradient(rgba(33,36,44,1) 40%, rgba(255,255,255,0)), url(${ctx}/images/index/intros/'+i+'.png)';
				oNewDiv.getElementsByClassName('shadow')[0].style.background='-ms-linear-gradient(rgba(33,36,44,1) 40%, rgba(255,255,255,0)), url(${ctx}/images/index/intros/'+i+'.png)';
				oNewDiv.getElementsByClassName('shadow')[0].style.background='-o-linear-gradient(rgba(33,36,44,1) 40%, rgba(255,255,255,0)), url(${ctx}/images/index/intros/'+i+'.png)';
				oNewDiv.getElementsByClassName('shadow')[0].style.backgroundSize='100% 100%';
				oNewDiv.style.backgroundSize='100% 100%';
				
				oDiv.appendChild(oNewDiv.parentNode);
				
			}
			startMove();
			document.ondblclick = function(){
				speedX= 1;
				startMove();
			}
			
			document.onmousedown=function (ev){
				var oEvent=ev||event;
				var mouseStartX=oEvent.clientX;
			//	var mouseStartY=oEvent.clientY;
				
				var startX=x;
				var startY=y;
				
				var lastX=mouseStartX;
			//	var lastY=mouseStartY;
				
				speedX=speedY=0;
				
				document.onmousemove=function(ev){
					var oEvent=ev||event;
					y= Math.ceil(startY+(oEvent.clientX-mouseStartX)/10);
				//	x=Math.ceil(startX-(oEvent.clientY-mouseStartY)/10);
					
					speedX=Math.ceil((oEvent.clientX-lastX)/5);
				//	speedY=Math.ceil((oEvent.clientY-lastY)/5);
					fixAll();

					lastX=oEvent.clientX;
				//	lastY=oEvent.clientY;
				};
				
				document.onmouseup=function (){
					document.onmousemove=null;
					document.onmouseup=null;
					startMove();
				};
				stopMove();
				return false;
			};
			
			var timer=null;
			
			// 开始转动
			function startMove(){
				clearInterval(timer);
				timer=setInterval(function (){
					x = -10;
					y+=speedX;
					
					if(speedX > 0){
						if(speedX>0.3)
						speedX-=0.1;
					}else{
						if(speedX< -0.3)
						speedX+=0.1;
					}
					autoRotate();
				}, 30);
			}
			
			function autoRotate(){
					oDiv.style.WebkitTransform='perspective(1000px) rotateX('+x+'deg) rotateY('+y+'deg)';
					oDiv.style.MozTransform='perspective(1000px) rotateX('+x+'deg) rotateY('+y+'deg)';
					oDiv.style.msTransform='perspective(1000px) rotateX('+x+'deg) rotateY('+y+'deg)';
					oDiv.style.OTransform='perspective(1000px) rotateX('+x+'deg) rotateY('+y+'deg)';
					oDiv.style.transform='perspective(1000px) rotateX('+x+'deg) rotateY('+y+'deg)';
					// 设置每个图片的透明度
					for(var i=0;i<aDiv.length;i++){
						var deg=aDiv[i].degY+y;
						var a=(deg%360+360)%360;
						
						a=Math.abs(180-a);
						
						var d=0.1+(a/180)*0.9;
						
						if(d<0.2)d=0.2;
						
						aDiv[i].style.opacity=d;
						//aDiv[i].innerHTML=parseInt(a);
					}
			}
			// 清除timeout
			function stopAutoMove(){
				clearInterval(autoTimer);
			}
			
			
			// 清除timeout
			function stopMove(){
				clearInterval(timer);
			}
			
	
			function fixAll(){
				oDiv.style.WebkitTransform='perspective(1000px) rotateX('+x+'deg) rotateY('+y+'deg)';
				oDiv.style.MozTransform='perspective(1000px) rotateX('+x+'deg) rotateY('+y+'deg)';
				oDiv.style.msTransform='perspective(1000px) rotateX('+x+'deg) rotateY('+y+'deg)';
				oDiv.style.OTransform='perspective(1000px) rotateX('+x+'deg) rotateY('+y+'deg)';
				oDiv.style.transform='perspective(1000px) rotateX('+x+'deg) rotateY('+y+'deg)';
				
				// 设置每个图片的透明度
				for(var i=0;i<aDiv.length;i++){
					var deg=aDiv[i].degY+y;
					var a=(deg%360+360)%360;
					
					a=Math.abs(180-a);
					
					var d=0.1+(a/180)*0.9;
					
					if(d<0.2)d=0.2;
					
					aDiv[i].style.opacity=d;
					
					//aDiv[i].innerHTML=parseInt(a);
				}
			}
		};  
		
		function showDetailInfo(index){
			if(isDone){
				isDone = false;
				$(".img_selected").removeClass("img_selected");
				$(".img").eq(index-1).addClass("img_selected");
				if(index == 11){
					window.location.href = "${ctx}/pages/index.jsp";
					return;
				}
				if(currentClickIndex == index){
					if($("#show").is(":hidden")){
						setTimeout("setContent()" , 1); 
						$("#show").show().animate({top:'-=40%',left:'50%',height:'+=10px',width:'+=1px'},'1000');
						$("#show").show().animate({left:'-=20%',height:'+=140px',width:'+=40%'},'fast',function(){
							isDone = true;
						
						});
					}else{
						$(".img_selected").removeClass("img_selected");
						$("#show").animate({left:'50%',height:'10px',width:'2px'},'fast');
						setTimeout("deleteContent()" ,1); 
						$("#show").animate({top:"+=40%",left:'50%'},'fast',function(){
							$("#show").css({height:'0px',width:'0px'}).hide();
							isDone = true;
						});	
					}
				}else{
					currentClickIndex = index;
					if($("#show").is(":visible")){				
						$("#show").animate({top:'-=50%',left:'50%',height:'-=150px',width:'-=40%'},'fast',function(){
								$("#show").css({top:'50%',left:'50%'}).hide();
								setTimeout("openDiv()" , 500); 
						});	
						
					}else{
						setTimeout("setContent()" , 1); 
						$("#show").show().animate({top:'-=40%',left:'50%',height:'+=10px',width:'+=1px'},'1000');
						$("#show").show().animate({left:'-=20%',height:'+=140px',width:'+=40%'},'fast',function(){
							isDone = true;
						});
					}
				}
			}
		
		}
		
		function deleteContent() {
			$("#show h3").html(" ");
			$("#show p").html(" ");
			$("#show a").hide();
		}
		
		function openDiv() {
			setTimeout("setContent()" , 1); 
			$("#show").show().animate({top:'-=40%',left:'50%',height:'+=10px',width:'+=1px'},'fast');
			$("#show").show().animate({left:'-=20%',height:'+=140px',width:'+=40%'},'fast',function(){
				isDone = true;
			
			});
		}
		
		function setContent(){		
		    $("#show a").show();
//			$("#show h3").html("分布式存储("+currentClickIndex+")");
           $("#show h3").html(products[productsArr[currentClickIndex]].name);
			$("#show p").html(products[productsArr[currentClickIndex]].outline);
		}
		// 跳转到产品页面
		function forwordToProducts(){
			window.location.href = "${ctx}/pages/product/products.jsp?productSid="+productArr[currentClickIndex]+"&productParentSid="+productParentArr[currentClickIndex];
		}
</script>
</head>

<body>

<div id="show" style="position:absolute;left:50%;top:50%;width:0px;height:0px;display:none;box-shadow: 0px 0px 10px white;border-radius:3px;color:#FFFFFF;padding:8px;z-index:99999;">
	<h3 style="margin-bottom:8px;"></h3>
	<p style="margin:0px;padding:0px; font-size:15px;"></p>
	<div style="width:35px;height:35px;position:absolute;bottom:5px;right:5px;">
		<a href="javascript:forwordToProducts()" ><img src="${ctx}/images/index/right_round-64.png" width="35px" height="35px"></a>
	</div>
</div>

<div style="position:absolute;top:0px;left:0px;width:100%;height:60px;">
	<table width="1000px" height="100%"  style="margin:0 auto;" border="0" cellpadding="0" cellspacing="0">
		  <tr>
				  <td width="40%" align="left" style="padding-top:5px;">
						<div style="width:100%;height:100%;position:relative;">
							<a href="${ctx}/pages/index.jsp">
						 	   <img src="${ctx}/images/index/hp-logo.png" width="50px" height="50px"  border="0"/> 
						       <font style="color:#FFFFFF;font-size:20px; position:absolute;top:13px;">&nbsp;&nbsp;<b><fmt:message key="header.title"/></b></font>
						    </a> 
						</div>
					</td>
			</tr>
	</table> 
</div> 
<div id="div1">
	<strong id="div2"></strong>
</div>
<br />
<br />
<br />
<br />
<div style=" position:absolute;right:0px;top:85%;width:255px;height:55px;text-align:right;z-index:9999">

	<div id="coverDiv"></div>
	<div id="index_content">
		<div id="enterTips">
		   <a href="${ctx}/pages/index.jsp" style="color:white;font-size:18px;cursor:pointer;">进入首页&nbsp;&nbsp;&nbsp;&nbsp;</a>
	    </div>
		<div style="position:absolute;right:-30px;top:0px;width:83px;height:53px; background:#21242C;border-top-left-radius:50px;border-bottom-left-radius:50px;"></div>
		<div id="enterIndex" style="position:absolute;right:0px;top:0px;width:55px;z-index:999;">
		   <a href="${ctx}/pages/index.jsp" style="color:#FFFFFF;cursor:pointer;text-decoration:underline;" ><img src="${ctx}/images/index/right_round-64.png" height="55" width="55" border="0"></a>
		<div>
	</div>
</div>
</div>
</div>
</body>
<script type="text/javascript"> 
	$("#index_content").hover(
	    function(){
			$(this).css("width","205px");
		   $("#enterTips").show().animate({left:"0px",width:"180px"},500);
		},
		function(){
		   $("#enterTips").animate({left:"185px",width:"0px"},500,function(){
		   		$("#enterTips").hide();
				 $("#index_content").css("width","55px");
		   });
		}
	)
</script>
</html>
