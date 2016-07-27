<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/header.jsp"%>
<title><fmt:message key="header.title.common"/><fmt:message key="header.title.login"/></title>
<link href="${ctx}/css/login.css" rel="stylesheet">
<style type="text/css">
		.animated {
				  -webkit-animation-fill-mode:both;
				  -moz-animation-fill-mode:both;
				  -ms-animation-fill-mode:both;
				  -o-animation-fill-mode:both;
				  animation-fill-mode:both;
				  -webkit-animation-duration:0.5s;
				  -moz-animation-duration:0.5s;
				  -ms-animation-duration:0.5s;
				  -o-animation-duration:0.5s;
				  animation-duration:0.5s;
		}
		.animated.hinge {
				-webkit-animation-duration:0.5s;
				-moz-animation-duration:0.5s;
				-ms-animation-duration:0.5s;
				-o-animation-duration:0.5s;
				animation-duration:0.5s;
		}
		@-webkit-keyframes shake { 
				0%, 100% {-webkit-transform: translateX(0);} 
				30%, 70% {-webkit-transform: translateX(-10px);}
			    10%,  50%,  90% {-webkit-transform: translateX(10px);}
		}

		@-moz-keyframes shake {
			0%, 100% {-webkit-transform: translateX(0);} 
			30%, 70% {-webkit-transform: translateX(-10px);}
			10%,  50%,  90% {-webkit-transform: translateX(10px);}
		}

		@-o-keyframes shake {
			0%, 100% {-webkit-transform: translateX(0);} 
			30%, 70% {-webkit-transform: translateX(-10px);}
			10%,  50%,  90% {-webkit-transform: translateX(10px);}
		}

		@keyframes shake {
			0%, 100% {-webkit-transform: translateX(0);} 
			30%, 70% {-webkit-transform: translateX(-10px);}
			10%,  50%,  90% {-webkit-transform: translateX(10px);}
		}

		.shake {
			-webkit-animation-name: shake;
			-moz-animation-name: shake;
			-o-animation-name: shake;
			animation-name: shake;
		}
		
		
 .animated1{-webkit-animation-fill-mode:both;-moz-animation-fill-mode:both;-ms-animation-fill-mode:both;-o-animation-fill-mode:both;animation-fill-mode:both;-webkit-animation-duration:0.5s;-moz-animation-duration:0.5s;-ms-animation-duration:0.5s;-o-animation-duration:0.5s;animation-duration:0.5s;}.animated.hinge{-webkit-animation-duration:0.5s;-moz-animation-duration:0.5s;-ms-animation-duration:0.5s;-o-animation-duration:0.5s;animation-duration:0.5s;}@-webkit-keyframes rotateIn {
	0% {
		-webkit-transform-origin: center center;
		-webkit-transform: rotate(-200deg);
		opacity: 0;
	}	100% {
		-webkit-transform-origin: center center;
		-webkit-transform: rotate(0);
		opacity: 1;
	}
}
@-moz-keyframes rotateIn {
	0% {
		-moz-transform-origin: center center;
		-moz-transform: rotate(-200deg);
		opacity: 0;
	}
	
	100% {
		-moz-transform-origin: center center;
		-moz-transform: rotate(0);
		opacity: 1;
	}
}
@-o-keyframes rotateIn {
	0% {
		-o-transform-origin: center center;
		-o-transform: rotate(-200deg);
		opacity: 0;
	}
	
	100% {
		-o-transform-origin: center center;
		-o-transform: rotate(0);
		opacity: 1;
	}
}
@keyframes rotateIn {
	0% {
		transform-origin: center center;
		transform: rotate(-200deg);
		opacity: 0;
	}
	
	100% {
		transform-origin: center center;
		transform: rotate(0);
		opacity: 1;
	}
}

.rotateIn {
	-webkit-animation-name: rotateIn;
	-moz-animation-name: rotateIn;
	-o-animation-name: rotateIn;
	animation-name: rotateIn;
}
</style>
</head>
<body>
<div id="container">
	<div id="cloud"></div>
	
	<div id="content">
		<h1>国税计算存储云服务</h1>
		
		<div id="forms">
			<div id="login" >
				<p id="login-title"  style="font-size:15px;font-weight:500;text-align:left;margin:0px 0px 5px 0px;padding:0px;">欢迎登录，请输入用户名和密码</p>
				<h2 class="error" id="login-error" style="display: none;"></h2>  
				<ul>
					<li>
						<span class="textbox overlabel">
							<input type="text" id="login-username" name="account" onkeydown="useEnterkeyLogin(event)" maxlength="32"  placeholder="用户名"/> 
						</span>
					</li>
					<li>
						<span class="textbox overlabel">
							<input type="password" id="login-password" name="password" onkeydown="useEnterkeyLogin(event)" maxlength="32"   placeholder="密码"/>
						</span>
					</li>
					<li>
						<span class="button">
							<button type="submit" onclick="javascript:verifyUser();" >登录</button>
						</span>
					</li>
				</ul>
			</div>
		</div> <!-- /forms -->
	</div> <!-- /content -->
</div> <!-- /container -->
<div id="closeDiv" style="position:absolute;top:0px;right:0px;"><img id="closeLoginPage"  class="animation  done" src="${ctx }/images/index/cross-close-slider2.png" style="cursor:pointer;"  onclick="backPage();"></img></div>
<script type="text/javascript">  
	$(function(){ 
		$("#login-username").focus();// focus on the username input textbox
		$("#closeDiv").hover(// the effect of close button
				 function () {
					    $(this).addClass("animated1").addClass("rotateIn");
					  },
					  function () {
						  $(this).removeClass("animated1").removeClass("rotateIn");
					  }
		);
	});

	var crossPageParams;
	if ('${param.params}' != '') {
		crossPageParams = JSON.parse('${param.params}');
	}
	
	// TO_DO  添加enter建登录
	
	function verifyUser() {
		$("#login").removeClass("animated").removeClass("shake");
		if($("#login-username").val() =="" && $("#login-password").val() !=""){
			setTimeout(function(){
				$("#login").addClass("animated").addClass("shake");
	    		$("#login-title").css("color","red").html("请输入用户名！");
			},50);
		}else if($("#login-username").val() !="" && $("#login-password").val() ==""){
			setTimeout(function(){
				$("#login").addClass("animated").addClass("shake");
	    		$("#login-title").css("color","red").html("请输入密码！");
			},50);
		}else if($("#login-username").val() =="" && $("#login-password").val() ==""){
			setTimeout(function(){
				$("#login").addClass("animated").addClass("shake");
	    		$("#login-title").css("color","red").html("请输入用户名和密码！");
			},50);
		}else{
			//验证用户
			Core.AjaxRequest({
				url : ws_url + "/rest/user/verify",
				params : { 
					account : $("#login-username").val(),
					password : $("#login-password").val()
				},
				callback : function (data) {
					if (data.status == "failure") {
			    		$("#login").addClass("animated").addClass("shake");
			    		$("#login-title").css("color","red").html(""+ data.message +"");
					} else {
						// 获取user信息
						var user = data.user;
						if (null != user && (typeof crossPageParams != 'undefined' || null != crossPageParams)) {
							if ((typeof crossPageParams.isOther != 'undefined' || null != crossPageParams.isOther) && crossPageParams.isOther) {
								window.location.href = crossPageParams.path + "?ssotoken=" + data.ssoToken + "&jsessionid=" + data.id;
							} else {
								window.location.href = crossPageParams.path;
							}
						} else {
							window.location.href = ctx + "/pages/index.jsp";
						}
					}
			    },
			    failure:function(data){
		    		var errorObj = JSON.parse(data.responseText); 
		    		$("#login").addClass("animated").addClass("shake");
		    		$("#login-title").css("color","red").html(""+errorObj.error+"");
			    }
			});
		}
	}
	
	function backPage() {
		if (typeof crossPageParams != 'undefined' || null != crossPageParams) {
			window.location.href = crossPageParams.backPath;
		} else {
			window.location.href = ctx + "/pages/index.jsp";
		}
	}
	
	// 点击Enter键登录
	function useEnterkeyLogin(event){
		 if(event.keyCode==13){
			 verifyUser();
	     }
	}
</script>
</body>