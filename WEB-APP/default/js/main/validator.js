(function ($)
{
    $.validator.addMethod(
            "notnull",
            function (value, element)
            {
                if (!value) return true;
                return !$(element).hasClass("l-text-field-null");
            },
            "不能为空"
    );

    //字母数字
    jQuery.validator.addMethod("alnum", function (value, element)
    {
        return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
    }, "只能包括英文字母和数字");

    // 手机号码验证   
    jQuery.validator.addMethod("cellphone", function (value, element)
    {
        var length = value.length;
        var tel =/^((\\+86){0,1})((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$/;
        return this.optional(element) || (length == 11);
    }, "请正确填写手机号码");

    // 电话号码验证   
    jQuery.validator.addMethod("telephone", function (value, element)
    {
    	//座机格式
        var tel = /^(0[0-9]{2,3}\-{0,1})?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/g;
        //手机格式
        var tel2 =/^((\+86){0,1})((13[0-9])|(15[^4,\D])|(18[0,5-9]))\d{8}$/;
        var bool=false;
        //if(tel.test(value) || tel2.test(value))
        if(value.length==8 ||value.length==11)
        {
        	bool=true;
        }
        return this.optional(element) || bool;
    }, "请正确填写电话号码");

    // 邮政编码验证
    jQuery.validator.addMethod("zipcode", function (value, element)
    {
        var tel = /^[0-9]{6}$/;
        return this.optional(element) || (tel.test(value));
    }, "请正确填写邮政编码");

    // 汉字
    jQuery.validator.addMethod("chcharacter", function (value, element)
    {
        var tel = /^[\u4e00-\u9fa5]+$/;
        return this.optional(element) || (tel.test(value));
    }, "请输入汉字");



    // QQ
    jQuery.validator.addMethod("qq", function (value, element)
    {
        var tel = /^[1-9][0-9]{4,}$/;
        return this.optional(element) || (tel.test(value));
    }, "请输入正确的QQ");

    // 用户名
    jQuery.validator.addMethod("username", function (value, element)
    {
        return this.optional(element) || /^[a-zA-Z][a-zA-Z0-9_]+$/.test(value);
    }, "用户名格式不正确");
 // 用户名
    jQuery.validator.addMethod("onlyUserName", function (value, element)
    {
    	alert('1');
        return false;
    }, "用户名已经存在");

})(jQuery);