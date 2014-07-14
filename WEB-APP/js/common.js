//公共js函数
$(function() {
	$('.demo-cancel-click').click(function() {
		return false;
	});
	var headText = $("#" + menuId).text();
	$("#menu2Name").text(headText);
	//导航链接
	$("#navigation").attr("href", url + "?menuId=" + id + "&menu2Id=" + menuId);
	// 返回按钮
	$("#backList").attr("href", url + "?menuId=" + id + "&menu2Id=" + menuId);

	// 展开一级菜单
	collapseMenu(id);

	// 验证
	$('#editForm').validate( {
		onKeyup : true,
		onSubmit : true,
		eachValidField : function() {

			$(this).closest('div').parents('div').removeClass('error')
					.addClass('success');
		},
		eachInvalidField : function() {

			$(this).closest('div').parents('div')
					.removeClass('success').addClass('error');
		}
	});
});