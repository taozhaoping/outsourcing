
		/**
		 * 检查验证码
		 */
		function checkValidecode() {
			var codevalue = document.getElementById("validecode").value
					.toLowerCase();
			var code = xui.util.Cookie.read('validateCode').toLowerCase();
			return (code == codevalue) ? true : false;
		}
		/**
		 * 显示验证码 通过ajax的方式请求验证码
		 */
		showValidateCode : function() {
			var url = document.getElementById('APP_ROOT_PATH').value + '/validatecode/validate!showValidateCode.action';
			xui.util.Ajax.asyncGET(url, function(obj) {
				if (obj != '' || obj != null) {
					var result = eval('(' + obj + ')');
					document.getElementById('validateImg').src = result.imgUrl;
				}
			});
		}