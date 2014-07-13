//公共js函数
$(function() {
	$('.demo-cancel-click').click(function() {
		return false;
	});
	text = $("#" + menuId)[0].innerText;
	$("#menu2Name")[0].innerText = text;
	$("#navigation")[0].href = url + "?menuId=" + id + "&menu2Id=" + menuId;
	// 返回按钮
	$("#backList")[0].href = url + "?menuId=" + id + "&menu2Id=" + menuId;

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