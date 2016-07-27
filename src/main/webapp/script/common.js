// 请求路径
var portal_name = ctx.substring(1, ctx.length);
var web_service_name = "tscloud-ws";
// 整个URl字符串(在浏览器中就是完整的地址栏)
var allUrl = window.location.href;
// 取得项目前面的URL
var hostPath = allUrl.substring(0, allUrl.indexOf(portal_name));
// WebService请求地址
// var ws_url = hostPath + web_service_name;
var ws_url = "http://" + window.location.host + "/" + web_service_name;// 发布使用的url

function goPlatformURL() {
	window.open("http://" + window.location.hostname + ":8080/", "blank");
};

// 权限
var roleCatlog = [];
var roleFunction = {};

var roleCatlogAdmin = [];
var roleFunctionAdmin = {};

/** 判断浏览器版本 */
// if(!Core.browser() && (window.location.pathname.indexOf("browserPrompt.jsp")
// < 0)){
// window.location.href = ctx+"/pages/browserPrompt.jsp";
// }
// 登录用户
var currentUser;

/** 加载页面判断user是否登陆 */
function setCurrentUser(user) {
	if (typeof user != "undefined") {
		currentUser = user;
	} else {
		Core.AjaxRequest({
			url : ws_url + "/rest/user/current",
			type : "GET",
			async : false,
			callback : function(data) {
				var user = data.user;
				if (typeof user != "undefined" && null != user) {
					currentUser = user;
				}
			}
		});
	}
}

// 查询用户并存入全局变量
setCurrentUser();
/** 获取全局用户信息变量 */
function getCurrentUser() {
	return currentUser;
}

/**
 * 跳转至登录页面
 * 
 * @param gopath
 *            去往地址,null使用当前页面.路径例子'/pages/console/console.jsp'
 * @param param
 *            登陆成功回传参数,非必填.
 */
function goLoginPage(gopath, backpath, param) {
	// 获取去往路径
	var backPath = typeof backpath == "undefined" || null == backpath ? window.location.pathname
			: ctx + backpath;
	var goPath = typeof gopath == "undefined" || null == gopath ? window.location.pathname
			: ctx + gopath;
	// 判断当前用户是否已经登陆
	if (typeof currentUser != "undefined" && null != currentUser) {
		window.location.href = goPath;
	} else {
		var params = {};
		if (typeof param == "undefined") {
			params = {
				path : goPath,
				backPath : backPath
			};
		} else {
			params = {
				path : goPath,
				backPath : backPath,
				param : JSON.stringify(param)
			};
		}
		var str = encodeURIComponent(JSON.stringify(params));
		window.location.href = ctx + "/pages/login.jsp?params=" + str;
	}
}

/**
 * 跳转至登录页面
 * 
 * @param path
 *            返回地址,null返回当前页面.路径例子'/pages/console/console.jsp'
 * @param param
 *            登陆成功回传参数,非必填.
 */

function interceptionString(str, length) {
	if (typeof (str) == "string" || typeof (length) == "number") {
		var retstr = "";
		if (str.length > length) {
			retstr = str.substring(0, length) + "...";
		} else {
			retstr = str;
		}
		return retstr;
	} else {
		return "";
	}
}

/**
 * 动态引入JS文件
 * 
 * @param url
 */
function addJS(url) {
	var script = document.createElement("script");
	script.setAttribute("async", "true");
	script.setAttribute("src", url);
	document.body.appendChild(script);
}

/**
 * 去掉HTML注释
 * 
 * @param e
 */
function unComment(e) {
	var t = e;
	for ( var n = 0, r = t.length; n < r; n++) {
		var i = document.getElementById(t[n]);
		for ( var s = 0, o = i.childNodes.length; s < o; s++) {
			var u = i.childNodes[s];
			if (u.nodeType == 3) {
				if (u.nodeType == document.COMMENT_NODE) {
					i.innerHTML = u.nodeValue;
					break
				}
			} else
				i.innerHTML = u.nodeValue
		}
	}
}