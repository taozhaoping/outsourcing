//公共js函数
var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host + "/"
				+ contextPath;
$(function() {
	
	$('.demo-cancel-click').click(function() {
		return false;
	});
	var headText = $("#" + menuId).text();
	$("#menu2Name").text(headText);
	$("#navigation").text(headText);
	//导航链接
	$("#navigation").attr("href", url + "?menuId=" + id + "&menu2Id=" + menuId);
	// 返回按钮
	$("#backList").attr("href", url + "?menuId=" + id + "&menu2Id=" + menuId);

	// 展开一级菜单
	collapseMenu(id);

	// 验证
	$('form').validate( {
		onKeyup : false,
		onSubmit : true,
		onChange : true,
		eachValidField : function() {

			$(this).closest('div').parents('div').removeClass('error')
					.addClass('success');
		},
		eachInvalidField : function() {

			$(this).closest('div').parents('div')
					.removeClass('success').addClass('error');
		}
	});
	
	//日期控件
	$(".form_datetime").datetimepicker({
		language : 'zh-CN',
		format : 'yyyy-mm-dd',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : true
	});
});

//选择用户
function selectUsers(id) {
	$.ajax({
		type : "POST", //访问WebService使用Post方式请求
		url : basePath + "/home/userInfo!queryUsers.jspa", //调用WebService的地址和方法名称组合 ---- WsURL/方法名
		data : {}, //这里是要传递的参数，格式为 data: "{paraName:paraValue}",下面将会看到       
		dataType : 'json', //WebService 会返回Json类型
		traditional : false, //不要序列化参数
		error : function(err, textStatus) {
			//alert("error: " + err + " textStatus: " + textStatus);
		},
		success : function(result) {//回调函数，result，返回值
			//填充到table中
			fillUserList(result, id);
		}
	});
}

//展示用户选择列表
function fillUserList(userList, id) {
	//清空上次的查询结果
	$("#" + id + "Option").nextAll("option").remove();
	var selectOptionValue = $("#" + id).attr("value");
	//动态生成用户列表
	for ( var i = 0; i < userList.length; i++) {
		var user = userList[i];
		if("airportPeopleId" == id){
			if(user.id == selectOptionValue){
				$("#" + id + "Option").clone(true).attr("selected", "selected").attr(
						"value", user.id).val(user.id).html(
						user.name + "(" + user.loginName + ")").insertAfter(
						"#" + id + "Option");
				
			}else{
				$("#" + id + "Option").clone(true).removeAttr("selected").attr(
						"value", user.id).val(user.id).html(
						user.name + "(" + user.loginName + ")").insertAfter(
						"#" + id + "Option");
				
			}
		}else{
			$("#" + id + "Option").clone(true).removeAttr("selected").attr(
					"value", user.id).val(user.id).html(
					user.name + "(" + user.loginName + ")").insertAfter(
					"#" + id + "Option");
		}
	}
}

Date.prototype.format = function(format)
{
var o = {
            "M+" : this.getMonth()+1, //month
            "d+" : this.getDate(), //day
            "h+" : this.getHours(), //hour
            "m+" : this.getMinutes(), //minute
            "s+" : this.getSeconds(), //second
            "q+" : Math.floor((this.getMonth()+3)/3), //quarter
            "S" : this.getMilliseconds() //millisecond
        }
    if(/(y+)/.test(format))
    format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
    if(new RegExp("("+ k +")").test(format))
    format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}