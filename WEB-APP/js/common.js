//公共js函数
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
	$('#editForm').validate( {
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