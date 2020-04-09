function cpaCookie() {
	var a_id = _getUrlValue("a_id");
	var b_id = _getUrlValue("b_id");
	var eu_id = _getUrlValue("eu_id");
	var cid = _getUrlValue("cid");
	var wid = _getUrlValue("wid");
	var fbt = _getUrlValue("fbt");
	var yid = _getUrlValue('yid');
	var keyword = _getUrlValue('keyword');
	var refferUrl = document.referrer;
	if (refferUrl == "" || refferUrl == null)
		refferUrl = " ";
	var refferDomain = document.referrer.split("/")[2];
	if (refferDomain == "" || refferDomain == null || refferDomain == undefined)
		refferDomain = " ";
	var landingPage = window.location.href;
	var landingDomian = document.domain;
	var wd = _getUrlValue('wd');
	if (wd == "")
		wd = " ";
	var chn = _getUrlValue('chn');
	if (chn == "")
		chn = " ";
	var tag = _getUrlValue('tag');
	if (tag == "")
		tag = " ";
	var tanceng = _getUrlValue('tanceng');
	if (tanceng == "")
		tanceng = " ";

	var cookieName;
	var cookieValue;
	var encoding = getBrowerEncoding();
	if (a_id != '' && b_id != '') {
		cookieName = 'EqifaInfo';
		cookieValue = a_id + "|" + "b_id" + "|||" + eu_id;
		saveCookie(cookieName, cookieValue)
	}
	if (cid != '' && wid != '') {
		cookieName = 'yiqifaInfo';
		cookieValue = cid + '|' + wid + '|||' + fbt;
		saveCookie("encoding", encoding);
		saveCookie(cookieName, encodingV(cookieValue, encoding))
	}
	if (yid != '') {
		cookieName = 'YiqifaKeyword';
		cookieValue = '_yid_' + yid + '_' + keyword;
		saveCookie("encoding", encoding);
		saveCookie(cookieName, encodingV(cookieValue, encoding))
	}
	if (document.cookie.indexOf('where2egou' + '=') == -1) {
		cookieName = 'where2egou';
		if (refferDomain.indexOf('egou.com') != -1
				|| refferDomain.indexOf('openapi.qzone.qq.com') != -1
				|| refferDomain.indexOf('api.t.sina.com.cn') != -1
				|| refferDomain.indexOf('oauth.taobao.com') != -1
				|| refferDomain.indexOf('auth.alipay.com') != -1) {
			refferUrl = " ";
			refferDomain = " "
		}
		cookieValue = refferUrl + '|' + refferDomain + '|' + landingPage + '|'
				+ landingDomian + '|' + wd + '|' + chn + '|' + tag + '|'
				+ tanceng + '|';
		saveCookie("encoding", encoding);
		saveCookie(cookieName, encodeURIComponent(cookieValue))
	} else if (refferDomain.indexOf('egou.com') == -1 && refferDomain != " "
			&& refferDomain.indexOf('openapi.qzone.qq.com') == -1
			&& refferDomain.indexOf('api.t.sina.com.cn') == -1
			&& refferDomain.indexOf('oauth.taobao.com') == -1
			&& refferDomain.indexOf('auth.alipay.com') == -1) {
		cookieName = 'where2egou';
		cookieValue = refferUrl + '|' + refferDomain + '|' + landingPage + '|'
				+ landingDomian + '|' + wd + '|' + chn + '|' + tag + '|'
				+ tanceng + '|';
		saveCookie("encoding", encoding);
		saveCookie(cookieName, encodeURIComponent(cookieValue))
	}
}

function getCookie(c_name) {
	if (document.cookie.length > 0) {
		c_start = document.cookie.indexOf(c_name + "=");
		if (c_start != -1) {
			c_start = c_start + c_name.length + 1;
			c_end = document.cookie.indexOf(";", c_start);
			if (c_end == -1)
				c_end = document.cookie.length;
			return unescape(document.cookie.substring(c_start, c_end))
		}
	}
	return ""
}

function encodingV(value, encoding) {
	return "utf-8" == encoding ? encodeURIComponent(value) : value
}

function getBrowerEncoding() {
	if (navigator.userAgent.indexOf('Opera') >= 0
			|| navigator.userAgent.indexOf('Firefox') >= 0) {
		return "gbk"
	} else {
		return "utf-8"
	}
}

function _getURI() {
	var href = location.href;
	var domain = window.document.domain;
	var s = href.replace("http://" + domain + "/", "");
	if (s.indexOf("?") >= 0) {
		s = s.substring(0, s.indexOf("?"))
	}
	if (s.indexOf("&") >= 0) {
		s = s.substring(0, s.indexOf("&"))
	}
	return s
}

function _getUrlValue(qs) {
	var s = location.href;
	s = s.replace("?", "?&").split("&");
	var re = "";
	for (i = 0; i < s.length; i++) {
		if (s[i].indexOf(qs + "=") == 0) {
			re = s[i].replace(qs + "=", "");
			break
		}
	}
	return re
}

function saveCookie(cookieName, cookieValue) {
	var name = cookieName;
	var value = cookieValue;
	var expires = 1;
	var path = "/";
	var domain = ".egou.com";
	var secure = "";
	var today = new Date();
	today.setTime(today.getTime());
	if (expires) {
		expires = expires * 1000 * 60 * 30
	}
	var expires_date = new Date(today.getTime() + (expires));
	document.cookie = name + '=' + (value)
			+ ((expires) ? ';expires=' + expires_date.toGMTString() : '')
			+ ((path) ? ';path=' + path : '')
			+ ((domain) ? ';domain=' + domain : '')
			+ ((secure) ? ';secure' : '')
}

function cleanCookie(cookieName) {
	var name = cookieName;
	var value = 1;
	var expires = -10000;
	var path = "/";
	var domain = ".egou.com";
	var secure = "";
	var today = new Date();
	today.setTime(today.getTime());
	var expires_date = new Date(today.getTime() + (expires));
	document.cookie = name + '=' + (value)
			+ ((expires) ? ';expires=' + expires_date.toGMTString() : '')
			+ ((path) ? ';path=' + path : '')
			+ ((domain) ? ';domain=' + domain : '')
			+ ((secure) ? ';secure' : '')
}

cpaCookie();